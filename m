Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 612AE7C584
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Feb 2019 19:10:54 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id r17so2302365wrp.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2019 11:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=VfNIHFCFXQ6N2nt4hfh5lrJEKzpTiynxQjrqgAUzRnE=;
	b=adsplKSW7R769WKMB8SGd8JmNDlYkCF808uGq8VLPqXx2EExXhm9Q/fF6skTNko5hk
	GcbuYpYAzf6/O/zX7FSqEwdzPOAPnDnV/HomL8lREMpzgQzuFb5WK1VLiz7lZ5pqhStU
	NoslYrUn2bjnLg5NtbBsrxyRRFCsn3OjE5Yyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=VfNIHFCFXQ6N2nt4hfh5lrJEKzpTiynxQjrqgAUzRnE=;
	b=jtq4bgGaFtGCEaeIRl3ZlFHYSJ1K1fA1swbzR/k6+IZggPfmHhA5vVLrGKCovr1evj
	KuXSob7XZ8TKtNuBQETQpA5lepzlwDL0X6KvUJfYIlKV+QrMl5USNKbDNM0JPIYDgzI/
	Wj4BnWoTAVpiLJ5h2pRhFSaQd8Hq/e6pkNe0vcOkSWAF/OeZqvsDDOK3j0Whkregy6XC
	BHAFgwZggWYIbJfYOFCyW4aOP/X4FFBXgdiVVCsEjSqILGKVo5UfcFIONO6Jehzep8mj
	8rGrPGuMT9fLIpus4/sjny6Ax+0tf4c2ukRIMbsLYtTr0mA7LGT9qcj2gdhAkN0ZyjCh
	uFBw==
X-Gm-Message-State: AHQUAua/mNc8m/NNW/S8VxIx+5a7UZIIY0RnHJT865bxbgTySmb4NQH4
	5LxDBw/WdRkJibtPy/9BbMxJgQ==
X-Google-Smtp-Source: AHgI3IY/RlGsrLKd0UnFO2deRD6mcOO0pbYRv21uAThPh8I6W1upEKIFj6Fbm2H4nMcfWMgBM5I+8g==
X-Received: by 2002:a5d:4ec7:: with SMTP id s7mr2015078wrv.14.1549048254741;
	Fri, 01 Feb 2019 11:10:54 -0800 (PST)
Received: from hex.config (5751ab90.skybroadband.com. [87.81.171.144])
	by smtp.gmail.com with ESMTPSA id t4sm4691608wrm.6.2019.02.01.11.10.53
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 01 Feb 2019 11:10:53 -0800 (PST)
Message-ID: <da60a762d6120336beae979ea45175a4b8ec6d70.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 01 Feb 2019 19:10:52 +0000
In-Reply-To: <450c4826-18f3-d000-0995-f03c0bd05605@gmail.com>
References: <20190131230553.31750-1-richard.purdie@linuxfoundation.org>
	<450c4826-18f3-d000-0995-f03c0bd05605@gmail.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/2] core-image-sato-sdk-ptest: Increase qemu memory to 1GB
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Feb 2019 19:10:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-02-01 at 08:17 -0800, akuster808 wrote:
> 
> On 1/31/19 3:05 PM, Richard Purdie wrote:
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/recipes-sato/images/core-image-sato-sdk-ptest.bb | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
> > b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
> > index 531571ee877..7e3152b4a11 100644
> > --- a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
> > +++ b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
> > @@ -9,3 +9,6 @@ IMAGE_FEATURES += "ptest-pkgs"
> >  # box) and explicitly add just 500MB.
> >  IMAGE_OVERHEAD_FACTOR = "1.0"
> >  IMAGE_ROOTFS_EXTRA_SPACE = "524288"
> > +
> > +# ptests need more memory than standard to avoid the OOM killer
> > +QB_MEM = "-m 1024"
> 
> Did we have an issue with mips not working with anything larger than
> 256? or am I miss remembering?

I think the runqemu code knows about that and limits anything that is
too large to work so this should be safe...

Cheers,

Richard



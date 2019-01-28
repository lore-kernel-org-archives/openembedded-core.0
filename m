Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id DA3B76D268
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 17:09:16 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id m22so14813524wml.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 09:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=P0805sZpOgY2+45O1VCHV9xaq6JQrHJXH9XvzEPTusc=;
	b=ICJYWXSp2V/wlifklkY65AD05XcNS3ua+xhKZ0bCKLO9gLwKnrqL1+xcyTg+0trRHi
	diXG5HRphlImfLD+K6iSQptylF8PbyROFL+vThz4sX0YDpb4a6y8jbZUWR+p2EZLVDe+
	nQKKDML+XcqBzibELzP7cOs0W7W2zo2m72u4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=P0805sZpOgY2+45O1VCHV9xaq6JQrHJXH9XvzEPTusc=;
	b=LDujzSFFk7N8w+ZypyHlz+dTxBQH8YBemA/RNFk6J64LeWL2XuID324iI1IVRPgg8c
	gxbs6Bf7iNgy2Z8PEZ5Dgs23sSwkcC81mQGqVMXGWc+w7FMhVgGMR8F53nBu5JULGAtp
	gopIVnCGDJlbYp/TEsgL/6w0BnQ/4yAw7Ca4wT3eVPtGdYksRal+auogPQcXl2A6Cd1D
	iAlxnRm/9AjX5ewyUeLOPUwP9lkR6ORJEGR2RhXZNXhWFhoCEx9u9pLfIjlCmDxg0uu2
	cuZTR/hg3YcJ0Pb85XjIJFkIgrquZyWI03xJghNT/tNCNDCCJoF+RiEU7rGtIm0Xiw43
	VFMw==
X-Gm-Message-State: AJcUukdVDUsQ9spwySePTy3gAFAYtJUngfuQCDXJucBw9TK/3kGm+m6A
	bm63j2V7RKAHbzlWwZCEgcJjbA==
X-Google-Smtp-Source: ALg8bN6OK7TB0tYd2Ybfm9NI4L7fEEQJdhePu77U+vbTiImgwY4MDvQrSTzdt5ytQc1WwhRn81exsQ==
X-Received: by 2002:a1c:b70b:: with SMTP id h11mr18627896wmf.72.1548695357472; 
	Mon, 28 Jan 2019 09:09:17 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c1sm64649274wmb.14.2019.01.28.09.09.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 28 Jan 2019 09:09:16 -0800 (PST)
Message-ID: <5cd1ecb20f1f09d3c3bf57fadb88d49a36a6c91c.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Sudhir Sharma <sudhirx.sharma@intel.com>
Date: Mon, 28 Jan 2019 17:09:15 +0000
In-Reply-To: <CAMKF1srP7ts_99SF6udk7dNhgMRWX8oD0qqrPaASG=ZPif4naw@mail.gmail.com>
References: <1548660808-65505-1-git-send-email-sudhirx.sharma@intel.com>
	<CAMKF1srP7ts_99SF6udk7dNhgMRWX8oD0qqrPaASG=ZPif4naw@mail.gmail.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Converted the manual Runtime testcase to json
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
X-List-Received-Date: Mon, 28 Jan 2019 17:09:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-01-28 at 09:02 -0800, Khem Raj wrote:
> On Mon, Jan 28, 2019 at 12:14 AM Sudhir Sharma <
> sudhirx.sharma@intel.com> wrote:
> > Added json file of converted manual runtime testcases(compliance
> > test cases)
> > 
> > Signed-off-by: Sudhir Sharma <sudhirx.sharma@intel.com>
> > ---
> >  meta/lib/oeqa/manual/compliance-test.json | 142
> > ++++++++++++++++++++++++++++++
> >  1 file changed, 142 insertions(+)
> >  create mode 100644 meta/lib/oeqa/manual/compliance-test.json
> > 
> > diff --git a/meta/lib/oeqa/manual/compliance-test.json
> > b/meta/lib/oeqa/manual/compliance-test.json
> > new file mode 100644
> > index 0000000..7adf8a1
> > --- /dev/null
> > +++ b/meta/lib/oeqa/manual/compliance-test.json
> > @@ -0,0 +1,142 @@
> > +[
> > +    {
> > +        "test": {
> > +            "@alias":
> > "configuration.configuration.LTP_subset_test_suite",
> > +            "author": [
> > +                {
> > +                    "email": "corneliux.stoicescu@intel.com",
> > +                    "name": "corneliux.stoicescu@intel.com"
> 
> do we have to hard code email addresses ? maybe we can insert them
> via environment.

Its not used anywhere, its just author information. That said I happen
to know that this email address doesn't work any more as the person is
no longer at Intel...

I was planning to clean these up en-mass somehow at some point.

Cheers,

Richard



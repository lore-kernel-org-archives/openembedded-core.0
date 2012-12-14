Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TjYXw-0001y2-1W
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 17:55:36 +0100
Received: from mail-ob0-f197.google.com ([209.85.214.197])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 14 Dec 2012 08:40:58 -0800
Received: by mail-ob0-f197.google.com with SMTP id v19so15010443obq.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 08:40:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=0mVNk2yjo7VTbHckB45BMK513b6+botO4ZjvphUd9io=;
	b=E8wFr2D0l+XxBZyAngId+62gBC4/g/0nI0J8Jf3JDBcZR3OPeLjgTSDLfYYljnOjzP
	E5DtR+9rKpFTMmxHZ4cvmf5kckZcJZijWnaX4JghI033Hr7YCxzl9/nAOG/MuIv0Dp01
	hD+bb+kqtOp/m5A3iRJ99S3Yn6BbugDDcnBilzSdzsB+pPxvDHKeyjXFejMPGzow5bos
	4i06IbG3+gyV26wwl5eUeIL/t0me5ngoAi8SoOjyJlIITqrIP6LrtsxTNbeoEPM8tVxQ
	N4eYxzfpG0DICOxua7TrHJIHVo4phLaD69J5Xmh6Ign1I+SOVOvlDHq2oX3Blhl3S54L
	DHcQ==
Received: by 10.60.4.165 with SMTP id l5mr5166129oel.84.1355503257369;
	Fri, 14 Dec 2012 08:40:57 -0800 (PST)
Received: by 10.60.4.165 with SMTP id l5mr5166123oel.84.1355503257253; Fri, 14
	Dec 2012 08:40:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Fri, 14 Dec 2012 08:40:37 -0800 (PST)
In-Reply-To: <50CB55C3.2070409@mlbassoc.com>
References: <50CB4B04.2080202@mlbassoc.com> <50CB55C3.2070409@mlbassoc.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 14 Dec 2012 16:40:37 +0000
Message-ID: <CAJTo0LY+E06ZHUL5awbtS6bET2WMS7s0NoHrd73ReTe5jZnAuw@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
X-Gm-Message-State: ALoCoQlLzADyr49+dzY9WyqAVerWEffUBd/JxCNpcKSI/85spXoIz3h885tReyWf8JfPA9QD0xg68f3T/PTE8tvwyut7WizaMULLVaO41CFqS8Um+9oDSFF7LIkf3/SBGwIij299nqnMo6QoE86HnEHU80u6rvQatDJKYKP1B5GrW75CS+SYKGNREepO8d3DygdcGvyrDMqV
Cc: openembedded-core@lists.openembedded.org
Subject: Re: libsoup and gnutls
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Dec 2012 16:55:36 -0000
Content-Type: text/plain; charset=UTF-8

On 14 December 2012 16:37, Gary Thomas <gary@mlbassoc.com> wrote:
> Solution: install glib-networking
>
> Perhaps this should be in RRECOMMENDS for libsoup?

Yes.  Patch hitting the list shortly.

Ross



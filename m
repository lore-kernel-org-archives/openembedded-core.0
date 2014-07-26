Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 7E21D65D9B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jul 2014 03:03:19 +0000 (UTC)
Received: by mail-ie0-f174.google.com with SMTP id rp18so4402848iec.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 20:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=o4s6S+FJK+JBLPXvEvdAUHCRRlKXGTSKwVZHCR+TP9Y=;
	b=Rz+meXw0H6PnTvmE0fAL1EKHZ20Um1B0kN2VMjDbaE0lzrTfEJYWwFavhbTmulF8Bq
	ar35cxcvIolR55hWn81flUGDUfNwRK0J9uc2MlcoHHUsQc1ae/DytpZoCxRw+ghRW5pX
	PhZQ9hK7wqeIcjNN7l+A+FT8NwgaTFmgfjYIfWZw1eoW1xv8ldA1yh3Ihg/koWDCli/H
	3JJ/bgIYVCnoC/3C/sc3ZT6Vp0CyXY557Y4isxAUp0Yvi2YJwIp/bDxRS0kSb/Ux9a99
	xY2osnns1dolWmBCoLOWI8vUnDHWpzS7jRe8Zk/oPoitB5j8r7gu677fR/STi/gv0LF3
	dNBg==
X-Received: by 10.50.43.134 with SMTP id w6mr10816044igl.17.1406343800374;
	Fri, 25 Jul 2014 20:03:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.78.105 with HTTP; Fri, 25 Jul 2014 20:02:50 -0700 (PDT)
In-Reply-To: <53D2DE13.9010007@mvista.com>
References: <53D2DE13.9010007@mvista.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Jul 2014 20:02:50 -0700
Message-ID: <CAMKF1son3T9fsuF9X0Px4hirfk7Ezguy4s5Zit6-0JvfmXDV5A@mail.gmail.com>
To: akuster <akuster@mvista.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: libpcap-ng
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
X-List-Received-Date: Sat, 26 Jul 2014 03:03:21 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 25, 2014 at 3:45 PM, akuster <akuster@mvista.com> wrote:
> Meta-security and Meta-selinux both have libcap-ng. Instead of maintaining
> the same package in both places, can we get it into OE where libcap resides?

I think at very least you can propose it for meta-oe if not or-core.
But I also wonder why meta-selinux is not a sub-layer under
meta-security,


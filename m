Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4E1C96010B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 16:45:14 +0000 (UTC)
Received: by ioc74 with SMTP id 74so24384010ioc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 08:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=1PXOHXpazYSl8deDP2c2ukFOiputgQY5UmoQH+VavAQ=;
	b=gJ7+pPAf28Zb9zUY+HUA0Y3uEEbcyURrALQ2m8o8nDgel1j9raw+0787dhR0dLyxJX
	BSZInx9NWOjqzewXujsqaBXyA4W5TQyEqfw9o/6SqT/DOntNdgTMW2j3rM9wHTBKbeOg
	On7LfJdjbQosIWQR8oChKah8TwKWwouEHsukIgI9XtYvRFqwoZVYTCcveQDvE7/lLnzq
	EeQPdl5U2ud44P/DPvTqmuFHaStsyHWrKewKghSJkRrUk3g7KNC3x4SU+yBFduJ6zCRb
	LhJrPU8So0/XqzS8OK+qH85SBVh+Z+JtkVlx0Bh3asZDGQb8up0n1snfEte91q5ygW9a
	9O/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=1PXOHXpazYSl8deDP2c2ukFOiputgQY5UmoQH+VavAQ=;
	b=GwlKqBa31XZbjlew11vFhO67gJVJusMVjLPgsBvU61Bpe5Hj1WMo6hBSrQg6MxRV/9
	ghLiLvZJ+0osrkWshOqjYIlT8+ffXgJtSYB2LW69m4NyvB3QBd1v7WNcyDP48bSvXucd
	GuToja6sxZ8+6/XExlwgnngEjOcwli2nvH4AoohtM51MjXSbh5MBbXmaQ2nMJW9KLaKa
	hErNT6IIom7/MB7hzCIr/Qt3uIi1/CLWkkQ2tS8MyEWjyOgKhtNQXyvG7ZHSlFJyxk9h
	f2q3f9xF8C72kZUJKYHo7mgYuPBLqqaHss15pOmFZuuUlq9bj6isrzVRopuzDauhafeM
	JLBw==
X-Gm-Message-State: ALoCoQm2bWbR+MpmpsMcdho3jitqXAj42Gbex3xeqQGKhrx1xTJFAQ0+5ekjDG4I2Arr0Xj4PHxx
X-Received: by 10.107.135.30 with SMTP id j30mr35766787iod.148.1447778715201; 
	Tue, 17 Nov 2015 08:45:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Tue, 17 Nov 2015 08:44:55 -0800 (PST)
In-Reply-To: <1447773377.1472.28.camel@pbcl.net>
References: <1447739760-14395-1-git-send-email-armccurdy@gmail.com>
	<1447773377.1472.28.camel@pbcl.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Nov 2015 16:44:55 +0000
Message-ID: <CAJTo0La98Rv=0ZwdHce4FTknVAmZnGEnNmpXopK9+8cKqbnj8Q@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] directfb.inc: force bfd linker for armv7a
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
X-List-Received-Date: Tue, 17 Nov 2015 16:45:15 -0000
Content-Type: multipart/alternative; boundary=001a113ec64a088c910524bf40a0

--001a113ec64a088c910524bf40a0
Content-Type: text/plain; charset=UTF-8

On 17 November 2015 at 15:16, Phil Blundell <pb@pbcl.net> wrote:

> Does the resulting directfb-csource binary actually work with that
> change?  My recollection is that ld.bfd will just silently permit
> relocs that gold (correctly) refuses to allow.
>

Personally I don't use DirectFB (and am constantly surprised it's still a
thing) so at this point I'm not going to merge either of these patches
until someone can confirm that their fix *works on hardware* instead of
just fixing the build.

Ross

--001a113ec64a088c910524bf40a0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 November 2015 at 15:16, Phil Blundell <span dir=3D"ltr">&lt;<a href=
=3D"mailto:pb@pbcl.net" target=3D"_blank">pb@pbcl.net</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><div id=3D":4vj" class=3D"a3s" style=3D"=
overflow:hidden">Does the resulting directfb-csource binary actually work w=
ith that<br>
change?=C2=A0 My recollection is that ld.bfd will just silently permit<br>
relocs that gold (correctly) refuses to allow.</div></blockquote></div><br>=
Personally I don&#39;t use DirectFB (and am constantly surprised it&#39;s s=
till a thing) so at this point I&#39;m not going to merge either of these p=
atches until someone can confirm that their fix *works on hardware* instead=
 of just fixing the build.</div><div class=3D"gmail_extra"><br></div><div c=
lass=3D"gmail_extra">Ross</div></div>

--001a113ec64a088c910524bf40a0--

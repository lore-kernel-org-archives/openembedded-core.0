Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 59C4076B7C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Mar 2016 16:36:46 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id b188so10693866iof.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Mar 2016 08:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XlfyNLhEp27zKhiq2/onMveZVLyEP0m9eJzlpsMDHGk=;
	b=p7wgxSKkN/rrmrXcKm8mp813Zvs2KS6KxpjTQ6aY+lHjk7mnFss42YO2cOgDJPcuy4
	IBY+WajPcGDr4vdut8ZlOIHuKV6KLY7o1Rh9LOZABu16o83oxilXhLizkp3vrc4b1QZh
	/yk/at7y4mZ+l/WuA5us0Waau+m2VWNR+tZ6GRG5Y3TB0F+PxX3riBdoceSfXSHG5sWC
	7nMDPUnvVq9UbOZoPDmOgHPz7OZn7o8NwAylpLukbA64d3by7vusjfsYDTtDOTt8lAvo
	86FXzerVTsZBmjJ3yJ5NPLpdfxA/yBv3XZ8Bv7QzEHSzJhSRFxV7NUHpDYwA2P7B6LL9
	/v8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XlfyNLhEp27zKhiq2/onMveZVLyEP0m9eJzlpsMDHGk=;
	b=bGaIqUkfpBCIPbAjFD8pMjT5NiGg2n3BLTCYwywJt6AXCucYEC90mJhX0q0Bi3OoHz
	KpFqNHRN5spvM0vpk5YbNi80a04gxzo7UOjDsnXAVkDnCDPG52tui1JtEdap6/x6IAF2
	rYUpQnDhX7/t0GJtaS96oKFuQP1evl/kkoPzpylBNlvB+NlaspIoqi7Z99VIMjV3QvFW
	7Y833D0PoIPGQdDRjOYNM4VgrQk3kFGpQYdhGTHo09ReO5MagBcvpz1hLyHsEqzF+4gK
	aR16tBZu2O2W2Nd89KQMnAoc3pPQSHz2mOeD3fSbj9gt9gL6GPeSXq9cQ9Z4LVVrGIC+
	LS6Q==
X-Gm-Message-State: AG10YOQyM+fVYzQgkiG9xXdxTMhysxA62P12Qa/KU6I3zC/JGp2FwEvxBMgviqMqBLvD5s60cPx1zk2xyoXfbYN8
X-Received: by 10.107.137.92 with SMTP id l89mr28536884iod.133.1456850207185; 
	Tue, 01 Mar 2016 08:36:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 1 Mar 2016 08:36:27 -0800 (PST)
In-Reply-To: <56D3DD08.5080206@windriver.com>
References: <cover.1456304688.git.liezhi.yang@windriver.com>
	<56D3DD08.5080206@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 1 Mar 2016 16:36:27 +0000
Message-ID: <CAJTo0LYUn-d-9S8U277QFAoYPp45yF3iRvffsFxTAT1RzB=C0Q@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] make vm + live images can build together
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
X-List-Received-Date: Tue, 01 Mar 2016 16:36:50 -0000
Content-Type: multipart/alternative; boundary=001a113ebdb4175952052cff5f1f

--001a113ebdb4175952052cff5f1f
Content-Type: text/plain; charset=UTF-8

On 29 February 2016 at 05:54, Robert Yang <liezhi.yang@windriver.com> wrote:

>    syslinux.bbclass: make vm and live can be built together
>>    sanity.bbclass: remove conflict checking for image vm and live
>
>
If I build a core-image-sato for intel-corei7-32 I get this warning:

WARNING: core-image-sato-base-1.0-r0 do_bootimg: Found potential conflicted
var INITRD, please use INITRD_LIVE rather than INITRD

Ross

--001a113ebdb4175952052cff5f1f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 February 2016 at 05:54, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"=
mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,20=
4);border-left-style:solid;padding-left:1ex"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-col=
or:rgb(204,204,204);border-left-style:solid;padding-left:1ex">=C2=A0 =C2=A0=
syslinux.bbclass: make vm and live can be built together<br>
=C2=A0 =C2=A0sanity.bbclass: remove conflict checking for image vm and live=
</blockquote></blockquote></div><br>If I build a core-image-sato for intel-=
corei7-32 I get this warning:</div><div class=3D"gmail_extra"><br></div><di=
v class=3D"gmail_extra">WARNING: core-image-sato-base-1.0-r0 do_bootimg: Fo=
und potential conflicted var INITRD, please use INITRD_LIVE rather than INI=
TRD<br></div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra=
">Ross</div></div>

--001a113ebdb4175952052cff5f1f--

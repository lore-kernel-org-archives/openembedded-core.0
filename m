Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id C6B1F77386
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 20:47:43 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id u25so50761381qki.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 12:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mQmEi7ni0IpauMDQYMEl29W3r+IUPdZ38BHpmdNypXI=;
	b=UF7klIPXUvsBZbwACcjl7FdtXfLO9LcQd1FpsW9i7IdyBi5LBwryJMjfljpOBuOf/V
	h2haRl/IKqFgEFH+YmFxRETWUGi+RkS7j3NIYEvTavUN9MWLRy/sRBnT6hrT4gJwm/6P
	WKEX4Qg4MxHEJuqA5Mo6RmDPp0TKxyUUJkdlIC/dzH3JfVt093f/JFK2IJ0i7PX2j8Ru
	r7cM71d82f/J7hrSTN3Qy3owEKcD2BG7v3ik7zs8Lo7v4/LPNbOwchNgjKDForGBAO55
	XFPTExv8emAGOIeFw+kNvcVHggFWeTA1bCwVQydVI1LBn4X1An5tnAaFNq8kN1fod4sD
	3vDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mQmEi7ni0IpauMDQYMEl29W3r+IUPdZ38BHpmdNypXI=;
	b=igA9mPBVaYH0RoGmOwJPxLA53xaPb8hkEnjsRbYCzkBGV+nuFZs4Cjk4IXVP9RiyJG
	B5KAdFRhXgT9pewArJpm/8CxWFmYhpfjMiq5PgtCzcUz7GFI+339Gj0N2tELDqWqIFGY
	jlW626QGtm39cilzREwEJRkbYi60jLuWOyEbSVrcNk5Ucqtm5jAE78fICi2gUN2790nH
	N3/aNwzDgTmbrWEIa2WWLjuKUSRi1ZyAGCzvvu8SILRJHUratC5ohpAgp3GQv12S9MDF
	YRZLNjw8IJgJfSPsSO6/Vb++j9NeJ0qcYc9h+D7iCM/ey19BB43S41/XzhVPKkLPBP4+
	z8tg==
X-Gm-Message-State: AIkVDXJx3zffs7yl26I4AD0MHASNOqjsRs4B4xpofWQqxuRykY4XAk1FfxFNqNu7j7zrCd/Rbv+hOpx0QbCDrxIE
X-Received: by 10.55.31.24 with SMTP id f24mr1320048qkf.221.1482266864437;
	Tue, 20 Dec 2016 12:47:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 20 Dec 2016 12:47:24 -0800 (PST)
In-Reply-To: <alpine.LFD.2.20.1612201321490.5281@localhost.localdomain>
References: <alpine.LFD.2.20.1612201321490.5281@localhost.localdomain>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 20 Dec 2016 20:47:24 +0000
Message-ID: <CAJTo0LbWx_xHVAL9O9xVRybW8tZY9a0uDVVArOMzfB1s5R0qwg@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: $50 bounty for an OE recipe for libfilesys-smbclient-perl. seriously.
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
X-List-Received-Date: Tue, 20 Dec 2016 20:47:44 -0000
Content-Type: multipart/alternative; boundary=001a1147e2baeafddf05441d2535

--001a1147e2baeafddf05441d2535
Content-Type: text/plain; charset=UTF-8

On 20 December 2016 at 18:32, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>   really, i just don't have time to mess with this anymore and i'm
> more than happy to pay someone $50 CAD (interac transfer) to provide
> me with a proper recipe and essential patches for the perl module
> Filesys-SmbClient-3.2 here:
>

FWIW I had a quick look at this.  I'm certainly no perl guru and can barely
understand it, but it does *so much* wrong that if you really need this
then it would be easier to just rewrite the makefile.pl from scratch.  Once
you remove the hunting for the headers in the wrong place, it then invokes
an autoconf script...  which needs to be passed the right options.

Do you really need this module?  It's not been updated for many years, so
surely there's something better.

Ross

--001a1147e2baeafddf05441d2535
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 December 2016 at 18:32, Robert P. J. Day <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":ve" cla=
ss=3D"a3s aXjCH m1591d832551edfc0">=C2=A0 really, i just don&#39;t have tim=
e to mess with this anymore and i&#39;m<br>
more than happy to pay someone $50 CAD (interac transfer) to provide<br>
me with a proper recipe and essential patches for the perl module<br>
Filesys-SmbClient-3.2 here:</div></blockquote></div><br>FWIW I had a quick =
look at this.=C2=A0 I&#39;m certainly no perl guru and can barely understan=
d it, but it does *so much* wrong that if you really need this then it woul=
d be easier to just rewrite the <a href=3D"http://makefile.pl">makefile.pl<=
/a> from scratch.=C2=A0 Once you remove the hunting for the headers in the =
wrong place, it then invokes an autoconf script... =C2=A0which needs to be =
passed the right options.</div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">Do you really need this module?=C2=A0 It&#39;s not been=
 updated for many years, so surely there&#39;s something better.</div><div =
class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1147e2baeafddf05441d2535--

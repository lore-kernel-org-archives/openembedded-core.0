Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id DA0196FF80
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Nov 2016 00:46:15 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id n21so127923265qka.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Nov 2016 16:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ckazmOSNPWZeGpUH7Y302cecdwJQHCNLIy5R1kTJEpc=;
	b=13W+bRhja4SKK/pqWDLeKeu8CefnVCZDBxiGlbSkEF5EqAPIiRixMIyIkXl4n+nY66
	X7eK8hPy/FA/uGZ8fM4ycX0DZV6MxwTT04j85pRqy256wLWkLy6oC74J7nraNDZYWOpi
	CyJ2Z/UsTSYF1jDNSsewVqrbLVTAyKv1g6BzrMhAT55FKc/lBNJIZJcJro8a9ObqZvH5
	DjWAkI4KAQVGwkRgjf0I4YFPwsD2eLi1quMjUZfwPY9KSy6hFtEczEazomLpzQV3ivaV
	0TDRWVfTrPsQ+KqSz33sTF7SknziUaLyhD4PuJkfns/VzUGL0N4RwKKYfuAHqNWSSdOX
	rwqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ckazmOSNPWZeGpUH7Y302cecdwJQHCNLIy5R1kTJEpc=;
	b=Rrbt3BK/deF1j8xK1Y3M5Y8RZHrTuzT/Ymuh4fkYt3PGBvi+xkYX6k6O7S3NYi+97o
	MaV4p7oPYOT3NafzzUsQUF35nxHp59UPUWfpSxDnLQS3oHlky6N7Hvn6saU0JIjsZMAW
	h4QBLkQmHRpPlzz0tvklU+VF3TXnXJQkAG9VeS655AQkg+3jbkW7OOs5u9DEs1Q2dQqZ
	SOZfVpcJiQpw1A8tzzJ9VII411TixyRM0xZG5YiuC/dcTczsFlWN/k5IuPj3PSBUmV+z
	4c2CU3IOY55P0NjGx32MEK47ezSiWDE7Ulm7Vlr0P6xrYGxKTclvCKCbPSJ9NXDSkjSt
	Xwrg==
X-Gm-Message-State: ABUngvdM1ML8j2a24t/4Tui397AV5KalROt/c+OHVvAv2Sd20fVqj7rlU58BwVF/JhMrph5S+2zf+UswpXmcmeol
X-Received: by 10.55.75.17 with SMTP id y17mr15915550qka.26.1478652376831;
	Tue, 08 Nov 2016 16:46:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Tue, 8 Nov 2016 16:45:56 -0800 (PST)
In-Reply-To: <03d91527-2e2f-0694-8339-22fe7158880e@gmail.com>
References: <20161107182006.4207-1-marex@denx.de>
	<CAJTo0LaSLN1eVRH1ju1w5Ba3PLh6d+E0ZwmRimxcN1DjKRk6iQ@mail.gmail.com>
	<03d91527-2e2f-0694-8339-22fe7158880e@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 9 Nov 2016 00:45:56 +0000
Message-ID: <CAJTo0Lb-xraoP7zCyWEw-06Q4BwjFjFMG+d5mbkgKRCyfzYbzg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Marek Vasut <marex@denx.de>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: mkimage: Fix build of u-boot-mkimage
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
X-List-Received-Date: Wed, 09 Nov 2016 00:46:17 -0000
Content-Type: multipart/alternative; boundary=001a114a88c8ab32250540d39572

--001a114a88c8ab32250540d39572
Content-Type: text/plain; charset=UTF-8

On 9 November 2016 at 00:43, Khem Raj <raj.khem@gmail.com> wrote:

> > I'm guessing that it is using the host compiler instead of the cross
> compiler.
>
> isnt mkimage a host tool ? why are we building it for target ?
>

If there's no chance that it will be ran on the target for in a SDK then
patches welcome to force the recipe to native only.

The recipe is using _append without adding whitespace, but fixing that
doesn't fix the build.

Ross

--001a114a88c8ab32250540d39572
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 November 2016 at 00:43, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><span class=3D"">&gt; I&#39;m gues=
sing that it is using the host compiler instead of the cross compiler.<br>
<br>
</span>isnt mkimage a host tool ? why are we building it for target ?<br></=
blockquote></div><br>If there&#39;s no chance that it will be ran on the ta=
rget for in a SDK then patches welcome to force the recipe to native only.<=
/div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">The re=
cipe is using _append without adding whitespace, but fixing that doesn&#39;=
t fix the build.</div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra">Ross</div></div>

--001a114a88c8ab32250540d39572--

Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id A791370034
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Aug 2016 10:10:11 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id b62so7021507iod.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Aug 2016 03:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=U4CmNb8q1DquITWD5Riwrvf4pKseXcmNjRVM68Q2NRo=;
	b=oU+EVz9Piyjuw9ZG7bfUP48e7Ev3ge8ZbgFCcZYpA3SES3UlK1+eJd1Y3jRMOWaMZk
	Qhps5i8v3t3M+ydVOaKhXGIY+TSDqusChe2ho2ij009z+Ixopqliis6llCEAfW9CtLg/
	UajzgNuaYeQdl87sxfc0QdLymC48P1SVztPTUnwoOLHphxcuvCA9SFC2iOgOZxwoRi+U
	DXM6rGyqbNjnIJT39ukDBuMehqxXS+QvdqF8pkviYKkIz6OahRCylJBAtLl2xY60rQ4K
	5k3fxdX6WUVBq7Vgjs8nctsWedjgPvWf1pliLa2bStg1BEhhAMNNMEI7w4I4V1dNLImG
	4d1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=U4CmNb8q1DquITWD5Riwrvf4pKseXcmNjRVM68Q2NRo=;
	b=kn9SmPs2mxgER8sK0VEKeospq+s1DD/sgFpV4Bg7jqjT5tziS0AsXZpPj0lMjaAIRs
	/H7+8Rm7UZLUL5XCigvC9cJd0UwWeL0R7n7HFGhu9l9RrDj3pniM/F0Jaml7ApCCdmoU
	M0eUT4EXCfdrO+By6XjC4+IldKpoIRx9U73IU3Teequ12LtXC3EGsOz+4e6kWb4knrGD
	XvvLTr3L3SNEIcQzdw+9MvxFHV7bxXZxlH+5CZmnSXYb1Wa1Sqb4GamI3YMmEafpIn+G
	xr6K44ppm4CY/rQjdJVyoHPDsElmmhFBMBujBVIXEinQVgMLdQBwN5FWqrFLEKVRqiVD
	C7Zw==
X-Gm-Message-State: AEkooutFq7fPwQyWUCRK9TFrMd4q1OL4NDrSM91yz5MKMes5NhJwA+4V9CaG6ds3EGuKJ5Ta9zZmWqk9VwOql8Ep
X-Received: by 10.107.138.212 with SMTP id c81mr95340473ioj.148.1470737411838; 
	Tue, 09 Aug 2016 03:10:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 9 Aug 2016 03:09:51 -0700 (PDT)
In-Reply-To: <1470671116-1997-1-git-send-email-tom.hochstein@nxp.com>
References: <1470671116-1997-1-git-send-email-tom.hochstein@nxp.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Aug 2016 11:09:51 +0100
Message-ID: <CAJTo0LaWyLEPg5S3=B=H_Gb4XNuhgiAqYMMgOBdf3JRHuE0FMQ@mail.gmail.com>
To: Tom Hochstein <tom.hochstein@nxp.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [krogoth][PATCH] mesa-demos: Fix OpenGL ES configurability
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
X-List-Received-Date: Tue, 09 Aug 2016 10:10:12 -0000
Content-Type: multipart/alternative; boundary=001a113ed932fdab5f0539a0bcde

--001a113ed932fdab5f0539a0bcde
Content-Type: text/plain; charset=UTF-8

On 8 August 2016 at 16:45, Tom Hochstein <tom.hochstein@nxp.com> wrote:

> The most recent patch 0011-drop-demos-dependant-on-
> obsolete-MESA_screen_surface.patch
> incorrectly removed the configuration constructs that allowed the
> package to be configured without OpenGL ES support.
>

Does this also need to be applied to master?

Ross

--001a113ed932fdab5f0539a0bcde
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 August 2016 at 16:45, Tom Hochstein <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:tom.hochstein@nxp.com" target=3D"_blank">tom.hochstein@nxp.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1pi" class=3D=
"a3s aXjCH m1566e3dd3f929f3d">The most recent patch 0011-drop-demos-dependa=
nt-on-<wbr>obsolete-MESA_screen_surface.<wbr>patch<br>
incorrectly removed the configuration constructs that allowed the<br>
package to be configured without OpenGL ES support.</div></blockquote></div=
><br>Does this also need to be applied to master?</div><div class=3D"gmail_=
extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ed932fdab5f0539a0bcde--

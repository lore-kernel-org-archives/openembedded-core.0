Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id B1FBD60168
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 15:07:49 +0000 (UTC)
Received: by qkgw4 with SMTP id w4so33552024qkg.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 08:07:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=z2uTgtm+Cb9DNjfQCNC7HzAD3VN+I3zVn3NR74Uni0U=;
	b=KIwjyX06oxQRWAWVVmIKwJDm8DJT72bdV2FkfAON3szPm86cnUgFZzq9zR+bv7IMP6
	aYS0OEWIkqDQT1k9FaNWYszGl2k1SfZbTMzMbrAVV2H005J8TKhGfakWXWxUS0PPGK9p
	uMtAwvEhoPTLz6hZuQTGoce46yRV0w9WyKHdqCkpOY2nNUlev/nPYIQQ3jPXI+IL/Cag
	EpuapkCofsVimzsDaUN6+kkMDSPKdza3E0R8/nvU2piJalaX1kAUIrl8Jxn8S/vboaO8
	Mcjow5Xa9eziyooGQ2rSxohqQV3NcIwxKy7lWaWytIQeLpQ9pG3kWsaacj5MJgw5lBxf
	gwyQ==
X-Gm-Message-State: ALoCoQlirq28k1lTOglIbDSUoef4NW7rZItCddgDicCJgJYj78vcMUm/ROU6b+32yP6OwIpc6Gec
X-Received: by 10.140.235.77 with SMTP id g74mr46586347qhc.64.1432134470423;
	Wed, 20 May 2015 08:07:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 20 May 2015 08:07:30 -0700 (PDT)
In-Reply-To: <CAOMwXhMWtUxfdN_+dy-vYOVtQvL8sknTDxyAbfcygML2idYJsA@mail.gmail.com>
References: <CAOMwXhNUPtaJfKHDuHPWoioyD2Sp8Abb_++Tdp3NAYN7-TGUcg@mail.gmail.com>
	<CAC1BbcQ0L1ujZA_NvXx1hmUBq1gt9gC7tMHRwNLkNvmPGYZWaA@mail.gmail.com>
	<CAC1BbcTOPBRO_3GjhSQdzQ35Y=BGAh1ntYdqK2tk8E09Hvni7g@mail.gmail.com>
	<CAOMwXhNB-5w2ywAe6anARY0Kp+osPRmu6KnoiOpfTJ6G0WCCnQ@mail.gmail.com>
	<CAJTo0La5BpGRQEnNb34ZtV5-Po2dELjcN2mcy_Dn_e-c7=SWXg@mail.gmail.com>
	<CAOMwXhP-fdD2SjRrOFNR-aS7Caa30sxiC-Js_Jr8B5_+Q8uHow@mail.gmail.com>
	<CAJTo0Lb5owzy0iq6xojbr6a20_VKm4JidZO=H48hLdqnSx5Udw@mail.gmail.com>
	<CAOMwXhOG9=fraTJfnuoWUY=e6ZwATRCKHOmUvTerz7m+08T_sg@mail.gmail.com>
	<CAOMwXhMWtUxfdN_+dy-vYOVtQvL8sknTDxyAbfcygML2idYJsA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 20 May 2015 16:07:30 +0100
Message-ID: <CAJTo0LbAzuA6m6bvZG5oOhqwGKavxh=enywV4MzoHmONAOYUTA@mail.gmail.com>
To: Laszlo Papp <lpapp@kde.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: busybox: passwd: applet not found
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
X-List-Received-Date: Wed, 20 May 2015 15:07:50 -0000
Content-Type: multipart/alternative; boundary=001a11354a00616b6c051684caa4

--001a11354a00616b6c051684caa4
Content-Type: text/plain; charset=UTF-8

On 20 May 2015 at 16:02, Laszlo Papp <lpapp@kde.org> wrote:

> On a second thought: is even worse now than that, our code has to
> handle _three_ different scenarios:
>
> 1) Desktop.
> 2) Embedded without Yocto or embedded with old Yocto.
> 3) Embedded with new Yocto.
>
> I do not get excited about this.
>

Do as the documentation says in your distro and you have one scenario.

Ross

--001a11354a00616b6c051684caa4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 May 2015 at 16:02, Laszlo Papp <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:lpapp@kde.org" target=3D"_blank">lpapp@kde.org</a>&gt;</span> wrote:<br><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><div id=3D":bt" class=3D"a3s" style=3D"overfl=
ow:hidden">On a second thought: is even worse now than that, our code has t=
o<br>
handle _three_ different scenarios:<br>
<br>
1) Desktop.<br>
2) Embedded without Yocto or embedded with old Yocto.<br>
3) Embedded with new Yocto.<br>
<br>
I do not get excited about this.</div></blockquote><div><br></div><div>Do a=
s the documentation says in your distro and you have one scenario.</div><di=
v><br></div><div>Ross=C2=A0</div></div></div></div>

--001a11354a00616b6c051684caa4--

Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 886A760125
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 20:10:12 +0000 (UTC)
Received: by ioii16 with SMTP id i16so33097797ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 13:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=+edjlf2jAtXtrS2iE6JpgFED2UuBBz4hgSmBjOSYmLs=;
	b=jTmYaPyn1L2xuqlhmcfyBCh58S6xhn4wRotSHGl5/ElFLDSaeOWgGJ/Hzc9TXKNIJG
	zj7IYTPAcp5PNh5uS1cpfz6ey3qkYARZKUFrXzIKYujunrbBfNwsmmLNgI4/u6oR0Qmj
	h5KPZNCa96qXVSQBCxcVNA0lbIUwtyd/Lj9lvHxnaMVnyqb8fbTA4hulY3g1wt4X7Izf
	XfhzxkzIBcE0qHBd6Lnm8ZrHNtqS3VXlAqa7FjbXzOUmnk7CzCdmGjuRoM7D7i8x2TSJ
	GHOrswjUZniwxf4ORj0guHKfiHAUmj/KLEBvlamWiVJqxAR/nSJFksUrHh5zABoTHs1J
	OOJg==
X-Received: by 10.107.158.197 with SMTP id h188mr4579765ioe.99.1438200612484; 
	Wed, 29 Jul 2015 13:10:12 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.199 with HTTP; Wed, 29 Jul 2015 13:09:53 -0700 (PDT)
In-Reply-To: <CAJTo0La49fhabdZHEJonC=Q16-PJuHzGCP1bBLcxC9ZLimAZqA@mail.gmail.com>
References: <1438103507-63604-1-git-send-email-abdur_rehman@mentor.com>
	<CAJTo0LZiEWScYqCJBfzrMQ=02vkb9jd5a-6+VvSZBqePZgr7yg@mail.gmail.com>
	<8663FA6B07BCC94795FAD21C9CC5ACF73783C098@EU-MBX-01.mgc.mentorg.com>
	<CAJTo0LZ8qasC_Out4=1KHyskj5KovxDL6+BPGoKTS8=FquBYcA@mail.gmail.com>
	<CABcZAN=W1_aW1YXAkR25TO0DM=iHoCzPrrBCNGhpw+pq3aJauA@mail.gmail.com>
	<CAJTo0La49fhabdZHEJonC=Q16-PJuHzGCP1bBLcxC9ZLimAZqA@mail.gmail.com>
From: Christopher Larson <chris_larson@mentor.com>
Date: Wed, 29 Jul 2015 13:09:53 -0700
X-Google-Sender-Auth: rlW_27kSJV-AVbp9mc-mnJ-S_0s
Message-ID: <CABcZANnM9ATkuV_ZT9+hhwh4Y1cepEfmVamWkvMDjzowMvQRhw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] watchdog: kill update-rc.d when not using sysvinit
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
X-List-Received-Date: Wed, 29 Jul 2015 20:10:12 -0000
Content-Type: multipart/alternative; boundary=001a1141becc9f7e5c051c092c1b

--001a1141becc9f7e5c051c092c1b
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2015 at 12:48 PM, Burton, Ross <ross.burton@intel.com>
wrote:

> On 29 July 2015 at 20:27, Christopher Larson <chris_larson@mentor.com>
> wrote:
>
>> I don=E2=80=99t think we really want initscripts installed in a systemd-=
only
>> distro, particularly if systemd is built with sysvcompat enabled, as we
>> don=E2=80=99t want to run the sysvinit scripts for services which are al=
ready
>> covered by systemd proper, unless I=E2=80=99m missing something?
>>
>
> The dependency on initscripts via VIRTUAL-RUNTIME_initscripts is a
> DEPENDS, so it's build time.  The runtime dependency is on
> initscripts-functions.
>
> As far as I'm aware the sysv-generator used the rcX.d symlinks generated
> by update-rcd to decide what to start when, so you can't just disable the
> class and expect it to still work.
>

VIRTUAL-RUNTIME_initscripts is installed at runtime (as you can tell by its
name) in packagegroup-core-boot and packagegroup-core-full-cmdline both. If
I don=E2=80=99t want it in my images, wiping the variable is the only metho=
d that
makes any sense.
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1141becc9f7e5c051c092c1b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Jul 29, 2015 at 12:48 PM, Burton, Ross <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On=
 29 July 2015 at 20:27, Christopher Larson <span dir=3D"ltr">&lt;<a href=3D=
"mailto:chris_larson@mentor.com" target=3D"_blank">chris_larson@mentor.com<=
/a>&gt;</span> wrote:<br></span><div class=3D"gmail_quote"><span class=3D""=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex"><span style=3D"color:rgb(0,0,0);font-family=
:Tahoma;font-size:13px">I don=E2=80=99t think we really want initscripts in=
stalled in a systemd-only distro, particularly if systemd is built with sys=
vcompat enabled, as we don=E2=80=99t want to run the sysvinit scripts for s=
ervices which are already covered by systemd proper, unless I=E2=80=99m mis=
sing something?<br></span></blockquote><div><br></div></span><div>The depen=
dency on initscripts via VIRTUAL-RUNTIME_initscripts is a DEPENDS, so it&#3=
9;s build time.=C2=A0 The runtime dependency is on initscripts-functions.</=
div><div><br></div><div>As far as I&#39;m aware the sysv-generator used the=
 rcX.d symlinks generated by update-rcd to decide what to start when, so yo=
u can&#39;t just disable the class and expect it to still work.</div><span =
class=3D"HOEnZb"><font color=3D"#888888"><div></div></font></span></div></b=
lockquote></div><br>VIRTUAL-RUNTIME_initscripts is installed at runtime (as=
 you can tell by its name) in packagegroup-core-boot and=C2=A0packagegroup-=
core-full-cmdline both. If I don=E2=80=99t want it in my images, wiping the=
 variable is the only method that makes any sense.<br>-- <br><div class=3D"=
gmail_signature"><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail do=
t com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<=
br>Senior Software Engineer, Mentor Graphics</div></div>
</div></div>

--001a1141becc9f7e5c051c092c1b--

Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2DE6873BB8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 20:04:49 +0000 (UTC)
Received: by qged69 with SMTP id d69so8588945qge.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 13:04:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=VXtADVnlLdBH3uUGzFtIGGyS+xFCtCRYtJpIHAp4wj4=;
	b=Cj8J6PMRaurEzd0LUmlSL0oBK3ySCTmEawic+gCvKDXQLuOVTlSu1r20JMS7n5pxaL
	JHtQbEiPm1Di8xyW4UKIMRfHs2X+CSrBZnbyrpd2v56D5cUKzXYqbzSpYwGd4L5k+Bwj
	xIZOVz6y2NzOW04fCCozTDXDbpJ+/tcIGKZa24DbPgOE0nhmPVFyEvDc5nA8k8JkqOAJ
	z9aK7p6Z928ewtRg+9Xfu1t/da58yKHXzEwkm2xbZ2n7QShjFYkDfYC1kf0XY3GCi2kF
	yGHsQeQjL3AUTB87W2YFK0x/KV5LGr/aHj/zJmmAMh19uEBjR2O00JSGCy4zAJgzrri6
	vRJQ==
X-Gm-Message-State: ALoCoQlxAMne3dv3v5s4f8LbAJsdQR4d7u4H7TrZFACGQBzCC6C0itxjQoHYw/qqZaeTGVtTsyAn
X-Received: by 10.55.43.95 with SMTP id r92mr19705084qkh.67.1437077089949;
	Thu, 16 Jul 2015 13:04:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Thu, 16 Jul 2015 13:04:30 -0700 (PDT)
In-Reply-To: <1437009464-31315-1-git-send-email-rongqing.li@windriver.com>
References: <1437009464-31315-1-git-send-email-rongqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 16 Jul 2015 21:04:30 +0100
Message-ID: <CAJTo0LajE==B1SxF8MNiv8XV5AvcBxAWkm=hR4K-an994VEQAg@mail.gmail.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] weston: fix two building issue
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
X-List-Received-Date: Thu, 16 Jul 2015 20:04:55 -0000
Content-Type: multipart/alternative; boundary=001a1147b8dc762f72051b039518

--001a1147b8dc762f72051b039518
Content-Type: text/plain; charset=UTF-8

On 16 July 2015 at 02:17, <rongqing.li@windriver.com> wrote:

> 1. duplicate makefile rule leads to race, so remove one:
>    "/usr/bin/install: cannot create regular file `bitbake_build/tmp/work/
>    core2-64-wrs-linux/weston/1.8.0-r0/image/usr/share/wayland-sessions/
>    weston.desktop': File exists"
>

Also I happened to have a weston tree to hand, so you can call this
Submitted now (
http://lists.freedesktop.org/archives/wayland-devel/2015-July/023467.html).
:)

Ross

--001a1147b8dc762f72051b039518
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 July 2015 at 02:17,  <span dir=3D"ltr">&lt;<a href=3D"mailto:rongqing=
.li@windriver.com" target=3D"_blank">rongqing.li@windriver.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-=
style:solid;padding-left:1ex"><div id=3D":2yk" class=3D"" style=3D"overflow=
:hidden">1. duplicate makefile rule leads to race, so remove one:<br>
=C2=A0 =C2=A0&quot;/usr/bin/install: cannot create regular file `bitbake_bu=
ild/tmp/work/<br>
=C2=A0 =C2=A0core2-64-wrs-linux/weston/1.8.0-r0/image/usr/share/wayland-ses=
sions/<br>
=C2=A0 =C2=A0weston.desktop&#39;: File exists&quot;</div></blockquote></div=
><br>Also I happened to have a weston tree to hand, so you can call this Su=
bmitted now (<a href=3D"http://lists.freedesktop.org/archives/wayland-devel=
/2015-July/023467.html">http://lists.freedesktop.org/archives/wayland-devel=
/2015-July/023467.html</a>). :)</div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra">Ross</div></div>

--001a1147b8dc762f72051b039518--

Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id F069160132
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 14:22:38 +0000 (UTC)
Received: by qkdg63 with SMTP id g63so5091849qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 07:22:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Myg4qqvyBDot03up1LaKxOsSG6qjJ5VZIDS5zvUOp6k=;
	b=iMZheWbYZ9618ad5UHTkI8X+Av6JuedLMMwUHc3+80O2j1HlHbki5vmaZEHfEaxejN
	Xrcc8N4+2P2fFO3OHhOPIViSPJTjwGGpMGjs51ybQs7IcAeIuYYnvQsIJ54n7/f6e0pg
	9zaU9Bpl5Ni0fh6tzLBNEMsgxPsQgk/DHGzi66UTjC8g0QRpaCPNbT+ws3EKyDSR9uP7
	rfFM/jAVIhytcW/cheoQNl6R5IHXkJT6xj6ETGUklso6+tMGq+QiUupcPM9oyb9Q+wBU
	8czLmf1HHOAkZff8VRJB+7bgbSPYhCstwREA6bcp7eoas6kn/LT7J+b7t0aT39UVkuVZ
	MwGA==
X-Gm-Message-State: ALoCoQkbYttK4+iOUWBXiAT2i243wRPF8xSxAmGHP4P8BTiGivGudN5upIwgYkNb4MCHgwL6V7O6
X-Received: by 10.55.43.95 with SMTP id r92mr60294019qkh.67.1438179756875;
	Wed, 29 Jul 2015 07:22:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.195 with HTTP; Wed, 29 Jul 2015 07:22:17 -0700 (PDT)
In-Reply-To: <1438125665-14966-8-git-send-email-armccurdy@gmail.com>
References: <1438125665-14966-1-git-send-email-armccurdy@gmail.com>
	<1438125665-14966-8-git-send-email-armccurdy@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 29 Jul 2015 15:22:17 +0100
Message-ID: <CAJTo0LZP1wrXWFaOh4kRqDmY5cXqOACS54aZK0OqAzhtyz0Lzg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/8] busybox: disable fstrim in defconfig
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
X-List-Received-Date: Wed, 29 Jul 2015 14:22:40 -0000
Content-Type: multipart/alternative; boundary=001a1147b8dc883c4d051c045137

--001a1147b8dc883c4d051c045137
Content-Type: text/plain; charset=UTF-8

On 29 July 2015 at 00:21, Andre McCurdy <armccurdy@gmail.com> wrote:

> The fstrim applet (to discard unused blocks on a mounted filesystem)
> doesn't seem like core functionality, so disable by default.
>

With SSDs being more common, is this really true?  What's the size impact
of this?

Ross

--001a1147b8dc883c4d051c045137
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 July 2015 at 00:21, Andre McCurdy <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2fn" class=3D"a3s"=
 style=3D"overflow:hidden">The <span class=3D"il">fstrim</span> applet (to =
discard unused blocks on a mounted filesystem)<br>
doesn&#39;t seem like core functionality, so disable by default.<br></div><=
/blockquote></div><br>With SSDs being more common, is this really true?=C2=
=A0 What&#39;s the size impact of this?</div><div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra">Ross</div></div>

--001a1147b8dc883c4d051c045137--

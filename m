Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 606F071D82
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 14:38:09 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id a20so55951299qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 06:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=43ham6R/HjgGQsVn5BwdTHbAHkaojHVXGcZHqBiE/Us=;
	b=idrtDZ7fDUuoSZNN0DygJ5a9vbCOoShmj+Q3iSaPtsSxUxyk+V620h3e1hriump1mL
	kw2sZsn7RcKHAhY6Re9opNQT9F2S36uZKuvJ2yXQ/BxrQbli45Kl4Lon+DIGWbqeek0x
	GsM7uKerAt/SW0qL9+1NjwLv3ZTbahUai5I6rWFrGOXD/w7RdXZdX05PIMZ7plZYtQ69
	vskQLL+tScF+RAzcoSQTKwh3jTz1M8StdX1kopMSawZWXTAwZRtBvA5AbRJNDbuN5Mf2
	nqg641kKa+SvaOFjQVJn1iJSlDcV4xMPMb1HjnTVC9ekW5di/QhI8XqoySviFAzPfKP7
	MtUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=43ham6R/HjgGQsVn5BwdTHbAHkaojHVXGcZHqBiE/Us=;
	b=HEkIA4JuM2BF+dB/ou6Y6AXiiw9YGyLdsj5EH+NewTtgbTqzyKsLEJtooQau5mU70k
	7Tu3VIH/BPybqKNp8tr5Lvvu37qgNfy56UjyRdM9kRCw7n4yxGEm33uape1wRCcorIyc
	2ziF4JX2Wl+hDdu3Meh01Iib6w0ozEZ6mZPzvp/g1a+BaUsfoc3ld+DAHoKh+MH422XJ
	8BU/bIuUjqEFvA1vx5lKmVM0k40Pw0Y0Y4r7BVu1N7PBO3EZ4EkPjaSy7emcXag2WAvZ
	KK2adM8u2l6S3UmecPRqNZKZorH3laqkNIGQvjXCAmEqq1DYF9R4UIiZY+hBPeQE0ZJA
	wtCA==
X-Gm-Message-State: AIkVDXKDkBWTo4WPC0s0u/acDqtdbNyrnDrryGO7qXD9uoOWEFO8jk7aEr0k6+48xdVJF8SCg0UZD0NVbPxLWX2B
X-Received: by 10.55.176.194 with SMTP id z185mr18540642qke.26.1484318289880; 
	Fri, 13 Jan 2017 06:38:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Fri, 13 Jan 2017 06:37:49 -0800 (PST)
In-Reply-To: <CADkTA4PehadXvsFM2wT4sfytFMTK1cNrh+-FA+md4DjFC136Ug@mail.gmail.com>
References: <cover.1484312322.git.ross.burton@intel.com>
	<CADkTA4NpPn78=SB+b2zO=Vd8z2SG+BtBLQi1ciKjXyEruoQ1rQ@mail.gmail.com>
	<CAHiDW_Fs4B1B2qzqsJqVdVuEZa40boKH8zGnON04W7L8=bfgSA@mail.gmail.com>
	<CADkTA4O0vhL8k+nvvwMsyBGt-YToan0KiSpMtSYOh+Qkwms6SQ@mail.gmail.com>
	<CAJTo0LZcdu=N99Brb5zocN9w2cROjDU6dgT-1HwXvkJKpxe6cw@mail.gmail.com>
	<CADkTA4PehadXvsFM2wT4sfytFMTK1cNrh+-FA+md4DjFC136Ug@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 13 Jan 2017 14:37:49 +0000
Message-ID: <CAJTo0LYMBn6V_o4YKAx3gtByUtGVnXWYBjTeWbeoADL25rcR_w@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/80] Consolidated pull
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
X-List-Received-Date: Fri, 13 Jan 2017 14:38:10 -0000
Content-Type: multipart/alternative; boundary=94eb2c060ce666f9fe0545fac8f9

--94eb2c060ce666f9fe0545fac8f9
Content-Type: text/plain; charset=UTF-8

On 13 January 2017 at 14:32, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> oh, and is this one logged in bugzilla ? (or elsewhere, I don't care .. i
> just want to have a look
> at the proposed fix so I can start a musl build and see if I can fix
> things in the background).
>

It's not in bugzilla because the patch is still pending.

Discussion is in the "musl: Upgrade to 1.1.16+ on master" thread.  I think
musl's include/netinet/in.h needs to #define
__UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO 0.  Khem was going to
talk to musl maintainers to discuss fixing upstream first.

Ross

--94eb2c060ce666f9fe0545fac8f9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 January 2017 at 14:32, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=
=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,=
204);border-left-style:solid;padding-left:1ex"><div>oh, and is this one log=
ged in bugzilla ? (or elsewhere, I don&#39;t care .. i just want to have a =
look<br></div><div>at the proposed fix so I can start a musl build and see =
if I can fix things in the background).<br></div></blockquote><div><br></di=
v><div>It&#39;s not in bugzilla because the patch is still pending. =C2=A0=
=C2=A0</div><br>Discussion is in the &quot;musl: Upgrade to 1.1.16+ on mast=
er&quot; thread.=C2=A0 I think musl&#39;s include/netinet/in.h needs to #de=
fine __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO 0.=C2=A0 Khem was=
 going to talk to musl maintainers to discuss fixing upstream first.</div><=
div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Ross</div></=
div></div>

--94eb2c060ce666f9fe0545fac8f9--

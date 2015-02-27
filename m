Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9B2EE737B1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 13:32:26 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id i50so14030728qgf.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 05:32:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=TMhcG4lx624/qTrPUVCbZIlJCdl/LrBOJWfSs7RSlrM=;
	b=cbVZQG7w4CcEzJJS3wlbtAyZVgEuzUIMnmaHsgbxoVYcHe1JrItBr1sFpanOT/C1KW
	5Xk98SN1EX9gpLscbR1L0nLrYBzw8UeXetdrEeftBx2obNxXT+e5O54duHw+oDIZBYQW
	nuN2NsGzOcTj1x8VhR/A4WlNhwosmNQh0J4EdNDWY8ooLuzDJy0KAo5nEGlRS1NmsZFb
	RRofoCYjJpqky6nBJz86sxExk7LpvZl9ExG3lyRQHzaNv8Vp5Xo80cgIZetuUTAtHO37
	nilTdLMO96lqhjxsfbZiDGHmIHkDWJhSGCEMDzi/uUrdUnp6fi5A/58BjWkT+yoqXgyP
	ZN7w==
X-Gm-Message-State: ALoCoQkjY++pjbFQ1WZ/tuVLwihKQxCV5Pv813CKGcyDPK6uGVXZa47eT5ZbDhvOYKfpBs1YK5Ut
X-Received: by 10.140.150.21 with SMTP id 21mr29466675qhw.69.1425043948076;
	Fri, 27 Feb 2015 05:32:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Fri, 27 Feb 2015 05:32:07 -0800 (PST)
In-Reply-To: <20150227132117.GL2309@jama>
References: <20150227074233.1D2E3502AE@opal.openembedded.org>
	<20150227132117.GL2309@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 27 Feb 2015 13:32:07 +0000
Message-ID: <CAJTo0La-wVzOVVtibXyR-cnOqr-AO7BmZomXPcw=OXOh_zxyNA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Khem Raj : systemd: Upgrade 218 -> 219
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
X-List-Received-Date: Fri, 27 Feb 2015 13:32:28 -0000
Content-Type: multipart/alternative; boundary=001a11353fbc509b2d051011e619

--001a11353fbc509b2d051011e619
Content-Type: text/plain; charset=UTF-8

On 27 February 2015 at 13:21, Martin Jansa <martin.jansa@gmail.com> wrote:

> Fails to build in world builds, looks like missing dependency:
>

Yep, in the upgrade the util-linux dependency was dropped.

Ross

--001a11353fbc509b2d051011e619
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 February 2015 at 13:21, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D=
"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":68x" clas=
s=3D"a3s" style=3D"overflow:hidden">Fails to build in world builds, looks l=
ike missing dependency:<br></div></blockquote></div><br>Yep, in the upgrade=
 the util-linux dependency was dropped.</div><div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra">Ross</div></div>

--001a11353fbc509b2d051011e619--

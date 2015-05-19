Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id E4EF5601DF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 14:49:06 +0000 (UTC)
Received: by qgew3 with SMTP id w3so8350677qge.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 07:49:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ROOe7QQf3IYyfkTfUTbZLylSzrRUB9vA/LQU44eQ/Io=;
	b=g3lqPt9DxmrMAhZcWTtqxDaXblwTJWV0yvH3t9opMotzN0MNimdxw8amaHSN87Gq2R
	t/OafuHUaYALLWGF4HhJJrVd5PD9wxbg5m9pmBmJyre3oiO6FIBZvQDT7PLRLNJRF4Mr
	XN9rIdoExLmHk6/OueH3qJLHMJKfSNtkFhrSamyUyYlMpdyWcRhU5Qr2pxlAoRF8rPdz
	gnXUwz69Rv0YGFXDGrWeOccMPCFTPehX2c9mGWVSkX0rCQPZ2vLr/zABFtUbGWJkWhRS
	Js6l5SNa5sk+qx5YAh2c5cDu9BdbeW7j1v78o+hjJo0Ah8Qclz6T5Y3VPKdRKuOe/WaZ
	sQPw==
X-Gm-Message-State: ALoCoQlEQH7tRthOlNN3hIfhmdn9onfqb0uwujAsol/xd/wcMOSfx3xbXsklRFVo1utqdjOI8Omv
X-Received: by 10.55.20.10 with SMTP id e10mr60603743qkh.36.1432046946433;
	Tue, 19 May 2015 07:49:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 19 May 2015 07:48:46 -0700 (PDT)
In-Reply-To: <1431952843-25139-4-git-send-email-tanu.kaskinen@linux.intel.com>
References: <1431952843-25139-1-git-send-email-tanu.kaskinen@linux.intel.com>
	<1431952843-25139-4-git-send-email-tanu.kaskinen@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 May 2015 15:48:46 +0100
Message-ID: <CAJTo0LaGWvY58_ffJDkALxdY1nUNShUP30O-t7Bi+jec6qjUmQ@mail.gmail.com>
To: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] pulseaudio: move client.conf to a separate package
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
X-List-Received-Date: Tue, 19 May 2015 14:49:07 -0000
Content-Type: multipart/alternative; boundary=001a1137de328b4bc8051670697d

--001a1137de328b4bc8051670697d
Content-Type: text/plain; charset=UTF-8

On 18 May 2015 at 13:40, Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
wrote:

> +REDPENDS_libpulse += "pulseaudio-client-conf"
>

Typo, RDEPENDS.

Ross

--001a1137de328b4bc8051670697d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 May 2015 at 13:40, Tanu Kaskinen <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:tanu.kaskinen@linux.intel.com" target=3D"_blank">tanu.kaskinen@linux.in=
tel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"=
:7se" class=3D"a3s" style=3D"overflow:hidden">+REDPENDS_libpulse +=3D &quot=
;pulseaudio-client-conf&quot;<br></div></blockquote></div><br>Typo, RDEPEND=
S.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ros=
s</div></div>

--001a1137de328b4bc8051670697d--

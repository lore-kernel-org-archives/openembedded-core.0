Return-Path: <kergoth@gmail.com>
Received: from mail-yh0-f49.google.com (mail-yh0-f49.google.com
	[209.85.213.49])
	by mail.openembedded.org (Postfix) with ESMTP id 934E66E5D7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 20:26:36 +0000 (UTC)
Received: by mail-yh0-f49.google.com with SMTP id v1so19531925yhn.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Feb 2015 12:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=dZzkfZjuF3UCvggX+ZgDhGrfUzGevMvBxi95RpnDmlY=;
	b=rWF/7VqtVQuFbyxvMMCr47Ohps6dr8Ym3a9ZOgMSlK8Ijj2ujJBE8qYSwq65bUWx2O
	DUmWWK1CYukSwW1HndaEg5wHNFX8snKyJMWTylXD4pZDgOw+quRD+2BKq/6LTi20m88o
	z5w5sQLWMoJ6AkLS1cpzCMn3IWHYnaPgCiS5u0PanNBHd4rohOFeYWj+LTuJlIVy2QxT
	kg+5JaOBFix5VepmSx5zTLv5R6lbeKiMAyFW5cikZQIfEDcbcRejODwKHMhl3oHTgvw2
	friRLIkFzFYH84iw1hvZYUTaEEpqPdqxJuoFKK0QFzoKVuKYSqKT0FMFMidB0mV4zCSS
	qaSw==
X-Received: by 10.170.47.8 with SMTP id 8mr11252413ykp.18.1422995197383; Tue,
	03 Feb 2015 12:26:37 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.170.205.88 with HTTP; Tue, 3 Feb 2015 12:26:17 -0800 (PST)
In-Reply-To: <f305b44fc206694e8f0b1bde4ccb8481489bca15.1422988163.git.sgw@linux.intel.com>
References: <cover.1422988163.git.sgw@linux.intel.com>
	<f305b44fc206694e8f0b1bde4ccb8481489bca15.1422988163.git.sgw@linux.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 3 Feb 2015 13:26:17 -0700
X-Google-Sender-Auth: dQOqyT_Xgi88A0djwqOvsf2YN48
Message-ID: <CABcZANnJCQjLO5Y1XKctOoBcdHQypbxPwbabK8sBH0XWv_Vxwg@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/6] core-image: split debug-tweaks into individual features
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
X-List-Received-Date: Tue, 03 Feb 2015 20:26:41 -0000
Content-Type: multipart/alternative; boundary=001a11390e1041dbba050e34e3f4

--001a11390e1041dbba050e34e3f4
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 3, 2015 at 11:34 AM, Saul Wold <sgw@linux.intel.com> wrote:

>  IMAGE_POSTPROCESS_COMMAND ?= ""
> +MACHINE_POSTPROCESS_COMMAND ?= ""
> +
>

Was this intended? It's not mentioned in the message.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11390e1041dbba050e34e3f4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Feb 3, 2015 at 11:34 AM, Saul Wold <span dir=3D"ltr">&lt;<a href=3D=
"mailto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1n2" class=3D"a=
3s" style=3D"overflow:hidden">=C2=A0IMAGE_POSTPROCESS_COMMAND ?=3D &quot;&q=
uot;<br>
+MACHINE_POSTPROCESS_COMMAND ?=3D &quot;&quot;<br>
+</div></blockquote></div><br>Was this intended? It&#39;s not mentioned in =
the message.<br>-- <br><div class=3D"gmail_signature">Christopher Larson<br=
>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<=
br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a11390e1041dbba050e34e3f4--

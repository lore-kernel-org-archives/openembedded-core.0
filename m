Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f49.google.com (mail-oa0-f49.google.com
	[209.85.219.49])
	by mail.openembedded.org (Postfix) with ESMTP id EE27261EBD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2013 16:54:51 +0000 (UTC)
Received: by mail-oa0-f49.google.com with SMTP id k14so1161210oag.22
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jun 2013 09:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=bZJoBAcHQJ6AHLhPBpJpoltgtJP/l03tT3xuUPjJ2P8=;
	b=owhvIjAhfyALqfBfTmofSQ+7fsOTwInFouQJCVxPRhu2mDMDeTt2oCSZzTv1uJxCr8
	4nv1805bDMIFUUaq9CooxNTrKFIZqkaInAm3C/f4BX1FdmyWQJc04TcARdjOtmqVG1Yp
	/BQb1/TopNv/KTjxtYr30mAssNiK8U+kKkukSpK1NXcBFoNAcMK+UBQzf8HDWEBHuy5J
	FjN+oD5RgCYuEV1bFlcRWNqrc4wSqRKRXww0gOdCtDK2p0qbcFT834bYhdSzKvCj5Su9
	N7loah7uM9VWq9/Vus0Qf0Eu13mQWwOmPPybMxDLpLlVmsVZE0Xka27O8fIzFQEnyXU/
	Q30g==
MIME-Version: 1.0
X-Received: by 10.60.35.201 with SMTP id k9mr10200629oej.102.1370278492450;
	Mon, 03 Jun 2013 09:54:52 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.108.167 with HTTP; Mon, 3 Jun 2013 09:54:52 -0700 (PDT)
In-Reply-To: <1370278425-22062-1-git-send-email-otavio@ossystems.com.br>
References: <1370278425-22062-1-git-send-email-otavio@ossystems.com.br>
Date: Mon, 3 Jun 2013 13:54:52 -0300
X-Google-Sender-Auth: DxVmUINrCmLu773qI5eW59FO3xk
Message-ID: <CAP9ODKp4aOmvzMQoxJmrEUzuYZNOdBEHySYnrwOWo_dBHZ6haA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>, 
	"Eggleton, Paul" <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH] gst-plugins-package.inc: Allow ${PN}-apps and ${PN}-glib to be empty
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
X-List-Received-Date: Mon, 03 Jun 2013 16:54:52 -0000
Content-Type: multipart/alternative; boundary=089e011613bcc9351d04de42d256

--089e011613bcc9351d04de42d256
Content-Type: text/plain; charset=ISO-8859-1

Hello Paul,

On Mon, Jun 3, 2013 at 1:53 PM, Otavio Salvador <otavio@ossystems.com.br>wrote:

> The ${PN}-meta package rdepends on ${PN}-apps and ${PN}-glib so we
> need to have them available or the installation of the meta package
> will fail.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> This patch is need to make the meta packages work. This should also be
> applied in dylan branch as currently ${PN}-meta packages are not
> installable.
>

Forgot to add you to CC, sorry.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--089e011613bcc9351d04de42d256
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Paul,<div class=3D"gmail_extra"><br><div class=3D"gm=
ail_quote">On Mon, Jun 3, 2013 at 1:53 PM, Otavio Salvador <span dir=3D"ltr=
">&lt;<a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio@o=
ssystems.com.br</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">The ${PN}-meta package rdepends on ${PN}-app=
s and ${PN}-glib so we<br>
need to have them available or the installation of the meta package<br>
will fail.<br>
<br>
Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.b=
r">otavio@ossystems.com.br</a>&gt;<br>
---<br>
This patch is need to make the meta packages work. This should also be<br>
applied in dylan branch as currently ${PN}-meta packages are not<br>
installable.<br></blockquote><div><br></div><div style>Forgot to add you to=
 CC, sorry.</div></div><div><br></div>-- <br>Otavio Salvador =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br><a href=3D"http=
://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com.br</a> =
=A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" target=3D"_blan=
k">http://projetos.ossystems.com.br</a><br>
Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750=
<br>
</div></div>

--089e011613bcc9351d04de42d256--

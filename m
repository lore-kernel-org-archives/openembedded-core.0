Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f45.google.com (mail-oa0-f45.google.com
	[209.85.219.45])
	by mail.openembedded.org (Postfix) with ESMTP id 21D9B6A963
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 20:50:58 +0000 (UTC)
Received: by mail-oa0-f45.google.com with SMTP id j6so6516739oag.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 13:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=HXD94MC8y6wUgV+nJ43SdAyPD9DPZAhJb1zGaB09q0I=;
	b=JxuWYZFWtu42AKv3EJOFvdbT3dkWEJKmpnRDM5XlzCZP+1xaFm/aiagP7AqnSZ1wLx
	sf8/XPkYUnhZGbuiLRaxMOQi7yNHe5HsAH3Ql+2IUiKPrLqqsdvs2T/WCOahaFB8SsPu
	lTPuCHfuElFFm+nv2Dv0SiJy2q+fBLlX0DX869yTO2uegzGKrARX/nurFtH/87fX/p/o
	6T/m5knlsyVmhzdnUDo8M7lU3CI4n6GV5SU2GiNgAUZ81erwqb4YOWyTP0IGJldiCKy7
	3vbz/mLX9rpgJrRBnvIsEsARe98Q+s4gcvBbOliPyb4IFlT00eLeWjHXGVK/XpplaQTM
	reqg==
MIME-Version: 1.0
X-Received: by 10.182.79.106 with SMTP id i10mr9761746obx.59.1370897458955;
	Mon, 10 Jun 2013 13:50:58 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.108.167 with HTTP; Mon, 10 Jun 2013 13:50:58 -0700 (PDT)
In-Reply-To: <20c43ce563bb2645ae95b1795b0fe2248b9e1b43.1370896970.git.chris_larson@mentor.com>
References: <cover.1370896970.git.chris_larson@mentor.com>
	<20c43ce563bb2645ae95b1795b0fe2248b9e1b43.1370896970.git.chris_larson@mentor.com>
Date: Mon, 10 Jun 2013 17:50:58 -0300
X-Google-Sender-Auth: YCxEz0ja85inCsmG15eYtl1bZzw
Message-ID: <CAP9ODKo=fufr20tSTt80nr_QFHGfCaxFdYnk=zqcoKiOd7RKmg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Christopher Larson <kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] sstate.bbclass: kill MIRRORS and FILESPATH to speed up fetching
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
X-List-Received-Date: Mon, 10 Jun 2013 20:50:58 -0000
Content-Type: multipart/alternative; boundary=047d7b2e3e1011487304ded2f049

--047d7b2e3e1011487304ded2f049
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jun 10, 2013 at 5:46 PM, Christopher Larson <kergoth@gmail.com>wrote:

> From: Christopher Larson <chris_larson@mentor.com>
>
> The default FILESPATH isn't really of use, as we don't expect to find
> sstate
> archives buried in layer recipe directories, and the default MIRRORS is
> intended for use for fetching SRC_URI, not sstate.
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>

Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--047d7b2e3e1011487304ded2f049
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Mon, Jun 10, 2013 at 5:46 PM, Christopher Larson <span dir=3D"lt=
r">&lt;<a href=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail=
.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">From: Christopher Larson &lt;<a href=3D"mail=
to:chris_larson@mentor.com">chris_larson@mentor.com</a>&gt;<br>
<br>
The default FILESPATH isn&#39;t really of use, as we don&#39;t expect to fi=
nd sstate<br>
archives buried in layer recipe directories, and the default MIRRORS is<br>
intended for use for fetching SRC_URI, not sstate.<br>
<br>
Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor=
.com">chris_larson@mentor.com</a>&gt;<br></blockquote><div><br></div><div s=
tyle>Reviewed-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.co=
m.br">otavio@ossystems.com.br</a>&gt;</div>
<div style><br></div></div>-- <br>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br><a href=3D"http://www.ossys=
tems.com.br" target=3D"_blank">http://www.ossystems.com.br</a> =A0 =A0 =A0 =
=A0<a href=3D"http://projetos.ossystems.com.br" target=3D"_blank">http://pr=
ojetos.ossystems.com.br</a><br>
Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750=
<br>
</div></div>

--047d7b2e3e1011487304ded2f049--

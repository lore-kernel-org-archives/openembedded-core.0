Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f169.google.com (mail-ob0-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id AE5A76A456
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2013 12:23:37 +0000 (UTC)
Received: by mail-ob0-f169.google.com with SMTP id up14so4603859obb.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jun 2013 05:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=84rhddVCJ0r3yRhCHGr+oA9jhYCha6KfnnNfpSa4imY=;
	b=BmWODzicOXaXgUndqV6A4riywB1TrW5525paHv6n2j+65Nf3nNJEeZaQxkDDSwULnt
	TLZ2vOyzF/Ty+Q7ExyHPs1/NmcZYblJKvSBq/deV/7t4XpG2hq1W2XoPh+zHC+fhbBDO
	L793rUNye54QMXjd3qT1FomDNBLSw5jVsD8N85mGqqKjm2MQFVeH0z1qkWifz5upQeE4
	rYZ9g/6ziGCrMW4oNeh9915p4OUJU1VDIqxbwej9PPq93DhvkFEyHEtWDxEUo33OkWeS
	KknZfl1GDXFZhbLbvgHVAM4BXFzpN/E9ozXuTXXtQONTOql/DI0CGSC9a93LKeB+9vxi
	bJrw==
MIME-Version: 1.0
X-Received: by 10.60.59.163 with SMTP id a3mr18468658oer.45.1370521418287;
	Thu, 06 Jun 2013 05:23:38 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.108.167 with HTTP; Thu, 6 Jun 2013 05:23:38 -0700 (PDT)
In-Reply-To: <CANwerB3EF73JEhoXUNneq4wXCbnQzyCqPx1WUMpjB8DQ-e1qeg@mail.gmail.com>
References: <1370422910-24366-1-git-send-email-net147@gmail.com>
	<51AF6B79.3040506@linux.intel.com> <2054363.UxqkIOrzAJ@helios>
	<2653566.bBSFCXsGIZ@helios>
	<CANwerB3EF73JEhoXUNneq4wXCbnQzyCqPx1WUMpjB8DQ-e1qeg@mail.gmail.com>
Date: Thu, 6 Jun 2013 09:23:38 -0300
X-Google-Sender-Auth: OZ4FvwaNV4OTO2kZKvvlDeQlx9M
Message-ID: <CAP9ODKqB4zhmRyMFBDUkVH_NtYDHx6nCk5Tr89ZMnnydmY1NiA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Jonathan Liu <net147@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qmake2.bbclass: export OE_QMAKE_QT_CONFIG
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
X-List-Received-Date: Thu, 06 Jun 2013 12:23:37 -0000
Content-Type: multipart/alternative; boundary=089e013d08184ba38604de7b6284

--089e013d08184ba38604de7b6284
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jun 6, 2013 at 12:11 AM, Jonathan Liu <net147@gmail.com> wrote:
>
> Please test it in combination with the patch I just submitted which
> fixes QMAKE_QT_CONFIG being overwritten with empty value from
> .qmake.cache. I needed it to build Qt Creator.


Cool; maybe you could share the Qt Creator recipe? It could go to meta-oe :)

 --
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--089e013d08184ba38604de7b6284
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Thu, Jun 6, 2013 at 12:11 AM, Jonathan Liu <span dir=3D"ltr">&lt=
;<a href=3D"mailto:net147@gmail.com" target=3D"_blank">net147@gmail.com</a>=
&gt;</span> wrote:<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">
Please test it in combination with the patch I just submitted which<br>
fixes QMAKE_QT_CONFIG being overwritten with empty value from<br>
.qmake.cache. I needed it to build Qt Creator.</blockquote><div><br></div><=
div style>Cool; maybe you could share the Qt Creator recipe? It could go to=
 meta-oe :)</div><div><br></div><div>=A0--=A0</div></div>Otavio Salvador =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br>
<a href=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossyst=
ems.com.br</a> =A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" =
target=3D"_blank">http://projetos.ossystems.com.br</a><br>Mobile: +55 (53) =
9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750<br>

</div></div>

--089e013d08184ba38604de7b6284--

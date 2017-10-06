Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 416BD780A1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Oct 2017 10:27:05 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id p138so4853905itp.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Oct 2017 03:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wxlM6DgYM3q5mfNOhkStDZ/OQmstZR3tcU8GENySncw=;
	b=p4RDLWIXa9PfMYhwOMC3tY0yOkHLMopCjydq5BMOEG7ECVQ6bVPCBaW40WabWPRNPE
	Nrk34netMQhHx1xgysXhVwpjKlLhrSHW/5S6CJb5GvLqQyJGzaq0a0l38QnQEqSALNPd
	4zFHm/zmiLEVhljn+Xj0XGEsP6TEQu3DJFbko11AkPpmkzXASPC2vMnvEO+QIB6XEdE5
	zwfPaMMvHDsQV9M2fDTzz9eGdaqXZF4NQaCIpJR3QHjY0Yonr3KEweykLWL4gIvuZ4s/
	Irp9g3WZMxEZ6WIGBbeg85UamNkG2ghnGJqvQP+SNPg3eZlj35qMmDv/R5gDIjLooW/V
	f4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wxlM6DgYM3q5mfNOhkStDZ/OQmstZR3tcU8GENySncw=;
	b=ZIVubJ5ocsGUi9RMpdHBfCczeLPJif6DhKro6YYmiJH7QjfQx+OccYNABfQpm7tkLq
	3gIgoVG06zpoata6nh/mizJlB81qJbxHPKs6R2fh4GJ6D4qwqggczvTOA8WR0UEn445n
	RYthGkFL2Lh4rCsLoUhkywpvaRbJuIvpz0kYOEOYWgBo1zt+tKrVqpECDRTaR2Zb3QGl
	9cnwbpQkBzDWZ7yb4UsXBASZstKPamf/gOa1e6ZZvSIA5fP3+KRbp/F7NZ6I/0XRR11v
	JMoQ/oGChcU5cdPdAPd3vjvBOiWeNsXi8N/RkNsmHzx65EdaMRIfzqB8BqNTwTZpinPT
	GhUw==
X-Gm-Message-State: AMCzsaVQAt34aHh22vRr5T6AyZljVra5iiVR86kEGNtGSHReTRAQest4
	BsU/D08+yLKORtdDdFf3B+y8ubwiLSHqZTMB9HTtgw==
X-Google-Smtp-Source: AOwi7QDK/lMzrXy5UDktzGct5JyxnS3w6JYJlp0AEDdiT61hvYNBJXhXbfYIYIRANfopfPBNyipOZ3cVbsGaQh6ErRA=
X-Received: by 10.36.178.1 with SMTP id u1mr1985888ite.120.1507285626661; Fri,
	06 Oct 2017 03:27:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.59.22 with HTTP; Fri, 6 Oct 2017 03:26:46 -0700 (PDT)
In-Reply-To: <1507246092-71662-1-git-send-email-juro.bystricky@intel.com>
References: <1507246092-71662-1-git-send-email-juro.bystricky@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 6 Oct 2017 11:26:46 +0100
Message-ID: <CAJTo0LaV5+LY6ST2omCu5SQzFnUf8LPC=jRyFTtiCdbHE_E1EA@mail.gmail.com>
To: Juro Bystricky <juro.bystricky@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bash-ptest: install additional locales
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
X-List-Received-Date: Fri, 06 Oct 2017 10:27:05 -0000
Content-Type: multipart/alternative; boundary="f403045d9c0e5a40d9055ade4863"

--f403045d9c0e5a40d9055ade4863
Content-Type: text/plain; charset="UTF-8"

On 6 October 2017 at 00:28, Juro Bystricky <juro.bystricky@intel.com> wrote:

> +RDEPENDS_${PN}-ptest_append_libc-glibc += " locale-base-fr-fr
> locale-base-de-de"
> +DEPENDS_ptest_append_libc-glibc += " locale-base-fr-fr locale-base-de-de"
>

That DEPENDS line is meaningless.

Ross

--f403045d9c0e5a40d9055ade4863
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 6 October 2017 at 00:28, Juro Bystricky <span dir=3D"lt=
r">&lt;<a href=3D"mailto:juro.bystricky@intel.com" target=3D"_blank">juro.b=
ystricky@intel.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div=
 class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">+RDEPENDS_${PN}-ptest=
_append_<wbr>libc-glibc +=3D &quot; locale-base-fr-fr locale-base-de-de&quo=
t;<br>
+DEPENDS_ptest_append_libc-<wbr>glibc +=3D &quot; locale-base-fr-fr locale-=
base-de-de&quot;<br></blockquote><div><br></div><div>That DEPENDS line is m=
eaningless.</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--f403045d9c0e5a40d9055ade4863--

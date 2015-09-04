Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 19FC576FF2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 10:15:20 +0000 (UTC)
Received: by qgev79 with SMTP id v79so11955753qge.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Sep 2015 03:15:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=AI/vzZNrSuVhn9Kq3GjAIE2JRJjHx/Gyzhfo9izqZK4=;
	b=U18UchLBCKC5NyvwB3aNgUQZQEQuWxEMsEkl9MojOwql2x5bc+6FrOiXCqWrpEa2Gt
	OkLsWoPKR7WYMbxae0dtDrzyyEDZ5EAJmgnGd+9HRVsrKRzCEREcg2Hju/8bl0a/RJka
	zhrWXD2MvwLH2Y5PNekRHFEXH97g2rXxr8dRDjAcpSaGKxp6inM2CAYgEXm+WsTvlzB+
	uadmlG9VqxR/PEBsu67h9fCBs8h8FuFIgJqMroOj38l9j4+B1XraLRArGjPm9PiJpJU0
	lJsoHjzKdtugFsIXEBjHR+Rt8zxkJHlEc1u7te/xoWo8vKMLVl5865o2OFAPAddaX5vD
	FCKQ==
X-Gm-Message-State: ALoCoQlp35BMSPMld+XmqmnfDAZDB/BzXMLKvlPjKv26kksd2172TQ5x1NqmHmk48fbdfpMTMI+V
X-Received: by 10.140.237.204 with SMTP id i195mr4035494qhc.93.1441361720291; 
	Fri, 04 Sep 2015 03:15:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Fri, 4 Sep 2015 03:15:00 -0700 (PDT)
In-Reply-To: <1441317662-42022-1-git-send-email-alejandro.hernandez@linux.intel.com>
References: <1441317662-42022-1-git-send-email-alejandro.hernandez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 4 Sep 2015 11:15:00 +0100
Message-ID: <CAJTo0LYMr+M0QBOpdX0R9DUBi=8FFUoNszQbCO0jEDciWht+9A@mail.gmail.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] distutils.bbclass: Handle python-backport modules
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
X-List-Received-Date: Fri, 04 Sep 2015 10:15:22 -0000
Content-Type: multipart/alternative; boundary=001a1135a03054cba3051ee92da6

--001a1135a03054cba3051ee92da6
Content-Type: text/plain; charset=UTF-8

On 3 September 2015 at 23:01, Alejandro Hernandez <
alejandro.hernandez@linux.intel.com> wrote:

> +
> +
> +       if [ -e
> ${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/backports/__init__.py ]; then
> +       rm ${D}${PYTHON_SITEPACKAGES_DIR}/backports/__init__.py;
> +       rm ${D}${PYTHON_SITEPACKAGES_DIR}/backports/__init__.pyc;
> +       #FILES_${PN}_remove =
> "${PYTHON_SITEPACKAGES_DIR}/backports/__init__.pyc";
> +       fi
>  }
>

Two blank lines with whitespace at the beginning, bad indentation in the
body, and surely the commented out FILES_ can be removed.

Ross

--001a1135a03054cba3051ee92da6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 September 2015 at 23:01, Alejandro Hernandez <span dir=3D"ltr">&lt;<a =
href=3D"mailto:alejandro.hernandez@linux.intel.com" target=3D"_blank">aleja=
ndro.hernandez@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div id=3D":ve" class=3D"a3s" style=3D"overflow:hidden">+<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -e ${STAGING_LIBDIR}/${PYTHON_DIR}/site-pa=
ckages/backports/__init__.py ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm ${D}${PYTHON_SITEPACKAGES_DIR}/backports/__i=
nit__.py;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm ${D}${PYTHON_SITEPACKAGES_DIR}/backports/__i=
nit__.pyc;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0#FILES_${PN}_remove =3D &quot;${PYTHON_SITEPACK=
AGES_DIR}/backports/__init__.pyc&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0}</div></blockquote></div><br>Two blank lines with whitespace at the =
beginning, bad indentation in the body, and surely the commented out FILES_=
 can be removed.</div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra">Ross</div></div>

--001a1135a03054cba3051ee92da6--

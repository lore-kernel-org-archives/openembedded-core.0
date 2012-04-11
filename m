Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SHoNR-00052g-W5
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 05:37:50 +0200
Received: by vcbfl13 with SMTP id fl13so408886vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2012 20:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=7hdmXm0Cr7dUnzmKy5SCEgyo1rkQ8VwyBvU+EnrXdE0=;
	b=X49dYLtMNsZLvTA1UYYpAfg86zUcnJCtm6y1GHEZ9iuuK/yyBHkKr/bz68N7BwzmYY
	mslHRPjdAbh6kcuTaz61Ltz/lVDQE/in+XiOZHaFedrKpDP4afSTb+MuOZ5roHFYFgn9
	xK/V+1tJpX2/rbZrdfTBc8x+zQiOhzKirce337mumcQkiN1VhmL0sNALlcPKCNGH2UEi
	lk5JxUja9kO2fmKiifs2GoZzrY7bTlaTdXb1BD1t9OAa3301b2D3G5dDZLEvrGkGJc5J
	ZWxscnaB65qXeSDs8yJ/UuQWyxr1/0IRUTGeDIoy9QBTa8I5HEawWevnvkiuP007EC93
	PEYQ==
MIME-Version: 1.0
Received: by 10.220.156.72 with SMTP id v8mr2165717vcw.45.1334114911049; Tue,
	10 Apr 2012 20:28:31 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.2.195 with HTTP; Tue, 10 Apr 2012 20:28:31 -0700 (PDT)
In-Reply-To: <8260c81f0251e639f853303fb94defcb58cf846b.1334114318.git.otavio@ossystems.com.br>
References: <cover.1334114318.git.otavio@ossystems.com.br>
	<8260c81f0251e639f853303fb94defcb58cf846b.1334114318.git.otavio@ossystems.com.br>
Date: Wed, 11 Apr 2012 00:28:31 -0300
X-Google-Sender-Auth: L06-fqR8Ft7GfC4TWNY6pR07Gpw
Message-ID: <CAP9ODKoXaHqyB4qM=V1T5xxUzv95WZy1-EXO5fhteF3pwjZyUA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] connman: backport test script fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Apr 2012 03:37:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 11, 2012 at 00:19, Otavio Salvador <otavio@ossystems.com.br> wr=
ote:
...
> --- a/meta/recipes-connectivity/connman/connman_0.79.bb
> +++ b/meta/recipes-connectivity/connman/connman_0.79.bb
> @@ -1,11 +1,15 @@
> =A0require connman.inc
>
> +PR =3D "r1"
> +
> =A0# 0.79 tag
> =A0SRCREV =3D "442b1fe603e005814f592a3dbcf0d0bfb13f961c"
> =A0SRC_URI =A0=3D "git://git.kernel.org/pub/scm/network/connman/connman.g=
it \
> =A0 =A0 =A0 =A0 =A0 =A0 file://add_xuser_dbus_permission.patch \
> =A0 =A0 =A0 =A0 =A0 =A0 file://ethernet_default.patch \
> =A0 =A0 =A0 =A0 =A0 =A0 file://disable_alg-test.patch \
> + =A0 =A0 =A0 =A0 =A0 =A0file://test-set-ipv4-method-api-fix.patch \
> + =A0 =A0 =A0 =A0 =A0 =A0file://test-set-ipv6-method-api-fix.patch \
> =A0 =A0 =A0 =A0 =A0 =A0 file://connman"
> =A0S =3D "${WORKDIR}/git"
> =A0PR =3D "r1"

When picking it, please fix the PR. It has been messed up in merging sorry.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br



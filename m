Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UcMpx-000634-2l
	for openembedded-core@lists.openembedded.org;
	Tue, 14 May 2013 23:32:47 +0200
Received: by mail-pa0-f47.google.com with SMTP id kl13so874680pab.20
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2013 14:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=ageLI3MZcNHKaHKC2Ic+D0K1pP+iMd1uRyZ2wt9AOtg=;
	b=KMtWnKw8CuDxSg3JlME936aluZP5tZ5MOwdpSRJDQ5PeSJ9ENixvYcbNGAqjsi81Gn
	ZXMotfmo92AKudB5vLdoaTUGBv5MKwrGOD5/Lz8N1lWGmxWOMZj/QNrYQFfYVIan60Ck
	VIhlZ/D8XbRk6EUhERU0lel+oSmqgHgAA5UjZFF/aUwHbYGxe1Yq+1TfRI4KSnOHuyKi
	ANwNLoVNIcKlDUe+BbPo8D8jyIw0sqVlpLAgd7V0Boa1TKolOaDwhk41CAC98OEKfVN7
	2qlIG+bK7a8Ey9F9xcaCGtrFK4Dvd2LBtmX8JhkCSWy65oYiGg3hIhnMdb/PDke/t1tg
	nnTQ==
X-Received: by 10.68.224.65 with SMTP id ra1mr35369911pbc.103.1368566072686;
	Tue, 14 May 2013 14:14:32 -0700 (PDT)
Received: from vjalali-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id xu10sm391609pab.3.2013.05.14.14.14.31
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 14 May 2013 14:14:31 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1368548976-28229-1-git-send-email-Martin.Jansa@gmail.com>
Date: Tue, 14 May 2013 14:14:32 -0700
Message-Id: <7ABA838A-F468-47D2-A277-32DD9C6CA6CC@gmail.com>
References: <20130510125303.GF12329@jama.dyndns-home.com>
	<1368548976-28229-1-git-send-email-Martin.Jansa@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] gcc-4.8: temporary disable thumb
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 May 2013 21:32:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On May 14, 2013, at 9:29 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:

> * temporary work around for build issue on armv4t:
> | cp/decl.o: In function `bad_specifiers':
> | =
/OE/shr-core/tmp-eglibc/work-shared/gcc-4.8.0-r0/gcc-4.8.0/gcc/cp/decl.c:7=
171:(.text.unlikely+0x24): relocation truncated to fit: R_ARM_THM_CALL =
against sym
> bol `error(char const*, ...)' defined in .glue_7 section in linker =
stubs
> | =
/OE/shr-core/tmp-eglibc/work-shared/gcc-4.8.0-r0/gcc-4.8.0/gcc/cp/decl.c:7=
173:(.text.unlikely+0x32): relocation truncated to fit: R_ARM_THM_CALL =
against sym
> bol `error(char const*, ...)' defined in .glue_7 section in linker =
stubs
> | =
/OE/shr-core/tmp-eglibc/work-shared/gcc-4.8.0-r0/gcc-4.8.0/gcc/cp/decl.c:7=
176:(.text.unlikely+0x3e): relocation truncated to fit: R_ARM_THM_CALL =
against sym
> bol `error(char const*, ...)' defined in .glue_7 section in linker =
stubs
> | =
/OE/shr-core/tmp-eglibc/work-shared/gcc-4.8.0-r0/gcc-4.8.0/gcc/cp/decl.c:7=
180:(.text.unlikely+0x4c): relocation truncated to fit: R_ARM_THM_CALL =
against sym
> bol `error(char const*, ...)' defined in .glue_7 section in linker =
stubs
> | =
/OE/shr-core/tmp-eglibc/work-shared/gcc-4.8.0-r0/gcc-4.8.0/gcc/cp/decl.c:7=
182:(.text.unlikely+0x5a): relocation truncated to fit: R_ARM_THM_CALL =
against sym
> bol `error(char const*, ...)' defined in .glue_7 section in linker =
stubs
> | =
/OE/shr-core/tmp-eglibc/work-shared/gcc-4.8.0-r0/gcc-4.8.0/gcc/cp/decl.c:7=
185:(.text.unlikely+0x66): relocation truncated to fit: R_ARM_THM_CALL =
against sym
> bol `error(char const*, ...)' defined in .glue_7 section in linker =
stubs
> | =
/OE/shr-core/tmp-eglibc/work-shared/gcc-4.8.0-r0/gcc-4.8.0/gcc/cp/decl.c:7=
189:(.text.unlikely+0x74): relocation truncated to fit: R_ARM_THM_CALL =
against sym
> bol `error(char const*, ...)' defined in .glue_7 section in linker =
stubs
> | =
/OE/shr-core/tmp-eglibc/work-shared/gcc-4.8.0-r0/gcc-4.8.0/gcc/cp/decl.c:7=
191:(.text.unlikely+0x82): relocation truncated to fit: R_ARM_THM_CALL =
against symbol `error(char const*, ...)' defined in .glue_7 section in =
linker stubs
> | =
/OE/shr-core/tmp-eglibc/work-shared/gcc-4.8.0-r0/gcc-4.8.0/gcc/cp/decl.c:7=
194:(.text.unlikely+0x8e): relocation truncated to fit: R_ARM_THM_CALL =
against symbol `error(char const*, ...)' defined in .glue_7 section in =
linker stubs
> | =
/OE/shr-core/tmp-eglibc/work-shared/gcc-4.8.0-r0/gcc-4.8.0/gcc/cp/decl.c:7=
198:(.text.unlikely+0x9c): relocation truncated to fit: R_ARM_THM_CALL =
against symbol `error(char const*, ...)' defined in .glue_7 section in =
linker stubs
> | =
/OE/shr-core/tmp-eglibc/work-shared/gcc-4.8.0-r0/gcc-4.8.0/gcc/cp/decl.c:7=
200:(.text.unlikely+0xaa): additional relocation overflows omitted from =
the output
> | collect2: error: ld returned 1 exit status
> | make[2]: *** [cc1plus] Error 1
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> meta/recipes-devtools/gcc/gcc_4.8.bb | 2 ++
> 1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc_4.8.bb =
b/meta/recipes-devtools/gcc/gcc_4.8.bb
> index 9954375..99485bc 100644
> --- a/meta/recipes-devtools/gcc/gcc_4.8.bb
> +++ b/meta/recipes-devtools/gcc/gcc_4.8.bb
> @@ -3,3 +3,5 @@ require gcc-configure-target.inc
> require gcc-package-target.inc
>=20
> ARCH_FLAGS_FOR_TARGET +=3D "-isystem${STAGING_INCDIR}"
> +
> +ARM_INSTRUCTION_SET =3D "arm"

Looks ok. For now it would be nicer to get a test case narrowed down

> --=20
> 1.8.2.1
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




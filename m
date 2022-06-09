Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21CFEC43334
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 07:35:51 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web12.7666.1654760143704857604
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 00:35:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lo/CtJno;
 spf=pass (domain: gmail.com, ip: 209.85.208.48,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 25so29757645edw.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 00:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=fwpaCTwa2DL/8b7bnQKR6G8WxPY91K4P+vI+QiV7CHg=;
        b=lo/CtJnoBBu2kNwyBkr+AeBbLItANjZiq2gfrpu4DiTI0i0hzgS2a5nSkNITcjkKc3
         bJY4sblF5sqVDu0CXLIhP10ogAGIaG3aQv90NOcASE30J/+9ZiSNfwkIoc2DImWx+x6+
         ydbqzim8tb4Xz5+/aRzHP69dMtS5hFN96Fhlcq5fxrJEjuz+sYHUB6QyESLmdLMG4KJV
         ch1QLG8aptPocKNmWEiKo9YabnS3XT8iU8ma5elMztYzV4E26yFMqd57Rs0raGC+YGP7
         sqEk/tjAbHXwZyjyH1rnfO+3CbIcAK53LWgrwpoGVIhhsz7xvCPYrT2jZrDpNkTkfuJC
         K+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=fwpaCTwa2DL/8b7bnQKR6G8WxPY91K4P+vI+QiV7CHg=;
        b=TkQQXb63Bmqba/CnvOysQsvhoAjLsKUMXRTVF8y6/DHvf6ClVp00krL9CNVrpyQ1k1
         S4fM2OwD+UoM0AG4e0TOt3bE8OgeSQFTOSz8YpAXYXgWcJVlaU29g9oF2BoQE/KADKxA
         CpNbTdzDMxTNw1ODcATH2iiOfnPD38ihxXop83WbhUzobWWrufcDn5nDkMrxmC9JRTPi
         jur9rL/UqOnIUI0gYI5pZR4C8EYTuYqjPPIZ2V52wbhaN6gvd+8R89s0OBhGl71MbcUW
         PtaB1+ZvIkUD7rJwtW6xy/P6s4CrswBv1D10/FNs9Ug64W5gwIbHwSLK5HZC0FmlKZrr
         xJow==
X-Gm-Message-State: AOAM531bjWhp3c8/7ASxI9TL5AchHg/vraJhDg+c1WCQt8d3AVCRvJPS
	2mPR7UjSrGXWPLcD3tWRLcT2UAWm7QHSfA==
X-Google-Smtp-Source: 
 ABdhPJynzGyRXEsq1hwQ6waItQPdaQKXq1HbKfy1xGgJWvHx71GQKH1nfaSVcJi20aht6pDD1ZBnpQ==
X-Received: by 2002:a05:6402:358a:b0:431:20d5:f4ad with SMTP id
 y10-20020a056402358a00b0043120d5f4admr29776868edc.375.1654760141575;
        Thu, 09 Jun 2022 00:35:41 -0700 (PDT)
Received: from smtpclient.apple (host-87-12-122-122.business.telecomitalia.it.
 [87.12.122.122])
        by smtp.gmail.com with ESMTPSA id
 cz20-20020a0564021cb400b0042dd85bd23bsm13816590edb.55.2022.06.09.00.35.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Jun 2022 00:35:40 -0700 (PDT)
Content-Type: multipart/signed;
	boundary="Apple-Mail=_AA69E845-0FD0-4A5A-8C27-5623A440AF21";
	protocol="application/pkcs7-signature";
	micalg=sha-256
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.100.31\))
Subject: Re: [master][kirkstone][PATCH] efivar: add musl libc compatibility
From: Davide Gardenal <davidegarde2000@gmail.com>
In-Reply-To: <20220524080400.293037-1-davide.gardenal@huawei.com>
Date: Thu, 9 Jun 2022 09:35:39 +0200
Cc: Davide Gardenal <davide.gardenal@huawei.com>,
 Steve Sakoman <steve@sakoman.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <9BCBF4D7-5669-4BFF-B5BB-4F24139D1C40@gmail.com>
References: <20220524080400.293037-1-davide.gardenal@huawei.com>
To: openembedded-core@lists.openembedded.org
X-Mailer: Apple Mail (2.3696.100.31)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jun 2022 07:35:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166760


--Apple-Mail=_AA69E845-0FD0-4A5A-8C27-5623A440AF21
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Greetings,

I=E2=80=99m here to flag that this patch has not yet landed to =
kirkstone-nut, is there any reason why?

Davide

> Il giorno 24 mag 2022, alle ore 10:04, Davide Gardenal =
<davidegarde2000@gmail.com> ha scritto:
>=20
> Backport patch to get efivar working with musl.
>=20
> Upstream issue:
> https://github.com/rhboot/efivar/issues/202
>=20
> After commit meta-oe/1582f81805ee3114bc1a44bd5cf52d21f96702ca
> fwupd gives an error when trying to build with musl because
> efivar is not compatible. This fixes the issue.
>=20
> Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
> ---
> .../efisecdb-fix-build-with-musl-libc.patch   | 184 ++++++++++++++++++
> meta/recipes-bsp/efivar/efivar_38.bb          |   3 +-
> 2 files changed, 185 insertions(+), 2 deletions(-)
> create mode 100644 =
meta/recipes-bsp/efivar/efivar/efisecdb-fix-build-with-musl-libc.patch
>=20
> diff --git =
a/meta/recipes-bsp/efivar/efivar/efisecdb-fix-build-with-musl-libc.patch =
b/meta/recipes-bsp/efivar/efivar/efisecdb-fix-build-with-musl-libc.patch
> new file mode 100644
> index 0000000000..ec5b285a06
> --- /dev/null
> +++ =
b/meta/recipes-bsp/efivar/efivar/efisecdb-fix-build-with-musl-libc.patch
> @@ -0,0 +1,184 @@
> +=46rom cece3ffd5be2f8641eb694513f2b73e5eb97ffd3 Mon Sep 17 00:00:00 =
2001
> +From: Natanael Copa <ncopa@alpinelinux.org>
> +Date: Fri, 28 Jan 2022 12:13:30 +0100
> +Subject: [PATCH] efisecdb: fix build with musl libc
> +
> +Refactor code to use POSIX atexit(3) instead of the GNU specific
> +on_exit(3).
> +
> +Resolves: #197
> +Resolves: #202
> +Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
> +
> +Upstream-Status: Backport
> =
+https://github.com/rhboot/efivar/commit/cece3ffd5be2f8641eb694513f2b73e5e=
b97ffd3
> +
> +Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
> +---
> + src/compiler.h |  2 --
> + src/efisecdb.c | 68 =
+++++++++++++++++++-------------------------------
> + 2 files changed, 26 insertions(+), 44 deletions(-)
> +
> +diff --git a/src/compiler.h b/src/compiler.h
> +index e2f18f0b..d95fb014 100644
> +--- a/src/compiler.h
> ++++ b/src/compiler.h
> +@@ -7,8 +7,6 @@
> + #ifndef COMPILER_H_
> + #define COMPILER_H_
> +=20
> +-#include <sys/cdefs.h>
> +-
> + /* GCC version checking borrowed from glibc. */
> + #if defined(__GNUC__) && defined(__GNUC_MINOR__)
> + #  define GNUC_PREREQ(maj,min) \
> +diff --git a/src/efisecdb.c b/src/efisecdb.c
> +index f8823737..6bd5ad90 100644
> +--- a/src/efisecdb.c
> ++++ b/src/efisecdb.c
> +@@ -25,6 +25,10 @@
> + extern char *optarg;
> + extern int optind, opterr, optopt;
> +=20
> ++static efi_secdb_t *secdb =3D NULL;
> ++static list_t infiles;
> ++static list_t actions;
> ++
> + struct hash_param {
> + 	char *name;
> + 	efi_secdb_type_t algorithm;
> +@@ -187,12 +191,11 @@ add_action(list_t *list, action_type_t =
action_type, const efi_guid_t *owner,
> + }
> +=20
> + static void
> +-free_actions(int status UNUSED, void *actionsp)
> ++free_actions(void)
> + {
> +-	list_t *actions =3D (list_t *)actionsp;
> + 	list_t *pos, *tmp;
> +=20
> +-	for_each_action_safe(pos, tmp, actions) {
> ++	for_each_action_safe(pos, tmp, &actions) {
> + 		action_t *action =3D list_entry(pos, action_t, list);
> +=20
> + 		list_del(&action->list);
> +@@ -202,12 +205,11 @@ free_actions(int status UNUSED, void *actionsp)
> + }
> +=20
> + static void
> +-free_infiles(int status UNUSED, void *infilesp)
> ++free_infiles(void)
> + {
> +-	list_t *infiles =3D (list_t *)infilesp;
> + 	list_t *pos, *tmp;
> +=20
> +-	for_each_ptr_safe(pos, tmp, infiles) {
> ++	for_each_ptr_safe(pos, tmp, &infiles) {
> + 		ptrlist_t *entry =3D list_entry(pos, ptrlist_t, list);
> +=20
> + 		list_del(&entry->list);
> +@@ -216,27 +218,12 @@ free_infiles(int status UNUSED, void *infilesp)
> + }
> +=20
> + static void
> +-maybe_free_secdb(int status UNUSED, void *voidp)
> ++maybe_free_secdb(void)
> + {
> +-	efi_secdb_t **secdbp =3D (efi_secdb_t **)voidp;
> +-
> +-	if (secdbp =3D=3D NULL || *secdbp =3D=3D NULL)
> ++	if (secdb =3D=3D NULL)
> + 		return;
> +=20
> +-	efi_secdb_free(*secdbp);
> +-}
> +-
> +-static void
> +-maybe_do_unlink(int status, void *filep)
> +-{
> +-	char **file =3D (char **)filep;
> +-
> +-	if (status =3D=3D 0)
> +-		return;
> +-	if (file =3D=3D NULL || *file =3D=3D NULL)
> +-		return;
> +-
> +-	unlink(*file);
> ++	efi_secdb_free(secdb);
> + }
> +=20
> + static void
> +@@ -323,15 +310,6 @@ parse_input_files(list_t *infiles, char =
**outfile, efi_secdb_t **secdb,
> + 	return status;
> + }
> +=20
> +-/*
> +- * These need to be static globals so that they're not on main's =
stack when
> +- * on_exit() fires.
> +- */
> +-static efi_secdb_t *secdb =3D NULL;
> +-static list_t infiles;
> +-static list_t actions;
> +-static char *outfile =3D NULL;
> +-
> + int
> + main(int argc, char *argv[])
> + {
> +@@ -351,6 +329,7 @@ main(int argc, char *argv[])
> + 	bool do_sort_data =3D false;
> + 	bool sort_descending =3D false;
> + 	int status =3D 0;
> ++	char *outfile =3D NULL;
> +=20
> + 	const char sopts[] =3D ":aAc:dfg:h:i:Lo:rs:t:v?";
> + 	const struct option lopts[] =3D {
> +@@ -376,10 +355,9 @@ main(int argc, char *argv[])
> + 	INIT_LIST_HEAD(&infiles);
> + 	INIT_LIST_HEAD(&actions);
> +=20
> +-	on_exit(free_actions, &actions);
> +-	on_exit(free_infiles, &infiles);
> +-	on_exit(maybe_free_secdb, &secdb);
> +-	on_exit(maybe_do_unlink, &outfile);
> ++	atexit(free_actions);
> ++	atexit(free_infiles);
> ++	atexit(maybe_free_secdb);
> +=20
> + 	/*
> + 	 * parse the command line.
> +@@ -587,24 +565,30 @@ main(int argc, char *argv[])
> + 	outfd =3D open(outfile, flags, 0600);
> + 	if (outfd < 0) {
> + 		char *tmpoutfile =3D outfile;
> +-		if (errno =3D=3D EEXIST)
> +-			outfile =3D NULL;
> ++		if (errno !=3D EEXIST)
> ++			unlink(outfile);
> + 		err(1, "could not open \"%s\"", tmpoutfile);
> + 	}
> +=20
> + 	rc =3D ftruncate(outfd, 0);
> +-	if (rc < 0)
> ++	if (rc < 0) {
> ++		unlink(outfile);
> + 		err(1, "could not truncate output file \"%s\"", =
outfile);
> ++	}
> +=20
> + 	void *output;
> + 	size_t size =3D 0;
> + 	rc =3D efi_secdb_realize(secdb, &output, &size);
> +-	if (rc < 0)
> ++	if (rc < 0) {
> ++		unlink(outfile);
> + 		secdb_err(1, "could not realize signature list");
> ++	}
> +=20
> + 	rc =3D write(outfd, output, size);
> +-	if (rc < 0)
> ++	if (rc < 0) {
> ++		unlink(outfile);
> + 		err(1, "could not write signature list");
> ++	}
> +=20
> + 	close(outfd);
> + 	xfree(output);
> diff --git a/meta/recipes-bsp/efivar/efivar_38.bb =
b/meta/recipes-bsp/efivar/efivar_38.bb
> index 68c4b4b914..53fe20a95b 100644
> --- a/meta/recipes-bsp/efivar/efivar_38.bb
> +++ b/meta/recipes-bsp/efivar/efivar_38.bb
> @@ -10,6 +10,7 @@ COMPATIBLE_HOST =3D =
"(i.86|x86_64|arm|aarch64).*-linux"
> SRC_URI =3D =
"git://github.com/rhinstaller/efivar.git;branch=3Dmain;protocol=3Dhttps =
\
>            file://0001-docs-do-not-build-efisecdb-manpage.patch \
>            =
file://0001-src-Makefile-build-util.c-separately-for-makeguids.patch \
> +           file://efisecdb-fix-build-with-musl-libc.patch \
>            "
> SRCREV =3D "1753149d4176ebfb2b135ac0aaf79340bf0e7a93"
>=20
> @@ -36,5 +37,3 @@ BBCLASSEXTEND =3D "native"
> RRECOMMENDS:${PN}:class-target =3D "kernel-module-efivarfs"
>=20
> CLEANBROKEN =3D "1"
> -# https://github.com/rhboot/efivar/issues/202
> -COMPATIBLE_HOST:libc-musl =3D 'null'
> --=20
> 2.32.0
>=20


--Apple-Mail=_AA69E845-0FD0-4A5A-8C27-5623A440AF21
Content-Disposition: attachment;
	filename=smime.p7s
Content-Type: application/pkcs7-signature;
	name=smime.p7s
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCDWEw
ggXsMIID1KADAgECAhAZua6DiHKYOdyCpz+O9+pLMA0GCSqGSIb3DQEBCwUAMIGBMQswCQYDVQQG
EwJJVDEQMA4GA1UECAwHQmVyZ2FtbzEZMBcGA1UEBwwQUG9udGUgU2FuIFBpZXRybzEXMBUGA1UE
CgwOQWN0YWxpcyBTLnAuQS4xLDAqBgNVBAMMI0FjdGFsaXMgQ2xpZW50IEF1dGhlbnRpY2F0aW9u
IENBIEczMB4XDTIxMDcwOTA4NDU0N1oXDTIyMDcwOTA4NDU0N1owJDEiMCAGA1UEAwwZZGF2aWRl
Z2FyZGUyMDAwQGdtYWlsLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAPOY6kcH
hhZIySmCFFosOe+SfI1xlKqhPlhXcx0EKmMYhQvI05SqOyJlvqOsouJffsGs/RQCjo4n+XiqlVbM
xAb4uLe8hQmTfNoDU8OOmod3SMANu5AshWZpvrS4lXR/RcF5bLmlOvr3NA0L0uivdfnZzuJxByZ4
VxTfp01c4KYxwR+OoSsRiJ73Bur9040YVA68PaMLaqGRPFhNBpWtjbUByv2prunNH2/ffam+2cF9
NMsWMA3bIj3jOjeiLlaFgA+s6T5qVAzP2u4iK+SkgBr2Y2SHZCaRWjL5kFySsw35iSYyh5rVN9iW
0RpRI57TY+x9bZhIDdjuk6QWEHJN1MMCAwEAAaOCAbowggG2MAwGA1UdEwEB/wQCMAAwHwYDVR0j
BBgwFoAUvpepqoS/gL8QU30JMvnhLjIbz3cwfgYIKwYBBQUHAQEEcjBwMDsGCCsGAQUFBzAChi9o
dHRwOi8vY2FjZXJ0LmFjdGFsaXMuaXQvY2VydHMvYWN0YWxpcy1hdXRjbGlnMzAxBggrBgEFBQcw
AYYlaHR0cDovL29jc3AwOS5hY3RhbGlzLml0L1ZBL0FVVEhDTC1HMzAkBgNVHREEHTAbgRlkYXZp
ZGVnYXJkZTIwMDBAZ21haWwuY29tMEcGA1UdIARAMD4wPAYGK4EfARgBMDIwMAYIKwYBBQUHAgEW
JGh0dHBzOi8vd3d3LmFjdGFsaXMuaXQvYXJlYS1kb3dubG9hZDAdBgNVHSUEFjAUBggrBgEFBQcD
AgYIKwYBBQUHAwQwSAYDVR0fBEEwPzA9oDugOYY3aHR0cDovL2NybDA5LmFjdGFsaXMuaXQvUmVw
b3NpdG9yeS9BVVRIQ0wtRzMvZ2V0TGFzdENSTDAdBgNVHQ4EFgQUiqeY/IEM07oIVIos/ACCcr6P
njQwDgYDVR0PAQH/BAQDAgWgMA0GCSqGSIb3DQEBCwUAA4ICAQByXme/hneEsW30qwk9NtxPo0jU
XVCtXGFS8vxZbtyzIQCK/3mJYzkAYQndhqz0s7RP3l+J9MkDXp01vVJurlMcgRCmIDEo2NOak/D1
kNj4qNk8QMJmb+E+VKlB4dW9+vghAO1AQb16C5lGQ9QWW+g4cGk58+IXR58kYJe3e4Os1NNZbC1O
8vPo4coKAWlJrABqDmfqMz2WJhjV9xlRZNf7jii1I+qLOScc+l4tIPmBj1NRt4JRmEKrzVG80NHv
vl1Wwb2DcFV/SHWvZ25SZSmzkNiU/KKuFjQcJYxRl03sbBULug6kN5G19vFsv3ci9bM8FtVCMvb4
Mi0c+rsaJFNwh0M/cVdCAY6qvBEB2haT4+YMAGR7MAnAw3YPt8MIOf83dcSC4st6KKni6M6SQbcp
C0QLSnsmTPcUu6ORkcf+OPPa4caPuCwyrXje2GUsCk3u49k5PQTuTB7Ax4UYhFRkBYl0Lq/pwHUE
ewMztjvdnwEvhmKVAH0pcu0hXqMowR6Xn+oOKgaxkP57RrfF06fCLIGJgIeuPO1VT26SCYV0zkZW
OnGXp1BebVCkxeMe5BFtsRCzDlJc+qDSQhbDhTgxSN4OXcZZGSi2a3eFsW+yexIYBGPGhMrzhOk/
k37cYmTEZRztTrFhb/3OhSAIodd191esnTBcWbanuKWWQ2RXxjCCB20wggVVoAMCAQICEBcQPt49
ihy1ygZRk+fKQ2swDQYJKoZIhvcNAQELBQAwazELMAkGA1UEBhMCSVQxDjAMBgNVBAcMBU1pbGFu
MSMwIQYDVQQKDBpBY3RhbGlzIFMucC5BLi8wMzM1ODUyMDk2NzEnMCUGA1UEAwweQWN0YWxpcyBB
dXRoZW50aWNhdGlvbiBSb290IENBMB4XDTIwMDcwNjA4NDU0N1oXDTMwMDkyMjExMjIwMlowgYEx
CzAJBgNVBAYTAklUMRAwDgYDVQQIDAdCZXJnYW1vMRkwFwYDVQQHDBBQb250ZSBTYW4gUGlldHJv
MRcwFQYDVQQKDA5BY3RhbGlzIFMucC5BLjEsMCoGA1UEAwwjQWN0YWxpcyBDbGllbnQgQXV0aGVu
dGljYXRpb24gQ0EgRzMwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDt5oeWocGktu3C
QlX3Pw8PImBfE+CmQ4iGSZF5HBsvGlAP3EYB7va6OobMUWHvxA+ACHEpWq0YfNh6rRUlULOGcIpE
FtVf4nAiEvdQtiFQBmtWJSn3naoMHqpMvmwZ4lL0Xr1U9JHmTqkU3DuYcNNO3S+hYWDZpWQbeSGi
bNVeiJ4kY6JDh0fvqloK1BsuS3n2OgArPYGfAYtDjCvT2d+6Ym3kArHZjEcrZeBI+yVVnjPwbTSC
Kax8DtS2NP/CJ6RjpnRvuSwusRy84OdwdB71VKs1EDXj1ITcCWRZpkz+OhV6L8Zh+P0rmOSJF6Kd
HiaozfncURx4s54GFJNRGkx1DnCxcuL0NJMYG42/hrDYOjNv+oGWSEZO/CT3aaLSMB5wTbZKfcD1
R+tTanXD+5Gz5Mi15DTE7QH8naZjZxqqhyxL1KyuIgaVDxvQtPSjo5vTsoa09rn+Ui8ybHnvYO/a
/68OIQIHLGbUd2COnwm0TiZ3Jg/oYGxwnJPvU1nDXNcecWTIJvFF5qD2ppJH3HgJVVePUEOY1E4K
p3k0B8hdRdhMV5n+O6RCKCTFcZaESF8sELgdrqnCLPP1+rX7DA8pxZoX0/9Jk64EOsbfQyLIJlrr
ob2YS0Xlku6HisZ8qrHLhnkzF5y7O34xmatIp8oZ5c54QP+K5flnTYzWjuIxLwIDAQABo4IB9DCC
AfAwDwYDVR0TAQH/BAUwAwEB/zAfBgNVHSMEGDAWgBRS2Ig6yJ94Zu2J83s4cJTJAgI20DBBBggr
BgEFBQcBAQQ1MDMwMQYIKwYBBQUHMAGGJWh0dHA6Ly9vY3NwMDUuYWN0YWxpcy5pdC9WQS9BVVRI
LVJPT1QwRQYDVR0gBD4wPDA6BgRVHSAAMDIwMAYIKwYBBQUHAgEWJGh0dHBzOi8vd3d3LmFjdGFs
aXMuaXQvYXJlYS1kb3dubG9hZDAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQwgeMGA1Ud
HwSB2zCB2DCBlqCBk6CBkIaBjWxkYXA6Ly9sZGFwMDUuYWN0YWxpcy5pdC9jbiUzZEFjdGFsaXMl
MjBBdXRoZW50aWNhdGlvbiUyMFJvb3QlMjBDQSxvJTNkQWN0YWxpcyUyMFMucC5BLiUyZjAzMzU4
NTIwOTY3LGMlM2RJVD9jZXJ0aWZpY2F0ZVJldm9jYXRpb25MaXN0O2JpbmFyeTA9oDugOYY3aHR0
cDovL2NybDA1LmFjdGFsaXMuaXQvUmVwb3NpdG9yeS9BVVRILVJPT1QvZ2V0TGFzdENSTDAdBgNV
HQ4EFgQUvpepqoS/gL8QU30JMvnhLjIbz3cwDgYDVR0PAQH/BAQDAgEGMA0GCSqGSIb3DQEBCwUA
A4ICAQAmm+cbWQ10sxID6edV94SAhc1CwzthHFfHpuYS30gisWUfWpgp43Dg1XzG2in3VGV7XrzC
CGZh4JM/XQWp+4oxmyV42Qjz9vc8GRksgo6X2nYObPYZzQjda9wxsCB38i4G3H33w8lf9sFvl0xm
4ZXZ2s2bF/PdqvrK0ZgvF51+MoIPnli/wJBw3p72xbk5Sb1MneSO3tZ293WFzDmz7tuGU0PfytYU
kG7O6annGqbU1I6CA6QVKUqeFLPodSODAFqJ3pimKD0vX9MuuSa0QinH7CkiPtZMD0mpwwzIsnSs
3qOOl60tIZQOTc0I6lCe1LLhrz7Q75J6nNL9N5zVwZ1I3o2Lb8Dt7BA13VFuZvZIzapUGV83R7pm
SVaj1Bik1nJ/R393e6mwppsT140KDVLh4Oenywmp2VpBDuEj9RgICAO0sibv8n379LbO7ARa0kw9
y9pggFzN2PAX25b7w0n9m78kpv3z3vW65rs6wl7E8VEHNfv8+cnb81dxN3C51KElz+l31zchFTur
D5HFEpyEhzO/fMS5AkweRJIzwozxNs7OL/S/SVTpJLJL1ukZ1lnHHX0d3xCzRy/5HqfK3uiG22LP
B5+RjNDobPAjAz2BKMfkF/+v0pzn8mqqkopQaJzEAbLbMpgQYHRCjvrUxxwjJyUFb2Z+40UNtMF4
MTK7zTGCA4UwggOBAgEBMIGWMIGBMQswCQYDVQQGEwJJVDEQMA4GA1UECAwHQmVyZ2FtbzEZMBcG
A1UEBwwQUG9udGUgU2FuIFBpZXRybzEXMBUGA1UECgwOQWN0YWxpcyBTLnAuQS4xLDAqBgNVBAMM
I0FjdGFsaXMgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIENBIEczAhAZua6DiHKYOdyCpz+O9+pLMA0G
CWCGSAFlAwQCAQUAoIIBvzAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEP
Fw0yMjA2MDkwNzM1MzlaMC8GCSqGSIb3DQEJBDEiBCCO5Gqww948X7rBquIA4DsM+BtTa08NkwsZ
1cEhHjTRxjCBpwYJKwYBBAGCNxAEMYGZMIGWMIGBMQswCQYDVQQGEwJJVDEQMA4GA1UECAwHQmVy
Z2FtbzEZMBcGA1UEBwwQUG9udGUgU2FuIFBpZXRybzEXMBUGA1UECgwOQWN0YWxpcyBTLnAuQS4x
LDAqBgNVBAMMI0FjdGFsaXMgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIENBIEczAhAZua6DiHKYOdyC
pz+O9+pLMIGpBgsqhkiG9w0BCRACCzGBmaCBljCBgTELMAkGA1UEBhMCSVQxEDAOBgNVBAgMB0Jl
cmdhbW8xGTAXBgNVBAcMEFBvbnRlIFNhbiBQaWV0cm8xFzAVBgNVBAoMDkFjdGFsaXMgUy5wLkEu
MSwwKgYDVQQDDCNBY3RhbGlzIENsaWVudCBBdXRoZW50aWNhdGlvbiBDQSBHMwIQGbmug4hymDnc
gqc/jvfqSzANBgkqhkiG9w0BAQsFAASCAQDUju3dQSE414j+JAXfAdzR66z8OBTyROEJyMoz95ZY
oEs9PdBBd6gaA2NKPGYMCvZVFR7prHiA6UBBCELl88uImZWflVJ5qVXaFoJ4eOiTcxdwTEWtukoD
ShEX62e3/CUp7uGxDNHuXslbAvMyqUBaRydfUF3u2QKFBqJJpggxfbQGYLwNaLEDjuIVo5NelpLl
K+oy3nA6DSHXwfmYxVsDuBpR334b/ZV3H+VExHMexRafILsOZKaecSLVi0Gmr6FS9jvGAwMf6y14
z7Ta4QG31pQWQwyfqluEY3xnYlBdMIwfvXa6QPfTItGOSLHk/i8tK01TAq5qmqQSXYLkEy4jAAAA
AAAA
--Apple-Mail=_AA69E845-0FD0-4A5A-8C27-5623A440AF21--


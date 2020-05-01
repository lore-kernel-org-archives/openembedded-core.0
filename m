Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.87])
 by mx.groups.io with SMTP id smtpd.web12.10225.1588340937991319868
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2020 06:48:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=Kt5tVLB+;
 spf=pass (domain: siemens.com, ip: 40.107.21.87, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bkc8Pv4+wSjtXO9TDo09rVIVlpdteUnczoo60fnghyyQxdwFn5FXV2LF+8SVBnKxmMVLjnaqO5wmP05IW+7nJAEGw2BLynH3wQJK+pJOPjvymMu/Hv1DelBWIP6klvcSiw26zKIJmEbv+x+IOPSef/fYHe9+wUICFr1w24rPQuMFtwIBVjPgDHJBvIYk2/xrZke67D7RBS+qE5tAYB0eos9u1GrmdIa/anp86yfPRuWK6F1mmRY/TCBH/BTsvV5m2H/qAuH2Is0LaM78k5J3H2URDks5Ywp+/q2rnHO5pzA0zAq5LdvuSiEmj6hJOWzlZBZIxfW2/im7PQV9iwjIMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vdaQQ41U19VloyUMPMCf0MQLiZRM0cfGBA6dvTiXJ1M=;
 b=nJCn3WQDxboyadx1cAmqDRJ/wnEOiS5FajR4GruHulfCaO2Ma2n+PQyZMtFDhBN4EuhpLuOdEkXaV7GrJ+wYNXL67LnFAOby6XffoPwro9Nfo5SNChPrbNi/NuXfsxirIh0rSscOJVqb12X2lnAyrh/45mU5CLhpWQR/JbZQp4nql0OqBjueeX0oMRRpvYSLBArwhTM0lEkGhjWaKHRya8Y4uy1w52pkvk/9VCfTf3tx4rL+neNYNkUyiWhn0pPlB8TBRJGCaelUgFtIloYygcX+oZTi1DMtrE1A7asLi2dAD3v7qEsa/QnHrvJZ9sdRbV/ppFhnJCskpCfoCUhAgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vdaQQ41U19VloyUMPMCf0MQLiZRM0cfGBA6dvTiXJ1M=;
 b=Kt5tVLB+KkImBw49QgGDcoGzwwtMDAbtOEZEa0/JnE2UtCp+Fh7UDI2vdQWr8cCbEZcAelfRsm4luXT69GRgWF5UurvGjxUqR3RlJTn2ixt6o7awXrlMumHDlx7xYtGcrNHrDTq0mCL7cm6ymJSnh2kITm9BS0KluAxvDNhB4Z0=
Received: from AM6PR10MB3000.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:e6::28)
 by AM6PR10MB2261.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:43::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19; Fri, 1 May
 2020 13:48:55 +0000
Received: from AM6PR10MB3000.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::808a:ad03:40a9:baec]) by AM6PR10MB3000.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::808a:ad03:40a9:baec%6]) with mapi id 15.20.2958.020; Fri, 1 May 2020
 13:48:54 +0000
From: "Andrej Valek" <andrej.valek@siemens.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] icu: upgrade 66.1 -> 67.1
Thread-Topic: [OE-core][PATCH] icu: upgrade 66.1 -> 67.1
Thread-Index: AQHWH5JNIZU6aOc5VUeHm/83tk0OiKiTPWRQ
Date: Fri, 1 May 2020 13:48:54 +0000
Message-ID: 
 <AM6PR10MB3000A0A64DB428E5ED6F33D292AB0@AM6PR10MB3000.EURPRD10.PROD.OUTLOOK.COM>
References: <20200501082616.11296-1-andrej.valek@siemens.com>
In-Reply-To: <20200501082616.11296-1-andrej.valek@siemens.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-document-confidentiality: NotClassified
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=siemens.com;
x-originating-ip: [165.225.200.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 58a6276c-f4b5-495e-f238-08d7edd663d4
x-ms-traffictypediagnostic: AM6PR10MB2261:
x-microsoft-antispam-prvs: 
 <AM6PR10MB22613131DC2BA1F01461BE2892AB0@AM6PR10MB2261.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:262;
x-forefront-prvs: 0390DB4BDA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 7iuuUWXwkN94UnenmUh/CRkVLdCUee3mUBY+O60S31DY5YcYQTIMtY8wbtBMjDmd69SuC/pRVNxOuzDsEW8sF8N/mflp4UZu3QZG44biQGrkgKklPbdKEEgnf92tH6FtuxX4mnhw5/KH5178wvlMmK7kRaVBljJMCFFVbjqqCEcn/LddmUpw08rTy7pxXiMg2lf6MTpbA3QcPQ56/6WcoX07ggwvVYpRju/27+X9MNpNi3HZXs23vKRWqfOuZzUOQHXpOgf0vSrCShKmMeBRW+z09DUnd71oiq0vN6zpIfu96BmryqF33rKYtI++ex9SGdBM8zbL9X8yNcbPOeby35hNrnHEwiCzbTUoZR+zKzjPob6WoMTtMOEbAmHA+Ogk6YId6rerwBlJ0GfCixDsoiQWYN6+C6AwPjxz/7pkqZy0Pvp+m+3RbeBl2ceoPdZPbtdvlpne9AI3PNryqh4ogAV4P5iebAVv7IZsX8+KKjA0KTSid4baLGgkUar9gIMtuLMNh8KNx3Jk3OXZBlSfVw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR10MB3000.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(376002)(396003)(346002)(366004)(136003)(76116006)(64756008)(66946007)(66446008)(52536014)(71200400001)(316002)(66476007)(26005)(186003)(6506007)(53546011)(110136005)(66556008)(55236004)(7696005)(478600001)(966005)(2906002)(45080400002)(5660300002)(8676002)(33656002)(55016002)(8936002)(86362001)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 DogHqMt8uEmD0DwtzLFEhp6T9RL9s80tjUPTOinkaPHJXC2qnBJmsk5QNwXaHUbsPQ5CdwpBxkJHkn85LzFls0h5c1CQk+IvtxY8WQRiXG1a6u8CA0Y8r36Ge+G1wZMvdGxDz0Ss/TrUlfRB+i4EWvvz67aEr+D2jY0nT+8hgSCyM8m80g164Pf7+ykTAf/gQSxFTZcRl26tASXOeaBbl+a65SDcZl81jvWZvra/ruBuUV26hkiea2pv2BDtW9aqPXqyQ1k0EfiP+sKKDEgPg3pP9oRhUFvRKBa8fd9AX+mkOmFxQ8JTZJu55cZeh3KeOGpPRMZRmE/PtQvvVEmw4A6kJdjq777FPsgyLE2zkOL/18v3m/e+gmZKR5LiFVMQGtmEpxKpNk9GbRqf0F7IC0webZ15m4QQo9IRU53xBfGjthQKa/ujODqxNWeZnJSKL+FZsdFbkRDCbb4X739psTH0TmaGeMaVebf2n3vW23nxtxKD8sNBk0B07B/CJfiS86gWpZ+ilh0ZqO7mZEttFnHc193EntMQyFFcRz3eb9E3cNcmM7Ff4Woh0HRL3f2i/EQ3Itt4so6t/cglE5Jt5OZ5Xv5lXsVMPJvEcSE9vluV5nxvonphbB2dHS6HYvHO7RotzoExK+LkecUBsK90DOv/ZSFmljWBkFFojO1DF000XnMtBSEZSeZmSsm3moY7od5CtLTU0962RuDeCab7IRNMDlluxJpPRrYiER4tRGmvmlRk5rLiCdKQMfSGeXQfJbc02Z9tVKgs6vNTSC9/5DoWa7600EPrRp7ejwRIL4sYNBqn3FHPDvZuwlQS7xQV
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58a6276c-f4b5-495e-f238-08d7edd663d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2020 13:48:54.7660
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l/e3/7ZCzpuf7/wtkYxsSxmCA0ROqD68Lfg9ft0/QGgrIGse4t/KYv619g/ytCQ9kVyR0ioufPq2kZoO1JXGeqPd9ml7UN34IiqFdec9cII=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2261
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Alex,

I wanted to upgrade ICU to 67.1 release but without success. Locally it was=
 working as well. When I was trying to apply the upgrading patch it failed.=
 I realized that, there are mixed line endings Linux/Windows. I am able to =
apply patch with "git am --keep-cr", but It's still failing on patchwork.

I was trying to send the patch with different encodings, auto, 7bit, but st=
ill without success (3-times). Which kind of " --transfer-encoding=3D(7bit|=
8bit|quoted-printable|base64" should I use for it? Is there an another way =
to submit the patch?

Thank you,
Andrej

-----Original Message-----
From: Andrej Valek <andrej.valek@siemens.com>=20
Sent: Friday, May 1, 2020 10:26 AM
To: openembedded-core@lists.openembedded.org
Cc: Valek, Andrej (IOT DS EU SK SI-BP1) <andrej.valek@siemens.com>
Subject: [OE-core][PATCH] icu: upgrade 66.1 -> 67.1

- 0001-icu-Added-armeb-support.patch - rebased
- 0001-Fix-big-endian-build.patch - removed, already included in new versio=
n
- icu-pkgdata-large-cmd.patch - removed, implemented correct size

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 .../icu/icu/0001-Fix-big-endian-build.patch        | 28 -------------
 .../icu/icu/0001-icu-Added-armeb-support.patch     |  6 +--
 .../icu/icu/icu-pkgdata-large-cmd.patch            | 49 ------------------=
----
 .../icu/{icu_66.1.bb =3D> icu_67.1.bb}               |  7 +---
 4 files changed, 5 insertions(+), 85 deletions(-)  delete mode 100644 meta=
/recipes-support/icu/icu/0001-Fix-big-endian-build.patch
 delete mode 100644 meta/recipes-support/icu/icu/icu-pkgdata-large-cmd.patc=
h
 rename meta/recipes-support/icu/{icu_66.1.bb =3D> icu_67.1.bb} (84%)

diff --git a/meta/recipes-support/icu/icu/0001-Fix-big-endian-build.patch b=
/meta/recipes-support/icu/icu/0001-Fix-big-endian-build.patch
deleted file mode 100644
index 91d68848c7..0000000000
--- a/meta/recipes-support/icu/icu/0001-Fix-big-endian-build.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 9be0b489a94b57419202c552022f25cb95bfac51 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 17 Apr 2019 16:41:58 +0200
-Subject: [PATCH] Fix big-endian build
-
-Bug-report: https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A=
%2F%2Funicode-org.atlassian.net%2Fbrowse%2FICU-20533&amp;data=3D02%7C01%7Ca=
ndrej.valek%40siemens.com%7Cf699ca9e0c5e4e6a04f908d7eda96fbb%7C38ae3bcd9579=
4fd4addab42e1495d55a%7C1%7C0%7C637239184284814122&amp;sdata=3DlkF0ueFchcq6k=
B67u%2BE52DnoJTVlb%2BhD5YtUQKo2TWI%3D&amp;reserved=3D0
-Patch taken from: https://eur01.safelinks.protection.outlook.com/?url=3Dht=
tps%3A%2F%2Fbugs.gentoo.org%2F682170&amp;data=3D02%7C01%7Candrej.valek%40si=
emens.com%7Cf699ca9e0c5e4e6a04f908d7eda96fbb%7C38ae3bcd95794fd4addab42e1495=
d55a%7C1%7C0%7C637239184284814122&amp;sdata=3DGiOAPhwkklHKkOtWwBWk6RdbyvvHi=
NGii7U1psFjhx8%3D&amp;reserved=3D0
-
-it is applied upstream and will be in version 67+
-
-Upstream-Status: Backport [https://eur01.safelinks.protection.outlook.com/=
?url=3Dhttps%3A%2F%2Fgithub.com%2Funicode-org%2Ficu%2Fcommit%2F4a3a457b38cd=
828b7b3fa4fdbc6e2504a57275e9&amp;data=3D02%7C01%7Candrej.valek%40siemens.co=
m%7Cf699ca9e0c5e4e6a04f908d7eda96fbb%7C38ae3bcd95794fd4addab42e1495d55a%7C1=
%7C0%7C637239184284814122&amp;sdata=3Dsqj%2B6HJBvmGjkMFTUOoW2%2F9pHppNCQDhj=
p4pufpfSDM%3D&amp;reserved=3D0]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- data/Makefile.in | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
---- a/data/Makefile.in
-+++ b/data/Makefile.in
-@@ -148,7 +148,8 @@ ICUDATA_ARCHIVE =3D $(firstword $(wildcard
- # and convert it to the current type.
- ifneq ($(ICUDATA_ARCHIVE),)
- ICUDATA_SOURCE_ARCHIVE =3D $(OUTDIR)/$(ICUDATA_PLATFORM_NAME).dat
--$(ICUDATA_SOURCE_ARCHIVE): $(ICUDATA_ARCHIVE) $(OUTDIR)
-+$(ICUDATA_SOURCE_ARCHIVE): $(ICUDATA_ARCHIVE)
-+	$(MKINSTALLDIRS) $(OUTDIR)
- 	$(INVOKE) $(TOOLBINDIR)/icupkg -t$(ICUDATA_CHAR) $(ICUDATA_ARCHIVE) $(IC=
UDATA_SOURCE_ARCHIVE)
- endif
- else
diff --git a/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patc=
h b/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
index 299689d95c..145efc0e01 100644
--- a/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
+++ b/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
@@ -13,10 +13,10 @@ Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/i18n/double-conversion-utils.h b/i18n/double-conversion-utils=
.h -index 1e44fca..e4f2a8b 100644
+index 8c6a0e1..cf89907 100644
 --- a/i18n/double-conversion-utils.h
 +++ b/i18n/double-conversion-utils.h
-@@ -92,7 +92,7 @@ int main(int argc, char** argv) {
+@@ -115,7 +115,7 @@ int main(int argc, char** argv) {
  //
  // If it prints "correct" then the architecture should be here, in the "c=
orrect" section.
  #if defined(_M_X64) || defined(__x86_64__) || \ @@ -24,7 +24,7 @@ index 1=
e44fca..e4f2a8b 100644
 +    defined(__arm__) || defined(__avr32__) || defined(_M_ARM) || defined(=
_M_ARM64) || \
      defined(__hppa__) || defined(__ia64__) || \
      defined(__mips__) || \
-     defined(__powerpc__) || defined(__ppc__) || defined(__ppc64__) || \
+     defined(__nios2__) || \
 --
 2.7.4
=20
diff --git a/meta/recipes-support/icu/icu/icu-pkgdata-large-cmd.patch b/met=
a/recipes-support/icu/icu/icu-pkgdata-large-cmd.patch
deleted file mode 100644
index e758a623ef..0000000000
--- a/meta/recipes-support/icu/icu/icu-pkgdata-large-cmd.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-pkgdata.cpp: use LARGE_BUFFER_MAX_SIZE for cmd
-
-Use LARGE_BUFFER_MAX_SIZE for cmd rather than SMALL_BUFFER_MAX_SIZE, -othe=
rwise there was a Segmentation fault error when the command line is -long, =
this should be a misplay since other cmd uses -LARGE_BUFFER_MAX_SIZE.
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
- tools/pkgdata/pkgdata.cpp | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/tools/pkgdata/pkgdata.cpp b/tools/pkgdata/pkgdata.cpp -index =
60167dd..506dd32 100644
---- a/tools/pkgdata/pkgdata.cpp
-+++ b/tools/pkgdata/pkgdata.cpp
-@@ -1084,7 +1084,7 @@ normal_symlink_mode:
-
- static int32_t pkg_installLibrary(const char *installDir, const char *tar=
getDir, UBool noVersion) {
-     int32_t result =3D 0;
--    char cmd[SMALL_BUFFER_MAX_SIZE];
-+    char cmd[LARGE_BUFFER_MAX_SIZE];
-=20
-     sprintf(cmd, "cd %s && %s %s %s%s%s",
-             targetDir,
-@@ -1152,7 +1152,7 @@ static int32_t pkg_installLibrary(const char *instal=
lDir, const char *targetDir,
-
- static int32_t pkg_installCommonMode(const char *installDir, const char *=
fileName) {
-     int32_t result =3D 0;
--    char cmd[SMALL_BUFFER_MAX_SIZE] =3D "";
-+    char cmd[LARGE_BUFFER_MAX_SIZE] =3D "";
-=20
-     if (!T_FileStream_file_exists(installDir)) {
-         UErrorCode status =3D U_ZERO_ERROR;
-@@ -1184,7 +1184,7 @@ static int32_t pkg_installCommonMode(const char *ins=
tallDir, const char *fileNam
- #endif
- static int32_t pkg_installFileMode(const char *installDir, const char *sr=
cDir, const char *fileListName) {
-     int32_t result =3D 0;
--    char cmd[SMALL_BUFFER_MAX_SIZE] =3D "";
-+    char cmd[LARGE_BUFFER_MAX_SIZE] =3D "";
-=20
-     if (!T_FileStream_file_exists(installDir)) {
-         UErrorCode status =3D U_ZERO_ERROR;
---
-1.9.1
-
diff --git a/meta/recipes-support/icu/icu_66.1.bb b/meta/recipes-support/ic=
u/icu_67.1.bb
similarity index 84%
rename from meta/recipes-support/icu/icu_66.1.bb
rename to meta/recipes-support/icu/icu_67.1.bb
index f2bb344e33..58638507c9 100644
--- a/meta/recipes-support/icu/icu_66.1.bb
+++ b/meta/recipes-support/icu/icu_67.1.bb
@@ -22,17 +22,15 @@ DATA_SRC_URI =3D "https://eur01.safelinks.protection.ou=
tlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Funicode-org%2Ficu%2Freleases%2F=
download%2Frelease-%24&amp;data=3D02%7C01%7Candrej.valek%40siemens.com%7Cf6=
99ca9e0c5e4e6a04f908d7eda96fbb%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7=
C637239184284814122&amp;sdata=3DtOWF0krhT2h0ba16I8RDpLLqZglg4o48ULQg5xW7OjI=
%3D&amp;reserved=3D0{I
 SRC_URI =3D "${BASE_SRC_URI};name=3Dcode \
            ${DATA_SRC_URI};name=3Ddata \
            file://filter.json \
-           file://icu-pkgdata-large-cmd.patch \
            file://fix-install-manx.patch \
-           file://0001-Fix-big-endian-build.patch;apply=3Dno \
            file://0001-icu-Added-armeb-support.patch \
            "
=20
 SRC_URI_append_class-target =3D "\
            file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
           "
-SRC_URI[code.sha256sum] =3D "52a3f2209ab95559c1cf0a14f24338001f389615bf00e=
2585ef3dbc43ecf0a2e"
-SRC_URI[data.sha256sum] =3D "8be647f738891d2beb79d48f99077b3499948430eae6f=
1be112553b15ab0243e"
+SRC_URI[code.sha256sum] =3D "94a80cd6f251a53bd2a997f6f1b5ac6653fe791dfab66=
e1eb0227740fb86d5dc"
+SRC_URI[data.sha256sum] =3D "7c16a59cc8c06128b7ecc1dc4fc056b36b17349312829=
b17408b9e67b05c4a7e"
=20
 UPSTREAM_CHECK_REGEX =3D "icu4c-(?P<pver>\d+(_\d+)+)-src"
 UPSTREAM_CHECK_URI =3D "https://eur01.safelinks.protection.outlook.com/?ur=
l=3Dhttps%3A%2F%2Fgithub.com%2Funicode-org%2Ficu%2Freleases&amp;data=3D02%7=
C01%7Candrej.valek%40siemens.com%7Cf699ca9e0c5e4e6a04f908d7eda96fbb%7C38ae3=
bcd95794fd4addab42e1495d55a%7C1%7C0%7C637239184284814122&amp;sdata=3Doc4vNT=
Jru5V9fuwz7ODlmQDVMB8EQF6EkXT1mfGM1gA%3D&amp;reserved=3D0"
@@ -43,7 +41,6 @@ do_make_icudata_class-target () {
     cd ${S}
     rm -rf data
     cp -a ${WORKDIR}/data .
-    patch -p1 < ${WORKDIR}/0001-Fix-big-endian-build.patch
     AR=3D'${BUILD_AR}' \
     CC=3D'${BUILD_CC}' \
     CPP=3D'${BUILD_CPP}' \
--
2.11.0


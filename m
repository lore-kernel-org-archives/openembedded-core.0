Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.40])
 by mx.groups.io with SMTP id smtpd.web10.1390.1602274877018510633
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2020 13:21:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=oTAXPaPG;
 spf=pass (domain: windriver.com, ip: 40.107.94.40, mailfrom: stacy.gaikovaia@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WYErVvgFCfxQ6qj2frC0YfRYGi1zfP78FWdyFiHCM5+OJSMzTT8UNbnaARJjTfnPQM8GFLEp39szHQ500KBUhtC83YCu75W0SJKLPYJO78vtpNL3lJUAd/h7TsINJHRzoq6Ekyu5RPnDRsn7qX66HxPbYhzduq4F/Z7Bf2vCtRcAHK/luhZx/U4XQ8FlBGFljSnIXhSsUJApPn5sgbc3Ebbom8M2UagTmeHKGVaNtltuqRLpeDLNT8IeiGrP73x12asW7uTl5c6xcM0Po5vgty907v2UIeDO+4bB6212eiOcZOoGiCbYpR2f49hiMc4Ez3tJ3uFwYS8DMGXTA58YnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c4aObcs9b9HE58Li1nISoLnqJ2Vy/WEQ3yLdihkcYKc=;
 b=YreLxoI4JM2hd+fn7itXUVRzCneWjAjuNdNuuoSekt4OaiAJKPirFCcscsSUnmQCaRwT4sk2LrCvSV6jTfdd3OdWdMVB3OAWRtja4hZn2EOX60ohnXgiQOvx1MC1uLUnGZhfAfjBYNjqWLRw2+CJ4wZu4cKGN12OzcxPtaQ9B3N0cz/tjNGQlue7LFLBHiRyIRgI23W+vd5meVI9HLXtIdM6gtdnHjioMypfquxjgJ4AaKUcCdMRA/tQi4T26t58wirnGc66gynjYayg06bUjLoLXmJsEu0+eAZlnb653a7Bvnx9c1QEfpsi3aTIh+IfiK1XJBRT2TL3gtxKtmVNLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c4aObcs9b9HE58Li1nISoLnqJ2Vy/WEQ3yLdihkcYKc=;
 b=oTAXPaPGDHnTEqq5/cICsoyO6s9qF3iWV7SnFSH9/vXGD2YLALtrdieEaWO2+EiiMmFiNelE4VerURP5bYtrTR6R4Kw7dGbddUUVQSsS7OlO8HnDmBJhCv+ci6nBYvKuTvJ3l5i1yhxMIRCJ/DJyObCSGRl+RSkRmtBhFMKBNv8=
Received: from BYAPR11MB3127.namprd11.prod.outlook.com (2603:10b6:a03:91::32)
 by BY5PR11MB4497.namprd11.prod.outlook.com (2603:10b6:a03:1cc::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22; Fri, 9 Oct
 2020 20:21:14 +0000
Received: from BYAPR11MB3127.namprd11.prod.outlook.com
 ([fe80::b1c4:b8ce:3c62:2b94]) by BYAPR11MB3127.namprd11.prod.outlook.com
 ([fe80::b1c4:b8ce:3c62:2b94%4]) with mapi id 15.20.3455.027; Fri, 9 Oct 2020
 20:21:14 +0000
From: "Stacy Gaikovaia" <Stacy.Gaikovaia@windriver.com>
To: Randy MacLeod <rwmacleod@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] valgrind: drd: fix pthread intercept test failures
Thread-Topic: [OE-core] [PATCH] valgrind: drd: fix pthread intercept test
 failures
Thread-Index: AQHWnmPiBTShutKl0keZTxjt6XgtJKmPtOkAgAABMeA=
Date: Fri, 9 Oct 2020 20:21:14 +0000
Message-ID: 
 <BYAPR11MB3127C6EBD896DBB8D1887A2DFD080@BYAPR11MB3127.namprd11.prod.outlook.com>
References: 
 <20201009174436.3243814-1-stacy.gaikovaia@windriver.com>,<CAK6=ix4Uro_mQyie8ZiMXST5TUMvWcDgwDTsAtYtEtjaBE5vmw@mail.gmail.com>
In-Reply-To: 
 <CAK6=ix4Uro_mQyie8ZiMXST5TUMvWcDgwDTsAtYtEtjaBE5vmw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
x-originating-ip: [70.53.9.167]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 28d49b1d-5a2a-4dde-5caf-08d86c90df12
x-ms-traffictypediagnostic: BY5PR11MB4497:
x-microsoft-antispam-prvs: 
 <BY5PR11MB44978B50692956A38BA33320FD080@BY5PR11MB4497.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 IbbcXZSTS7x0r/4nOz4O2gAu6/63q/fL4J9aFUhxwx2kEA+lkZGv6FTTVv3grzOt42LEgyfTy+O12yb7+5pBhvY2rklNUpZvPD1yP63qAtnvRVc0AuTxqOo0V6ycW/kSTVR/q+iMeJ8AUJbch47YhHbHac7/8RindeD9fEciWaQUfQRfRxeCgq4qSK1g7yadhHwLk3O7Hnn1x1ZjlXwz7ICNDuapizpUbDWpQGP97wr62aH7Azi74RPKDWM46mOYjoEf4gm2UtghvZ3vAcUzZ7jK4NuplXea4li5fYwDzTJXJXI5t9MY8HJ5xVRhBtec0jOlbib8w+vyJBToVcrnnpp3+ONry7l6FDatBoc2f7LUSQPGKg0XOMt+1YlfHcGvDE0FJNjx1ZiHnnz2rErp1g==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3127.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(136003)(39850400004)(366004)(66446008)(71200400001)(5660300002)(52536014)(4326008)(8936002)(8676002)(6916009)(76116006)(66556008)(478600001)(66946007)(64756008)(966005)(55016002)(66476007)(26005)(33656002)(166002)(186003)(83080400001)(9686003)(53546011)(83380400001)(2906002)(7696005)(316002)(19627405001)(6506007)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 i+So7xwPANK3VoILCDQhPvGbyrwKweFGXNqXzfrgGtehFCVhP2ZGQUI7OdgZ38xYMAnZ37X9P8tNq5nD+jwuiGZKJ8FsxLUpsG0CWFykLbXp62arXioXQGWqaycUCihujJbVnQJP/eJSe1VJPD7nsGw2GPnz3vdaaymF9Bke1Tgxozw4Mp3SbXq1eZPy3lR/9uliRg989PFM68bs9nleRR8W/QXHWbgycNbocyCZAxWkKZYIuAIRFMJWkhjVhzFra6NLGrBe9m+YOSCFub5KADS+JlhguNetDUqHxN+R6EXd/MeiTevoIbQ2+ZMGNVbxOudIotUM6wdWCwRUb1PLId2Q/1WOprAD4gj+X/p08PZkUbLSRjYagMmoAKJFSX3eAFOBDdg59vRV5cXnVn9KztBJzyg2WZJ7QG/2zu+YpSOBRGh7xmunS/RiLSqD4jocRrJNvy67Y2rmZv1v/tvd05Y/MNuQrSNnI0VwxJSjgLxHggQQj3CuSYCVUXpqTEveKJWfLkOt4wEJrEKUxQHyoaKu1O8xAfNCqS8YS9ILHJ8mQz6qiXeMYr6g4OGUK6/jyJSBta1OmW+lxrhA5SSWvo/VxO6QTcwHOPpn3q3G6pw80qzAiLGhA3hhkXSHrgrEp/WXfCmtSZph+B1woAEzbw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3127.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28d49b1d-5a2a-4dde-5caf-08d86c90df12
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2020 20:21:14.5618
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XsBuNCWqL7U67m2/LGFKpvxx/Y6Hymia1ExGQV7iWMCMRZ8mvPJyjkdsHcSRIM9kH61z6BcCFZwr6NEAJYdnNUuO7pXL7dMjqCoyQoWjR98=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4497
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BYAPR11MB3127C6EBD896DBB8D1887A2DFD080BYAPR11MB3127namp_"

--_000_BYAPR11MB3127C6EBD896DBB8D1887A2DFD080BYAPR11MB3127namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sure I'll do those things.


Upsteam-Status: Backport

>> This goes in the body of the patch. Mention the vg commit ID too please=
.

I have the vg commit ID in the body of the patch, is that ok or should bot=
h things be in both spots?

Stacy
________________________________
From: Randy MacLeod <rwmacleod@gmail.com>
Sent: Friday, October 9, 2020 4:14 PM
To: Gaikovaia, Stacy <Stacy.Gaikovaia@windriver.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.open=
embedded.org>
Subject: Re: [OE-core] [PATCH] valgrind: drd: fix pthread intercept test f=
ailures



On Fri., Oct. 9, 2020, 13:45 Stacy Gaikovaia, <Stacy.Gaikovaia@windriver.c=
om<mailto:Stacy.Gaikovaia@windriver.com>> wrote:
From: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com<mailto:Stacy.Gaikovai=
a@windriver.com>>

After glibc uprev 2.32 -> 2.32, the

2.31 -> 2.32

following drd ptests
fail with the error "condition variable has not been initialized".

drd/tests/annotate_hb_err
drd/tests/annotate_sem
drd/tests/annotate_rwlock
drd/tests/annotate_order_2
drd/tests/annotate_smart_pointer
drd/tests/annotate_spinlock
drd/tests/monitor_example
drd/tests/pth_cond_race
drd/tests/pth_inconsistent_cond_wait

In glibc 2.32, the POSIX thread functions are in both
libc and libpthread, causing valgrind to misinterpert
test behaviour. This patch tells valgrind to intercept
the pthread functions in libc,


It's intercepting both as mentioned in the patch commit:

   "intercept both the libc and the libpthread functions"
so please make that clear in your commit log.


resolving these ptest
failures. Patch can be removed once we uprev valgrind.

Can you add the pass, fail, skip and total counts and mention the test sys=
tem qemux86-64? This will help people track things when there is another up=
date.


Upsteam-Status: Backport

This goes in the body of the patch. Mention the vg commit ID too please.


Thanks,

Randy


Signed-off-by: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com<mailto:Stacy=
.Gaikovaia@windriver.com>>
---
 .../valgrind/0001-drd-Port-to-Fedora-33.patch | 46 +++++++++++++++++++
 .../valgrind/valgrind_3.16.1.bb<http://valgrind_3.16.1.bb>               =
|  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-=
to-Fedora-33.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-to-Fedo=
ra-33.patch b/meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-to-Fedo=
ra-33.patch
new file mode 100644
index 0000000000..bca3d9b892
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-to-Fedora-33.p=
atch
@@ -0,0 +1,46 @@
+From 15330adf7c2471fbaa6a0818db07078d81dbff97 Mon Sep 17 00:00:00 2001
+From: Bart Van Assche <bvanassche@acm.org<mailto:bvanassche@acm.org>>
+Date: Sat, 19 Sep 2020 08:08:59 -0700
+Subject: [PATCH] drd: Port to Fedora 33
+
+Apparently on Fedora 33 the POSIX thread functions exist in both libc and
+libpthread. Hence this patch that intercepts the pthread functions in
+libc. See also https://bugs.kde.org/show_bug.cgi?id=3D426144 .
+
+Signed-off-by: Bart Van Assche <bvanassche@acm.org<mailto:bvanassche@acm.=
org>>
+
+This patch was imported from the valgrind sourceware server
+(https://sourceware.org/git/?p=3Dvalgrind.git), commit id
+15330adf7c2471fbaa6a0818db07078d81dbff97. It was modified to
+remove the changes to the valgrind NEWS file, as these are difficult to
+maintain and don't impact the valgrind code itself.
+
+Signed-off-by: Stacy Gaikovaia <stacy.gaikovaia@windriver.com<mailto:stac=
y.gaikovaia@windriver.com>>
+---
+ drd/drd_pthread_intercepts.c | 9 +++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/drd/drd_pthread_intercepts.c b/drd/drd_pthread_intercepts.c
+index 58c45aaec..c2882e5ab 100644
+--- a/drd/drd_pthread_intercepts.c
++++ b/drd/drd_pthread_intercepts.c
+@@ -174,7 +174,16 @@ static int never_true;
+    ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBC_SONAME,zf) argl_decl            =
\
+    { return implf argl; }
+ #else
++/*
++ * On Linux, intercept both the libc and the libpthread functions. At
++ * least glibc 2.32.9000 (Fedora 34) has an implementation of all pthrea=
d
++ * functions in both libc and libpthread. Older glibc versions only have=
 an
++ * implementation of the pthread functions in libpthread.
++ */
+ #define PTH_FUNC(ret_ty, zf, implf, argl_decl, argl)                    =
\
++   ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBC_SONAME,zf) argl_decl;           =
\
++   ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBC_SONAME,zf) argl_decl            =
\
++   { return implf argl; }                                               =
\
+    ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBPTHREAD_SONAME,zf) argl_decl;     =
\
+    ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBPTHREAD_SONAME,zf) argl_decl      =
\
+    { return implf argl; }
+--
+2.25.1
+
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb<http://valg=
rind_3.16.1.bb> b/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb<http://=
valgrind_3.16.1.bb>
index d4ca1a7752..7508098b55 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb<http://valgrind_3.=
16.1.bb>
+++ b/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb<http://valgrind_3.=
16.1.bb>
@@ -40,6 +40,7 @@ SRC_URI =3D "https://sourceware.org/pub/valgrind/valgrin=
d-${PV}.tar.bz2<https://sourceware.org/pub/valgrind/valgrind-$%7BPV%7D.tar.=
bz2> \
            file://s390x_vec_op_t.patch \
            file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths=
.patch \
            file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch \
+           file://0001-drd-Port-to-Fedora-33.patch \
            "
 SRC_URI[md5sum] =3D "d1b153f1ab17cf1f311705e7a83ef589"
 SRC_URI[sha256sum] =3D "c91f3a2f7b02db0f3bc99479861656154d241d2fdb265614b=
a918cc6720a33ca"
--
2.25.1





--_000_BYAPR11MB3127C6EBD896DBB8D1887A2DFD080BYAPR11MB3127namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii=
">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-b=
ottom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
<div dir=3D"auto">Sure I'll do those things.<br>
<br>
</div>
<div dir=3D"auto">
<div dir=3D"auto">
<div>
<blockquote style=3D"margin:0 0 0 0.8ex; padding-left:1ex; border-left:1px=
 solid #CCCCCC">
<br>
<div>Upsteam-Status: Backport</div>
</blockquote>
</div>
</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">&gt;&gt; This goes in the body of the patch. Mention the=
 vg commit ID too please.</div>
</div>
<br>
I have the vg commit ID in the body of the patch, is that ok or should bot=
h things be in both spots?<br>
<br>
Stacy <br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" s=
tyle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Randy MacLeod &lt;rw=
macleod@gmail.com&gt;<br>
<b>Sent:</b> Friday, October 9, 2020 4:14 PM<br>
<b>To:</b> Gaikovaia, Stacy &lt;Stacy.Gaikovaia@windriver.com&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@=
lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH] valgrind: drd: fix pthread intercept=
 test failures</font>
<div>&nbsp;</div>
</div>
<div>
<div dir=3D"auto">
<div><br>
<br>
<div class=3D"x_gmail_quote">
<div dir=3D"ltr" class=3D"x_gmail_attr">On Fri., Oct. 9, 2020, 13:45 Stacy=
 Gaikovaia, &lt;<a href=3D"mailto:Stacy.Gaikovaia@windriver.com" target=3D"=
_blank" rel=3D"noreferrer">Stacy.Gaikovaia@windriver.com</a>&gt; wrote:<br>
</div>
<blockquote class=3D"x_gmail_quote" style=3D"margin:0 0 0 .8ex; border-lef=
t:1px #ccc solid; padding-left:1ex">
From: Stacy Gaikovaia &lt;<a href=3D"mailto:Stacy.Gaikovaia@windriver.com"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">Stacy.Gaikovaia@windriver.=
com</a>&gt;<br>
<br>
After glibc uprev 2.32 -&gt; 2.32, the </blockquote>
</div>
</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">2.31 -&gt; 2.32</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">
<div class=3D"x_gmail_quote">
<blockquote class=3D"x_gmail_quote" style=3D"margin:0 0 0 .8ex; border-lef=
t:1px #ccc solid; padding-left:1ex">
following drd ptests<br>
fail with the error &quot;condition variable has not been initialized&quot=
;.<br>
<br>
drd/tests/annotate_hb_err<br>
drd/tests/annotate_sem<br>
drd/tests/annotate_rwlock<br>
drd/tests/annotate_order_2<br>
drd/tests/annotate_smart_pointer<br>
drd/tests/annotate_spinlock<br>
drd/tests/monitor_example<br>
drd/tests/pth_cond_race<br>
drd/tests/pth_inconsistent_cond_wait<br>
<br>
In glibc 2.32, the POSIX thread functions are in both<br>
libc and libpthread, causing valgrind to misinterpert<br>
test behaviour. This patch tells valgrind to intercept<br>
the pthread functions in libc, </blockquote>
</div>
</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">It's intercepting both as mentioned in the patch commit:=
</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto"><span style=3D"font-family:sans-serif">&nbsp; &nbsp;&quo=
t;intercept both the libc and the libpthread functions&quot;</span><br>
</div>
<div dir=3D"auto"><font face=3D"sans-serif">so please make that clear in y=
our commit log.</font></div>
<div dir=3D"auto"><font face=3D"sans-serif"><br>
</font></div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">
<div class=3D"x_gmail_quote">
<blockquote class=3D"x_gmail_quote" style=3D"margin:0 0 0 .8ex; border-lef=
t:1px #ccc solid; padding-left:1ex">
resolving these ptest<br>
failures. Patch can be removed once we uprev valgrind.<br>
</blockquote>
</div>
</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Can you add the pass, fail, skip and total counts and me=
ntion the test system qemux86-64? This will help people track things when t=
here is another update.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">
<div class=3D"x_gmail_quote">
<blockquote class=3D"x_gmail_quote" style=3D"margin:0 0 0 .8ex; border-lef=
t:1px #ccc solid; padding-left:1ex">
<br>
Upsteam-Status: Backport<br>
</blockquote>
</div>
</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">This goes in the body of the patch. Mention the vg commi=
t ID too please.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Thanks,</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Randy</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">
<div class=3D"x_gmail_quote">
<blockquote class=3D"x_gmail_quote" style=3D"margin:0 0 0 .8ex; border-lef=
t:1px #ccc solid; padding-left:1ex">
<br>
Signed-off-by: Stacy Gaikovaia &lt;<a href=3D"mailto:Stacy.Gaikovaia@windr=
iver.com" rel=3D"noreferrer noreferrer" target=3D"_blank">Stacy.Gaikovaia@w=
indriver.com</a>&gt;<br>
---<br>
&nbsp;.../valgrind/0001-drd-Port-to-Fedora-33.patch | 46 +++++++++++++++++=
++<br>
&nbsp;.../valgrind/<a href=3D"http://valgrind_3.16.1.bb" rel=3D"noreferrer=
 noreferrer noreferrer" target=3D"_blank">valgrind_3.16.1.bb</a>&nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 1 +<br>
&nbsp;2 files changed, 47 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-drd-=
Port-to-Fedora-33.patch<br>
<br>
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-to-Fedo=
ra-33.patch b/meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-to-Fedo=
ra-33.patch<br>
new file mode 100644<br>
index 0000000000..bca3d9b892<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-to-Fedora-33.p=
atch<br>
@@ -0,0 +1,46 @@<br>
+From 15330adf7c2471fbaa6a0818db07078d81dbff97 Mon Sep 17 00:00:00 2001<br=
>
+From: Bart Van Assche &lt;<a href=3D"mailto:bvanassche@acm.org" rel=3D"no=
referrer noreferrer" target=3D"_blank">bvanassche@acm.org</a>&gt;<br>
+Date: Sat, 19 Sep 2020 08:08:59 -0700<br>
+Subject: [PATCH] drd: Port to Fedora 33<br>
+<br>
+Apparently on Fedora 33 the POSIX thread functions exist in both libc and=
<br>
+libpthread. Hence this patch that intercepts the pthread functions in<br>
+libc. See also <a href=3D"https://bugs.kde.org/show_bug.cgi?id=3D426144" =
rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">
https://bugs.kde.org/show_bug.cgi?id=3D426144</a> .<br>
+<br>
+Signed-off-by: Bart Van Assche &lt;<a href=3D"mailto:bvanassche@acm.org" =
rel=3D"noreferrer noreferrer" target=3D"_blank">bvanassche@acm.org</a>&gt;<=
br>
+<br>
+This patch was imported from the valgrind sourceware server<br>
+(<a href=3D"https://sourceware.org/git/?p=3Dvalgrind.git" rel=3D"noreferr=
er noreferrer noreferrer" target=3D"_blank">https://sourceware.org/git/?p=
=3Dvalgrind.git</a>), commit id<br>
+15330adf7c2471fbaa6a0818db07078d81dbff97. It was modified to<br>
+remove the changes to the valgrind NEWS file, as these are difficult to <=
br>
+maintain and don't impact the valgrind code itself.<br>
+<br>
+Signed-off-by: Stacy Gaikovaia &lt;<a href=3D"mailto:stacy.gaikovaia@wind=
river.com" rel=3D"noreferrer noreferrer" target=3D"_blank">stacy.gaikovaia@=
windriver.com</a>&gt;<br>
+---<br>
+ drd/drd_pthread_intercepts.c | 9 +++++++++<br>
+ 1 file changed, 10 insertions(+)<br>
+<br>
+diff --git a/drd/drd_pthread_intercepts.c b/drd/drd_pthread_intercepts.c<=
br>
+index 58c45aaec..c2882e5ab 100644<br>
+--- a/drd/drd_pthread_intercepts.c<br>
++++ b/drd/drd_pthread_intercepts.c<br>
+@@ -174,7 +174,16 @@ static int never_true;<br>
+&nbsp; &nbsp; ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBC_SONAME,zf) argl_decl&n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \<br>
+&nbsp; &nbsp; { return implf argl; }<br>
+ #else<br>
++/*<br>
++ * On Linux, intercept both the libc and the libpthread functions. At<br=
>
++ * least glibc 2.32.9000 (Fedora 34) has an implementation of all pthrea=
d<br>
++ * functions in both libc and libpthread. Older glibc versions only have=
 an<br>
++ * implementation of the pthread functions in libpthread.<br>
++ */<br>
+ #define PTH_FUNC(ret_ty, zf, implf, argl_decl, argl)&nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \<br>
++&nbsp; &nbsp;ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBC_SONAME,zf) argl_decl;&=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\<br>
++&nbsp; &nbsp;ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBC_SONAME,zf) argl_decl&n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \<br>
++&nbsp; &nbsp;{ return implf argl; }&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\<br>
+&nbsp; &nbsp; ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBPTHREAD_SONAME,zf) argl_=
decl;&nbsp; &nbsp; &nbsp;\<br>
+&nbsp; &nbsp; ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBPTHREAD_SONAME,zf) argl_=
decl&nbsp; &nbsp; &nbsp; \<br>
+&nbsp; &nbsp; { return implf argl; }<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-devtools/valgrind/<a href=3D"http://valgrind_3.1=
6.1.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">valgrind=
_3.16.1.bb</a> b/meta/recipes-devtools/valgrind/<a href=3D"http://valgrind_=
3.16.1.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">valgr=
ind_3.16.1.bb</a><br>
index d4ca1a7752..7508098b55 100644<br>
--- a/meta/recipes-devtools/valgrind/<a href=3D"http://valgrind_3.16.1.bb"=
 rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">valgrind_3.16.1=
.bb</a><br>
+++ b/meta/recipes-devtools/valgrind/<a href=3D"http://valgrind_3.16.1.bb"=
 rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">valgrind_3.16.1=
.bb</a><br>
@@ -40,6 +40,7 @@ SRC_URI =3D &quot;<a href=3D"https://sourceware.org/pub/=
valgrind/valgrind-$%7BPV%7D.tar.bz2" rel=3D"noreferrer noreferrer noreferre=
r" target=3D"_blank">https://sourceware.org/pub/valgrind/valgrind-${PV}.tar=
.bz2</a> \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://s390x_vec_op_t.patch \<br=
>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://0001-none-tests-fdleak_cm=
sg.stderr.exp-adjust-tmp-paths.patch \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://0001-memcheck-tests-Fix-t=
imerfd-syscall-test.patch \<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;file://0001-drd-Port-to-Fedora-3=
3.patch \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;<br>
&nbsp;SRC_URI[md5sum] =3D &quot;d1b153f1ab17cf1f311705e7a83ef589&quot;<br>
&nbsp;SRC_URI[sha256sum] =3D &quot;c91f3a2f7b02db0f3bc99479861656154d241d2=
fdb265614ba918cc6720a33ca&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_BYAPR11MB3127C6EBD896DBB8D1887A2DFD080BYAPR11MB3127namp_--

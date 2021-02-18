Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by mx.groups.io with SMTP id smtpd.web09.7398.1613658324035726822
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Feb 2021 06:25:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=Zu1KT0z2;
 spf=pass (domain: gmx.de, ip: 212.227.15.18, mailfrom: dl9pf@gmx.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1613658320;
	bh=q6BaL/ucRq8K+vKYX9tcZII4YBNPgE4RE9+xDO6tKng=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=Zu1KT0z2B6FSX5pVwrs1rrk3j7T4sIYvIjEkrj9/bTyXMmhyqDWccZNPgAlax6k0o
	 9zBNGxYOSCGd7jK0NkhMvHN1Y1caJPsMCyNMiEkJiu/Q7HQ8JG1jxIyI+3YeUFB2UA
	 IyKv6bcJo9mQg4oyG09C96ZRaaoY9ofvE3uzG6Zc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from gmx.de ([95.88.58.204]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MSKyI-1lJEU41gJk-00Sddx; Thu, 18
 Feb 2021 15:25:20 +0100
From: =?UTF-8?B?SmFuLVNpbW9uIE3DtmxsZXI=?= <dl9pf@gmx.de>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Jan-Simon=20M=C3=B6ller?= <jsmoeller@linuxfoundation.org>
Subject: [PATCH] Enable use_source_date_epoch_as_buildtime in package_rpm class
Date: Thu, 18 Feb 2021 15:25:16 +0100
Message-Id: <20210218142516.25876-1-dl9pf@gmx.de>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:a6hdkE9psuQL/EtNQBYCOPX/Sb6Ssdoofrd/qHdB2CKli1vpUMt
 PuT0Z073990xtQ9gvHwpIpPhaRfErXMtKd99ZIX7TNKMH1NXNRqbBOyPka50EJg+iFmCM6O
 2UR7A0PWxW7R3Pz1daoUx5a+XnXKcqXgLDtE/16gabKAgcrvBTWBrZs9lIfWJi/Njy0Lx/Y
 2KxAHKlnT0iioZq6vuWTw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:kZkY7Amjh9c=:+Zc9c6aZUno1x78DRuOcW3
 oQd+CBmvgF2Ox7fT1ppGKLjwWXtFweAU+5K9tAUV6Ai1T5dmQcu/sbk7DDahkpVl6ZF5jxSBf
 m3M7sKSxiRhN8kurZY4HTDefskgeIvj0w7NXFjnDcwpVzhkxowsxMKEhxsftAwowGo1KtUXno
 bZZ/O/FjnOWhC6nukq65Q0C7g31iIBEyGY5QryxMxk53xeS8545LV09Sist8MZvnpv/mJoIEZ
 fdmZgRd5OaiWDetk6iVw0G5YHOYBzcC8z7gdv0B5oHgGcZ4VLnckWC09D0nJfGwYe4sTW+GbA
 830wbSnSB0e/DgQVIgxbeK8HAlvHomAJ1Grn2COexXBLeczm2VwSHZJxAdLD++VZybMfgkACX
 XjZ0YkiwwNC+J976HlA1OmcBOF1Ft+va9elLFpovcM7PWjlTJb3pfgNAE7c/gD2/L3SvKB3Fj
 qDTQ/87Wd9aWZCnMKiaGnGM7H8Ztjwz6oLztLtsElXo6Cgh6V88gv3VNJs9wSOQCClalROUUi
 S3NHLw11VnAc0L/bAkQTLdU307CbbdoT+no54OcRPy0BydS3ImDbxMsq7wqquhIHDtlxKCuQ8
 FxT5VGSK/MxIvS7aYXUok9WVLVKNHGBH8rX3LV0FbxiP1i+TMPxfE8c/VQwt2JwSNdkml+BDy
 pY8LVNY7IHIE3md01t/m82kWh8EJNoXkhfy4Dbg+x0t11jq2V62NGWZRIM3Kj3TULzkPnE8wR
 oWXcHmg8sCQ/Hu8/dtjqwnHydYlwWeZjf61CRjUrlqnoONUoCE4BQCqLjla1ryrKnRauodM6u
 Kmki2GqaWsUSEpZXA42bgeFsy4pqaoDVPC1L9yC/xj8qIKI2OU29JZq1FnGtcMLKEPlAf39L7
 +X+kJZKN31ZO8uYZgHvw==
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Jan-Simon M=C3=B6ller <jsmoeller@linuxfoundation.org>

Adding --define 'use_source_date_epoch_as_buildtime 1' to rpmbuild
ensure that the rpm header does have a consistent BUILDTIME tag.

Signed-off-by: Jan-Simon M=C3=B6ller <jsmoeller@linuxfoundation.org>
=2D--
 meta/classes/package_rpm.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.b=
bclass
index c48bece742..c1824306ee 100644
=2D-- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -687,6 +687,7 @@ python do_package_rpm () {
     cmd =3D cmd + " --define '_binary_payload w6T.xzdio'"
     cmd =3D cmd + " --define '_source_payload w6T.xzdio'"
     cmd =3D cmd + " --define 'clamp_mtime_to_source_date_epoch 1'"
+    cmd =3D cmd + " --define 'use_source_date_epoch_as_buildtime 1'"
     cmd =3D cmd + " --define '_buildhost reproducible'"
     if perfiledeps:
         cmd =3D cmd + " --define '__find_requires " + outdepends + "'"
=2D-
2.30.0


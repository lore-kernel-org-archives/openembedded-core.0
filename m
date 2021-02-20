Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by mx.groups.io with SMTP id smtpd.web09.9610.1613842198695758676
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Feb 2021 09:29:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=GxQYXz75;
 spf=pass (domain: gmx.de, ip: 212.227.15.18, mailfrom: dl9pf@gmx.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1613842196;
	bh=zxgVEjbgd/WeSlOb281HSuACSNkc7ddhIuePrbvQhFE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GxQYXz752PXsstE2StaKFrS6mo4zz41Ux/I+t5t4xmiWY0m834LKE6W8rsyrpxZBs
	 hjFwSKbf3kypJ3Aq+LGjSYM4JhAxhc0RPkYBjQi+vy88YsC66N7Om0Bz9QwpVa8Ekv
	 fjrwB5LZbhlGtl9twqRoCl2/H+6N4HMtu8fOymLg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from gmx.de ([95.88.58.204]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MFsUv-1l3wdP1Lax-00HROU; Sat, 20
 Feb 2021 18:29:56 +0100
From: =?UTF-8?B?SmFuLVNpbW9uIE3DtmxsZXI=?= <dl9pf@gmx.de>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Jan-Simon=20M=C3=B6ller?= <jsmoeller@linuxfoundation.org>
Subject: [PATCH 2/3] reproducible_builds: SOURCE_DATE_EPOCH should not be 0
Date: Sat, 20 Feb 2021 18:29:33 +0100
Message-Id: <20210220172934.6428-2-dl9pf@gmx.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210220172934.6428-1-dl9pf@gmx.de>
References: <20210220172934.6428-1-dl9pf@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:MrZcVE/zUozuILzP26op1QruAxkRmF1Z8VafPmp+nFy5JxBkAcM
 KiJsX3Bgqwwd1biDsppX+QWXeFTvG8RxYjc2mc3o72bV3iX/CW71FrzC2Clwrlqq+8Rikx/
 jHj3Z49+c67GCq6Vt84GiHb+rZX+o6ZVu8hqjzw/RjZoWAphAI7EPIsVN6u4HVKuymewhrD
 QpQ6n9NjXbDnVMoffGxMw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:EyBbun3+1a0=:njGhRHgJS3tEqYvN7ktBw1
 g9CLl2xR2CQjyG3p6Ft0xpAu1g4GXcnf6Cq7/tVwG1+Cnks/aiuUpsYl8aQyXafdaIBEc5IRb
 XX702Gn2+SvvVBPAa+25sXIkn2xuPLcNT89brh0L3vqG/GiEqaUL08xieG0hKG3QNOIyZI0rA
 4667vEAZM2SGphk2/jRrmiZU1LHBcsZCR64GDLr/w4CoLOhVWQPgCT2oD9Jreex1MwKS6mDAH
 a377KuWk/sXWN552TyEupwkdKwAj5ZGif92Fbx/fvehDEcRGsXmuCpPm1FEVcQX1ZStGbc4hJ
 TYzHf6f+7dAn4hXcwWS82In/6PBvPKEJbH6zo2fmEuArYOVUR9wJwbqt2AA+OwgL7OjvfSaw5
 CjSneV8jYeLLIW3UINaQ/vsoIAltzUlSxx2pFFx/cdydKF32Ju0DnKyd04nvRmxlKourgkgNq
 jKexSaeX83rGRcezCu6qnobKonp6YpCH5L/wkFALF5FCcxM5rjjKomOxOj31YR5DZZtjsXMi/
 L+ftgakw6q+Ido/zsB7grSPRgLTzcoyDTkNkoSknHZTShXZfFeLvzOuauDIPP99oE0PYNNN1i
 q0RLK54y03MB7QwAQbqDmtwKeOM46lxl/5hfR0pUuni35FHI0s23rSH3LZjUrTzDxOB9cTRxb
 1gBdCn0m6Ck6KHhPdAPvhLKDjYqKLiDw2ZijSnP7IpC8DuCqtfpDYipdq+no1cXDz59vDQAqI
 XmOxhicbsWmrGizc/AA+rJr8Xz8rGCpXbXkWmOiczMiTibaj/AUaZXtpx4mn5V2ySAwE5CIZX
 gvHZqkjAUbi32joTMUjYNs9YY9aomi3n3OLXQR0A8CZbYS6R0nBXtailUcaTbFHz/cKnbIRXO
 ce+pfrMMw33MkCN1MJ+oGdCOldPoerqzUjfC3fPDF+qEiYvZw+xl3Ui02Ln2oAzfroP0Yv5MV
 WijUYeh/gawna4cQ83o58iz8ceRtzf6w=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Jan-Simon M=C3=B6ller <jsmoeller@linuxfoundation.org>

A SOURCE_DATE_EPOCH of 0 might be misinterpreted by namely rpm as no SDE.

 e.g.:
 char *srcdate =3D getenv(SOURCE_DATE_EPOCH);
 if (srcdate && rpmExpandNumeric(%{?clamp_mtime_to_source_date_epoch}))

Solve this by:
- providing a SOURCE_DATE_EPOCH_FALLBACK variable !=3D 0
- changing defaults to use it
- using SOURCE_DATE_EPOCH_FALLBACK also when reading 0 out of sstate-cache

Signed-off-by: Jan-Simon M=C3=B6ller <jsmoeller@linuxfoundation.org>
=2D--
 meta/classes/reproducible_build.bbclass | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reprod=
ucible_build.bbclass
index 2f3bd90b07..16b69ba48d 100644
=2D-- a/meta/classes/reproducible_build.bbclass
+++ b/meta/classes/reproducible_build.bbclass
@@ -37,10 +37,13 @@
 BUILD_REPRODUCIBLE_BINARIES ??=3D '1'
 inherit ${@oe.utils.ifelse(d.getVar('BUILD_REPRODUCIBLE_BINARIES') =3D=3D=
 '1', 'reproducible_build_simple', '')}

-SDE_DIR =3D"${WORKDIR}/source-date-epoch"
+SDE_DIR =3D "${WORKDIR}/source-date-epoch"
 SDE_FILE =3D "${SDE_DIR}/__source_date_epoch.txt"
 SDE_DEPLOYDIR =3D "${WORKDIR}/deploy-source-date-epoch"

+# A SOURCE_DATE_EPOCH of '0' might be misinterpreted as no SDE
+export SOURCE_DATE_EPOCH_FALLBACK ??=3D "1302044400"
+
 SSTATETASKS +=3D "do_deploy_source_date_epoch"

 do_deploy_source_date_epoch () {
@@ -81,6 +84,10 @@ python create_source_date_epoch_stamp() {

     source_date_epoch =3D oe.reproducible.get_source_date_epoch(d, d.getV=
ar('S'))

+    if source_date_epoch =3D=3D 0 :
+        bb.debug(1, "source_date_epoch is 0, using SOURCE_DATE_EPOCH_FALL=
BACK instead.")
+        source_date_epoch =3D int(d.getVar('SOURCE_DATE_EPOCH_FALLBACK'))
+
     bb.debug(1, "SOURCE_DATE_EPOCH: %d" % source_date_epoch)
     bb.utils.mkdirhier(d.getVar('SDE_DIR'))
     with open(epochfile, 'w') as f:
@@ -93,15 +100,19 @@ def get_source_date_epoch_value(d):
         return cached

     epochfile =3D d.getVar('SDE_FILE')
-    source_date_epoch =3D 0
+    source_date_epoch =3D int(d.getVar('SOURCE_DATE_EPOCH_FALLBACK'))
     if os.path.isfile(epochfile):
         with open(epochfile, 'r') as f:
             s =3D f.read()
             try:
                 source_date_epoch =3D int(s)
+                # workaround for old sstate with SDE_FILE content being 0=
 - use SOURCE_DATE_EPOCH_FALLBACK
+                if source_date_epoch =3D=3D 0 :
+                    bb.warn("SOURCE_DATE_EPOCH value from sstate '%s' is =
deprecated/invalid. Reverting to SOURCE_DATE_EPOCH_FALLBACK '%s'" % (s, SO=
URCE_DATE_EPOCH_FALLBACK))
+                    source_date_epoch =3D int(d.getVar('SOURCE_DATE_EPOCH=
_FALLBACK'))
             except ValueError:
-                bb.warn("SOURCE_DATE_EPOCH value '%s' is invalid. Reverti=
ng to 0" % s)
-                source_date_epoch =3D 0
+                bb.warn("SOURCE_DATE_EPOCH value '%s' is invalid. Reverti=
ng to SOURCE_DATE_EPOCH_FALLBACK" % s)
+                source_date_epoch =3D int(d.getVar('SOURCE_DATE_EPOCH_FAL=
LBACK'))
         bb.debug(1, "SOURCE_DATE_EPOCH: %d" % source_date_epoch)
     else:
         bb.debug(1, "Cannot find %s. SOURCE_DATE_EPOCH will default to %d=
" % (epochfile, source_date_epoch))
=2D-
2.26.2


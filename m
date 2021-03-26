Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web12.6830.1616723523597125530
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 18:52:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
Received: from [100.112.196.73] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-west-1.aws.symcld.net id DF/01-60958-14E3D506; Fri, 26 Mar 2021 01:52:01 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgkeJIrShJLcpLzFFi42Kxs+GYqutgF5t
  g8PGBnsWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmnH381yWgn7Oij/T9jI3ME7i6GLk4hAS2Mwk
  8eHJcXYIZw+jxJnn+1m6GDk52AQMJPafvQCU4OAQEdCTuPpPFCQsLGAr8f9yByuIzSKgKtE74
  TGYzSvgLdEx+xs7iC0hoCAx5eF7Zoi4oMTJmU/ARjILSEgcfPGCGWSkhICixOzp8hBmlcSRmW
  oTGHlmIWmYhaRhASPTKkbzpKLM9IyS3MTMHF1DAwNdQ0MjXUNLM10zE73EKt0kvdRS3fLU4hJ
  dQ73E8mK94src5JwUvbzUkk2MwABKKTjisIPx/usPeocYJTmYlER5D52ISRDiS8pPqcxILM6I
  LyrNSS0+xCjDwaEkwfvaNjZBSLAoNT21Ii0zBxjMMGkJDh4lEd4fIGne4oLE3OLMdIjUKUZFK
  XHeQpCEAEgiozQPrg0WQZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfNagUzhycwrgZv+Cm
  gxE9DijT8iQRaXJCKkpBqYdA6eFHncZHHixFHB89OXG8o9fnR/8de9+n9YD/2U5meVuLmjbnv
  ujut5B6VMTrQpn3Q31H/gWmRvu//pve6jgeuP5y015fm4KGD/rM5vCd/i529xjQt8fFIlp+PH
  69Rs66vbTcLubua5rnfMSr2ZebFXCvuqx0ezuaZnL/8Tc/3M4llPvGcsu+q0t9Nq2mnjOeHMN
  YvDEoPeTVQXFPrcvrLqS7eo+vfvjzJSc168S9/rycO847dqobi/zy3X+4WXHmZeslL48Ltvqe
  Dr1mN3OCf+M93zTul/meWS3jCushNT1ieeLK0+u1k0YsXbdhmxStOeyWnesuoTyude/MXItsT
  T6JLNhZtCB70UHr2Pu6rEUpyRaKjFXFScCACeWc7dGwMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-5.tower-291.messagelabs.com!1616723520!489470!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11794 invoked from network); 26 Mar 2021 01:52:00 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-5.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 26 Mar 2021 01:52:00 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12Q1psc2011956
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Mar 2021 01:52:00 GMT
Received: from localhost.localdomain (10.167.225.35) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 26 Mar 2021 01:51:53 +0000
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] epiphany: upgrade 3.38.2 -> 3.38.3
Date: Fri, 26 Mar 2021 18:23:28 +0800
Message-ID: <1616754208-67628-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../epiphany/{epiphany_3.38.2.bb => epiphany_3.38.3.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/epiphany/{epiphany_3.38.2.bb => epiphany_3.38.3.bb} (93%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.38.2.bb b/meta/recipes-gnome/epiphany/epiphany_3.38.3.bb
similarity index 93%
rename from meta/recipes-gnome/epiphany/epiphany_3.38.2.bb
rename to meta/recipes-gnome/epiphany/epiphany_3.38.3.bb
index 04f340f133..889de16d00 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.38.2.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.38.3.bb
@@ -19,7 +19,7 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "8b05f2bcc1e80ecf4a10f6f01b3285087eb4cbdf5741dffb8c0355715ef5116d"
+SRC_URI[archive.sha256sum] = "ce62c1fa3e442a9d6131fc884a6bc9a65cf06224c30d649c49624c2ebcb0d275"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
-- 
2.25.1


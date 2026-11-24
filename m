Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23140.1795540446776554461
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 09:14:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=UEwPEaOE;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=bIunauEC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: jose.quaresma@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFL8hU4124246
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 17:14:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JIBP6xSJyru
	9yLEYE5zEQbw4y2B1KzVJw/c2+9KbRT8=; b=UEwPEaOEcp4M5/az5GEkUiwsX2p
	tJ9SyktdPtB4ItOrLqSh+QdAhOgQPmsiR2nj2oiqQvdR6CzOXYVgRk68/O6vhwT7
	FPmgJo/mdq11iJevxDQorBrDPqUHCUE5hCP84O4rJyzedqLkOIQCQGVkkYUZXe7V
	rkyGpbmjJIpMUo6AvCvy/1GKs3nAQ3aqK5Ap0BGohH0Urzpwr/5VYENIKhpGcgUQ
	z0DQYYvcchAZpD72F1kTPzj+36HtRFk4RiGAlPnjfmctgPQRU6WlZpesKjCKKd8r
	HnytVcSUD+alzK0cnPPdmhDD5OEB+wR/kyllxq4RnbEs8E9+/YKyuX//iyg==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rhay8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 17:14:06 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-836caf085e0so64560687b3.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 09:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795540445; x=1796145245; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JIBP6xSJyru9yLEYE5zEQbw4y2B1KzVJw/c2+9KbRT8=;
        b=bIunauECmQPICPhIf0wpKbPwkzXL0YWvV8TSFZLXadMd4UTWkFYPsUuO7zfNcUKNcM
         nQwFoR+1/FpRqX/RB5JvTnxOMZKpAL3++xToHLQJU0tj+0+zITqRpDHimrzl8ZNr7YNF
         b52xWu/K809RI9hF0grOXpheNRLVIaBlUjCyAvkSz6gM8fsNJaNJmUrMVI8F6dCkKabo
         VZmKrkF5sWTfZAnkXAdxPrj1VXt5ii7G1ONdO1v1yyGSrzB3B8VcsUHRQJVGFXKJhgNR
         WHDz8jyXI7RshAMYrW/gY/6XBng3xOgJjx4vaVb34h1LpIxT1YVcSXU/rUCOespIQQ/Q
         GwYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795540445; x=1796145245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JIBP6xSJyru9yLEYE5zEQbw4y2B1KzVJw/c2+9KbRT8=;
        b=MFR9eeghD7IyhupiOqSHRW6vlwhW0cx51lg1MtKwSjdTlCuPIw4S+xCJeReoW5TeTd
         VB2RSBQiYm1Br/1CkuGUIO9iYrEg3ruJhyYsKx2R0CbuVBv6EuqJf5a0A9I9boI8MnpQ
         jhijDkPWQ7f6GB8qTB+HafMC9v28tX889r5QozoLv1eJSwIUqBG5vw4VWNwuFq1mhMXD
         ArJ/xKJeeLzrn9+L4bjmfRFuuVXjgBnmDPQ6hoabp96jfiFMuBmC/Y7kvUfRvR47u16u
         gh1A6sJW1Yg4cVRxuH+DSQyx05Z1ru9xTkWSXLG6I4tnyQ+lAf0WgzKMVndiqsmaqvyy
         D+Vg==
X-Gm-Message-State: APuU4Z9KGH2HB/M8ZOIVVECSHjYyx8v9EebKC1xI+kW6B3XNOWI9Lacd
	7v6K8TdimB9IzD99/wKEmrTDMG+G7ayselZV0f1OA5Po//QvCX5Q+GCWbsaIU6k8r7dXngDHXkp
	9/WFK1rX2Gi/pNWqYHHKXfhyjWH/VsR/AXqR2NE8Bh56EpT0vDAOJCejgTg12jtUUURxVEV+onL
	W8qrtqaX5OedkUBMZnp8ct
X-Gm-Gg: AZFdTZfZwJNUtBwTCsN4pFsg6xWylY5ptNGZNBR9bm+rYruWoS90rLiJP+XQ+nEuPtT
	YnDHVJ98zL98jA1BYutZImOPjvrVBTpN9s2upqD8KIn1ZnLi4BQvGZwtCJxPHW6NdHgsFbCyP8+
	UaYaR4eeiOiVpS1Lol3AH3rlSj4Ty9Jm7VhOKnX3nmZLVQr6skzyPMJQMGaBLy3ygYI+V3POOPV
	rJevOeVE2AmvCM3O32OvoX3ETBnL/qg0ylDSDM5ocyJj0o0rMeo2asL3TjriOOzOHn1Y8koNM5w
	7D8YfTu8Bm+oeM9UpaSTLfR7iNgt3Y27rEjeB6wSPxYsJ7xZP243FxZU2ObE41heOnYd+YQt9Cy
	mG/42waLAfSqVWGhrF7iiztzvKmMHp79PTPSxACgXS6YTPXQGoKNglbzcaXXgppc=
X-Received: by 2002:a05:690c:e18:b0:8b4:fc2d:2fa2 with SMTP id 00721157ae682-8b5204db17bmr63843847b3.38.1795540445204;
        Tue, 24 Nov 2026 09:14:05 -0800 (PST)
X-Received: by 2002:a05:690c:e18:b0:8b4:fc2d:2fa2 with SMTP id 00721157ae682-8b5204db17bmr63843637b3.38.1795540444458;
        Tue, 24 Nov 2026 09:14:04 -0800 (PST)
Received: from toster.lan ([185.228.162.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b33a596f9csm9632479f8f.12.2026.11.24.09.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:14:03 -0800 (PST)
From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
        Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Subject: [RFC wrynose][PATCH 2/5] yocto-check-layer: don't skip entries when dropping invalid layers
Date: Tue, 24 Nov 2026 17:13:48 +0000
Message-ID: <20261124171356.951415-3-jose.quaresma@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124171356.951415-1-jose.quaresma@oss.qualcomm.com>
References: <20261124171356.951415-1-jose.quaresma@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BKkmP1QG c=1 sm=1 tr=0 ts=6b05c5de cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=qOKIifoFPMYe9XV0Ag7/Dg==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8
 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8 a=EUspDBNiAAAA:8 a=2V6DY6BgAAAA:8
 a=OreDpC4mTmnKIuOQwSkA:9 a=MFSWADHSvvjO3QEy5MdX:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=ldqKKs2zR4t-S6fqr-1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NyBTYWx0ZWRfXzAHFgCfMZ7e2
 UZNo5EHLexGebFx55vyEW6XsWm4ssx20myGs09l6LCV+y0SZthxOKBntceLw0eYI2ZIVCGv257B
 Zwi5oGW7UdKmtH9O9UZe9RCvN9899Do=
X-Proofpoint-GUID: alrSNedc5lQLE8ZqnULHz5vfGr08v_yZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NyBTYWx0ZWRfX7GaPJd6aiOZ9
 odyPXm0cNzUv8Xj/+0Rn7OH+XPDw3kQZ/Mbexc76c19hJJ9vXVRun+UTYWd0wHQ2jA+OoH5iZb8
 v8vr96/1LDuVkAgQEQ3bwBANRr/rk8NGsM68GmFZg3NpaCMQhjpCl1IUmaBIvn5lq9BdbzrS7f+
 FrZUVugHlMkRsjjt00F6A+qy/FPA4t1+To0LKf3o2HI8mKb7ILKkG6Yl31JwciGK4dgBMd7momK
 wq4sle98k8DDKNOnUWx8/LsN3/H4nQ3/FOr794LpgpgdhCAgECNIX871Pjypg4oC9BRFa+i6lX5
 yodIYPMeyg8+kCpbY73XmYcS3ubGtLTXFflrkR9YOhtOVvE6oeQWLsQlJRjBZPjG0lQeVv6D5kS
 yz7KtpRXSXlbvjaXMJ7LP5e2iybltP1cIfb+KKmMWIItn49D7DkyyM4XnQahEBWK0m57IxEwTkI
 3g2NBnnRxdGROyex10g==
X-Proofpoint-ORIG-GUID: alrSNedc5lQLE8ZqnULHz5vfGr08v_yZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 17:14:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251046
Content-Type: text/plain; charset="utf-8"

From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>

The "Detected layers" loop removes invalid entries from the list it's
iterating over. When two invalid layers are adjacent, removing the
first skips the second, leaving it in the list.

A skipped entry without conf/layer.conf makes the dependency pass fail
with KeyError: 'collections'. A skipped BSP+DISTRO entry isn't
reported. If no other layer is left to test, the script exits 0.

Move the filtering into validate_layers(), which builds a new list
containing only valid layers. Keep validation at its original position
and update dep_layers when it previously shared the same list, without
changing the existing dependency handling.

Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6050ce9f129ad20ad395c35380855bafb79c530f)
Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
---
 scripts/yocto-check-layer | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
index 8c8b4dbcad..ca4ada0f35 100755
--- a/scripts/yocto-check-layer
+++ b/scripts/yocto-check-layer
@@ -48,6 +48,22 @@ def dump_layer_debug(layer):
     if collections:
         logger.debug("%s collections: %s" % (layer["name"], ", ".join(collections)))
 
+def validate_layers(layers):
+    valid_layers = []
+    for layer in layers:
+        if layer['type'] == LayerType.ERROR_BSP_DISTRO:
+            logger.error("%s: Can't be DISTRO and BSP type at the same time."\
+                     " Both conf/distro and conf/machine folders were found."\
+                     % layer['name'])
+        elif layer['type'] == LayerType.ERROR_NO_LAYER_CONF:
+            logger.info("%s: Doesn't have conf/layer.conf file, so ignoring"\
+                     % layer['name'])
+        else:
+            logger.info("%s: %s, %s" % (layer['name'], layer['type'],
+                layer['path']))
+            valid_layers.append(layer)
+    return valid_layers
+
 def main():
     parser = argparse.ArgumentParser(
             description="Yocto Project layer checking tool",
@@ -125,19 +141,10 @@ def main():
         return 1
 
     logger.info("Detected layers:")
-    for layer in layers:
-        if layer['type'] == LayerType.ERROR_BSP_DISTRO:
-            logger.error("%s: Can't be DISTRO and BSP type at the same time."\
-                     " Both conf/distro and conf/machine folders were found."\
-                     % layer['name'])
-            layers.remove(layer)
-        elif layer['type'] == LayerType.ERROR_NO_LAYER_CONF:
-            logger.info("%s: Doesn't have conf/layer.conf file, so ignoring"\
-                     % layer['name'])
-            layers.remove(layer)
-        else:
-            logger.info("%s: %s, %s" % (layer['name'], layer['type'],
-                layer['path']))
+    layers = validate_layers(layers)
+    # Keep dep_layers in sync when it previously shared the layers list.
+    if not args.dependency:
+        dep_layers = layers
     if not layers:
         return 1
 
-- 
2.56.1


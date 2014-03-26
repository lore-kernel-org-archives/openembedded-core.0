Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id A77FC6EF94
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 13:48:23 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2QDmJsg019113 for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 13:48:19 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id A01Ptwo8kqcz
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 13:48:18 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2QDmCq7019103
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 13:48:14 GMT
Message-ID: <1395841686.24890.94.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Mar 2014 13:48:06 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] scripts: Update after addtion of parameter to bitbake -S
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
X-List-Received-Date: Wed, 26 Mar 2014 13:48:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/scripts/bitbake-whatchanged b/scripts/bitbake-whatchanged
index 90ad2f8..e4497e0 100755
--- a/scripts/bitbake-whatchanged
+++ b/scripts/bitbake-whatchanged
@@ -272,7 +272,7 @@ Note:
     try:
         # Generate the new stamps dir
         print("Generating the new stamps ... (need several minutes)")
-        cmdline = "STAMPS_DIR=%s bitbake -S %s" % (new_stampsdir, recipe)
+        cmdline = "STAMPS_DIR=%s bitbake -S none %s" % (new_stampsdir, recipe)
         # FIXME
         # The "bitbake -S" may fail, not fatal error, the stamps will still
         # be generated, this might be a bug of "bitbake -S".
diff --git a/scripts/sstate-diff-machines.sh b/scripts/sstate-diff-machines.sh
index 931f9d7..860be73 100755
--- a/scripts/sstate-diff-machines.sh
+++ b/scripts/sstate-diff-machines.sh
@@ -98,7 +98,7 @@ OUTPUT=${tmpdir}/sstate-diff/`date "+%s"`
 for M in ${machines}; do
   find ${tmpdir}/stamps/ -name \*sigdata\* | xargs rm -f
   mkdir -p ${OUTPUT}/${M}
-  export MACHINE=${M}; bitbake -S ${targets} | tee -a ${OUTPUT}/${M}/log;
+  export MACHINE=${M}; bitbake -S none ${targets} | tee -a ${OUTPUT}/${M}/log;
   cp -ra ${tmpdir}/stamps/* ${OUTPUT}/${M}
   find ${OUTPUT}/${M} -name \*sigdata\* | sed "s#${OUTPUT}/${M}/##g" | sort > ${OUTPUT}/${M}/list
   M_UNDERSCORE=`echo ${M} | sed 's/-/_/g'`




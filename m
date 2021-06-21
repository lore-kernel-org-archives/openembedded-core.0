Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
 by mx.groups.io with SMTP id smtpd.web08.500.1624297834108389027
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jun 2021 10:50:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=mesmtp header.b=Ughkr4Yp;
 spf=pass (domain: cold-front.org, ip: 64.147.123.25, mailfrom: jsbronder@cold-front.org)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 747A91135;
	Mon, 21 Jun 2021 13:50:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Mon, 21 Jun 2021 13:50:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=mesmtp; bh=56aq+hyVy8kzZY8j7D3O+sI
	sddT2lpwCnPIRUxY/ZR4=; b=Ughkr4Ype+c3mEgSYfYMIHJ7bhvu7Qqo2wtsTA0
	kkM7yr5llayRQES0epzSM0IGQv235Dhfqg0dSKG9mTMQ9XcamSAR3/HaWTeqg7xi
	1Hu3jJdxgUYZJuwcC61scevNFgc+OVWHwdXEjada1AddJyPK2uZ44CDOH4EkgG7y
	kpSI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=56aq+hyVy8kzZY8j7
	D3O+sIsddT2lpwCnPIRUxY/ZR4=; b=a/2HAKD8kUK5mPXNqGIBzVGGL7Il0sKRy
	C58UcsddQbSDzdZ7pvRlggTbbGQVOl/VBQQ86nBWsH6HquwJ2/59+gZrfneFq+ob
	enHDNQxYFG5WQ3GBI1+A7R/eiSvo41HZTF21PAKd9rbewsTIcCZVixX/LdBj5v9F
	+KdUjrZ2BEkz0GsVOpfbr8RACKiy2pKa+6uGvN8FFYzfa4WBQhiRzLSSoSro4sWA
	NbZ9lfQY0UJiaPdtfAwiWqCo6nGPN8TppcsP8NM96CPpJnfdf/sa7JL63mm17fTt
	LaySBbi6NYilLdhev0SUYp7q1JAeE/TWafXWVX8NFozrWJaXPs6kw==
X-ME-Sender: <xms:aNHQYBj-ugqJnPkELNoQPvrlpoz1bJ0RftkZwcNRxtorZ0df1QegbQ>
    <xme:aNHQYGDc_ecjyJ2KE2caORoyfBAqwCCUFcVCeOAUYrmhK1tl4-9dm93Gxx4Eqp91s
    _eW4k0sXDHtHvjEvg>
X-ME-Received: <xmr:aNHQYBFt9Tqop3Jsjrob3qCksn0CdW0nK6mWYwpHGlZPpGE-GqBVcSl2nlE930_B_ZHlQY1RfhrY5U1XeIPm972SNZ08dk0Lj14yAGZk-nZ8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeefledguddukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefluhhsthhinhcuuehrohhnuggvrhcuoehjshgsrhhonhguvghr
    segtohhlugdqfhhrohhnthdrohhrgheqnecuggftrfgrthhtvghrnhepleevieefgfejge
    eggffhfeefkeekgeeiveejffevieekheetgfetveehvddvtddunecuffhomhgrihhnpehs
    ihhgghgvnhdrshgrvhgvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepjhhssghrohhnuggvrhestgholhguqdhfrhhonhhtrdhorhhg
X-ME-Proxy: <xmx:aNHQYGQiDCnx_KKrw7nzN37qr1q2WePJafetA0aI8GDm06SmoaDtyQ>
    <xmx:aNHQYOxAhAmp0hLeoz1BTESZiUL-rJQViM9kREl1i_PzNMET5WROmw>
    <xmx:aNHQYM5IGuJehes2wHzy8HWxwad58DF1AREBQ2clUuyF5Sz1WFXBbw>
    <xmx:adHQYEa7IoNkn2J_B35mySKtal1Ne5b-rCNEbkDbKHz9lFK7h0nMGg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Jun 2021 13:50:32 -0400 (EDT)
From: "Justin Bronder" <jsbronder@cold-front.org>
To: openembedded-core@lists.openembedded.org
Cc: Justin Bronder <jsbronder@cold-front.org>
Subject: [PATCH v2] populate_sdk_ext: copy BBMULTICONFIG files
Date: Mon, 21 Jun 2021 13:50:28 -0400
Message-Id: <20210621175028.20209-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the generated local.conf includes BBMULTICONFIG, the referenced files
in conf/multiconfig also need to be copied.  Otherwise with
BBMULTICONFIG="abc" for instance, building the esdk fails with:

ERROR: ParseError at tmp/build-glibc/work/qemux86_64-oe-linux/core-image-ssh/1.0-r0/sdk-ext/image/tmp-renamed-sdk/layers/openembedded-core/meta/conf/bitbake.conf:767: Could not include required file conf/multiconfig/abc.conf

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 meta/classes/populate_sdk_ext.bbclass | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index fe840d9cfb..517b4e45ff 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -397,6 +397,14 @@ python copy_buildsystem () {
             f.write('require conf/locked-sigs.inc\n')
             f.write('require conf/unlocked-sigs.inc\n')
 
+    # Copy multiple configurations if they exist in the users config directory
+    if d.getVar('BBMULTICONFIG') is not None:
+        bb.utils.mkdirhier(os.path.join(baseoutpath, 'conf', 'multiconfig'))
+        for mc in d.getVar('BBMULTICONFIG').split():
+            dest_stub = "/conf/multiconfig/%s.conf" % (mc,)
+            if os.path.exists(builddir + dest_stub):
+                shutil.copyfile(builddir + dest_stub, baseoutpath + dest_stub)
+
     if os.path.exists(builddir + '/cache/bb_unihashes.dat'):
         bb.parse.siggen.save_unitaskhashes()
         bb.utils.mkdirhier(os.path.join(baseoutpath, 'cache'))
@@ -556,6 +564,9 @@ python copy_buildsystem () {
     # sdk_ext_postinst() below) thus the checksum we take here would always
     # be different.
     manifest_file_list = ['conf/*']
+    if d.getVar('BBMULTICONFIG') is not None:
+        manifest_file_list.append('conf/multiconfig/*')
+
     esdk_manifest_excludes = (d.getVar('ESDK_MANIFEST_EXCLUDES') or '').split()
     esdk_manifest_excludes_list = []
     for exclude_item in esdk_manifest_excludes:
@@ -564,7 +575,7 @@ python copy_buildsystem () {
     with open(manifest_file, 'w') as f:
         for item in manifest_file_list:
             for fn in glob.glob(os.path.join(baseoutpath, item)):
-                if fn == manifest_file:
+                if fn == manifest_file or os.path.isdir(fn):
                     continue
                 if fn in esdk_manifest_excludes_list:
                     continue
-- 
2.31.1


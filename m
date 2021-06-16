Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web12.756.1623875234452297645
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jun 2021 13:27:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=mesmtp header.b=wEt3b7Xq;
 spf=pass (domain: cold-front.org, ip: 66.111.4.26, mailfrom: jsbronder@cold-front.org)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.nyi.internal (Postfix) with ESMTP id AAD9C5C010A;
	Wed, 16 Jun 2021 16:27:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 16 Jun 2021 16:27:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=mesmtp; bh=9nZ7X13TO5EEuovtycmSxw0
	hGVaO7PoMwyBX1zd6XVE=; b=wEt3b7Xqlg4HWss5rktdjKqo6pyhGUg7WpZgQW7
	KZsVdNKhmAZncQC/LVYmAp9hPJ2Zz/AbLIq/rDZR0sT4I9q/YzI88zWhYBFmrXwG
	J9uWOmb0ul8AHXHmYtMDqKyLXt/rRwkdflHrk2qA/GjXOraklGw971/japTtyvns
	eYWo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=9nZ7X13TO5EEuovty
	cmSxw0hGVaO7PoMwyBX1zd6XVE=; b=WUjkuCuQGAT9jyqn5gt7G+4BNeiSAG7Tz
	lm7syK8uqNlwBDIY0QemkQK8F9JpES4E0zTwpSvEi+FX/vgk5eiRo53/poTTK3pq
	HlXZj82DSlMnCoH7XUZ8onJI8UhOpmKd0o80+egc5IrwyL/a1XGOiAnemuopWWa0
	PORLqeXghZB//x0cnALuvTWEWkdAQMFM5pTkEcg31vyoE5V/2D8wXXlQed0V7qc5
	n/OVNvC7U4Ry/aPosFOFVN++0ibCav8DMttm2N1xTbuBKTMvAd+p14M3wsHg+7jY
	TRBybYALodvq1xwqfcWD80x92Iy7w+FhWlhYFcEC2bMIQbItS7qVA==
X-ME-Sender: <xms:oV7KYGz9AllgSwGr058FG0PbzJnpwXWoXGBUKuwcML6ft8BljVclhA>
    <xme:oV7KYCQLeyX2k5KOwAyy34l9h6ufByLQnIwTNrdt_tvMeKvUFGgseghditjrIHX6r
    gZipVNwr2GEdxZ0SQ>
X-ME-Received: <xmr:oV7KYIVu9vUg0HvemwoSqkL2j8BgZE3N4RyP_zZuER8bIilj1q8r8KeRm9ohmw41bEMSAhjmc1NfdtZlirIIOMwc8bGT0N7BbNS-jb2K9cPZ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvledgudegudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefluhhsthhinhcuuehrohhnuggvrhcuoehjshgsrhhonhguvghr
    segtohhlugdqfhhrohhnthdrohhrgheqnecuggftrfgrthhtvghrnhepleevieefgfejge
    eggffhfeefkeekgeeiveejffevieekheetgfetveehvddvtddunecuffhomhgrihhnpehs
    ihhgghgvnhdrshgrvhgvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepjhhssghrohhnuggvrhestgholhguqdhfrhhonhhtrdhorhhg
X-ME-Proxy: <xmx:oV7KYMj4t56AhQBy2kqGDoiorTsIlbjWFNxi2rwFyu3QKu05NR6ErQ>
    <xmx:oV7KYIBhfOJ8woslcR7pbzA7GarcfIk5zfmc213AosmDH-1QxTjaig>
    <xmx:oV7KYNIfdZH8KAgJDb25VcdO7Erl4xFn4XgVqyIj4qJYu-hphIx9Sg>
    <xmx:oV7KYDr37n8wTNN4EwNk0uV0NaihSTxNfN6SdI8ne6VQ4w0cHL2z1Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Jun 2021 16:27:13 -0400 (EDT)
From: "Justin Bronder" <jsbronder@cold-front.org>
To: openembedded-core@lists.openembedded.org
Cc: Justin Bronder <jsbronder@cold-front.org>
Subject: [PATCH] populate_sdk_ext: copy BBMULTICONFIG files
Date: Wed, 16 Jun 2021 16:27:09 -0400
Message-Id: <20210616202709.5143-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the generated local.conf includes BBMULTICONFIG, the referenced files
in conf/multiconfig also need to be copied.  Otherwise with
BBMULTICONFIG="abc" for instance, building the esdk fails with:

ERROR: ParseError at tmp/build-glibc/work/qemux86_64-oe-linux/core-image-ssh/1.0-r0/sdk-ext/image/tmp-renamed-sdk/layers/openembedded-core/meta/conf/bitbake.conf:767: Could not include required file conf/multiconfig/abc.conf

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 meta/classes/populate_sdk_ext.bbclass | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index fe840d9cfb..71f601fa9b 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -397,6 +397,13 @@ python copy_buildsystem () {
             f.write('require conf/locked-sigs.inc\n')
             f.write('require conf/unlocked-sigs.inc\n')
 
+    # Copy multiple configurations if they exist
+    if d.getVar('BBMULTICONFIG') is not None:
+        bb.utils.mkdirhier(os.path.join(baseoutpath, 'conf', 'multiconfig'))
+        for mc in d.getVar('BBMULTICONFIG').split():
+            dest_stub = "/conf/multiconfig/%s.conf" % (mc,)
+            shutil.copyfile(builddir + dest_stub, baseoutpath + dest_stub)
+
     if os.path.exists(builddir + '/cache/bb_unihashes.dat'):
         bb.parse.siggen.save_unitaskhashes()
         bb.utils.mkdirhier(os.path.join(baseoutpath, 'cache'))
@@ -556,6 +563,9 @@ python copy_buildsystem () {
     # sdk_ext_postinst() below) thus the checksum we take here would always
     # be different.
     manifest_file_list = ['conf/*']
+    if d.getVar('BBMULTICONFIG') is not None:
+        manifest_file_list.append('conf/multiconfig/*')
+
     esdk_manifest_excludes = (d.getVar('ESDK_MANIFEST_EXCLUDES') or '').split()
     esdk_manifest_excludes_list = []
     for exclude_item in esdk_manifest_excludes:
@@ -564,7 +574,7 @@ python copy_buildsystem () {
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


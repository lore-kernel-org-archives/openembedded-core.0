Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 3D7FA7FBF9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 06:50:16 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id l10so4676390wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 23:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Mfl3ii9y5/z88cnv3O6vZveoQssz5Cs3nh/jrUmBEtg=;
	b=UiEhXhtH6hFvGqXl0gWFHOjdBYuyZy5wrdQOFbd70wDbixkuVL9jZn2SUUXGQwdMo0
	Mykjlk8p6Wi+OPLpLHCykm18rxliMp0d9DTd5Sx99pG8Z9kmmpZkTkVNeYGHaUpw63II
	wrD2TfggzABEeE/xy7hTvZAZDkbvDI6TjOSv1FshJ1vJIstNrrxkDEt6bZEdMB3h6iT7
	MASrjqpAj/GHrW3Wvy9rtyLz1Z+LBCYkE1wGFWcm8JPAp/DyjdyZQdyssZueOqtfUUpz
	tgZNTsN9ATblc1QNSQBbvgtpeDosnHHVP4NGQpjBHU2Rs3lPnNmB1Hmff2xXVg8EQe+6
	j6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Mfl3ii9y5/z88cnv3O6vZveoQssz5Cs3nh/jrUmBEtg=;
	b=rsouCq5n9BiOVUZlGOKvbl0TShqcJhqLj7dmYW+jSfdCX70/48rIvc2TjKJ/Gy8oDQ
	QqVErQ400+3LsfPp6s42vzuYQexZsLmnxhlkLwV00LsRDJnzJ79HyXHY5PgmVJmygrwq
	7mtcybuwJXEVCzvC6nvUCV8P+T/9qNLPqfw+36UIqNbTq98109yOnTzBZbBz3hPx0Rzi
	9Jo97jSemQiNAD6J0PeqCdQwTtRPpdhNLWoHRStYTzr6cRfGhaGfiHqS+TdOxAtWiSbu
	RoPt6xjwCBTDoYCKo4bOSp/B8o8hzhIU/rXfLt/z72K0j12dzRhSEvaR9rlu6xi5C5Lt
	IR1A==
X-Gm-Message-State: APjAAAW7lDGJ+Ni94gzfPhIXmPPgthVVLLzvBcLnR9q3x7gLst2/4qbU
	mFMkaLpme1VZ8tSLhcGlU3buKXT8tf8=
X-Google-Smtp-Source: APXvYqwiqCMXzH3APHPv6GwfrBmGSTWmGAkzduidcTPSNFmbQNI2oavZ046Wp3Ub1sCiBE3ciJkQrQ==
X-Received: by 2002:a5d:6b0e:: with SMTP id v14mr6128685wrw.280.1572072616716; 
	Fri, 25 Oct 2019 23:50:16 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.controleur.wifipass.org ([178.18.58.186])
	by smtp.gmail.com with ESMTPSA id v6sm4807911wru.72.2019.10.25.23.50.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Oct 2019 23:50:16 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2019 23:49:47 -0700
Message-Id: <60ee826ec6f07b270ae77e24be0088269a93081e.1572072422.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1572072421.git.akuster808@gmail.com>
References: <cover.1572072421.git.akuster808@gmail.com>
Subject: [zeus 15/28] i2c-tools: Add missing RDEPEND
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
X-List-Received-Date: Sat, 26 Oct 2019 06:50:16 -0000

From: Ricardo Ribalda Delgado <ricardo@ribalda.com>

Fixes:
 # decode-dimms
Can't locate Carp.pm in @INC (you may need to install the Carp module) (@INC contains: /usr/lib/perl5/site_perl/5.28.1/x86_64-linux /usr/lib/perl5/site_perl/5.28.1 /usr/lib/perl5/vendor_perl/5.28.1/x86_64-linux /usr/lib/perl5/vendor_perl/5.28.1 /usr/lib/perl5/5.28.1/x86_64-linux /usr/lib/perl5/5.28.1 .) at /usr/lib/perl5/5.28.1/Tie/Hash.pm line 190.
BEGIN failed--compilation aborted at /usr/lib/perl5/5.28.1/Tie/Hash.pm line 190.
Compilation failed in require at /usr/lib/perl5/5.28.1/x86_64-linux/POSIX.pm line 505.
Compilation failed in require at /usr/bin/decode-dimms line 41.
BEGIN failed--compilation aborted at /usr/bin/decode-dimms line 41.
root@qt5222:~# apt-get install perl-module-carp

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c73d2a2c0ecc99f0d6d7e6a1861ecce7a2312a57)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/i2c-tools/i2c-tools_4.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/i2c-tools/i2c-tools_4.1.bb b/meta/recipes-devtools/i2c-tools/i2c-tools_4.1.bb
index dcbd05a..c576117 100644
--- a/meta/recipes-devtools/i2c-tools/i2c-tools_4.1.bb
+++ b/meta/recipes-devtools/i2c-tools/i2c-tools_4.1.bb
@@ -31,6 +31,7 @@ FILES_${PN}-misc = "${sbindir}/i2c-stub-from-dump \
 RDEPENDS_${PN}-misc = "${PN} perl perl-module-posix \
                        perl-module-constant perl-module-file-basename \
                        perl-module-fcntl perl-module-strict perl-module-vars \
+		       perl-module-carp \
                       "
 
 ALTERNATIVE_PRIORITY = "100"
-- 
2.7.4



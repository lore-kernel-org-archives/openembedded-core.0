Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3E91D73042
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 23:05:34 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id z70so3090686itb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 16:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=pfT72PyQ9L4ug2/qfS/DxUzJ9yYBcneuL16EnJ0ymf4=;
	b=gdK7gZZkiaSlqhbU3/FQQ46vuHrGQ3vWgJx0tOkCy37WIf7OG9uKYMDkJjBmH/ZOZp
	G3MlCCxhQo7LvR3wthZAIk+80U+FO6UZlnLhNOf3w7x5GGIUCewVfW0hiyf9JinEFoMb
	MCRNdUyQYQD/KexYdz1yOV1c+8tikkzRLQtfKbeO76bIbMsUOYKU08MIEoxSB/ZXT8yq
	erdtR3CZj/j5GrHuB0aW8+QUdrw17CMmBAUypX/heRo7wMgX9HamdpHEEc2yIw3RBAzD
	9HMUlu6AUUtAbsbk1OmRYmgJtp7PSgXaqJaYbj4NaAOo04rb10TZOKSzf2wZvz+VbcRZ
	jCJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=pfT72PyQ9L4ug2/qfS/DxUzJ9yYBcneuL16EnJ0ymf4=;
	b=dFg9UbIc/CokU4BJfEBIDBO9xfNH9ihdiVlroihYeGwtpDXvyTHF1t6NtdvqZ7IfAR
	1RqkVsBVy+P1ggQ8OUSrV241Jxk4PF4Yzayn541tGgglpDKAglHtUlYe5uVeJVtW233u
	U6Hriwd+MJRN8P+M5uZWVU26lR5vTTRAU913um9STX78Pc4yajzBXkpzDjUTlL7fmite
	+pSmD/Ztd9ImGfnNCUhjBIumAmNrkkaKE7tWdTFLB/dmJ1NlzSvBtJN5EO9o2zoS7/ex
	23tIsuYseYlf+z+qw/N9c4g9WZaSSE/K/knqP+06etTJADERLgs0vDqrNnK6HK2vkhSU
	jL7A==
X-Gm-Message-State: AFeK/H1dZWhC3DU4H/43uaGuLoR4q5rHh4NjMe8twbrK5dKP1XJvOW1yI51PpLdgzshTwQ==
X-Received: by 10.36.84.199 with SMTP id t190mr5282752ita.114.1490137535916;
	Tue, 21 Mar 2017 16:05:35 -0700 (PDT)
Received: from linux-uys3.suse (104-247-246-30.cpe.teksavvy.com.
	[104.247.246.30]) by smtp.gmail.com with ESMTPSA id
	n18sm10785767ion.42.2017.03.21.16.05.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Mar 2017 16:05:35 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Mar 2017 19:05:33 -0400
Message-Id: <20170321230533.3283-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.12.0.rc1.48.g076c053
Subject: [PATCH] core-image.bbclass: update available IMAGE_FEATURES
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
X-List-Received-Date: Tue, 21 Mar 2017 23:05:35 -0000

Update the list of available IMAGE_FEATURES with the sub-features of
'debug-tweaks' and add 'splash'.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/classes/core-image.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index 8431440db4..a9a2cec68f 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -24,11 +24,15 @@
 # - hwcodecs            - Install hardware acceleration codecs
 # - package-management  - installs package management tools and preserves the package manager database
 # - debug-tweaks        - makes an image suitable for development, e.g. allowing passwordless root logins
+#   - empty-root-password
+#   - allow-empty-password
+#   - post-install-logging
 # - dev-pkgs            - development packages (headers, etc.) for all installed packages in the rootfs
 # - dbg-pkgs            - debug symbol packages for all installed packages in the rootfs
 # - doc-pkgs            - documentation packages for all installed packages in the rootfs
 # - ptest-pkgs          - ptest packages for all ptest-enabled recipes
 # - read-only-rootfs    - tweaks an image to support read-only rootfs
+# - splash              - bootup splash screen
 #
 FEATURE_PACKAGES_x11 = "packagegroup-core-x11"
 FEATURE_PACKAGES_x11-base = "packagegroup-core-x11-base"
-- 
2.12.0.rc1.48.g076c053



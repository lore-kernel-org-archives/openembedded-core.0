Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f50.google.com (mail-lf0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6661C71A81
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 07:09:37 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id o141so21310711lff.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 23:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=neaq+cjnP+R+q81lyY0LewyamOrEdJNy8UeGDkONmCM=;
	b=FxfHVM767SmVtB0gZwUQeVffCCTHMnOy1zqFy9RBzH6wWwlgc01uUa+liaeYam8xhX
	HSD0A/4v9z4bCn3M1p6apjtnCbxQR6cjUbApC104o6mobMq5tmqWO26sXWsubiA8SGsu
	djJG3o5JuYP2Yxb2spLjENqdeW+cGOHHoKcQ+h1p6+qkvrjQgpJDoZViM29q/E1amGbe
	2J+tO1WpxEFZtCiieVkAAKznKysT/QhZ8QcVw7qPypHwJEoiru8eURl8sGVb7O+6mSbd
	kGIeOXGQlJvQClaF84dW1yWwAroFj5XCjrsyYawsYTY7ar1sPs38A23hMGij7mSnab0g
	wJww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=neaq+cjnP+R+q81lyY0LewyamOrEdJNy8UeGDkONmCM=;
	b=RMQ0yanu0sPDG4dRBAZa2sGGutKVWooy0V3DalFtAo8le9mfhb36pLdJGR32JGpA37
	8HqQH1BfsdArFbhJgVHKJny/hXpD8Zju2UUt1hCppei4TaD8t0u47DpHzg+C+HYJ5v9Y
	eHBc6ah69MuMecHkpqlYBc6KRoR5p4vCjzaeYNycpRg/r6AN8fgwiGidScg/kRB/Zkg6
	XGdQwS+zuZ873ArntJOFYeMvh3WJBrwt56pJXv1JPyg8gCY4HrTwB1ijlw+MpfZ3c3El
	tkusK3eRjYGZbYbcywRWH7FjCmJfCTzvnXtvoRAC8tm2zYN9NA+XyN6zEYUwRco7oa+L
	wYSA==
X-Gm-Message-State: AKaTC00CgPgV2Vl9R4LyXaFSfxp++4NWcQJ7jz27SE6VhbrcgNebw0b/a7whwpTqn+fXNQ==
X-Received: by 10.25.125.132 with SMTP id y126mr382758lfc.86.1479971377794;
	Wed, 23 Nov 2016 23:09:37 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id v9sm7780542lja.0.2016.11.23.23.09.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 23:09:37 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Nov 2016 08:08:28 +0100
Message-Id: <7cd0e82525439243112a255ea52747a062adf4e1.1479971185.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1479970230.git.maciej.borzecki@rndity.com>
References: <cover.1479970230.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1479971185.git.maciej.borzecki@rndity.com>
References: <cover.1479971185.git.maciej.borzecki@rndity.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v5 1/6] oe-selftest: enforce en_US.UTF-8 locale
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
X-List-Received-Date: Thu, 24 Nov 2016 07:09:37 -0000

Replicate bitbake and eforce en_US.UTF-8 locale so that ouptut of locale-aware
tools remains stable.

Signed-off-by: Maciej Birzecki <maciej.borzecki@rndity.com>
Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 scripts/oe-selftest | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index c3215ea6592e128d17da550d778272985f5bd1a6..deaa4324cc888ea261687f90f83e8759c4436a15 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -468,6 +468,9 @@ def main():
     sys.path.extend(layer_libdirs)
     imp.reload(oeqa.selftest)
 
+    # act like bitbake and enforce en_US.UTF-8 locale
+    os.environ["LC_ALL"] = "en_US.UTF-8"
+
     if args.run_tests_by and len(args.run_tests_by) >= 2:
         valid_options = ['name', 'class', 'module', 'id', 'tag']
         if args.run_tests_by[0] not in valid_options:
-- 
2.5.0



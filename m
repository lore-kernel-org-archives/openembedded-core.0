Return-Path: <nathan@nathanrossi.com>
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
	[209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id 4AAAB6102C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 06:00:03 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id m13so3477926pjb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 22:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=w4FEes8VqRpwvAn8b4+yOTKpqgvxzENG4YeWXB4fzJw=;
	b=JK+mrT0y8DpV0Jgeoa6EWF14/jOXnbaY/wQCZbjOxx1c4g1EPxyh3fJJrN0D+VzG+2
	zK0K1uYGuzKDvfuhucjeWcWwBAXMLaLrgke275U3XD40I0N5XEnVBRNyjim1GTuP36xV
	Yajha3TDlI7XkOGnQ8B9eaaz3VNviQPUCTksrQZ+PNhpkxpYGPuXXsYAzRuKuyoRJDmx
	/SujOJaAIM9WtDKaWeRmdSKmRFL4EHP/Ya83KMvTuGy2OGaR/rzYOxuml6splYqEL7ej
	8vKSEZE+a4L+IN0GHYKiWa2O6DdiKKivc3+rffk4yt04g4jfiY4Q5YIisp75QLt/bVup
	TBWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=w4FEes8VqRpwvAn8b4+yOTKpqgvxzENG4YeWXB4fzJw=;
	b=N5uCYdYDgqheh1LyXO/re+SIwywUbtCCXVY3GbnKGP3K9tBleU7iN/LusjTaCmhLFz
	rYNV1fO9FqhB+XgqYRbs2TgkVdUm/a4oZqVkU/nsvZrVbImuw8Zn7qszwIXHmJyrdf+F
	87STU/Afb3DFzAsOhkQWJKAIyIzmrz92IhcMDOA7E9ttKPQ8FJ09qQDTvqlyXNeqn1DT
	U0yqqCwj84HL1kjFurKsXv0HDukFKupaEXLmYAg2X/dOyosufjTaW+scuMLCWIuqdOVt
	Db0vC/tFlj9AAv6iOSZTm6UT+WornxYF5EARQpIzQ9Tw4jiYOMhcoWRLykbTcX0vaNL9
	e3kA==
X-Gm-Message-State: APjAAAXpNwTcvHuliy3yaop4g9A69O8b+psAfKCcYBRQu2qml8gyNwh3
	sOv6ndc5kWR4oHMj3FgBANpeOA==
X-Google-Smtp-Source: APXvYqzwl3/ZKmm0gEQFJosPWtZWEzyqf6XZ+JlIGD5Pb7zNYw471xCmvIJlVpuoCYurQHxsb3ccUw==
X-Received: by 2002:a17:902:6b03:: with SMTP id
	o3mr1611044plk.331.1581660004376; 
	Thu, 13 Feb 2020 22:00:04 -0800 (PST)
Received: from [127.0.1.1] ([1.128.246.203])
	by smtp.gmail.com with UTF8SMTPSA id
	iq22sm4851137pjb.9.2020.02.13.22.00.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 13 Feb 2020 22:00:03 -0800 (PST)
Date: Fri, 14 Feb 2020 05:59:43 +0000
Message-Id: <20200214055943.602254-2-nathan@nathanrossi.com>
In-Reply-To: <20200214055943.602254-1-nathan@nathanrossi.com>
References: <20200214055943.602254-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 2/2] glibc-testsuite: Exclude this recipe from world builds
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
X-List-Received-Date: Fri, 14 Feb 2020 06:00:03 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

This recipe is intended to be run manually or via oeqa.

[YOCTO #13737]

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-core/glibc/glibc-testsuite_2.31.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc-testsuite_2.31.bb b/meta/recipes-core/glibc/glibc-testsuite_2.31.bb
index c44f30bf1c..d887aeff79 100644
--- a/meta/recipes-core/glibc/glibc-testsuite_2.31.bb
+++ b/meta/recipes-core/glibc/glibc-testsuite_2.31.bb
@@ -1,5 +1,7 @@
 require glibc_${PV}.bb
 
+EXCLUDE_FROM_WORLD = "1"
+
 # handle PN differences
 FILESEXTRAPATHS_prepend := "${THISDIR}/glibc:"
 
---
2.24.1


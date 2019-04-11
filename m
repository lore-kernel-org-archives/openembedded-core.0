Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 427F87D5E7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 04:04:06 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id b3so2767594pfd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 21:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:content-transfer-encoding
	:mime-version; bh=rIG7yBgLAswUkTkqzmgdnfcO843yJrEahlzYLdfcAG4=;
	b=OlNsBp/udo4bpaj2Z1PE7iI6RHoJELNz+bvRIru/1NUOS8UDELL1UnxEM6f6VRY/aa
	8Gu2N5gTGgiRJRNj8kfVa/Uu2uctk9V113x/kU/nsYu3Mb1Xr4zuKEZ6RGcSq78oMKem
	wF3j+aJ0LpVYPkCeWEs+LXnv4mTJNzUHOdc/JN22H2swQ8e1H4gq+yA6NrKwsvPP82yy
	WDMndodVWX3kW5LLuXsI+4retQ52N7yM3pOI2eJu8ZYYRSZxOgGzwhClPY9eTv8oF3b+
	nyT2gkMD6Js2hzZGD5rdr5TJT3tMGbjcwobvtvpzC3lBksUyoK6dF2eWHkpSQblieTfc
	pMEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=rIG7yBgLAswUkTkqzmgdnfcO843yJrEahlzYLdfcAG4=;
	b=DNQ2esj7gLJlGXrzu2E1JUmazUdIvh7jHM8T3XU1bEMgjfPMnrJ7OKZUmnefkqQSUT
	dnsY7ecnqJCNEFoCIYKLNxl118QwAXkHCmIzCvS1q5+EZVBkaLyyEJGJbyfGp8PMRwNY
	Fz5txwCjXDMI8PocI/itp51e4scQ7n+Wu2wI5a0jGHTVjmVQFc2kZuaA6TnirgBiZwOJ
	drTHJuNY9scQ2qX5wSEpFmTAqqxgj9/4h0npEmeTZZModIpcVtxWWhk4V6Vf5pUQQspj
	fCyHYI444WX6WPKABdnW2bH7kuvRuYPMPI2Ps5Tkm4KqAwB5Bkyb6CjC17MMwiHkuRz0
	V+vw==
X-Gm-Message-State: APjAAAXowhEVMQ1aDWHn+Ss2XOibUfbKqcINyHyul+TjE1RsfHo48aUI
	sDI89FS2aizB6CPFlfJ8GqQRsd5xl1M=
X-Google-Smtp-Source: APXvYqwjDdtLQ7fDXdcNuIk7q0e4Xuc0PjiFE9O8+PSd+nHx/xeB0HcGQw9wd7Cfff2MUi+mI7GQBQ==
X-Received: by 2002:a65:6108:: with SMTP id z8mr44841282pgu.106.1554955446717; 
	Wed, 10 Apr 2019 21:04:06 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.78.119])
	by smtp.gmail.com with UTF8SMTPSA id
	b26sm70308110pgn.4.2019.04.10.21.04.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 10 Apr 2019 21:04:06 -0700 (PDT)
Date: Thu, 11 Apr 2019 04:03:52 +0000
Message-Id: <20190411040352.26813-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH] ccmake.bbclass: Fix up un-escaped quotes in output formatting
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
X-List-Received-Date: Thu, 11 Apr 2019 04:04:06 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The quotes should be generated in the output to match the expected cmake
syntax for setting cache variables.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/classes/ccmake.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/ccmake.bbclass b/meta/classes/ccmake.bbclass
index 4114daa61b..df5134a108 100644
--- a/meta/classes/ccmake.bbclass
+++ b/meta/classes/ccmake.bbclass
@@ -81,7 +81,7 @@ python do_ccmake_diffconfig() {
 
                 with open(d.expand("${WORKDIR}/site-file.cmake"), "w") as f:
                     for k, kt, v in added:
-                        f.write("SET({0} \"{1}\" CACHE {2} "")\n".format(k, v, kt))
+                        f.write("SET({0} \"{1}\" CACHE {2} \"\")\n".format(k, v, kt))
                 bb.plain("Configuration cmake fragment written to: {0}".format(d.expand("${WORKDIR}/site-file.cmake")))
 
                 # restore the original config
---
2.20.1


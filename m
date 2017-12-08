Return-Path: <taborskikrzysztof@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id E9F7F786C8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Dec 2017 17:46:41 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id f206so4353707wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Dec 2017 09:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:references:in-reply-to:subject:date:message-id:mime-version
	:content-transfer-encoding:thread-index:content-language;
	bh=SRnpQFJezftGc8L7ebtzhGBl+VBkylUFFxO0S4v6JYs=;
	b=Us/K6l4tTYYv4QyOF0dwA71T6b/6ps7nVHZ+x/bsHwAS3cty+qCd3nFGjvFbSckIq5
	v/p4pldfVaXQMkFkz8HZgspbsVk3W1xgng+uP3fWphr01CvMhV8mj5jZXqL8LVAVkiD1
	RH2xZ2Kof/POgte1m86Q7JJB2pyIpVn2NmuF9KkOzEo9BVDuMbMfKNIknHR8yHU6S/yY
	dCE6TjTpSe60MayLFhiXIez75RdPv/GgoHAVQRlXymPAGAvilI2gvCqu4C9/bMm4yTY5
	GzupdK/myBs9zKUyvRXJsq4lJ+r7JyZGMxjGlQ5CW0nJsyHxYJ3VtAfLomoa7IWnT1ec
	egsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:references:in-reply-to:subject:date
	:message-id:mime-version:content-transfer-encoding:thread-index
	:content-language;
	bh=SRnpQFJezftGc8L7ebtzhGBl+VBkylUFFxO0S4v6JYs=;
	b=FsLGx+hxMn6uegu3WBWjurlkM672+czAZA173EA0xlI4+p2+ylJAkvGW81+NBRkdGF
	s3OjJx3i4qXdb9vk3F7QZH/RPiIP4VeQIyPiN/r830G93OlaxpHdpGupJK5+FoM43Ycf
	IJsVvjVpiV24z0dH2XUnhnmSDxHXjM9IAaAWJ31jyI9u20hfC/grhdN/lNctqDSUJ3pN
	cVlKRK1i0I6MH6suti+tfEnF17t2bGpF3b7AfRi+Z/r0SS+PTlDiQPGHauTM1wpVfP4z
	B9K/szjmrmPJhmrtt5qP3EFky2Gsv1dag4n142N9DaD9vC4bW6KP0uI201RL9ABp+1C7
	vQwA==
X-Gm-Message-State: AKGB3mKEtmowjVt6qR0T1fwdb+yulG/NCFRiyHVUIjKRjXT3kDGVOHim
	RNjRP9w4xMmZQ5Mh1d1OoIXBgQ==
X-Google-Smtp-Source: AGs4zMbCALIUc3Z5QJZqwGnf1E5zGHSuVRnqiuw5iC+tpM8ycOqxw+zGW2H9G8JBcaEiXVGhVXpJaQ==
X-Received: by 10.28.191.3 with SMTP id p3mr4393238wmf.81.1512755202451;
	Fri, 08 Dec 2017 09:46:42 -0800 (PST)
Received: from KrzysiekPC ([2a02:a317:e242:9880:9570:a4e3:8fb5:27a9])
	by smtp.gmail.com with ESMTPSA id
	d18sm9837657wrd.54.2017.12.08.09.46.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Dec 2017 09:46:41 -0800 (PST)
From: "Krzysztof Taborski" <taborskikrzysztof@gmail.com>
To: <openembedded-core@lists.openembedded.org>
References: <20171204181640.31225-1-taborskikrzysztof@gmail.com>
In-Reply-To: <20171204181640.31225-1-taborskikrzysztof@gmail.com>
Date: Fri, 8 Dec 2017 18:46:42 +0100
Message-ID: <00b101d3704c$8297acc0$87c70640$@gmail.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQGg2WR2E9OWH46s7KQbCRFgkDZQQKOe5dXw
Subject: Re: [PATCH v2] perl: native modules will not trigger build perl for target.
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
X-List-Received-Date: Fri, 08 Dec 2017 17:46:42 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: pl

Hello,
I would like to request feedback about my patch.

Br,
Krzysztof Taborski

-----Original Message-----
From: Krzysztof Taborski [mailto:taborskikrzysztof@gmail.com] 
Sent: Monday, December 04, 2017 7:17 PM
To: openembedded-core@lists.openembedded.org
Cc: Krzysztof Taborski
Subject: [OE-core][PATCH v2] perl: native modules will not trigger build
perl for target.

Currently building perl-native modules triggers build perl for target due to
PACKAGES_DYNAMIC regex.

This commit will cause, that perl native modules will trigger perl-native
build.

Signed-off-by: Krzysztof Taborski <taborskikrzysztof@gmail.com>
---
 meta/recipes-devtools/perl/perl-native_5.24.1.bb | 2 ++
 meta/recipes-devtools/perl/perl_5.24.1.bb        | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/perl-native_5.24.1.bb
b/meta/recipes-devtools/perl/perl-native_5.24.1.bb
index 48113f05a9..a81dc4d703 100644
--- a/meta/recipes-devtools/perl/perl-native_5.24.1.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.24.1.bb
@@ -134,3 +134,5 @@ EOF
 
 # Fix the path in sstate
 SSTATE_SCAN_FILES += "*.pm *.pod *.h *.pl *.sh"
+PACKAGES_DYNAMIC_class-native += "^perl-module-.*native$"
+
diff --git a/meta/recipes-devtools/perl/perl_5.24.1.bb
b/meta/recipes-devtools/perl/perl_5.24.1.bb
index 6b27b22d22..3dc7805da9 100644
--- a/meta/recipes-devtools/perl/perl_5.24.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.24.1.bb
@@ -323,7 +323,7 @@ python split_perl_packages () {
     d.setVar(d.expand("RRECOMMENDS_${PN}-modules"), ' '.join(packages))  }
 
-PACKAGES_DYNAMIC += "^perl-module-.*"
+PACKAGES_DYNAMIC += "^perl-module-.*(?<!\-native)$"
 PACKAGES_DYNAMIC_class-nativesdk += "^nativesdk-perl-module-.*"
 
 RPROVIDES_perl-lib = "perl-lib"
--
2.13.6




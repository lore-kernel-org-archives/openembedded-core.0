Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
	[209.85.210.173])
	by mail.openembedded.org (Postfix) with ESMTP id 9E38160B31
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 05:59:57 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id i6so4349906pfc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 21:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:content-transfer-encoding
	:mime-version; bh=A1PEUnApM/+3CJ327fzxIXrYR4a1tpJO/FDOCwxx120=;
	b=OwbCVHNEKNLWc/ATHZ37Lic7mrxFMsymxsa8ap3RuQLr7JBILpXaPJYFCV9+ciQiFo
	d0JHnlasFTt8nrF7eDcLAlngM9eTxZldCZiCoNPsEM27imaAe00xf94vUbDnzOWLFdVv
	pPR+BepTfKHz55zgBBmheRzKTeMeGzpdeY/TabIBo4ATF376n3Hf/mhWIHYQEO9A0kT1
	ITcWjnbDNNvD68+PgMqtvQtwf/xtQj3cRVbR3AFtCsOZtfLxJz3wAlmYexOYeUtc8VIC
	caPaPcW9OnudDJoYUzpYY18saumx+N2cazjQTAD55c60sDKhhInxeQWicXFsxHhiop5M
	jYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=A1PEUnApM/+3CJ327fzxIXrYR4a1tpJO/FDOCwxx120=;
	b=LfIiWGdMfWOD84cQWZO/21TkcSORzTW3YpKaUrGsklJ/1d2UazscO3osMlEhMWyLCr
	07RpcdZI4nk7rhsqFO+M9sGtR/1j0TIDEDHhXp36wXLtZH+UkZleo4r1HlQh9FbLAAIc
	8+Y20wBvj6ykY3g3MoHsvY362L62plOGtG1+7/rrjLGj+PIoxZyOU7gjbLRPo/Q7P5xb
	zY8QXng4r2918i8xh7BI5GY+ET6wDVElNtvSIDtwENHM2HGFOXuh/GvEXYIe4xiliMto
	5YPwg3+2uEndjYhKqbe1XBjtlSw8a22Tp2WUeH/KeSVeHCJbFb27HeTU4FQelkqJ6H4o
	ydlA==
X-Gm-Message-State: APjAAAWBvTpTws12AG42KAJEavO3hioYpoteDGBT5sJ1JFZm4xMlNQxc
	3Np4fG8dA2gRHnTU1F4HFiTiOAZXL00=
X-Google-Smtp-Source: APXvYqwzLDoJwcU9FsWJVSSm1Tr7+Z6OpeDBqvm0GTj55kMgLftxQp6kHghdFavvG3qTlNcVzaZQNw==
X-Received: by 2002:a62:e30d:: with SMTP id g13mr1790149pfh.92.1581659998678; 
	Thu, 13 Feb 2020 21:59:58 -0800 (PST)
Received: from [127.0.1.1] ([1.128.246.203])
	by smtp.gmail.com with UTF8SMTPSA id
	r7sm5307017pfg.34.2020.02.13.21.59.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 13 Feb 2020 21:59:57 -0800 (PST)
Date: Fri, 14 Feb 2020 05:59:43 +0000
Message-Id: <20200214055943.602254-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 1/2] glibc-testsuite: Remove the do_install task
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
X-List-Received-Date: Fri, 14 Feb 2020 05:59:57 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

This task is not intended to be run as this recipe does not produce any
packages or install any sysroot content. Additionally running this task
behaves differently from a normal glibc build, and can result in issues.

[YOCTO #13737]

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-core/glibc/glibc-testsuite_2.31.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glibc/glibc-testsuite_2.31.bb b/meta/recipes-core/glibc/glibc-testsuite_2.31.bb
index 657fd4dbc1..c44f30bf1c 100644
--- a/meta/recipes-core/glibc/glibc-testsuite_2.31.bb
+++ b/meta/recipes-core/glibc/glibc-testsuite_2.31.bb
@@ -58,3 +58,4 @@ addtask do_check after do_compile
 
 inherit nopackages
 deltask do_stash_locale
+deltask do_install
---
2.24.1


Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 9F28C6074F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jul 2018 06:39:08 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id i139-v6so7653991wmf.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Jul 2018 23:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dresearch-fe-de.20150623.gappssmtp.com; s=20150623;
	h=to:from:subject:openpgp:autocrypt:message-id:date:user-agent
	:mime-version:content-language:content-transfer-encoding;
	bh=u+JZG+yxZptAAYMUBN9n06qDXjHzC1gtzYcDMUkJRvw=;
	b=bJLP6iVrvV1muOZPZb6h4ZJ2bJqtsuywJReJE3uvJAZfZogrhZFmLUDfR8KYvWJpGe
	zv1A/khMjqO1b6Yl77QFQS9LMKZCsyI5TpObwLvF7E9LWZJNY7BdWrjjZNU9fd+rzPsF
	qQI6Ww4V9zhiUUYVSa2sI0cGTgh8llWIuHhXdDZIKGQPaDjB1xXO84AQkeeL634zSuWe
	tKVV1hACpeMx2GxzogQZev6tn2muyB86+6CoJVZNQ6aR1jBacQA2d8PntplzMwmPRA1T
	6N5EGyig+IeF00mQ7gvo6aOK6WVJoFRXWb050b6T2R2BrskYOMRkaSz/+wPu090D6lu/
	DEMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:content-language
	:content-transfer-encoding;
	bh=u+JZG+yxZptAAYMUBN9n06qDXjHzC1gtzYcDMUkJRvw=;
	b=BJcHCBN9CUMrSqIo+4rknnixfwxGX6UsoX4oockfzhTeAeWYk1F02jxJ2cilRY+Dzi
	DZ1fqF5MZDNQKfZUzaUaUMXYlqHLKMcvDr4FKkIjQvWB3ErZUtSV0SDeoEwJ10ybYpjL
	Sqsw+h9G+MMJv8ZM0eHE07zG5UkxQiNQQJtuWYUZH+h448uTxKz9E0wSen+GELNvYlCQ
	IxQ8jVZCcKEpWXmd3sgE4lI+JFz5xeree1Lj3jMK+4F83y7y1FP91jDj7y8tL1UxvjBw
	0SPLi9iyx1d7iXsFC9KzNOFU/eT54rR6Am5TKz3GgsZ9N1awj5bGivu/S3U9dZ9pfr06
	d3ow==
X-Gm-Message-State: APt69E3k+kmmbDcdWkejntIJpnlACPp2IGcn9k5LnG4LYequDNjFmYr2
	gu8hQlXI/tzDi78zkU87rYc/NQ==
X-Google-Smtp-Source: AAOMgpfOXg549C9i2939zcc2FPZF6DzRiBDbJe2U25iE/DAJR2S71JxkAYO2SXXZsibivIm8lwUWAQ==
X-Received: by 2002:a1c:1414:: with SMTP id
	20-v6mr6952607wmu.119.1530513549070; 
	Sun, 01 Jul 2018 23:39:09 -0700 (PDT)
Received: from ?IPv6:2003:a:31:4300::46? ([2003:a:31:4300::46])
	by smtp.googlemail.com with ESMTPSA id
	n10-v6sm16523685wrs.64.2018.07.01.23.39.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 01 Jul 2018 23:39:07 -0700 (PDT)
To: openembedded-core <openembedded-core@lists.openembedded.org>
From: Steffen Sledz <sledz@dresearch-fe.de>
Openpgp: preference=signencrypt
Autocrypt: addr=sledz@dresearch-fe.de; prefer-encrypt=mutual; keydata=
	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
Message-ID: <99949e3e-c252-9504-ea89-f379bab6f021@dresearch-fe.de>
Date: Mon, 2 Jul 2018 08:39:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
Subject: devshell problems after distro upgrade openSUSE Leap 42.3 -> 15.0
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
X-List-Received-Date: Mon, 02 Jul 2018 06:39:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 8bit

After upgrading my build system from openSUSE Leap 42.3 to openSUSE Leap 15.0 a

  bitbake foo -c devshell

no longer switches to the related work directory. The devshell is opened in the original directory without any error or warning instead.

Any hints what's wrong here or how I can debug this behaviour?

BTW: The problem ocurs with pyro, rocko, and sumo branches. Here's one of the configurations.

Build Configuration:
BB_VERSION        = "1.34.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "opensuseleap-15.0"
TARGET_SYS        = "arm-angstrom-linux-gnueabi"
MACHINE           = "himx0294"
DISTRO            = "angstrom"
DISTRO_VERSION    = "v2017.06"
TUNE_FEATURES     = "arm armv7a vfp thumb neon callconvention-hard"
TARGET_FPU        = "hard"
meta-hipos        = "HEAD:a42bfbebe01c70076a57228ffa161e8bbe271048"
meta-freescale    = "pyro:af5a8cf74d488ba45715ed0b0e0441e60b10c31d"
meta-fsl-arm-extra = "pyro:9613dbc02ca970122a01c935bc9e5789ced73a9d"
meta-qt5          = "pyro:631ea6373ca3ffb0e17968dfcd6f3171f95bbac6"
meta-congatec-x86 = "pyro:c8664aa2d7fba32ccdc1e89a83b5fb00796e907d"
meta-intel        = "pyro:9b37952d6af36358b6397cedf3dd53ec8962b6bf"
meta-angstrom     = "angstrom-v2017.06-yocto2.3:137803eb32f6b34374c7a5a3c1f03eb88b68e4d4"
meta-oe
meta-systemd
meta-multimedia
meta-networking
meta-webserver
meta-python
meta-ruby
meta-efl
meta-gnome
meta-xfce         = "pyro:dfbdd28d206a74bf264c2f7ee0f7b3e5af587796"
meta              = "pyro:819aa151bd634122a46ffdd822064313c67f5ba5"
meta-hipos-closed = "pyro:a3787398eece562172641491b4a6174e7e32c5f9"

Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


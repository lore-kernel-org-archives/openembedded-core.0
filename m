Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id AFBD273181
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 10:39:24 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id 145so3500022pfz.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 03:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=9b7RuX0QBbYQjAwGuG5l7W/kRnPbhRavAbyJuXWWZrQ=;
	b=o3HRaO+mKs9ibuwfoIJdmxEORQ62M/uP1aHv0jzWRHsvZ8JcCYAz/rhHw/eIqNczKi
	792VOOQ+pcLwT9693IEl6Au/9OT/PUNTeeFO2F2kQcxE8FhRbjGzdsf36N5K09UDIqEx
	xJY8JxfsQRmc56MAPa8bsUTHcf/uhd5m4XaXRo0SCbekkETKyadg0hOkB+0aUN/tos9k
	TF9VeVgXaCVIJprhVySj2fC+g4XM/kS/qMJRQEF1gErjjJEN2Z7MX/JeFUHGAUCeplKq
	5pKiWDiDAsiuMqgQ8hGh8EFpMW4UcvSBwKEu3KRAsNy1F9C6qgvE4iUnWnq1hgVAxuVH
	J+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=9b7RuX0QBbYQjAwGuG5l7W/kRnPbhRavAbyJuXWWZrQ=;
	b=TT7+A9bgLrjWgy2eCJvGlWueDfOTvA/sXTMU3mFvonXoM1W38dOGAqSfxxXUVfF0Re
	UER8re6njLXoBrdjKq1s93DAxSn1OPh441tkB2zDGGuq9RpsS2JiV/6zoWhQgoKoIq9A
	QM97GDxHrvCotukwy94bzQV8NwXHO/w5GYDEmsD0UYTgCijM1Y8wk4v3bPAtSwHs6ywA
	1DdRQGPlw5Loe3/YE8N9wY8sdRFfRFVrpn5xVMMBvJHrrEccLKwihRPx1csUnqAvmdJu
	Bd59yShGi1X9G5TgUYR/OoQr57vKHcrz4gXyLQKtWCSIXiMYH617bR6CXe4EXoKzObGF
	ZvEg==
X-Gm-Message-State: AOPr4FWG9VJLQMfGHSoe6zUuM6XjOpISEJWJCdqAWskQdqyc0x/w82er7j06wv/m7DPHNg==
X-Received: by 10.98.29.137 with SMTP id d131mr3786504pfd.2.1462963165020;
	Wed, 11 May 2016 03:39:25 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:d479:c1c3:6c29:187a?
	([2601:202:4000:1239:d479:c1c3:6c29:187a])
	by smtp.googlemail.com with ESMTPSA id
	t14sm11126944pfj.12.2016.05.11.03.39.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 May 2016 03:39:23 -0700 (PDT)
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1462952554.git.liezhi.yang@windriver.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <57330BDA.5080009@gmail.com>
Date: Wed, 11 May 2016 03:39:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <cover.1462952554.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/1] [jethro] openssl: 1.0.2d -> 1.0.2h (mainly for CVEs)
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
X-List-Received-Date: Wed, 11 May 2016 10:39:24 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 05/11/2016 12:43 AM, Robert Yang wrote:
> The following changes since commit 69b49e8dc45cf60defba547d93e663df42c92127:
> 
>   boot-directdisk.bbclass: remove HDDIMG before create (2016-05-09 14:37:19 +0100)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib rbt/openssl
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/openssl
> 
> Robert Yang (1):
>   openssl: 1.0.2d -> 1.0.2h (mainly for CVEs)

Thank you. that saved my some work.

- armin

> 
>  .../openssl/0001-Add-test-for-CVE-2015-3194.patch  |  66 ---
>  ...64-mont5.pl-fix-carry-propagating-bug-CVE.patch | 101 ----
>  .../CVE-2015-3194-1-Add-PSS-parameter-check.patch  |  45 --
>  ...CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch |  66 ---
>  .../openssl/openssl/CVE-2015-3197.patch            |  63 ---
>  .../openssl/openssl/CVE-2016-0701_1.patch          | 102 ----
>  .../openssl/openssl/CVE-2016-0701_2.patch          | 156 ------
>  .../openssl/openssl/CVE-2016-0800.patch            | 198 -------
>  .../openssl/openssl/CVE-2016-0800_2.patch          | 592 ---------------------
>  .../openssl/openssl/CVE-2016-0800_3.patch          | 503 -----------------
>  .../openssl/crypto_use_bigint_in_x86-64_perl.patch |  14 +-
>  .../openssl/debian1.0.2/block_diginotar.patch      |  17 +-
>  .../{debian => debian1.0.2}/version-script.patch   |  35 +-
>  ...-pointer-dereference-in-EVP_DigestInit_ex.patch |  14 +-
>  .../{openssl_1.0.2d.bb => openssl_1.0.2h.bb}       |  18 +-
>  15 files changed, 40 insertions(+), 1950 deletions(-)
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Add-test-for-CVE-2015-3194.patch
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2015-3193-bn-asm-x86_64-mont5.pl-fix-carry-propagating-bug-CVE.patch
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2015-3194-1-Add-PSS-parameter-check.patch
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2015-3197.patch
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-0701_1.patch
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-0701_2.patch
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-0800.patch
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-0800_2.patch
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-0800_3.patch
>  rename meta/recipes-connectivity/openssl/openssl/{debian => debian1.0.2}/version-script.patch (99%)
>  rename meta/recipes-connectivity/openssl/{openssl_1.0.2d.bb => openssl_1.0.2h.bb} (73%)
> 


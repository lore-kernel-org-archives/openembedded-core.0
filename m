Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 29A40606BF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jan 2015 04:50:39 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id bj1so47690971pad.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 20:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=7d820qHmd1Q7iSiroqgXd/Kgyc4P90/ooSVtIAVovP0=;
	b=Tft5yOBLEJLMzQz8ajj7KsxzDxvxFWWosmKENRAsVvJ8gmy+pJo9JFHA7pNtlCbO1H
	CYSjr4k/97mXs7gakiSKrefM5rkjAeIELEL+t0eaXOw/hYdIsdEeP7BA5ZYXiTNQ1gKf
	sDocxRvVE+WQJHwxrdfPHRvUj7eixm+VOJZpewc/NTabernQX63UmSFPchISDwQ2/7Y6
	NHihGdgWjzspq5c15RKC8eUorQHQ5gOcsR69rXc70FHeXeZYpGfvj//jeIKWerTrFAjS
	ekUN8qsOo0fm20W8uzbPXBG+H6l7jS2lT/xkwn4pieKDMWkdedj6LgFv/Ac22sKBWBcq
	eCXQ==
X-Received: by 10.68.172.193 with SMTP id be1mr6297911pbc.64.1422593440313;
	Thu, 29 Jan 2015 20:50:40 -0800 (PST)
Received: from ?IPv6:2601:c:a700:272f:eda6:338:1977:847?
	([2601:c:a700:272f:eda6:338:1977:847])
	by mx.google.com with ESMTPSA id nw6sm8437886pbb.94.2015.01.29.20.50.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Jan 2015 20:50:39 -0800 (PST)
Message-ID: <54CB0D9C.20801@gmail.com>
Date: Thu, 29 Jan 2015 20:50:36 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1421294632-31110-1-git-send-email-ting.liu@freescale.com>
In-Reply-To: <1421294632-31110-1-git-send-email-ting.liu@freescale.com>
Subject: Re: [oe-core dizzy][PATCH 0/3] fixes for dizzy
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
X-List-Received-Date: Fri, 30 Jan 2015 04:50:42 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit


patches staged.

- armin
On 01/14/2015 08:03 PM, ting.liu@freescale.com wrote:
> From: Ting Liu <ting.liu@freescale.com>
>
> The following changes since commit e13f2681b75fd83aa3a1c823ad1c09faed0d6ae3
>      rm_work: Fix RM_WORK_EXCLUDE for image/sdk recipes
>
> Ting Liu (3):
>    libunwind: Fix test case link failure on PowerPC with Altivec
>    bitbake.conf: add PKGDATA_DIR to BB_HASHBASE_WHITELIST
>    valgrind: build with altivec only if it supported
>
>   meta/conf/bitbake.conf                             |  2 +-
>   .../pass-maltivec-only-if-it-supported.patch       | 68 ++++++++++++++++++++++
>   meta/recipes-devtools/valgrind/valgrind_3.9.0.bb   |  1 +
>   ...k-failure-on-PowerPC-systems-with-Altivec.patch | 28 +++++++++
>   meta/recipes-support/libunwind/libunwind_1.1.bb    |  4 ++
>   5 files changed, 102 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-devtools/valgrind/valgrind/pass-maltivec-only-if-it-supported.patch
>   create mode 100644 meta/recipes-support/libunwind/libunwind-1.1/Fix-test-case-link-failure-on-PowerPC-systems-with-Altivec.patch
>


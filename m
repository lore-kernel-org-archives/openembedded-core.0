Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 37900760AD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 20:21:44 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id c74so4639667pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 13:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=fuqBd5ksrstQNt8zSatrrLg77cuvoqV4b5QnT52/Zsc=;
	b=Pn8zLPmQrZreKDgYkTAW9H+s3jssgHEZoRU0lTkRwPMoDbGw/RUqzS1lboEeHuh6UC
	cYfDkhEKjcIomk+Y0GDL0jz34s6vGAusPdPPzF2i8um307vpZOgUJ/rPFIEX81+bti5h
	PohReiX2RqY1BJAdLK0fUNItwDvVm43lrtFoaU2Ew8KAAJzx070lFL8hOMletPYgOP4J
	WXsS3tI/Y5N7qRUDgoEO8vnvEzVDDVzPbr8oexf0QzKoFyFOJGIp0+hn4vMInJfHnirh
	JDN4ed1pFgPWAAyyOvuXf5KZmpdY5kTBwThv84/gjqo0/1qrsMrjjIrqcD6055TFCVJi
	C7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=fuqBd5ksrstQNt8zSatrrLg77cuvoqV4b5QnT52/Zsc=;
	b=FGfZblpqQ2SjyEccGGw5PT9cvIGi0cH1l89hN3lBLSN8QQBBMZgNVCAKKNWjvz91ai
	v84Ri/7TDIPDTmL9jKOFma/If0S/YIS1b1QucEVCsOCECyrAdbKRd77gKrSw0lXZfm6+
	X9c5W5SkmuugxYo8Ngc40H3vO4TxN5jCiI5w1bi5TOftFFSfIUUqhMMWXG6AT5DzkCmK
	MfRO/HJ/KXfVKABbM3ip6eDFEol2GZimre3cVRDLX93NvrpbFRjUWaJbIYGTfCZ6q5ro
	Tc4P0leTcg4X4MRzf9gqYQRJpeBFlSNWpxaTyMc9HgN20DYuo1Jb59SPQvlwZcMMyEon
	hRug==
X-Gm-Message-State: ALyK8tJYVne3Vx5G/+Wjth+cb09lYk15a3zoVR7uPLTOgBxB2jEoxgAdLjty0YX0OF6Vmw==
X-Received: by 10.98.34.15 with SMTP id i15mr7106248pfi.29.1466108505432;
	Thu, 16 Jun 2016 13:21:45 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:81f8:1e89:6800:455e?
	([2601:202:4001:9ea0:81f8:1e89:6800:455e])
	by smtp.googlemail.com with ESMTPSA id
	i187sm29785062pfc.62.2016.06.16.13.21.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Jun 2016 13:21:44 -0700 (PDT)
To: Alexandru Moise <alexandru.moise@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <1466060834-19849-1-git-send-email-alexandru.moise@windriver.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <57630A56.2000703@gmail.com>
Date: Thu, 16 Jun 2016 13:21:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1466060834-19849-1-git-send-email-alexandru.moise@windriver.com>
Subject: Re: [PATCH] squid: don't build squid-conf-tests binary
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
X-List-Received-Date: Thu, 16 Jun 2016 20:21:45 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 06/16/2016 12:07 AM, Alexandru Moise wrote:
> autotools ends up stripping this binary which ends up causing
> QA Errors at do_package. Remove it.

I think you want to send this to openembedded-devel mailing list.

- armin

> Signed-off-by: Alexandru Moise <alexandru.moise@windriver.com>
> ---
>  ...squid-don-t-build-squid-conf-tests-binary.patch | 30 ++++++++++++++++++++++
>  .../recipes-daemons/squid/squid_3.5.7.bb           |  1 +
>  2 files changed, 31 insertions(+)
>  create mode 100644 meta-networking/recipes-daemons/squid/files/0001-squid-don-t-build-squid-conf-tests-binary.patch
> 
> diff --git a/meta-networking/recipes-daemons/squid/files/0001-squid-don-t-build-squid-conf-tests-binary.patch b/meta-networking/recipes-daemons/squid/files/0001-squid-don-t-build-squid-conf-tests-binary.patch
> new file mode 100644
> index 0000000..82cd0b0
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/squid/files/0001-squid-don-t-build-squid-conf-tests-binary.patch
> @@ -0,0 +1,30 @@
> +From 75f4072e6fc9704713629c87eec750ff708135c4 Mon Sep 17 00:00:00 2001
> +From: Alexandru Moise <alexandru.moise@windriver.com>
> +Date: Thu, 16 Jun 2016 10:01:41 +0300
> +Subject: [PATCH] squid: don't build squid-conf-tests binary
> +
> +autotools ends up stripping this binary which ends up causing
> +QA Errors at do_package. Remove it.
> +
> +Signed-off-by: Alexandru Moise <alexandru.moise@windriver.com>
> +---
> + test-suite/Makefile.am | 3 +--
> + 1 file changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/test-suite/Makefile.am b/test-suite/Makefile.am
> +index b9c412d..0471bf0 100644
> +--- a/test-suite/Makefile.am
> ++++ b/test-suite/Makefile.am
> +@@ -43,8 +43,7 @@ TESTS += debug \
> + 	MemPoolTest\
> + 	mem_node_test\
> + 	mem_hdr_test\
> +-	$(ESI_TESTS) \
> +-	squid-conf-tests
> ++	$(ESI_TESTS)
> + 
> + ## Sort by alpha - any build failures are significant.
> + check_PROGRAMS += debug \
> +-- 
> +2.7.4
> +
> diff --git a/meta-networking/recipes-daemons/squid/squid_3.5.7.bb b/meta-networking/recipes-daemons/squid/squid_3.5.7.bb
> index b571e29..2d243fb 100644
> --- a/meta-networking/recipes-daemons/squid/squid_3.5.7.bb
> +++ b/meta-networking/recipes-daemons/squid/squid_3.5.7.bb
> @@ -21,6 +21,7 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${MIN_VER}/${BPN}-${P
>             file://volatiles.03_squid \
>             file://CVE-2016-3947.patch \
>             file://CVE-2016-4553.patch \
> +           file://0001-squid-don-t-build-squid-conf-tests-binary.patch \
>  "
>  
>  LIC_FILES_CHKSUM = "file://COPYING;md5=c492e2d6d32ec5c1aad0e0609a141ce9 \
> 


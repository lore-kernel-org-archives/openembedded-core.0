Return-Path: <anuj.mittal@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id CCC206AC00
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 May 2018 02:30:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 May 2018 19:30:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,417,1520924400"; d="scan'208";a="56603578"
Received: from aperumal-mobl4.gar.corp.intel.com (HELO [10.249.71.139])
	([10.249.71.139])
	by fmsmga001.fm.intel.com with ESMTP; 18 May 2018 19:30:44 -0700
To: Armin Kuster <akuster808@gmail.com>, akuster@mvista.com,
	openembedded-core@lists.openembedded.org
References: <1526696034-3857-1-git-send-email-akuster@mvista.com>
	<1526696034-3857-7-git-send-email-akuster@mvista.com>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <ed930412-44bf-466d-ffe5-a3d9cd85442f@intel.com>
Date: Sat, 19 May 2018 10:30:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1526696034-3857-7-git-send-email-akuster@mvista.com>
Subject: Re: [PATCH 7/8] busybox: update to 1.28.3
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
X-List-Received-Date: Sat, 19 May 2018 02:30:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05/19/2018 10:13 AM, Armin Kuster wrote:
>  SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
> -           file://busybox-udhcpc-no_deconfig.patch \
>             file://find-touchscreen.sh \
>             file://busybox-cron \
>             file://busybox-httpd \
> @@ -42,11 +41,9 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>             file://rcK \
>             file://runlevel \
>             file://makefile-libbb-race.patch \
> -           file://CVE-2011-5325.patch \
> -           file://CVE-2017-15873.patch \
> -           file://busybox-CVE-2017-16544.patch \
>  "
>  SRC_URI_append_libc-musl = " file://musl.cfg "
>  
> -SRC_URI[tarball.md5sum] = "476186f4bab81781dab2369bfd42734e"
> -SRC_URI[tarball.sha256sum] = "9d4be516b61e6480f156b11eb42577a13529f75d3383850bb75c50c285de63df"
> +#file://busybox-udhcpc-no_deconfig.patch

Why has this been removed and commented out? Is this intentional?

Thanks.


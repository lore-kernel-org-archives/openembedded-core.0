Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id AE38965CBA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 17:23:39 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id my20so5336949pab.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 10:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=9ODSkwOwktEVD1AWeT+5OY9W5tQkUEnGNNFKEQi2+ZI=;
	b=WNjTOre5N8eN9alITcIFBojL17d3qQeeXO2sEjuyc6uH1ohs/w9M8YNDKP/1nOvbEr
	HhcG1NPzAiGE99d3x7ir3djd+C8t8UNV+44YasnR69vKGt0Iht30lzvNuDTCTRmfCKBM
	ILk72fK7dlR9rsPp5PQCi/KmpoRuUkUSMlKmhG2fNJiMqmaaL11N9gbeby5L/9nPUgPx
	98pv7jcm+o9GKzQl3r4/IW6xCnTBjI82enSyRks+ijBydtxE6ki+4K6YaIR33W4mAm4j
	V1bBgcnlqUmehkbsbtz3hiJ4v47XsEPEyJTQvwyn9bgOd+qgD28HQNew85vM6R1CjAVS
	U4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=9ODSkwOwktEVD1AWeT+5OY9W5tQkUEnGNNFKEQi2+ZI=;
	b=VlBYvva0MZ8dKZC1CyAMPCMRPxt+Jps0ThMruawRzY3yWgsqihUblZ1auDWApoU+vi
	0C/uQzF/9l47wBeeJrFdZy7mKYctoOFzEV4HKsj+kKEqz0LZqALUey2ptC97ZlFfOJBW
	CJ2rqGPzlCDjNvuEexgs5bFUi3WofncpkX98VDdk2XKmSRrNU9Q8zSA4iZaKFurucCnU
	xgiMLzA2KVP/+WU9Yh9DzYiint4lZ0iqLpp4oq8lMacMZeDOWq5XvXWUe1bvMqE4U+/e
	RJ1df69B/RtqgL0b5LrV5WrFkUD4kzvcGBy0PHXA5wj97Cwb5zi+TlEqlMtPwhRUNTNJ
	Leug==
X-Gm-Message-State: AE9vXwPsExZ4SpBU9ue/do7a8esyAi/z7iUMTJqkbBy5PAivHe29kwRWnnk3pdJT49UISg==
X-Received: by 10.66.253.101 with SMTP id zz5mr14512286pac.32.1474651420585;
	Fri, 23 Sep 2016 10:23:40 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:c560:5d36:d9b:7d07?
	([2601:202:4001:9ea0:c560:5d36:d9b:7d07])
	by smtp.gmail.com with ESMTPSA id
	i62sm12872847pfg.89.2016.09.23.10.23.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Sep 2016 10:23:39 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <cover.1474398462.git.akuster@mvista.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <7e4ee155-4f00-3235-da29-d1b00fd1d22a@gmail.com>
Date: Fri, 23 Sep 2016 10:23:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <cover.1474398462.git.akuster@mvista.com>
Subject: Re: [PATCH 0/7] Jethro pull request #2
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
X-List-Received-Date: Fri, 23 Sep 2016 17:23:39 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

ping


On 09/20/2016 12:12 PM, Armin Kuster wrote:
> From: Armin Kuster <akuster@mvista.com>
>
> please consider these changes for Jethro
>
> Similar fixes for krogoth are in my staging branch
>
> The following changes since commit 6f0350d1cbf5829bfbaa3a43227f8d564903743a:
>
>    wget: Security fix CVE-2016-4971 (2016-09-17 22:33:07 -0700)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib akuster/jethro-next
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=akuster/jethro-next
>
> Armin Kuster (7):
>    qemu: Security Fix CVE-2016-3710
>    qemu: Security Fix CVE-2016-3712
>    qemu: Security fix CVE-2016-4439
>    qemu: Security fix CVE-2016-6351
>    qemu: Security fix for CVE-2016-4002
>    qemu: Secuirty fix for CVE-2016-5403
>    util-linux: Security fix for CVE-2016-5011
>
>   .../util-linux/util-linux/CVE-2016-5011.patch      |  59 +++++++++
>   .../util-linux/util-linux/CVE-2016-5011_p2.patch   |  91 ++++++++++++++
>   meta/recipes-core/util-linux/util-linux_2.26.2.bb  |   2 +
>   .../recipes-devtools/qemu/qemu/CVE-2016-3710.patch | 112 +++++++++++++++++
>   .../qemu/qemu/CVE-2016-3712_p1.patch               |  73 ++++++++++++
>   .../qemu/qemu/CVE-2016-3712_p2.patch               | 132 +++++++++++++++++++++
>   .../qemu/qemu/CVE-2016-3712_p3.patch               |  34 ++++++
>   .../qemu/qemu/CVE-2016-3712_p4.patch               |  80 +++++++++++++
>   .../recipes-devtools/qemu/qemu/CVE-2016-4002.patch |  39 ++++++
>   .../recipes-devtools/qemu/qemu/CVE-2016-4439.patch |  46 +++++++
>   .../recipes-devtools/qemu/qemu/CVE-2016-5403.patch |  67 +++++++++++
>   .../qemu/qemu/CVE-2016-6351_p1.patch               |  75 ++++++++++++
>   .../qemu/qemu/CVE-2016-6351_p2.patch               |  60 ++++++++++
>   meta/recipes-devtools/qemu/qemu_2.4.0.bb           |  10 ++
>   14 files changed, 880 insertions(+)
>   create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2016-5011.patch
>   create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2016-5011_p2.patch
>   create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-3710.patch
>   create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-3712_p1.patch
>   create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-3712_p2.patch
>   create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-3712_p3.patch
>   create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-3712_p4.patch
>   create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-4002.patch
>   create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-4439.patch
>   create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-5403.patch
>   create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-6351_p1.patch
>   create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-6351_p2.patch
>



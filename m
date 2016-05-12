Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F366E6011C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 05:42:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u4C5gPbF017799
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 11 May 2016 22:42:25 -0700 (PDT)
Received: from [128.224.162.214] (128.224.162.214) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 11 May 2016 22:42:24 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1463017812.git.akuster@mvista.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <573417BF.7030504@windriver.com>
Date: Thu, 12 May 2016 13:42:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <cover.1463017812.git.akuster@mvista.com>
Cc: Armin Kuster <akuster@mvista.com>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/8] Pull request - for jethro-next: security fixes
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
X-List-Received-Date: Thu, 12 May 2016 05:42:28 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Hi RP,

I've done some building testing on these patches, they are OK.
Would you please help to merge to jethro, please ?

// Robert

On 05/12/2016 09:54 AM, Armin Kuster wrote:
> This is to honor Yocto Compatibility requirements
>
> Take what you find as usefull
>
> The following changes since commit bca156013af0a98cb18d8156626b9acc8f9883e3:
>
>    openssl: 1.0.2d -> 1.0.2h (mainly for CVEs) (2016-05-11 12:36:54 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib akuster/jethro-next
>    http://git.yoctoproject.org/cgit.cgi//log/?h=akuster/jethro-next
>
> Armin Kuster (8):
>    libtiff: Security fix CVE-2015-8664 and 8683
>    busybox: Security Fix CVE-2016-2148
>    busybox: Security fix CVE-2016-2147
>    openssh: Security Fix CVE-2016-3115
>    gcc: Security fix CVE-2016-4488
>    gcc: Security fix CVE-2016-4489
>    gcc: Security fix CVE-2016-2226
>    gcc: Security Fix CVE-2016-4490
>
>   .../openssh/openssh/CVE-2016-3115.patch            |  84 +++++++
>   meta/recipes-connectivity/openssh/openssh_7.1p2.bb |   4 +-
>   .../busybox/busybox/CVE-2016-2147.patch            |  57 +++++
>   .../busybox/busybox/CVE-2016-2147_2.patch          |  32 +++
>   .../busybox/busybox/CVE-2016-2148.patch            |  74 ++++++
>   meta/recipes-core/busybox/busybox_1.23.2.bb        |   3 +
>   meta/recipes-devtools/gcc/gcc-5.2.inc              |   4 +
>   .../gcc/gcc-5.2/CVE-2016-2226.patch                | 103 ++++++++
>   .../gcc/gcc-5.2/CVE-2016-4488.patch                |  70 ++++++
>   .../gcc/gcc-5.2/CVE-2016-4489.patch                |  56 +++++
>   .../gcc/gcc-5.2/CVE-2016-4490.patch                | 267 +++++++++++++++++++++
>   .../libtiff/files/CVE-2015-8665_8683.patch         | 137 +++++++++++
>   meta/recipes-multimedia/libtiff/tiff_4.0.4.bb      |   1 +
>   13 files changed, 891 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2016-3115.patch
>   create mode 100644 meta/recipes-core/busybox/busybox/CVE-2016-2147.patch
>   create mode 100644 meta/recipes-core/busybox/busybox/CVE-2016-2147_2.patch
>   create mode 100644 meta/recipes-core/busybox/busybox/CVE-2016-2148.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc-5.2/CVE-2016-2226.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc-5.2/CVE-2016-4488.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc-5.2/CVE-2016-4489.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc-5.2/CVE-2016-4490.patch
>   create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2015-8665_8683.patch
>


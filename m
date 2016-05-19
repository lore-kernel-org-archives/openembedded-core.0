Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DA3FE606D0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 20:33:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4JKX1Bq016449
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 19 May 2016 13:33:01 -0700
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 19 May 2016 13:33:00 -0700
To: bavery <brian.avery@intel.com>, <openembedded-core@lists.openembedded.org>
References: <cover.1463687747.git.brian.avery@intel.com>
	<56ed08f6881a846d08c8e23e4b67a562e263a848.1463687747.git.brian.avery@intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <e2d12da2-72c1-2a79-f9a6-cfc0080e0d21@windriver.com>
Date: Thu, 19 May 2016 15:32:59 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <56ed08f6881a846d08c8e23e4b67a562e263a848.1463687747.git.brian.avery@intel.com>
Subject: Re: [PATCH 1/1] gdb: 7.11 backport of 7.12 avx/mxp support
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
X-List-Received-Date: Thu, 19 May 2016 20:33:03 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 5/19/16 3:17 PM, bavery wrote:
> Signed-off-by: bavery <brian.avery@intel.com>
> ---
>  meta/recipes-devtools/gdb/gdb-common.inc         |    2 +-
>  meta/recipes-devtools/gdb/gdb/0011-avx_mpx.patch | 2503 ++++++++++++++++++++++
>  2 files changed, 2504 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/gdb/gdb/0011-avx_mpx.patch
> 
> diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
> index 1d1cf8f..3e00a2e 100644
> --- a/meta/recipes-devtools/gdb/gdb-common.inc
> +++ b/meta/recipes-devtools/gdb/gdb-common.inc
> @@ -36,6 +36,7 @@ SRC_URI = "git://sourceware.org/git/binutils-gdb.git;branch=gdb-7.11-branch \

...

> diff --git a/meta/recipes-devtools/gdb/gdb/0011-avx_mpx.patch b/meta/recipes-devtools/gdb/gdb/0011-avx_mpx.patch
> new file mode 100644
> index 0000000..f51329d
> --- /dev/null
> +++ b/meta/recipes-devtools/gdb/gdb/0011-avx_mpx.patch

The avx_mpx patch is missing any type of header and sign-off-by.  You need
something to indicate this is a backport, as well as what the purpose of the
patch is.

The patch changelog from 0/1 would be adequate in my opinion as the 'why'.  You
just need an:

Upstream-Status: Backport

...and a signed-off-by line...

--Mark


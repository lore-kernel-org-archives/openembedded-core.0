Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 25CE5719DB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Nov 2016 16:05:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uA7G5SjT010980
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 7 Nov 2016 08:05:28 -0800 (PST)
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 7 Nov 2016 08:05:26 -0800
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
	<openembedded-core@lists.openembedded.org>
References: <20161107150135.40266-1-Zubair.Kakakhel@imgtec.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <72beb05b-1399-f8c7-f258-94a7885cc188@windriver.com>
Date: Mon, 7 Nov 2016 10:05:25 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161107150135.40266-1-Zubair.Kakakhel@imgtec.com>
Subject: Re: [Patch 00/13] MIPS: Use MACHINEOVERRIDES and reduce duplication
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
X-List-Received-Date: Mon, 07 Nov 2016 16:05:32 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit


I've looked over the set, it all looks reasonable to me.

Acked-by: Mark Hatle <mark.hatle@windriver.com>

--Mark

On 11/7/16 9:01 AM, Zubair Lutfullah Kakakhel wrote:
> Hi,
> 
> This patch series adds a few MACHINEOVERRIDES options in arch-mips
> to reduce duplicate configurations in various recipes.
> 
> Further info in 
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=10404
> 
> Regards,
> ZubairLK
> 
> Zubair Lutfullah Kakakhel (13):
>   arch-mips: Add MACHINEOVERRIDES variables to reduce duplication
>   bitbake.conf: Reduce duplication in MIPS variants
>   fts: Reduce duplication in MIPS variants.
>   glibc: Reduce duplication in MIPS variants
>   packagegroup: Reduce duplication in MIPS variants.
>   gcc-runtime: Reduce duplication in MIPS variants.
>   gdb: Reduce duplication in MIPS variants.
>   mmc-utils: Reduce duplication in MIPS variants.
>   valgrind: Reduce duplication in MIPS variants.
>   ghostscript: Reduce duplication in MIPS variants.
>   ltp: Reduce duplication in MIPS variants.
>   mdadm: Reduce duplication in MIPS variants.
>   webkit: Reduce duplication in MIPS variants.
> 
>  meta/conf/bitbake.conf                                  | 11 +----------
>  meta/conf/machine/include/mips/arch-mips.inc            |  7 +++++++
>  meta/recipes-core/fts/fts.bb                            |  5 +----
>  meta/recipes-core/glibc/glibc-ld.inc                    | 17 ++---------------
>  .../recipes-core/packagegroups/packagegroup-core-sdk.bb |  5 +----
>  .../packagegroups/packagegroup-core-tools-profile.bb    | 10 ++--------
>  meta/recipes-devtools/gcc/gcc-runtime.inc               |  9 +--------
>  meta/recipes-devtools/gdb/gdb-common.inc                |  7 +------
>  meta/recipes-devtools/mmc/mmc-utils_git.bb              |  6 ++++--
>  meta/recipes-devtools/valgrind/valgrind_3.12.0.bb       |  3 +--
>  meta/recipes-extended/ghostscript/ghostscript_9.19.bb   |  4 ++--
>  meta/recipes-extended/ltp/ltp_20160126.bb               |  3 ++-
>  meta/recipes-extended/mdadm/mdadm_3.4.bb                |  6 ++++--
>  meta/recipes-sato/webkit/webkitgtk_2.14.1.bb            |  3 +--
>  14 files changed, 30 insertions(+), 66 deletions(-)
> 



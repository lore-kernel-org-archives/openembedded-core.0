Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 11BA86017E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Nov 2014 03:23:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sA43NpYm011413
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 3 Nov 2014 19:23:52 -0800 (PST)
Received: from [128.224.162.187] (128.224.162.187) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Mon, 3 Nov 2014 19:23:50 -0800
Message-ID: <5458472F.5080203@windriver.com>
Date: Tue, 4 Nov 2014 11:25:35 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1409069458.git.roxana.ciobanu@intel.com>
	<8ece0cf761b780c9d192d172b0bb7ae5ce987980.1409069458.git.roxana.ciobanu@intel.com>
In-Reply-To: <8ece0cf761b780c9d192d172b0bb7ae5ce987980.1409069458.git.roxana.ciobanu@intel.com>
X-Originating-IP: [128.224.162.187]
Subject: Re: [PATCH 1/1] gdb: Upgrade gdb 7.7.1 -> 7.8
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
X-List-Received-Date: Tue, 04 Nov 2014 03:23:55 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

There are failures on autobuilder that might be related to this patch.

https://autobuilder.yoctoproject.org/main/builders/nightly-ppc/builds/88/steps/BuildImages/logs/stdio

ERROR: Command Error: exit status: 1  Output:
Applying patch include_asm_ptrace.patch
patching file gdb/aarch64-linux-nat.c
Hunk #1 succeeded at 32 with fuzz 2.
patching file gdb/gdbserver/linux-aarch64-low.c
Hunk #1 FAILED at 26.
1 out of 1 hunk FAILED -- rejects in file gdb/gdbserver/linux-aarch64-low.c
Patch include_asm_ptrace.patch does not apply (enforce with -f)
ERROR: Function failed: patch_do_patch


Best Regards,
Chen Qi

On 08/27/2014 12:11 AM, Ciobanu Roxana wrote:
> From: Roxana Ciobanu <roxana.ciobanu@intel.com>
>
> Signed-off-by: Roxana Ciobanu <roxana.ciobanu@intel.com>
> ---
>   meta/recipes-devtools/gdb/{gdb-7.7.1.inc => gdb-7.8.inc}              | 4 ++--
>   .../gdb/{gdb-cross-canadian_7.7.1.bb => gdb-cross-canadian_7.8.bb}    | 0
>   meta/recipes-devtools/gdb/{gdb-cross_7.7.1.bb => gdb-cross_7.8.bb}    | 0
>   meta/recipes-devtools/gdb/{gdb_7.7.1.bb => gdb_7.8.bb}                | 0
>   4 files changed, 2 insertions(+), 2 deletions(-)
>   rename meta/recipes-devtools/gdb/{gdb-7.7.1.inc => gdb-7.8.inc} (70%)
>   rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.7.1.bb => gdb-cross-canadian_7.8.bb} (100%)
>   rename meta/recipes-devtools/gdb/{gdb-cross_7.7.1.bb => gdb-cross_7.8.bb} (100%)
>   rename meta/recipes-devtools/gdb/{gdb_7.7.1.bb => gdb_7.8.bb} (100%)
>
> diff --git a/meta/recipes-devtools/gdb/gdb-7.7.1.inc b/meta/recipes-devtools/gdb/gdb-7.8.inc
> similarity index 70%
> rename from meta/recipes-devtools/gdb/gdb-7.7.1.inc
> rename to meta/recipes-devtools/gdb/gdb-7.8.inc
> index aa16d5a..f4e9a9e 100644
> --- a/meta/recipes-devtools/gdb/gdb-7.7.1.inc
> +++ b/meta/recipes-devtools/gdb/gdb-7.8.inc
> @@ -6,5 +6,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
>   
>   S = "${WORKDIR}/${BPN}-${PV}"
>   
> -SRC_URI[md5sum] = "45b07b53d81832d32ccd4829465d4886"
> -SRC_URI[sha256sum] = "eefadb9831e3695d1eaef34e98b8f1fb441df6fe5071317ea49c6bd6ba213eff"
> +SRC_URI[md5sum] = "38d816d641093db2e13ba284e26090b4"
> +SRC_URI[sha256sum] = "46be505fc1bc157a01124333ef37ed195147fa6a405cbfd32dea63bacaaabbe4"
> diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.7.1.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.8.bb
> similarity index 100%
> rename from meta/recipes-devtools/gdb/gdb-cross-canadian_7.7.1.bb
> rename to meta/recipes-devtools/gdb/gdb-cross-canadian_7.8.bb
> diff --git a/meta/recipes-devtools/gdb/gdb-cross_7.7.1.bb b/meta/recipes-devtools/gdb/gdb-cross_7.8.bb
> similarity index 100%
> rename from meta/recipes-devtools/gdb/gdb-cross_7.7.1.bb
> rename to meta/recipes-devtools/gdb/gdb-cross_7.8.bb
> diff --git a/meta/recipes-devtools/gdb/gdb_7.7.1.bb b/meta/recipes-devtools/gdb/gdb_7.8.bb
> similarity index 100%
> rename from meta/recipes-devtools/gdb/gdb_7.7.1.bb
> rename to meta/recipes-devtools/gdb/gdb_7.8.bb



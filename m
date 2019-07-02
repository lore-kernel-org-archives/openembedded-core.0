Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C1EAE7EB90
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2019 10:34:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x62AXwub017159
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Jul 2019 03:34:03 -0700 (PDT)
Received: from localhost.corp.ad.wrs.com (128.224.162.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Tue, 2 Jul 2019 03:33:58 -0700
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
	<openembedded-core@lists.openembedded.org>
References: <20190627154415.1924-1-open.source@oleksandr-kravchuk.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <6586c7ca-10da-ae60-2494-1d3a605047a7@windriver.com>
Date: Tue, 2 Jul 2019 18:34:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190627154415.1924-1-open.source@oleksandr-kravchuk.com>
Subject: Re: [PATCH] autoconf-archive: update to 2019.01.06
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
X-List-Received-Date: Tue, 02 Jul 2019 10:34:02 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

This patch makes meta-openembedded/meta-oe/recipes-extended/rsyslog/librelp_1.4.0.bb
and
meta-secure-core/meta-tpm2/recipes-tpm/tpm2-tss/tpm2-tss_git.bb

fail to build. E.g.:

MACHINE = "qemux86"
$ bitbake librelp

../../git/src/cmdif.h:52:13: error: no previous declaration for 'relpSCSyslog' 
[-Werror=missing-declarations]
    52 |  relpRetVal relp##type##C##cmd(relpFrame_t LIBRELP_ATTR_UNUSED *pFrame, 
relpSess_t *pSess) \
       |             ^~~~
../../git/src/scsyslog.c:45:1: note: in expansion of macro 'BEGINcommand'


$ bitbake rsyslog
Makefile:14636: *** missing separator.  Stop.

The errors are wild, do you have any ideas on how to fix them, please?

// Robert

On 6/27/19 11:44 PM, Oleksandr Kravchuk wrote:
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>   ...f-archive_2018.03.13.bb => autoconf-archive_2019.01.06.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta/recipes-devtools/autoconf-archive/{autoconf-archive_2018.03.13.bb => autoconf-archive_2019.01.06.bb} (78%)
> 
> diff --git a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2018.03.13.bb b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2019.01.06.bb
> similarity index 78%
> rename from meta/recipes-devtools/autoconf-archive/autoconf-archive_2018.03.13.bb
> rename to meta/recipes-devtools/autoconf-archive/autoconf-archive_2019.01.06.bb
> index 7d62e52ab8..985a254fcc 100644
> --- a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2018.03.13.bb
> +++ b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2019.01.06.bb
> @@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=11cc2d3ee574f9d6b7ee797bdce4d423 \
>       file://COPYING.EXCEPTION;md5=fdef168ebff3bc2f13664c365a5fb515"
>   
>   SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
> -SRC_URI[md5sum] = "46b13a5936372297b6d49980327a3c35"
> -SRC_URI[sha256sum] = "6175f90d9fa64c4d939bdbb3e8511ae0ee2134863a2c7bf8d9733819efa6e159"
> +SRC_URI[md5sum] = "d46413c8b00a125b1529bae385bbec55"
> +SRC_URI[sha256sum] = "17195c833098da79de5778ee90948f4c5d90ed1a0cf8391b4ab348e2ec511e3f"
>   
>   inherit autotools allarch
>   
> 


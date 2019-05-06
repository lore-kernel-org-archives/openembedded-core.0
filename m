Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E13F07D43C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 May 2019 02:31:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x462VhC7007653
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 5 May 2019 19:31:43 -0700 (PDT)
Received: from [128.224.162.157] (128.224.162.157) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Sun, 5 May 2019 19:31:42 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
References: <20190506022634.20518-1-hongxu.jia@windriver.com>
Message-ID: <785e61d4-006b-7637-f70b-b220f3a8118d@windriver.com>
Date: Mon, 6 May 2019 10:31:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190506022634.20518-1-hongxu.jia@windriver.com>
Subject: Re: [PATCH] acpica: use update-alternatives for acpidump
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
X-List-Received-Date: Mon, 06 May 2019 02:31:43 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 5/6/19 10:26 AM, Hongxu Jia wrote:
> acpixtract is both provided by acpica and pmtools, so use

s/acpixtract/acpica/

Sorry for the typo, V2 incoming

//Hongxu

> update-alternatives to fix conflicts:
> ...
> |Error: Transaction check error:
> |  file /usr/bin/acpidump conflicts between attempted installs of
> pmtools-20130209+git0+3ebe0e54c5-r0.i586 and acpica-20190405-r0.i586
> ...
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta/recipes-extended/acpica/acpica_20190405.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/acpica/acpica_20190405.bb b/meta/recipes-extended/acpica/acpica_20190405.bb
> index 0cd88d4e30..25ad7ce31c 100644
> --- a/meta/recipes-extended/acpica/acpica_20190405.bb
> +++ b/meta/recipes-extended/acpica/acpica_20190405.bb
> @@ -26,7 +26,7 @@ S = "${WORKDIR}/acpica-unix2-${PV}"
>   inherit update-alternatives
>   
>   ALTERNATIVE_PRIORITY = "100"
> -ALTERNATIVE_${PN} = "acpixtract"
> +ALTERNATIVE_${PN} = "acpixtract acpidump"
>   
>   EXTRA_OEMAKE = "CC='${CC}' \
>                   OPT_CFLAGS=-Wall \




Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 97EEE77796
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 17:13:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v2AHDqZ6001804
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 10 Mar 2017 09:13:52 -0800 (PST)
Received: from soho-mhatle-m.local (172.25.36.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 10 Mar 2017 09:13:51 -0800
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
	<b88fa585fc5fd8da7983efd4dbd86a0ed4cc86d9.1489144807.git.alexander.kanavin@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <9e8e04e8-07c9-d7db-d96b-fc54bd14c7ed@windriver.com>
Date: Fri, 10 Mar 2017 11:13:50 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <b88fa585fc5fd8da7983efd4dbd86a0ed4cc86d9.1489144807.git.alexander.kanavin@linux.intel.com>
Subject: Re: [PATCH 41/44] bash: package bashbug separately
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
X-List-Received-Date: Fri, 10 Mar 2017 17:13:51 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 3/10/17 5:24 AM, Alexander Kanavin wrote:
> It's a machine-specific script, which is causing conflicts
> when multiple versions of bash are installed in multilib setting,
> and it also does not really make sense for embedded systems anyway.

Out of curiosity what is machine specific here?

(The bashbug shouldn't be part of the main recipe, no disagreement.)  But in the
past we had a single bashbug that would not conflict in multilibs -- that must
have broken at some point.

--Mark

> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/recipes-extended/bash/bash.inc | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
> index a05b987b87b..3e9c6625693 100644
> --- a/meta/recipes-extended/bash/bash.inc
> +++ b/meta/recipes-extended/bash/bash.inc
> @@ -65,3 +65,7 @@ pkg_postinst_${PN} () {
>  pkg_postrm_${PN} () {
>  	printf "$(grep -v "^${base_bindir}/bash$" $D${sysconfdir}/shells)\n" > $D${sysconfdir}/shells
>  }
> +
> +PACKAGES += "${PN}-bashbug"
> +FILES_${PN} = "${bindir}/bash ${base_bindir}/bash.bash"
> +FILES_${PN}-bashbug = "${bindir}/bashbug"
> 



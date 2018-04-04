Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id AFFAE748A5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 05:15:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Apr 2018 22:15:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,404,1517904000"; d="scan'208";a="47799117"
Received: from danayien-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.66.143])
	by orsmga002.jf.intel.com with ESMTP; 03 Apr 2018 22:15:36 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Ross Burton <ross.burton@intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Wed, 04 Apr 2018 17:15:32 +1200
Message-ID: <8605981.apyMxeIDRi@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <54a7cbe4b4fadf428ff8249041bd009cdec0f16f.1522045990.git.Qi.Chen@windriver.com>
References: <cover.1522045990.git.Qi.Chen@windriver.com>
	<54a7cbe4b4fadf428ff8249041bd009cdec0f16f.1522045990.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: "Chan, Aaron Chun Yew" <aaron.chun.yew.chan@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] systemd: fix typo in sulogin-path setting
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
X-List-Received-Date: Wed, 04 Apr 2018 05:15:43 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, 26 March 2018 9:05:20 PM NZST Chen Qi wrote:
> Fix typo in sulogin-path setting. It should be ${base_sbindir} instead of
> just {base_sbindir}.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-core/systemd/systemd_237.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/systemd/systemd_237.bb b/meta/recipes-core/
systemd/systemd_237.bb
> index 7ef42b2..1d04796 100644
> --- a/meta/recipes-core/systemd/systemd_237.bb
> +++ b/meta/recipes-core/systemd/systemd_237.bb
> @@ -189,7 +189,7 @@ EXTRA_OEMESON += "-Dkexec-path=${sbindir}/kexec \
>                    -Dmount-path=${base_bindir}/mount \
>                    -Dquotacheck-path=${sbindir}/quotacheck \
>                    -Dquotaon-path=${sbindir}/quotaon \
> -                  -Dsulogin-path={base_sbindir}/sulogin \
> +                  -Dsulogin-path=${base_sbindir}/sulogin \
>                    -Dumount-path=${base_bindir}/umount"
>  
>  do_install() {
> 

I talked with Aaron this morning and he has been seeing the results of this on 
his autobuilder (failed boot with systemd) - can we pull this in as soon as 
possible?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre




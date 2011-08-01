Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QnthB-0004Hz-RC
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 16:42:18 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p71Ebv7B024050
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Aug 2011 07:37:57 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 1 Aug 2011 07:37:56 -0700
Message-ID: <4E36BA44.1080809@windriver.com>
Date: Mon, 1 Aug 2011 09:37:56 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1312199543.git.ke.yu@intel.com>
	<f598d89680b56218a1f0c50844b1e6823c7baca9.1312199543.git.ke.yu@intel.com>
In-Reply-To: <f598d89680b56218a1f0c50844b1e6823c7baca9.1312199543.git.ke.yu@intel.com>
Subject: Re: [PATCH 1/1] package_rpm.bbclass: fix one typo
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Aug 2011 14:42:18 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

acked-by:  Mark Hatle <mark.hatle@windriver.com>

On 8/1/11 6:54 AM, Yu Ke wrote:
> fix the MLPREFIX referrence typo which cause multilib rpm
> do_rootfs failure
> 
> CC: Mark Hatle <mark.hatle@windriver.com>
> 
> Signed-off-by: Yu Ke <ke.yu@intel.com>
> ---
>  meta/classes/package_rpm.bbclass |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index 0377100..ded744b 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -248,7 +248,7 @@ package_install_internal_rpm () {
>  			echo "Processing $pkg..."
>  
>  			archvar=base_package_archs
> -			ml_pkg=$(echo ${pkg} | sed "s,$^{MLPREFIX}\(.*\),\1,")
> +			ml_pkg=$(echo ${pkg} | sed "s,^${MLPREFIX}\(.*\),\1,")
>  			if [ "${ml_pkg}" != "${pkg}" ]; then
>  				archvar=ml_package_archs
>  			fi




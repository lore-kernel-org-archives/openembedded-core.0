Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SHzjc-0006bU-78
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 17:45:28 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 11 Apr 2012 08:35:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="87861094"
Received: from unknown (HELO [10.255.12.89]) ([10.255.12.89])
	by AZSMGA002.ch.intel.com with ESMTP; 11 Apr 2012 08:35:45 -0700
Message-ID: <4F85A4D0.9080005@linux.intel.com>
Date: Wed, 11 Apr 2012 08:35:44 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1334145612-2814-1-git-send-email-noor_ahsan@mentor.com>
In-Reply-To: <1334145612-2814-1-git-send-email-noor_ahsan@mentor.com>
Subject: Re: [PATCH] insane.bbclass: Add missing variable bpn
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
X-List-Received-Date: Wed, 11 Apr 2012 15:45:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2012 05:00 AM, Noor, Ahsan wrote:
> From: Noor Ahsan<noor_ahsan@mentor.com>
>
> * bpn variable was used but it was not defined. Add bpn to resolve that issue.
>
> Signed-off-by: Noor Ahsan<noor_ahsan@mentor.com>
> ---
>   meta/classes/insane.bbclass |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 6298136..1cfb898 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -328,6 +328,7 @@ def package_qa_check_arch(path,name,d, elf, messages):
>       target_os   = d.getVar('TARGET_OS', True)
>       target_arch = d.getVar('TARGET_ARCH', True)
>       provides = d.getVar('PROVIDES', d, True)
> +    bpn = d.getVar('BPN', True)
>
>       # FIXME: Cross package confuse this check, so just skip them
>       for s in ['cross', 'nativesdk', 'cross-canadian']:

Merged into OE-Core

Sau!



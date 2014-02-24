Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 929E76E3E0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 14:18:25 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 Feb 2014 06:14:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,535,1389772800"; d="scan'208";a="461115532"
Received: from unknown (HELO [10.255.14.29]) ([10.255.14.29])
	by orsmga001.jf.intel.com with ESMTP; 24 Feb 2014 06:18:25 -0800
Message-ID: <530B54B0.8090304@linux.intel.com>
Date: Mon, 24 Feb 2014 16:18:24 +0200
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Chong Lu <Chong.Lu@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <1393048477-16896-1-git-send-email-Chong.Lu@windriver.com>
In-Reply-To: <1393048477-16896-1-git-send-email-Chong.Lu@windriver.com>
Subject: Re: [PATCH] python-native: export some environment variables
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
X-List-Received-Date: Mon, 24 Feb 2014 14:18:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/22/2014 07:54 AM, Chong Lu wrote:
> Need to export these environment variables for python-config to work.
>
Can you clariy further as to what's broken?  Has this not been working 
in the past, or is this a new test of somekine that we are failing?

Sau!

> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>   meta/classes/pythonnative.bbclass |    4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/meta/classes/pythonnative.bbclass b/meta/classes/pythonnative.bbclass
> index fdd22bb..58a5b5c 100644
> --- a/meta/classes/pythonnative.bbclass
> +++ b/meta/classes/pythonnative.bbclass
> @@ -4,3 +4,7 @@ inherit python-dir
>   PYTHON="${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}"
>   EXTRANATIVEPATH += "${PYTHON_PN}-native"
>   DEPENDS += " ${PYTHON_PN}-native "
> +export STAGING_INCDIR
> +export STAGING_LIBDIR
> +export BUILD_SYS
> +export HOST_SYS
>


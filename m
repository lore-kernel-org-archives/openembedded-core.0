Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T8Wqz-0005Vt-B1
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 15:38:13 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 Sep 2012 06:25:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,359,1344236400"; d="scan'208";a="195876334"
Received: from unknown (HELO helios.localnet) ([10.252.121.155])
	by orsmga002.jf.intel.com with ESMTP; 03 Sep 2012 06:25:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 03 Sep 2012 14:25 +0100
Message-ID: <1790418.NGaulcvLqT@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <12f1f03a5d78efa644a7dcc40a00c6e3e32d1214.1346668109.git.paul.eggleton@linux.intel.com>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
	<12f1f03a5d78efa644a7dcc40a00c6e3e32d1214.1346668109.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 08/28] classes/packagegroup: add ability to disable complementary packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Sep 2012 13:38:13 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 03 September 2012 11:30:28 Paul Eggleton wrote:
> This allows package group recipes that do not want the automatic
> addition of complementary packages (e.g. for SDKs) to still inherit from
> this class and thus it becomes very easy to determine if a recipe is a
> package group which we need to do in certain circumstances.
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/classes/packagegroup.bbclass |    3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta/classes/packagegroup.bbclass
> b/meta/classes/packagegroup.bbclass index aa9e0ac..2e07529 100644
> --- a/meta/classes/packagegroup.bbclass
> +++ b/meta/classes/packagegroup.bbclass
> @@ -19,6 +19,9 @@ PACKAGE_ARCH = "all"
>  # to the list. Their dependencies (RRECOMMENDS) are handled as usual
>  # by package_depchains in a following step.
>  python () {
> +    if d.getVar('PACKAGEGROUP_DISABLE_COMPLEMENTARY', True) != '1':

Er, that conditional is the wrong way around. Fixed on the branch.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



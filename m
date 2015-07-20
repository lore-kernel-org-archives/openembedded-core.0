Return-Path: <anibal.limon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5CA6D65CBD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jul 2015 19:19:34 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 20 Jul 2015 12:19:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,509,1432623600"; d="scan'208";a="732277524"
Received: from alimon-thinkpad-w540.zpn.intel.com (HELO [10.219.5.54])
	([10.219.5.54])
	by orsmga001.jf.intel.com with ESMTP; 20 Jul 2015 12:19:34 -0700
Message-ID: <55AD49CB.9010605@linux.intel.com>
Date: Mon, 20 Jul 2015 14:19:39 -0500
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1436921037-32378-1-git-send-email-anibal.limon@linux.intel.com>
In-Reply-To: <1436921037-32378-1-git-send-email-anibal.limon@linux.intel.com>
Subject: Re: [PATCHv2 0/3] oe/recipeutils.py: get_recipe_upstream_info improvements
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
X-List-Received-Date: Mon, 20 Jul 2015 19:19:34 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

ping...

On 14/07/15 19:43, Aníbal Limón wrote:
> Sending v2 i forget to include first patch.
>
> This patch set uses the new latest_versionstring method that returns the
> current revision of a version in SCM's this DEPENDS on,
>
> http://lists.openembedded.org/pipermail/bitbake-devel/2015-July/006034.html
>
> Aníbal Limón (3):
>    oe/recipeutils.py: get_recipe_upstream_info only use sfx and pfx when
>         exits
>    oe/recipeutils.py: get_recipe_upstream_info update to get revision
>    recipeutils.py: get_recipe_pv_without_srcpv remove prefixes from pv
>
>   meta/lib/oe/recipeutils.py | 31 +++++++++++++++++++++++--------
>   1 file changed, 23 insertions(+), 8 deletions(-)
>



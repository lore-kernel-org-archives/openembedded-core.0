Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 10C33700F3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2017 15:44:26 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga104.fm.intel.com with ESMTP; 04 Jan 2017 07:44:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,459,1477983600"; d="scan'208";a="49241879"
Received: from unknown (HELO [10.219.5.165]) ([10.219.5.165])
	by orsmga005.jf.intel.com with ESMTP; 04 Jan 2017 07:44:26 -0800
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <1482930164-15721-1-git-send-email-markus.lehtonen@linux.intel.com>
	<1482930164-15721-9-git-send-email-markus.lehtonen@linux.intel.com>
From: Mariano Lopez <mariano.lopez@linux.intel.com>
Message-ID: <de81809e-103a-4260-a198-a1897e2a9894@linux.intel.com>
Date: Wed, 4 Jan 2017 09:45:03 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <1482930164-15721-9-git-send-email-markus.lehtonen@linux.intel.com>
Subject: Re: [PATCH 8/8] oeqa.utils.metadata: add bitbake revision information
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
X-List-Received-Date: Wed, 04 Jan 2017 15:44:27 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 28/12/16 07:02, Markus Lehtonen wrote:
> [YOCTO #10590]
>
> Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
> ---
>  meta/lib/oeqa/utils/metadata.py | 32 +++++++++++++++++++-------------
>  1 file changed, 19 insertions(+), 13 deletions(-)
>
> diff --git a/meta/lib/oeqa/utils/metadata.py b/meta/lib/oeqa/utils/metadata.py
> index 6331c21..23449fc 100644
> --- a/meta/lib/oeqa/utils/metadata.py
> +++ b/meta/lib/oeqa/utils/metadata.py
> @@ -10,6 +10,8 @@ from collections.abc import MutableMapping
>  from xml.dom.minidom import parseString
>  from xml.etree.ElementTree import Element, tostring
>  
> +from git import Repo, InvalidGitRepositoryError, NoSuchPathError
> +

It seems not every user running selftest appreciated the requirement of
gitpython, so there was a patch to keep this dependency out. This will
introduce the need of gitpython again.


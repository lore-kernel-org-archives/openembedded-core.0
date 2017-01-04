Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 350996B6F7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2017 15:29:53 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 04 Jan 2017 07:29:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,459,1477983600"; d="scan'208";a="26090571"
Received: from unknown (HELO [10.219.5.165]) ([10.219.5.165])
	by orsmga002.jf.intel.com with ESMTP; 04 Jan 2017 07:29:53 -0800
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <1482930164-15721-1-git-send-email-markus.lehtonen@linux.intel.com>
	<1482930164-15721-4-git-send-email-markus.lehtonen@linux.intel.com>
From: Mariano Lopez <mariano.lopez@linux.intel.com>
Message-ID: <edb7398f-c7f9-8ec4-daf5-c5c350c0d671@linux.intel.com>
Date: Wed, 4 Jan 2017 09:30:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <1482930164-15721-4-git-send-email-markus.lehtonen@linux.intel.com>
Subject: Re: [PATCH 3/8] oeqa.utils.metadata: drop 'unknown' git data elements
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
X-List-Received-Date: Wed, 04 Jan 2017 15:29:54 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 28/12/16 07:02, Markus Lehtonen wrote:
> It's better just to not have the xml elements than to have elements with
> faux data. One could have git branch named 'unknown', for example.
>
>

I don't think is a good idea to completely remove the layer from the
metadata when such layer is not a repository, it would remove valuable
information for later analysis. And if you ask would do such a thing, I
would, I have my own debug layers that can mess with testing.


Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9852C7458D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 01:38:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Jul 2018 18:38:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,371,1526367600"; d="scan'208";a="57992794"
Received: from anmitta2-mobl1.png.intel.com (HELO [10.221.20.253])
	([10.221.20.253])
	by orsmga008.jf.intel.com with ESMTP; 18 Jul 2018 18:38:07 -0700
To: Carlos Rafael Giani <dv@pseudoterminal.org>,
	openembedded-core@lists.openembedded.org
References: <20180717093523.5582-1-dv@pseudoterminal.org>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <461ba09d-eb1e-7278-9b44-e42732e11df4@intel.com>
Date: Thu, 19 Jul 2018 09:38:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180717093523.5582-1-dv@pseudoterminal.org>
Subject: Re: [PATCH 1/6] gstreamer1.0-plugin-base: Update packageconfigs
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
X-List-Received-Date: Thu, 19 Jul 2018 01:38:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07/17/2018 05:35 PM, Carlos Rafael Giani wrote:
> * There is no libvisual recipe in oe-core or in meta-openembedded, so
>   the visual packageconfig needs to go

What is the benefit of removing it as compared to just letting it be
present as a configurable option which isn't enabled by default and is
still valid? It might be needed by layers outside of
oe-core/meta-openembedded ...

It was added specifically in a commit and I see a recipe present when I
search on layers.openembedded.org.

Thanks,

Anuj


Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0F1906093C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Feb 2017 11:42:26 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Feb 2017 03:42:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,328,1477983600"; d="scan'208";a="39242058"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 03 Feb 2017 03:42:26 -0800
To: openembedded-core@lists.openembedded.org
References: <20170203070635.30804-1-tanuk@iki.fi>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <8fa96caf-d21c-e845-533e-473e38ce7420@linux.intel.com>
Date: Fri, 3 Feb 2017 13:42:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <20170203070635.30804-1-tanuk@iki.fi>
Subject: Re: [PATCH] pulseaudio: 9.0 -> 10.0
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
X-List-Received-Date: Fri, 03 Feb 2017 11:42:28 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/2017 09:06 AM, Tanu Kaskinen wrote:
>
> Dropped json-c and gdbm from DEPENDS. The new release doesn't use json-c
> any more. gdbm isn't used when --with-database=simple is passed to
> configure, so it should have been removed from DEPENDS a long time ago.

Does anything else in oe-core still use json-c? We're generally trying 
to trim such dangling recipes.


Alex



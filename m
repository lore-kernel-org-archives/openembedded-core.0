Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei.adrianx.dinu@intel.com>) id 1TG890-0001wy-9P
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 14:52:14 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 24 Sep 2012 05:39:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,474,1344236400"; d="scan'208";a="148379936"
Received: from adinu-vostro-460 (HELO [10.237.105.39]) ([10.237.105.39])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Sep 2012 05:39:24 -0700
Message-ID: <506054A0.6090309@intel.com>
Date: Mon, 24 Sep 2012 15:40:00 +0300
From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: Phil Blundell <philb@gnu.org>
References: <1348485983-8294-1-git-send-email-andrei.adrianx.dinu@intel.com>
	<1348486253.31293.28.camel@phil-desktop>
In-Reply-To: <1348486253.31293.28.camel@phil-desktop>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc: Fix for dynamic linker broken offset
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
X-List-Received-Date: Mon, 24 Sep 2012 12:52:14 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/24/2012 02:30 PM, Phil Blundell wrote:
> On Mon, 2012-09-24 at 14:26 +0300, Andrei Dinu wrote:
>> +-	    *reloc_addr += sym->st_value;
>> ++	    *reloc_addr = sym->st_value;
> That patch looks slightly dubious to me.  Are you sure this doesn't
> introduce any regressions elsewhere?
>
> p.
>
>
I have insufficient data to affirm that it doesn't introduces regressions.

Regards,

Andrei Dinu



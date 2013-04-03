Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UNV3A-0006z0-E6
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 23:16:56 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 03 Apr 2013 13:59:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,403,1363158000"; d="scan'208";a="280412951"
Received: from unknown (HELO [10.255.14.19]) ([10.255.14.19])
	by azsmga001.ch.intel.com with ESMTP; 03 Apr 2013 13:59:43 -0700
Message-ID: <515C983E.20007@linux.intel.com>
Date: Wed, 03 Apr 2013 13:59:42 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
References: <51493825.5050802@linux.intel.com>
	<1363770696-2908-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<515C4FC5.70808@linux.intel.com> <515C954A.3000109@linaro.org>
In-Reply-To: <515C954A.3000109@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] elfutils: split libraries into separate packages
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
X-List-Received-Date: Wed, 03 Apr 2013 21:16:56 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/03/2013 01:47 PM, Marcin Juszkiewicz wrote:
> W dniu 03.04.2013 17:50, Saul Wold pisze:
>> This change seems to cause some issues with multilib build with lib32 on
>> x86-64:
>
> I have to admit that I never did any multilib builds with OE. Can you
> point me to config options I need to set to get such build done?
>
>

Sure set the following in your local.conf:

MACHINE = "qemux86-64"
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"


bitbake lib32-elfutils

you can also bitbake world, but that will take some time.

Sau!




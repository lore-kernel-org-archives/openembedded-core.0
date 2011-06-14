Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QWV1Q-00057D-JD
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 16:55:17 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 14 Jun 2011 07:51:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,364,1304319600"; d="scan'208";a="18058441"
Received: from unknown (HELO [10.255.12.216]) ([10.255.12.216])
	by fmsmga001.fm.intel.com with ESMTP; 14 Jun 2011 07:51:50 -0700
Message-ID: <4DF77586.8020201@linux.intel.com>
Date: Tue, 14 Jun 2011 07:51:50 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1308037752.git.sgw@linux.intel.com>	<8b9e3b8e8afa3720fbc57adb817b9e9f7f9094ef.1308037753.git.sgw@linux.intel.com>
	<1308043883.25285.234.camel@phil-desktop>
In-Reply-To: <1308043883.25285.234.camel@phil-desktop>
Subject: Re: [CONSOLIDATED PULL 21/51] alsa-tools: fix Checksums
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
X-List-Received-Date: Tue, 14 Jun 2011 14:55:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/14/2011 02:31 AM, Phil Blundell wrote:
> On Tue, 2011-06-14 at 01:01 -0700, Saul Wold wrote:
>> +EXTRA_OEFLAGS = "--host ${HOST_SYS}"
>
> This change isn't mentioned in the checkin comment and, as far as I can
> tell, setting that variable isn't going to produce any useful effect.
> Can you clarify what's going on here?
>
Clarification is too much going on and I missed fixing this during a 
rebase.  I was in the middle of trying to fix this recipe (currently 
does not configure correctly).

Sau!

> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



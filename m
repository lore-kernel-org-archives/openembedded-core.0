Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SoNon-0007kZ-Kn
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 01:56:41 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 09 Jul 2012 16:45:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="120526963"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by AZSMGA002.ch.intel.com with ESMTP; 09 Jul 2012 16:45:30 -0700
Message-ID: <4FFB6D1A.4070400@linux.intel.com>
Date: Mon, 09 Jul 2012 16:45:30 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1341871474-8719-1-git-send-email-sgw@linux.intel.com>
	<CAMKF1sowgGneDRp61GaL10-rbsCT7ucUq_ri_GNhm4+--idKww@mail.gmail.com>
In-Reply-To: <CAMKF1sowgGneDRp61GaL10-rbsCT7ucUq_ri_GNhm4+--idKww@mail.gmail.com>
Subject: Re: [PATCH] gnupg: ensure deterministic build by disabling libcurl
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
X-List-Received-Date: Mon, 09 Jul 2012 23:56:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/09/2012 03:43 PM, Khem Raj wrote:
> On Mon, Jul 9, 2012 at 3:04 PM, Saul Wold <sgw@linux.intel.com> wrote:
>> gnupg has it's own fake curl, since we use gnupg with zypper, there does not
>> seem to be a strong reason to add curl to the depends list.
>
> what does disabling curl has to do with gnupg being used with zypper ?
>
I was looking for where gnupg was used within oe-core and it's usage 
model to see if it made sense to go with the extra dependency for gnupg, 
let me know your reasoning.  Generally especially for natives we look 
for ways to reduce the initial build time.

Sau!

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>




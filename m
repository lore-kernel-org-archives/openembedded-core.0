Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 10AC06B216
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 14:47:45 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Jul 2013 07:45:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,677,1367996400"; d="scan'208";a="346474058"
Received: from unknown (HELO [10.255.13.97]) ([10.255.13.97])
	by orsmga001.jf.intel.com with ESMTP; 16 Jul 2013 07:47:42 -0700
Message-ID: <51E55D0C.4080605@linux.intel.com>
Date: Tue, 16 Jul 2013 07:47:40 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: "Iorga, Cristian" <cristian.iorga@intel.com>
References: <1373984927-21039-1-git-send-email-cristian.iorga@intel.com>
	<1373985229.2651.84.camel@phil-desktop.brightsign>
	<969F26A8BAB325438E7EB80D3C3134FB16C05A76@IRSMSX105.ger.corp.intel.com>
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB16C05A76@IRSMSX105.ger.corp.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3 0/2] BlueZ 5 experimental recipes
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
X-List-Received-Date: Tue, 16 Jul 2013 14:47:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/16/2013 07:36 AM, Iorga, Cristian wrote:
> " why having it be so is not a very good thing."
>
> Sorry, I did not understood this part.
>
> Judging by my investigation, is RREPLACES needed or not?
>
I believe that RREPLACES is not needed, it could cause problems if a 
feed builds the bluez5 packages but does not want to use them, without 
the RREPLACES it requires a conscious effort on the target to get the 
update.

The upgrade case is exactly why we should not have RREPLACES.

Sau!

> /Cristian
>
> -----Original Message-----
> From: Phil Blundell [mailto:pb@pbcl.net]
> Sent: Tuesday, July 16, 2013 5:34 PM
> To: Iorga, Cristian
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH V3 0/2] BlueZ 5 experimental recipes
>
> On Tue, 2013-07-16 at 17:28 +0300, Cristian Iorga wrote:
>> Observe my investigation below in order to decide if RREPLACES is needed.
>> Conclusion: BlueZ 5.x will be eventually an upgrade path for an
>> already installed embedded device. As such, RREPLACES is needed for a system-wide upgrade.
>
> It wasn't very obvious to me that these results make a compelling case for bluez4 needing to RREPLACE bluez5.  Indeed, this section:
>
> root@qemux86:~# opkg install bluez5
> Multiple replacers for bluez5, using first one (bluez4).
> Package bluez4 is already installed on root.
> root@qemux86:~# opkg list-installed | grep bluez
> bluez4 - 4.101-r6.0
> libasound-module-bluez - 4.101-r6.0
>
> ... seems to illustrate (modulo the usual amount of opkg craziness) why having it be so is not a very good thing.
>
> p.
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


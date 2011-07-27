Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Qm6Dh-0003vJ-T8
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 17:40:30 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Qm69c-0007mP-VX from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 08:36:12 -0700
Received: from SVR-ORW-FEM-03.mgc.mentorg.com ([147.34.97.39]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 27 Jul 2011 08:36:12 -0700
Received: from [172.30.80.87] (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.1.289.1;
	Wed, 27 Jul 2011 08:36:11 -0700
Message-ID: <4E303066.4070902@mentor.com>
Date: Wed, 27 Jul 2011 08:36:06 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1311752531.git.sgw@linux.intel.com>	<7f9b1ed3edb4bd9e8e23e6d191248a0c28d924e6.1311752531.git.sgw@linux.intel.com>
	<1311760065.30326.278.camel@phil-desktop>
In-Reply-To: <1311760065.30326.278.camel@phil-desktop>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 27 Jul 2011 15:36:12.0661 (UTC)
	FILETIME=[EA3ADA50:01CC4C72]
Subject: Re: [Consolidated & Tested 27/35] siteinfo: Move the rp-pppoe entry to common-linux
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
X-List-Received-Date: Wed, 27 Jul 2011 15:40:30 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 07/27/2011 02:47 AM, Phil Blundell wrote:
> On Wed, 2011-07-27 at 00:47 -0700, Saul Wold wrote:
>> --- a/meta/site/common-linux
>> +++ b/meta/site/common-linux
>> @@ -23,3 +23,6 @@ bash_cv_unusable_rtsigs=${bash_cv_unusable_rtsigs=no}
>>  # mysql
>>  ac_cv_sys_restartable_syscalls=${ac_cv_sys_restartable_syscalls=yes}
>>  ac_cv_conv_longlong_to_float=${ac_cv_conv_longlong_to_float=yes}
>> +
>> +# rp-pppoe
>> +rpppoe_cv_pack_bitfields=${rpppoe_cv_pack_bitfields=rev}
> 
> Per previous discussion, I am pretty sure this is wrong.

Agreed.  This is actually fixed right now in meta-oe and doesn't belong
in oe-core (until someone argues rp-pppoe needs to be in oe-core).

-- 
Tom Rini
Mentor Graphics Corporation



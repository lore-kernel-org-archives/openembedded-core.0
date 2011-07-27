Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Qm6Cr-0003tb-Nd
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 17:39:33 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Qm68l-0007h0-Vx from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 08:35:20 -0700
Received: from SVR-ORW-FEM-03.mgc.mentorg.com ([147.34.97.39]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 27 Jul 2011 08:32:31 -0700
Received: from [172.30.80.87] (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.1.289.1;
	Wed, 27 Jul 2011 08:35:19 -0700
Message-ID: <4E303031.2070506@mentor.com>
Date: Wed, 27 Jul 2011 08:35:13 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1311752531.git.sgw@linux.intel.com>	<4adc1ac758823bf95ef5259ecf90a7906b38afc9.1311752531.git.sgw@linux.intel.com>
	<1311759861.30326.276.camel@phil-desktop>
In-Reply-To: <1311759861.30326.276.camel@phil-desktop>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 27 Jul 2011 15:32:31.0296 (UTC)
	FILETIME=[66493C00:01CC4C72]
Subject: Re: [Consolidated & Tested 24/35] siteinfo: Move certain bash entries to common-linux
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
X-List-Received-Date: Wed, 27 Jul 2011 15:39:34 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 07/27/2011 02:44 AM, Phil Blundell wrote:
> On Wed, 2011-07-27 at 00:47 -0700, Saul Wold wrote:
>> diff --git a/meta/site/arm-common b/meta/site/arm-common
>> index 5d3e68a..39eb30b 100644
>> --- a/meta/site/arm-common
>> +++ b/meta/site/arm-common
>> @@ -14,21 +14,7 @@ apr_cv_tcp_nodelay_with_cork=${apr_cv_tcp_nodelay_with_cork=yes}
>>  
>>  # bash
>>  ac_cv_c_long_double=${ac_cv_c_long_double=yes}
>> -bash_cv_have_mbstate_t=${bash_cv_have_mbstate_t=yes}
>>  bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=missing}
> 
> That sigsetjmp thing looks pretty bogus to me.  sigsetjmp() is POSIX.1;
> it isn't (shouldn't be) architecture specific in any way, and both
> eglibc and uclibc implement it nowadays.  I think you should probably
> have sigsetjmp=present in linux-common.

Agreed that we're far from complete here.  oe.dev has this one done and
once I've got the rest of the oe.dev re-sync done I'm just going to wipe
the site files clean and see what's needed anywhere, really.

-- 
Tom Rini
Mentor Graphics Corporation



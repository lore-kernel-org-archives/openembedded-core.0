Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QfFzJ-0005tu-8M
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 20:41:17 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QfFvY-0000hz-Vp from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 11:37:25 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 8 Jul 2011 11:36:11 -0700
Received: from [172.30.80.17] (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.1.289.1;
	Fri, 8 Jul 2011 11:37:24 -0700
Message-ID: <4E174E52.2@mentor.com>
Date: Fri, 8 Jul 2011 11:37:06 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1310080780.git.jessica.zhang@intel.com>
	<1310142693.20015.906.camel@rex>
In-Reply-To: <1310142693.20015.906.camel@rex>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 08 Jul 2011 18:36:11.0483 (UTC)
	FILETIME=[E8FB12B0:01CC3D9D]
Subject: Re: [PATCH 0/1] [bug 1195] site/mips-common: Cache cvs_cv_func_printf_ptr
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
X-List-Received-Date: Fri, 08 Jul 2011 18:41:17 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 07/08/2011 09:31 AM, Richard Purdie wrote:
> On Thu, 2011-07-07 at 16:23 -0700, Jessica Zhang wrote:
>> The following changes since commit c412674cf818e77e35857fb93353e392e7ac9e53:
>>   Khem Raj (1):
>>         package.bbclass,prserv.bbclass: Compare USE_PR_SERV with "1" or "0"
>>
>> are available in the git repository at:
>>
>>   git://git.yoctoproject.org/poky-contrib jzhang/1195
>>   http://git.yoctoproject.org/cgit.cgi//log/?h=jzhang/1195
>>
>> Khem Raj (1):
>>   [bug 1195] site/mips-common: Cache cvs_cv_func_printf_ptr
> 
> Merged to master, thanks.

Late again and my fault this time but why is this in site/mips-common
and not site/linux-common or glibc-common?

-- 
Tom Rini
Mentor Graphics Corporation



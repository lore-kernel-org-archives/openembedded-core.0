Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QoH4U-0005J2-98
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 17:39:54 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QoH0G-0006Ed-Kb from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 08:35:32 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 2 Aug 2011 08:32:13 -0700
Received: from [172.30.80.87] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.289.1;
	Tue, 2 Aug 2011 08:35:32 -0700
Message-ID: <4E381933.2000502@mentor.com>
Date: Tue, 2 Aug 2011 08:35:15 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1312272881-15695-1-git-send-email-galak@kernel.crashing.org>	<1312298395.4325.53.camel@phil-desktop>
	<4E381902.6050408@mentor.com>
In-Reply-To: <4E381902.6050408@mentor.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 02 Aug 2011 15:32:13.0624 (UTC)
	FILETIME=[5A3B3380:01CC5129]
Subject: Re: [PATCH] automake: Fix issue with tar configure failing with large UID/GIDs
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
X-List-Received-Date: Tue, 02 Aug 2011 15:39:54 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 08/02/2011 08:34 AM, Tom Rini wrote:
> On 08/02/2011 08:19 AM, Phil Blundell wrote:
>> On Tue, 2011-08-02 at 03:14 -0500, Kumar Gala wrote:
>>> +-_am_tools='gnutar m4_if([$1], [ustar], [plaintar]) pax cpio none'
>>> ++_am_tools='gnutar m4_if([$1], [ustar], [plaintar]) cpio pax none'
>>
>> Have you discussed that with upstream?  If not, are you confident that
>> preferring cpio will not simply mean that we are swapping one deficiency
>> for another?
> 
> A bug was filed with upstream automake.  At issue is that pax does not
> fail gracefully when it cannot create ustar archives while cpio does.

http://debbugs.gnu.org/cgi/bugreport.cgi?bug=8343 and should be in the
patch header...

-- 
Tom Rini
Mentor Graphics Corporation



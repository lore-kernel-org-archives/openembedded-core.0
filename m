Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QmSNE-0002gO-VW
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 17:19:45 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QmSJ7-0003VN-32 from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 08:15:29 -0700
Received: from SVR-ORW-FEM-02.mgc.mentorg.com ([147.34.96.206]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 28 Jul 2011 08:12:35 -0700
Received: from [172.30.80.87] (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.1.289.1;
	Thu, 28 Jul 2011 08:15:28 -0700
Message-ID: <4E317D08.1020400@mentor.com>
Date: Thu, 28 Jul 2011 08:15:20 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <A64E29D1-A803-4CC3-B7D7-C82C915869D0@kernel.crashing.org>
	<1311862667.30326.443.camel@phil-desktop>
In-Reply-To: <1311862667.30326.443.camel@phil-desktop>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 28 Jul 2011 15:12:35.0374 (UTC)
	FILETIME=[C7DFC4E0:01CC4D38]
Subject: Re: lib vs lib64?
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
X-List-Received-Date: Thu, 28 Jul 2011 15:19:45 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 07/28/2011 07:17 AM, Phil Blundell wrote:
> On Thu, 2011-07-28 at 09:15 -0500, Kumar Gala wrote:
>> With recent multilib changes for a pure 64-bit target (no multilib) should things be in /lib or /lib64?
> 
> They should be in ${base_libdir}.  Whether that's /lib or /lib64 is a
> DISTRO choice I suppose.

Assuming the libc has been patched for that arch.  Or do we no longer
need that change?  I know there was a patch for mips64 to look at /lib
not /lib64 for ld.so, etc, etc.

-- 
Tom Rini
Mentor Graphics Corporation



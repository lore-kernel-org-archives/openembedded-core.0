Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QjYcx-0003uM-4U
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 17:24:02 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QjYYz-000766-3L from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 08:19:53 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 20 Jul 2011 08:19:52 -0700
Received: from [172.30.80.89] (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.1.289.1;
	Wed, 20 Jul 2011 08:19:52 -0700
Message-ID: <4E26F215.2020100@mentor.com>
Date: Wed, 20 Jul 2011 08:19:49 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <5A3CA715-DE17-48DC-A7DC-8063B44942E9@freescale.com>
	<1311165760.30326.66.camel@phil-desktop>
In-Reply-To: <1311165760.30326.66.camel@phil-desktop>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 20 Jul 2011 15:19:52.0942 (UTC)
	FILETIME=[796158E0:01CC46F0]
Subject: Re: sudo build failure
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
X-List-Received-Date: Wed, 20 Jul 2011 15:24:03 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 07/20/2011 05:42 AM, Phil Blundell wrote:
> On Wed, 2011-07-20 at 07:16 -0500, Kumar Gala wrote:
>> Trying to build a powerpc64 target rootfs and I'm getting the following build failures on sudo.  Wondering if anyone has seen anything similar:
>>
>> http://pastebin.com/MeqPn46Q
> 
> There was a bug like that a few months ago which was caused by broken
> siteinfo files.  Presumably your tree is fairly up to date, but it
> sounds like you have a similar kind of issue.  You'll need to
> investigate why configure thinks you don't need -ldl.

And part of the problem, I suspect, is that we're still re-syncing
siteinfo stuff from oe.dev (where your file is based on) into oe-core
and oe.dev has a lot more stuff in common files (which I'm working on
bringing to oe-core right now).

-- 
Tom Rini
Mentor Graphics Corporation



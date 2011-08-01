Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QnvgC-0007nv-TE
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 18:49:25 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Qnvbz-0001ZS-TR from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 09:45:03 -0700
Received: from SVR-ORW-FEM-03.mgc.mentorg.com ([147.34.97.39]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 1 Aug 2011 09:45:03 -0700
Received: from [172.30.80.87] (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.1.289.1;
	Mon, 1 Aug 2011 09:45:02 -0700
Message-ID: <4E36D800.1050906@mentor.com>
Date: Mon, 1 Aug 2011 09:44:48 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1312208500-13381-1-git-send-email-galak@kernel.crashing.org>	<1312209045.30326.515.camel@phil-desktop>	<4727DFCB-0AA2-43D1-A0CA-58717D815FE8@kernel.crashing.org>
	<1312214835.30326.528.camel@phil-desktop>
In-Reply-To: <1312214835.30326.528.camel@phil-desktop>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 01 Aug 2011 16:45:03.0714 (UTC)
	FILETIME=[5C984420:01CC506A]
Subject: Re: [PATCH] gcc: Add ability for tune files to pass in configure options to gcc
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
X-List-Received-Date: Mon, 01 Aug 2011 16:49:25 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 08/01/2011 09:07 AM, Phil Blundell wrote:
> On Mon, 2011-08-01 at 09:37 -0500, Kumar Gala wrote:
>> Not sure I understand the statement about disambiguate the resulting compilers, on PPC where I intend to utilize this we'd have the toolchains already named something like:
> 
> The thing about disambiguating was that, if you're going to modify the
> configure opts for gcc-cross based (indirectly) on ${MACHINE} you need
> to consider what happens if you have a single build directory that's
> being used for multiple MACHINEs.

What, I think, Kumar is driving at is why are you saying MACHINE when
it's a per core tune he's doing.  eg, every e5500 would do --with-cpu=e5500

-- 
Tom Rini
Mentor Graphics Corporation



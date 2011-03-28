Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q4Hfo-00062M-P1
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Mar 2011 21:00:21 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Q4Hdw-000410-S9 from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Mar 2011 11:58:24 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 28 Mar 2011 11:57:01 -0700
Received: from [172.30.80.76] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Mon, 28 Mar 2011 11:58:23 -0700
Message-ID: <4D90DA4A.3030605@mentor.com>
Date: Mon, 28 Mar 2011 11:58:18 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <600E597B-5D02-419E-A378-5EE511B848FA@dominion.thruhere.net>
In-Reply-To: <600E597B-5D02-419E-A378-5EE511B848FA@dominion.thruhere.net>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 28 Mar 2011 18:57:01.0740 (UTC)
	FILETIME=[EC0EA6C0:01CBED79]
Subject: Re: Using meta-toolchain output as prebuilt toolchains
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
X-List-Received-Date: Mon, 28 Mar 2011 19:00:21 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 03/27/2011 04:44 AM, Koen Kooi wrote:
> Hi,
> 
> What is the preferred way of 'importing' prebuilt toolchains into OE-core? In oe.dev I can use this: http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/meta/external-toolchain-angstrom.bb to 'import' an angstrom toolchain built with 'bitbake meta-toolchain', but I'm not sure how to do that in OE-core.
> 
> My actual use case is actually 2 use-cases:
> 
> 1) Hand people a prebuilt angstrom toolchain and migrate them to OE while keeping the toolchain
> 2) "Get started in 10 minutes" type of thing, I suspect an sstate mirror might be better.
> 
> So any suggestions for #2 as well?

sstate is the best way to catch #2 and I know in general there's "look
at this URI for the file you want" bits.  I haven't yet started kicking
the tires on sstate as hard as I have for packaged-staging however.

For #1, I believe external toolchains are to be supported still, but I
don't know off hand if the recipes still work (but there is both an old
CSL one as well as a poky toolchain one in meta/recipes-core/meta/).
Another area on my TODO list...

-- 
Tom Rini
Mentor Graphics Corporation



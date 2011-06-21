Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QZ5On-00020G-Fb
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 20:10:05 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QZ5LN-0000BZ-8C from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 11:06:33 -0700
Received: from SVR-ORW-FEM-03.mgc.mentorg.com ([147.34.97.39]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 21 Jun 2011 11:01:19 -0700
Received: from [172.30.80.125] (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.1.289.1;
	Tue, 21 Jun 2011 11:06:30 -0700
Message-ID: <4E00DD8F.3010600@mentor.com>
Date: Tue, 21 Jun 2011 11:06:07 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1308677220.git.paul.eggleton@linux.intel.com>	<201106211842.09743.paul.eggleton@linux.intel.com>	<331DEFC1-20ED-45EE-B84F-429E55EB6C75@dominion.thruhere.net>
	<201106211859.55194.paul.eggleton@linux.intel.com>
In-Reply-To: <201106211859.55194.paul.eggleton@linux.intel.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 21 Jun 2011 18:01:19.0141 (UTC)
	FILETIME=[38D34550:01CC303D]
Subject: Re: [PATCH 1/1] u-boot: set SRCREV to a git revision	instead of a tag reference
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
X-List-Received-Date: Tue, 21 Jun 2011 18:10:05 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 06/21/2011 10:59 AM, Paul Eggleton wrote:
> On Tuesday 21 June 2011 18:54:12 Koen Kooi wrote:
>> Since we're using the 2011.03 tag, why is SRCPV in PV at all? It should be
>> exactly the same as the tarball.
> 
> One might go one step further and ask why fetching from git is a good idea 
> when the tarball would be much cleaner. Ultimately this is up to whoever 
> maintains the u-boot recipe.

Especially with the current git archive mirroring problem.

-- 
Tom Rini
Mentor Graphics Corporation



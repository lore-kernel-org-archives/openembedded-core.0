Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Qivsc-0008Fy-23
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 00:01:34 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Qivog-00004Q-F4 from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jul 2011 14:57:30 -0700
Received: from SVR-ORW-FEM-03.mgc.mentorg.com ([147.34.97.39]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 18 Jul 2011 14:55:25 -0700
Received: from [172.30.80.76] (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.1.289.1;
	Mon, 18 Jul 2011 14:57:29 -0700
Message-ID: <4E24AC48.7050108@mentor.com>
Date: Mon, 18 Jul 2011 14:57:28 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <E1Qivkw-0005IS-9Y@happy.bec-systems.com>
In-Reply-To: <E1Qivkw-0005IS-9Y@happy.bec-systems.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 18 Jul 2011 21:55:25.0858 (UTC)
	FILETIME=[66797020:01CC4595]
Subject: Re: OE Changelog for 2011-07-11 to 2011-07-18
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
X-List-Received-Date: Mon, 18 Jul 2011 22:01:34 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit


> ====================================================
> Changelog for meta-openembedded:
> 
> Khem Raj (2):
>   icon-naming-utils: inherit allarch
>   icon-naming-utils: Inherit perlnative
[snip]
> Tom Rini (1):
>   icon-naming-utils-native: Fix long path to perl in icon-name-mapping

Having just completed my world build in a long build path (pull requests
tomorrow after I sort them out better), why is this in meta-openembedded
and not oe-core?   Oversight I assume since I don't see
icon-naming-utils-native coming into oe-core as a recent thing.  Or is
there additional stuff in the recipes in meta-openembedded that don't
belong in oe-core?

-- 
Tom Rini
Mentor Graphics Corporation



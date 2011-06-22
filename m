Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QZV03-0005hK-6i
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 23:30:15 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QZUwb-0004DR-2j from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 14:26:41 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 22 Jun 2011 14:21:21 -0700
Received: from [172.30.80.125] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.289.1;
	Wed, 22 Jun 2011 14:26:40 -0700
Message-ID: <4E025DFA.3020306@mentor.com>
Date: Wed, 22 Jun 2011 14:26:18 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1308706423.git.raj.khem@gmail.com>	<1308758279.20015.79.camel@rex>	<4E0235DA.8060200@windriver.com>
	<4E025052.6070300@windriver.com>
In-Reply-To: <4E025052.6070300@windriver.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 22 Jun 2011 21:21:21.0250 (UTC)
	FILETIME=[550D8420:01CC3122]
Subject: Re: [PATCH 0/4] eglibc 2.14 upgrade
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
X-List-Received-Date: Wed, 22 Jun 2011 21:30:15 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 06/22/2011 01:28 PM, Mark Hatle wrote:
> On 6/22/11 1:35 PM, Mark Hatle wrote:
>> Since applying this update, I'm not longer getting an rpc/rpc.h file, which
>> breaks various things like busybox mount.
>>
>> Is anyone else seeing this behavior?
> 
> Reverting:
> 
> 2a68cf4d315cdd18766de0c75928ff17846a6cd7 and
> 190a946e9a4213944e3ee675c4b3e18701698e87
> 
> fixed the problem for me.  So there is definitely a problems in the upgrade.

This also fixes the problem that Otavio and I have seen of locale
generation failing crazily.

-- 
Tom Rini
Mentor Graphics Corporation



Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PzAvC-0001o0-B1
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Mar 2011 17:47:06 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PzAta-0003cx-TQ from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Mar 2011 09:45:26 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 14 Mar 2011 09:45:15 -0700
Received: from [172.30.80.14] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Mon, 14 Mar 2011 09:45:14 -0700
Message-ID: <4D7E460C.1070606@mentor.com>
Date: Mon, 14 Mar 2011 09:45:00 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1299940883.git.raj.khem@gmail.com>
	<4D7CE94A.5080706@mlbassoc.com>
In-Reply-To: <4D7CE94A.5080706@mlbassoc.com>
X-OriginalArrivalTime: 14 Mar 2011 16:45:15.0230 (UTC)
	FILETIME=[31A077E0:01CBE267]
Subject: Re: [PATCH 0/1] Import own-mirrors class from OE
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
X-List-Received-Date: Mon, 14 Mar 2011 16:47:06 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/13/2011 08:56 AM, Gary Thomas wrote:
> On 03/12/2011 08:04 AM, Khem Raj wrote:
>> Hi Richard
>>
>>
>>
>> Pull URL: git://git.openembedded.org/openembedded-core-contrib.git
>> Branch: kraj/own-mirror
>> Browse:
>> http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/own-mirror
>>
>>
>> Thanks,
>> Khem Raj<raj.khem@gmail.com>
>> ---
>>
>>
>> Khem Raj (1):
>> own-mirrors.bbclass: Bring own-mirrors.bbclass from oe commit
>> 0ef914b250df46a41348479446214575668943fb
>>
>> meta/classes/own-mirrors.bbclass | 12 ++++++++++++
>> 1 files changed, 12 insertions(+), 0 deletions(-)
>> create mode 100644 meta/classes/own-mirrors.bbclass
>>
>
> Poky/Yocto already has a mechanism for this by overriding PREMIRRORS
> I would think sticking with one extension method would be better.
>
> Here's what I have in my [Poky] DISTRO.conf:
>
> SOURCE_DIR ?= "/opt/poky/sources"
> PREMIRRORS = "\
> http://.*/.* file://${SOURCE_DIR}/ \n \
> https://.*/.* file://${SOURCE_DIR}/ \n \
> ftp://.*/.* file://${SOURCE_DIR}/ \n \
> bzr://.*/.* file://${SOURCE_DIR}/ \n \
> cvs://.*/.* file://${SOURCE_DIR}/ \n \
> git://.*/.* file://${SOURCE_DIR}/ \n \
> hg://.*/.* file://${SOURCE_DIR}/ \n \
> osc://.*/.* file://${SOURCE_DIR}/ \n \
> p4://.*/.* file://${SOURCE_DIR}/ \n \
> svk://.*/.* file://${SOURCE_DIR}/ \n \
> svn://.*/.* file://${SOURCE_DIR}/ \n"
>
> Users can have their own mirror by defining SOURCE_DIR in local.conf

I know this has been beaten to death, but I want to try answering 
differently.  What you mention above isn't so much a solution in poky as 
simply using the normal PREMIRRORS mechanism.  The own-mirrors patch is 
a wrapper around this logic to make it a 2 line local.conf change.  In 
your example, this would become:
INHERIT += "own-mirrors"
SOURCE_MIRROR_URL = "file:///opt/poky/sources"

(Or http://localhost:8080 and do a python -m SimpleHTTPServer 8080 & in 
/opt/poky/sources).

-- 
Tom Rini
Mentor Graphics Corporation



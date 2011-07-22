Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QkIyV-0008BJ-8Z
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 18:53:19 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QkIuT-0000rN-Jn from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 09:49:09 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 22 Jul 2011 09:46:45 -0700
Received: from [172.30.80.68] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.289.1;
	Fri, 22 Jul 2011 09:49:09 -0700
Message-ID: <4E29A9FE.4020205@mentor.com>
Date: Fri, 22 Jul 2011 09:49:02 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1311191810.git.tom_rini@mentor.com>
	<4EFFABBF-7073-4B97-B5A5-F9DBF4B7C5DA@dominion.thruhere.net>
In-Reply-To: <4EFFABBF-7073-4B97-B5A5-F9DBF4B7C5DA@dominion.thruhere.net>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 22 Jul 2011 16:46:45.0671 (UTC)
	FILETIME=[F13C2B70:01CC488E]
Subject: Re: [PATCH v2 0/1] Resync siteinfo.bbclass with oe.dev
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
X-List-Received-Date: Fri, 22 Jul 2011 16:53:19 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 07/22/2011 08:35 AM, Koen Kooi wrote:
> 
> Op 20 jul. 2011, om 22:50 heeft Tom Rini het volgende geschreven:
> 
>> Hey all,
>>
>> This is the second of two pull requests.  This doesn't depend on the first
>> request, it's just splitting changes up.  There's three changes here.  First,
>> site/ix86-common was setting the wrong value for unsigned int.  Second,
>> change perl to use SITEINFO variables rather than functions.  
>> We're down to one change now to re-sync siteinfo.bbclass with oe-core
>> and oe.dev.  This re-works the functions a bit inside siteinfo.bbclass
>> to be easier to add new platforms (and hopefully multilibs) to.
>>
>> My next step is to work on merging and verifying as much as possible
>> the site files in oe-core and oe.dev.
>>
>> v2: Rework based on Richard's comments to not be a generator and just
>> return a string list again.
> 
> Not that it has been merged, can the siteinfo from meta-oe get deleted?

The class? yes.  It wasn't being used anyhow :)

-- 
Tom Rini
Mentor Graphics Corporation



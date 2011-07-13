Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Qh6IH-0005Nf-U6
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 22:44:31 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Qh6ES-0001Zy-5Y from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 13:40:32 -0700
Received: from SVR-ORW-FEM-03.mgc.mentorg.com ([147.34.97.39]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 13 Jul 2011 13:40:30 -0700
Received: from [172.30.80.17] (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.1.289.1;
	Wed, 13 Jul 2011 13:40:30 -0700
Message-ID: <4E1E02BB.7080305@mentor.com>
Date: Wed, 13 Jul 2011 13:40:27 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1310583666.git.tom_rini@mentor.com>
	<4E1DF50E.7080305@windriver.com>
In-Reply-To: <4E1DF50E.7080305@windriver.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 13 Jul 2011 20:40:30.0676 (UTC)
	FILETIME=[1B125940:01CC419D]
Subject: Re: [PATCH 0/3] siteinfo.bbclass re-merge
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
X-List-Received-Date: Wed, 13 Jul 2011 20:44:31 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 07/13/2011 12:42 PM, Mark Hatle wrote:
> On 7/13/11 2:05 PM, Tom Rini wrote:
>> Hey all,
>>
>> This is the second of two pull requests.  This doesn't depend on the first
>> request, it's just splitting changes up.  There's three changes here.  First,
>> site/ix86-common was setting the wrong value for unsigned int.  Second,
>> change perl to use SITEINFO variables rather than functions.  Third, bring
>> in the various changes in siteinfo.bbclass that have been in oe.dev.  This
>> last part will, I hope, also make dealing with multilib-specific siteinfo
>> stuff easier (also alternative ABIs like x32).
> 
> Note, this is NOT an objection to the changes.  However, one thing to keep in mind.
> 
> (In fact I like the changes being suggested)
> 
> We have a dynamic site-configuation mechanism already in place.  So it's
> important that we don't duplicate things within the site/* files.
> 
> Currently the recipes: glibc, zlib, eglibc, and uclibc contain dynamic
> site_config files.  (See ./recipes-core/glibc/site_config/* for an example)
> 
> The output of these files get placed into a target arch specific site config
> directory: ${STAGING_DATADIR}/${TARGET_SYS}_config_site.d

I want to confirm that these files are still generated, found and
working.  But maybe part 4 of my series will be talking about some of
this stuff a bit more and if that's really the best method for the goal.

-- 
Tom Rini
Mentor Graphics Corporation



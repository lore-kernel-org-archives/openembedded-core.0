Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Qhk4J-0000S5-Ga
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jul 2011 17:12:43 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Qhk0P-0003qW-VE from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jul 2011 08:08:41 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 15 Jul 2011 08:08:41 -0700
Received: from [172.30.80.62] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.289.1;
	Fri, 15 Jul 2011 08:08:41 -0700
Message-ID: <4E2057F8.5090100@mentor.com>
Date: Fri, 15 Jul 2011 08:08:40 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <4E1F9F59.5050305@mentor.com>
	<4E1FAC5A.2090308@windriver.com>	<1310740753.2350.0.camel@scimitar>
	<4E2051FB.8080006@windriver.com>
In-Reply-To: <4E2051FB.8080006@windriver.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 15 Jul 2011 15:08:41.0781 (UTC)
	FILETIME=[15458E50:01CC4301]
Subject: Re: Building hg/help2man not relying on them?
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
X-List-Received-Date: Fri, 15 Jul 2011 15:12:43 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 07/15/2011 07:43 AM, Mark Hatle wrote:
> On 7/15/11 9:39 AM, Joshua Lock wrote:
>> On Thu, 2011-07-14 at 21:56 -0500, Mark Hatle wrote:
>>> On 7/14/11 9:00 PM, Tom Rini wrote:
>>>> Hey all,
>>>>
>>>> As I work on bringing jenkins up on my stripped down builder machines
>>>> I've once again run into the "wait, I'm supposed to have installed...?"
>>>> problem.  Can we switch to building help2man and mercurial rather than
>>>> making the end user install them?  Perhaps some sort of test for if we
>>>> find it, ASSUME_PROVIDED it, otherwise build it?
>>>>
>>>
>>> The full sanity list is:
>>>
>>> patch help2man diffstat texi2html makeinfo cvs svn bzip2 tar gzip gawk hg
>>> chrpath wget cpio
>>>
>>> Of the above, help2man, texi2html, hg, and chrpath seem to be the ones I usually
>>> have to find or build myself.
>>
>> Originally I built chrpath when I added relocatable.bbclass but then we
>> wanted to relocate native packages and it got extremely tricky...
> 
> I wonder if we can do something like pseudo and force chrpath to be built -very-
> early in the process.. and then have most things have an automatic requirement
> on chrpath-native...
> 
> (pseudo of course has the advantage it's NOT used for native packages...)
> 
> Is the native chrpath usage only in do_package [or later]?  If so, we could
> probably put a dependency on do_package of chrpath.. with the affect that
> chrpath would have to be built first...

IIRC, it's somewhere between really tricky and just not possible to
nicely shove chrpath-native as a dependency into the graph.  I'm going
to pause my siteinfo stuff shortly and take a stab at mercurial and
help2man since I know the recipes exist in oe.dev and this time around
I'll take a stab at adding stuff to ASSUME_PROVIDED if found (oe.dev
just has help2man-native in local.conf.sample).

-- 
Tom Rini
Mentor Graphics Corporation



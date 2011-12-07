Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1RYHzV-0005x1-PC
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 14:56:58 +0100
Received: by eaao14 with SMTP id o14so436937eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Dec 2011 05:50:09 -0800 (PST)
Received: by 10.213.112.200 with SMTP id x8mr548906ebp.12.1323265809247;
	Wed, 07 Dec 2011 05:50:09 -0800 (PST)
Received: from fensuse.internal.dresearch-fe.de
	(pd95cb174.dip0.t-ipconnect.de. [217.92.177.116])
	by mx.google.com with ESMTPS id a60sm5861081eeb.4.2011.12.07.05.50.06
	(version=SSLv3 cipher=OTHER); Wed, 07 Dec 2011 05:50:07 -0800 (PST)
Message-ID: <4EDF6F0D.1000306@dresearch-fe.de>
Date: Wed, 07 Dec 2011 14:50:05 +0100
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4ECF768A.4060108@dresearch-fe.de>
	<95977E6E-2138-4CEA-B7C6-FC8A248F9C95@dominion.thruhere.net>
	<4ECF7C0E.304@dresearch-fe.de>
	<CAMKF1spxSD4pG1x4Z30ATfMKWKcjoFJJxW4r0pguM0rybcyHaw@mail.gmail.com>
	<4EDDBF42.4070501@dresearch-fe.de>
In-Reply-To: <4EDDBF42.4070501@dresearch-fe.de>
X-Enigmail-Version: 1.3.3
Cc: Tom King <ka6sox@gmail.com>
Subject: Re: Uncommon source deployment policy of live555
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
X-List-Received-Date: Wed, 07 Dec 2011 13:56:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.12.2011 08:07, Steffen Sledz wrote:
> On 26.11.2011 06:49, Khem Raj wrote:
>> On Fri, Nov 25, 2011 at 3:29 AM, Steffen Sledz <sledz@dresearch-fe.de> wrote:
>>> On 25.11.2011 12:21, Koen Kooi wrote:
>>>>
>>>> Op 25 nov. 2011, om 12:05 heeft Steffen Sledz het volgende geschreven:
>>>>
>>>>> The LIVE555 project has a really uncommon source deployment policy. :(
>>>>>
>>>>> They publish *only* the latest tarball of their code [1]. And they don't make the code available under a source code repository [2].
>>>>>
>>>>> I've asked to change this policy but they are not willing to do that [3].
>>>>>
>>>>> How can we handle this?
>>>>> Does OE provides a "mirror" server to provide the versions we're referencing?
>>>>
>>>> Angstrom has had such a mirror ever since it started and it has the following live555 releases:
>>>
>>> Great.
>>>
>>> So there's no need to change the recipes. This server is used automatically. Right?
>>>
>>
>> for angstrom yes the mirror is a fallback
>>
>>
>>>> live.2009.06.02.tar.gz
>>>> live.2010.04.09.tar.gz
>>>> live.2010.05.29.tar.gz
>>>> live.2010.10.15.tar.gz
>>>> live.2011.01.10.tar.gz
>>>> live.2011.03.14.tar.gz
>>>
>>> I'd like to see the current live.2011.11.20.tar.gz there too. Who's maintaining such requests?
>>
>> as another backup you can also put this up on
>> sources.openemebedded.org, send it to ka6sox
> 
> I did not get an answer from ka6sox to my upload request until now. Can anybody else make to upload to sources.openemebedded.org?

Ping!

There's a commit pending requiring this tarball. :(

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058



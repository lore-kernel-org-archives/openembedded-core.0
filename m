Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QcusL-0004Bl-I9
	for openembedded-core@lists.openembedded.org;
	Sat, 02 Jul 2011 09:44:25 +0200
Received: by wwi14 with SMTP id 14so422488wwi.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Jul 2011 00:40:40 -0700 (PDT)
Received: by 10.216.82.205 with SMTP id o55mr1755543wee.64.1309592439968;
	Sat, 02 Jul 2011 00:40:39 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id
	et5sm2851822wbb.16.2011.07.02.00.40.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 02 Jul 2011 00:40:39 -0700 (PDT)
Message-Id: <E2BFAAC4-CED3-4CBA-99C5-F3ADC31395F2@dominion.thruhere.net>
From: Koen Kooi <koen@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1309558358.20015.563.camel@rex>
Mime-Version: 1.0 (Apple Message framework v936)
Date: Sat, 2 Jul 2011 09:40:26 +0200
References: <c201845df210143f3170eca54c9870f7e20be47a.1309533254.git.richard.purdie@linuxfoundation.org>
	<469c48cf5611c9e984d8114a48e834d03c44d099.1309533254.git.richard.purdie@linuxfoundation.org>
	<1309533561.2633.76.camel@phil-desktop>
	<1309558358.20015.563.camel@rex>
X-Mailer: Apple Mail (2.936)
Subject: Re: [PATCH 5/6] beecrypt: Fix up packaging QA warnings
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
X-List-Received-Date: Sat, 02 Jul 2011 07:44:25 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit


Op 2 jul 2011, om 00:12 heeft Richard Purdie het volgende geschreven:

> On Fri, 2011-07-01 at 16:19 +0100, Phil Blundell wrote:
>> On Fri, 2011-07-01 at 16:17 +0100, Richard Purdie wrote:
>>> +FILES_${PN} = "${sysconfdir} ${libdir}/*.so.* ${libdir}/${BPN}/ 
>>> *.so.*"
>>
>> You can use ${SOLIBS} there...
>>
>>> +FILES_${PN}-dev += "${libdir}/${BPN}/*.so ${libdir}/${BPN}/*.la
>>
>> ... and ${SOLIBSDEV} there.
>
> I'm in two minds on these. On the one hand they do make sense and have
> allowed us to build darwin targets in the past (and would extend to
> windows too). On the other hand nobody is using them outside the core
> metadata.

They would also be usefull for uclinux builds



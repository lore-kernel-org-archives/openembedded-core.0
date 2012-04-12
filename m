Received: from [78.110.170.148] (helo=tinyArch.localdomain)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1SIKye-0007Ow-5o
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 16:26:24 +0200
Received: from [192.168.0.55] (unknown [195.171.99.130])
	by tinyArch.localdomain (Postfix) with ESMTPSA id 144B02DD95
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2012 14:53:13 +0100 (BST)
Message-ID: <4F86E3FF.3050905@communistcode.co.uk>
Date: Thu, 12 Apr 2012 15:17:35 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120406 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1334238147-15338-1-git-send-email-ml@communistcode.co.uk>
	<2244DB0D-6E70-4128-BBBA-EFABB2C489EE@dominion.thruhere.net>
In-Reply-To: <2244DB0D-6E70-4128-BBBA-EFABB2C489EE@dominion.thruhere.net>
Subject: Re: [PATCH] New recipe - jansson, C library for encoding, decoding and manipulating JSON data
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
X-List-Received-Date: Thu, 12 Apr 2012 14:26:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/04/12 15:08, Koen Kooi wrote:
> Op 12 apr. 2012, om 15:42 heeft ml@communistcode.co.uk het volgende geschreven:
>
>> From: Jack Mitchell<jack.mitchell@dbbroadcast.co.uk>
>>
>> Signed-off-by: Jack Mitchell<jack.mitchell@dbbroadcast.co.uk>
>> ---
>> meta-oe/recipes-support/jansson/jansson.inc    |    8 ++++++++
>> meta-oe/recipes-support/jansson/jansson_2.3.bb |    4 ++++
> I'll ask the standard question: why is this needed in oe-core?
>
> regards,
>
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

It was in oe-classic so I believed it would be useful to port it over 
oe-core. I thought that the location I chose was the most suitable place 
for it. There doesn't seem to be a general 'user-cotrib/devel' layer 
into which these packages can go, I was unsure of it's relevance but a 
patch declined is a patch archived, right?

Kind Regards,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--




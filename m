Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q2scK-0005XE-27
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Mar 2011 23:02:56 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Q2saW-00041L-EW from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Mar 2011 15:01:04 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 24 Mar 2011 14:59:51 -0700
Received: from [172.30.80.38] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Thu, 24 Mar 2011 15:00:53 -0700
Message-ID: <4D8BBEFB.4040107@mentor.com>
Date: Thu, 24 Mar 2011 15:00:27 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1300978024.git.richard.purdie@linuxfoundation.org>
	<43A4384F-8595-4A7A-8EC5-93DF7DCFEE39@dominion.thruhere.net>
In-Reply-To: <43A4384F-8595-4A7A-8EC5-93DF7DCFEE39@dominion.thruhere.net>
X-OriginalArrivalTime: 24 Mar 2011 21:59:51.0365 (UTC)
	FILETIME=[CCCF9750:01CBEA6E]
Subject: Re: [PATCH 0/2] Split IMAGE* variables into a separate class
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
X-List-Received-Date: Thu, 24 Mar 2011 22:02:56 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/24/2011 08:39 AM, Koen Kooi wrote:
>
> Op 24 mrt 2011, om 15:49 heeft Richard Purdie het volgende geschreven:
>
>> From: Richard Purdie<richard.purdie@linuxfoundation.org>
>>
>> These patches split the IMAGE* variables out into a separate class
>> to improve readabilty.
>
> I like it!

Agreed.  This will help us clean up the N instances of make an ext2 
image, modify.

-- 
Tom Rini
Mentor Graphics Corporation



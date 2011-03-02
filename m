Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1PuaJP-0004od-Hd
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Mar 2011 01:53:07 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p220peVk014386
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Mar 2011 16:51:40 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 1 Mar 2011 16:51:40 -0800
Message-ID: <4D6D949B.2020801@windriver.com>
Date: Tue, 1 Mar 2011 18:51:39 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1298920867-4961-1-git-send-email-koen@dominion.thruhere.net>	<A632FFDE-18DE-439E-B247-80DE29746320@dominion.thruhere.net>	<4D6D5671.6050903@windriver.com>
	<4D6D8BE8.9020907@mentor.com>
In-Reply-To: <4D6D8BE8.9020907@mentor.com>
X-Originating-IP: [172.25.36.227]
Subject: Re: [PATCH] base.bbclass: add support for SOC_FAMILY in COMPATIBLE_MACHINES
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
X-List-Received-Date: Wed, 02 Mar 2011 00:53:08 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 3/1/11 6:14 PM, Tom Rini wrote:
> On 03/01/2011 01:26 PM, Mark Hatle wrote:
>> On 3/1/11 1:55 PM, Koen Kooi wrote:
>>> ping
>>
>> Do you have an example showing how this is to be used?
> 
> For example:
> http://cgit.openembedded.org/cgit.cgi/openembedded/tree/conf/machine/include/omap3.inc
> http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/linux/linux-omap3.inc
> 

Thanks, that makes sense to me.  I think it's useful.  (It's already in, no
objections to that)

--Mark



Received: from sanddollar.geekisp.com ([216.168.135.167])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1Sf9nT-0005Aj-88
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jun 2012 15:09:11 +0200
Received: (qmail 30261 invoked by uid 1003); 14 Jun 2012 12:58:33 -0000
Received: from unknown (HELO ?192.168.1.108?) (philip@opensdr.com@71.171.27.98)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	14 Jun 2012 12:58:32 -0000
Message-ID: <4FD9DFF7.70005@balister.org>
Date: Thu, 14 Jun 2012 08:58:31 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111108 Fedora/3.1.16-1.fc14 Thunderbird/3.1.16
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1339593545-14046-1-git-send-email-sbabic@denx.de>	<CAJTo0LYQQXZKoK8N9g0msxQAcg_c2sc0n4-hAgKCJJYzj4vuag@mail.gmail.com>	<4FD8A219.9000100@denx.de>	<CAJTo0LbKGqM=pCovegAmZgTz-Q2cKZmZU7qUbYm21KRquydzog@mail.gmail.com>
	<4FD99A2B.2060006@denx.de>
In-Reply-To: <4FD99A2B.2060006@denx.de>
X-Enigmail-Version: 1.1.2
Subject: Re: [PATCH] Added recipe for libconfig
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
X-List-Received-Date: Thu, 14 Jun 2012 13:09:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 06/14/2012 04:00 AM, Stefano Babic wrote:
> On 13/06/2012 16:24, Burton, Ross wrote:
>> On 13 June 2012 15:22, Stefano Babic <sbabic@denx.de> wrote:
>>> no, there is not yet. I add the libconfig to my image and my apllication
>>> make use of it. However, I see it as a general purpose library, that one
>>> can decide to add or not to the own rootfs.
>>>
>>> Is there some constraints in OE requiring that a lib can be merged only
>>> if a provided package make use of it ?
>>
>> Surely meta-oe would be a better place for this then?
> 
> Understood. Or maybe under meta-yocto/recipes-core ? I will prefer this
> one because meta-oe is not part of the yocto distribution. Am I right to
> post patches here or am I completely off-topic ?

meta-oe is the place for this tyoe of recipe. The Yocto Project is not a
distribution, rather a project to make embedded systems easier :)

Philip



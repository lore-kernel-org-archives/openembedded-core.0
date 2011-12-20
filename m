Received: from sanddollar.geekisp.com ([216.168.135.167])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1Rd1mS-0007Hf-Vn
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Dec 2011 16:39:07 +0100
Received: (qmail 18823 invoked by uid 1003); 20 Dec 2011 15:31:53 -0000
Received: from unknown (HELO ?192.168.1.104?) (philip@opensdr.com@96.240.172.5)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	20 Dec 2011 15:31:53 -0000
Message-ID: <4EF0AA68.7070501@balister.org>
Date: Tue, 20 Dec 2011 10:31:52 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111108 Fedora/3.1.16-1.fc14 Thunderbird/3.1.16
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1324316137.git.paul.eggleton@linux.intel.com>	<4077851.vBmcQh9dAf@helios>	<756581D3-FAA6-48FC-9ECE-0B7CC1262A5D@dominion.thruhere.net>
	<3289178.cJ7bor4PPM@helios>
In-Reply-To: <3289178.cJ7bor4PPM@helios>
X-Enigmail-Version: 1.1.2
Subject: Re: [PATCH 0/2] psplash fixes
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
X-List-Received-Date: Tue, 20 Dec 2011 15:39:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 12/19/2011 01:57 PM, Paul Eggleton wrote:
> On Monday 19 December 2011 19:48:48 Koen Kooi wrote:
>> I will say again: I absolutely HATE that virtual-runtime nonsense. If you
>> need to change a task, change the task, don't introduce things that make it
>> non deterministic. Guess what happens when you change a virtual-runtime
>> *after* you have built the task already.
> 
> This is the problem I'm trying to avoid. Perhaps it wasn't clear, but what I 
> meant was change things so we do not bring in psplash via a task anymore - 
> instead use the value of VIRTUAL-RUNTIME_splash within core-image.bbclass, 
> controlled via an IMAGE_FEATURE.
> 
>>> Would update-alternatives be needed at all in
>>> that case?
>>
>> It would if you want to change it after booting :)
> 
> What's the use case for changing the splash image after booting?

I can see people taking an existing image, adding a few packages to
customize it for their application, and changing the splash image to a
product specific one.

Philip



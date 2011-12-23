Received: from sanddollar.geekisp.com ([216.168.135.167])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1RdsfX-0007Av-Gj
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Dec 2011 01:07:27 +0100
Received: (qmail 3342 invoked by uid 1003); 23 Dec 2011 00:00:18 -0000
Received: from unknown (HELO ?192.168.1.104?) (philip@opensdr.com@96.240.172.5)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	23 Dec 2011 00:00:18 -0000
Message-ID: <4EF3C491.8080903@balister.org>
Date: Thu, 22 Dec 2011 19:00:17 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111108 Fedora/3.1.16-1.fc14 Thunderbird/3.1.16
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1324316137.git.paul.eggleton@linux.intel.com>
	<3289178.cJ7bor4PPM@helios> <4EF0AA68.7070501@balister.org>
	<2148975.ysQ11QrYeT@helios>
In-Reply-To: <2148975.ysQ11QrYeT@helios>
X-Enigmail-Version: 1.1.2
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 23 Dec 2011 00:07:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 12/21/2011 10:15 AM, Paul Eggleton wrote:
> On Tuesday 20 December 2011 10:31:52 Philip Balister wrote:
>> I can see people taking an existing image, adding a few packages to
>> customize it for their application, and changing the splash image to a
>> product specific one.
> 
> I'm not entirely convinced this workflow makes sense when you're interested in 
> getting reproducible product images. This is basically the "take some existing 
> distro and hack it up until it fits" approach which taken past a certain point 
> leads to an unmaintainable mess, or at the very least regressions.
> 
> People really ought to be able to produce their final images from the metadata 
> with no additional post-build changes (or at least none that are manual). If 
> that's too difficult, that's the problem I think is most worthwhile to attack, 
> even if it requires more work on our part.

Well, I can see people wanting to do this. It falls into the case of the
customer is always right, even when he is wrong :)

Philip



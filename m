Received: from r-finger.com ([178.79.160.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tf+lists.yocto@r-finger.com>) id 1TQOmJ-0008JP-S5
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 22:39:15 +0200
Received: from [192.168.0.2] (host81-153-114-123.range81-153.btcentralplus.com
	[81.153.114.123]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 964C799A4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2012 21:25:52 +0100 (BST)
Message-ID: <5085ABCF.6010403@r-finger.com>
Date: Mon, 22 Oct 2012 21:25:51 +0100
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
CC: openembedded-core@lists.openembedded.org
References: <CAJTo0LboPRF7Oxnwh8QS6b6ReS-1-P+=r04L54QRptPnHfV5oQ@mail.gmail.com>
	<5085800A.4060600@r-finger.com>
	<CAJTo0LZ=Z803V-joHd17qeMqm3XaNGEnJavSeb=LBzqcLW9AbQ@mail.gmail.com>
In-Reply-To: <CAJTo0LZ=Z803V-joHd17qeMqm3XaNGEnJavSeb=LBzqcLW9AbQ@mail.gmail.com>
Subject: Re: [RFC] OpenGL packaging/staging policy
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Oct 2012 20:39:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/10/12 20:27, Burton, Ross wrote:
> On 22 October 2012 18:19, Tomas Frydrych <tf+lists.yocto@r-finger.com> wrote:
>> Our
>> current difficulties stem directly from trying to pretend this is not
>> the case, or that mesa is somehow more than just *a* GL provider. IMHO
>> the correct thing to do here is:
> 
> Mesa is the only free GL provider, which does make it useful in an
> open source build system.

Useful, yes, but not different. Having multiple providers is a normal
scenario that OE handles perfectly well; having a privileged provider
and bunch second class providers is a new scenario that serves no useful
purpose here -- you are creating the problem you are trying to solve.


> This would be the "complication packaging tricks" that I alluded to in
> the original mail.

There is nothing complicated about this; the fact that you cannot build
mesa GL without *staging* mesa EGL at the same time is broken which ever
way you look at it. Having only mesa to stage things is not a fix, it's
a work around, and one that punishes everyone else for the mesa mess. :-)

Tomas



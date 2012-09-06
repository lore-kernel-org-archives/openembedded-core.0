Received: from r-finger.com ([178.79.160.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tf+lists.yocto@r-finger.com>) id 1T9dOw-0008CV-0T
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 16:49:50 +0200
Received: from [192.168.0.2] (host81-153-84-143.range81-153.btcentralplus.com
	[81.153.84.143]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 5C4319ADE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2012 15:37:27 +0100 (BST)
Message-ID: <5048B526.4050501@r-finger.com>
Date: Thu, 06 Sep 2012 15:37:26 +0100
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CAK18fxEb3gjEEwhvN-du3eJvgUVCbjXU2Ag4kicFFDt6xra6og@mail.gmail.com>
	<CAJTo0LYmPf0g_qv6X+8MefjzfWr4gsr33SaszHsG82PiGg+oEg@mail.gmail.com>
	<644855E8-7D63-45DC-B072-B9A9893058F3@dominion.thruhere.net>
	<CAJTo0La9-QHoWJB2v82C2tiM2XFwgHzsP1zda+Duqe_3uTwByw@mail.gmail.com>
In-Reply-To: <CAJTo0La9-QHoWJB2v82C2tiM2XFwgHzsP1zda+Duqe_3uTwByw@mail.gmail.com>
Subject: Re: [yocto] opengl / libgl / libgles
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
X-List-Received-Date: Thu, 06 Sep 2012 14:49:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/09/12 14:51, Burton, Ross wrote:
> On 6 September 2012 14:25, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> It's not automatic, but you can do something like this:
>>
>>         http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=23b02134
>>
>>         RDEPENDS_${PN} = "libGL"
> 
> Ah, interesting.  I'm not entirely keen on the manual dependencies but
> that's certainly a step in the right direction.

Is there much that actually links against libGL / libgles? Things like
cogl dlopen() these these, so you have to manually specify the RDEPENDS
anyway. Just thinking this could be less of an issue than it might appear.

Tomas



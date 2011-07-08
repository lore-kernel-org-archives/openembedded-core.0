Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QfCdS-00018u-Dx for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 17:07:23 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68F10xB021115
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jul 2011 16:01:00 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20817-02 for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2011 16:00:56 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68F0uEF021109
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jul 2011 16:00:56 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <27ED3419-C3F8-40B4-AF21-D7BEDC631813@dominion.thruhere.net>
References: <cover.1310027619.git.dexuan.cui@intel.com>
	<cb76f021571c5f35239192ff05eb89cab4713d04.1310027619.git.dexuan.cui@intel.com>
	<4E15D389.9040906@mentor.com>
	<1865303E0DED764181A9D882DEF65FB6A6B2A2650F@shsmsx502.ccr.corp.intel.com>
	<27ED3419-C3F8-40B4-AF21-D7BEDC631813@dominion.thruhere.net>
Date: Fri, 08 Jul 2011 16:00:17 +0100
Message-ID: <1310137217.20015.874.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] powertop: inherit update-alternatives and use	a higher priority than busybox
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
X-List-Received-Date: Fri, 08 Jul 2011 15:07:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-08 at 08:25 +0100, Koen Kooi wrote:
> 
> Op 8 jul. 2011 om 02:40 heeft "Cui, Dexuan" <dexuan.cui@intel.com> het volgende geschreven:
> 
> > Tom Rini wrote:
> >> On 07/07/2011 01:39 AM, Dexuan Cui wrote:
> >>> busybox-1.18.4 installs /bin/powertop and the powertop recipe
> >>> installs /usr/bin/powertop. So, in PATH, if /bin appears before
> >>> /usr/bin, we would run the version offered by busybox, which has a
> >>> very limited function (e.g., no parameter is accepted) and this
> >>> causes trouble to eclipse plugin. 
> >>> 
> >>> We can use update-alternatives for powertop with higher priority to
> >>> resolve the issue. 
> >>> 
> >>> Fixes [YOCTO #1208]
> >>> 
> >>> Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
> >> 
> >> This fix seems a bit incomplete.  Why is busybox putting powertop into
> >> /bin when it almost certainly belongs in /usr/bin like the real recipe
> >> was placing it.  busybox needs a fix here too.
> > Thanks for the comment! 
> > I was hesitant about fixing busybox as I wasn't sure if it's worthy
> to make a patch to only fix the path for busybox. I don't know why
> busybox puts it into /bin. I think the best place may be /usr/sbin/. 
> > A little unluckily this patch to powertop has been already in poky
> master... So maybe we could try to fix the recipes in future, e.g.,
> when upgrading them.
> 
> we should do the right thing in oe-core,  the poky people can clean up on their own. 

I don't think anyone is suggesting we shouldn't do the right thing in
OE-Core? :)

I merged the original patch on the grounds that its was an improvement
to the situation. We've identified a better improvement so can someone
please send me the patch and I'll likely merge that too.

FWIW, I agree that powertop should really be under /usr/...

Cheers,

Richard





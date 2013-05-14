Received: from r-finger.com ([178.79.160.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tf+lists.yocto@r-finger.com>) id 1UcBiY-0000H2-MY
	for openembedded-core@lists.openembedded.org;
	Tue, 14 May 2013 11:40:30 +0200
Received: from [192.168.0.2] (host86-137-102-112.range86-137.btcentralplus.com
	[86.137.102.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id AB967952B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2013 10:22:09 +0100 (BST)
Message-ID: <51920240.3070408@r-finger.com>
Date: Tue, 14 May 2013 10:22:08 +0100
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1368189198-1294-1-git-send-email-jukka.rissanen@linux.intel.com>
	<518FB7F9.2020102@linux.intel.com>
	<1368384890.16243.79.camel@pb-ThinkPad-R50e>
	<3529451.hQA8zCVn47@helios>
	<1368442968.6920.4.camel@phil-desktop.brightsign>
	<CAJTo0LYSqikcyXKsXA5OpnUNmwbvrRqbi4kQ93r2QzBtEuo2zQ@mail.gmail.com>
	<5190CF63.2030303@r-finger.com>
	<1368456796.6920.23.camel@phil-desktop.brightsign>
In-Reply-To: <1368456796.6920.23.camel@phil-desktop.brightsign>
Subject: Re: [PATCH 0/5] Enable VPN support in ConnMan
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
X-List-Received-Date: Tue, 14 May 2013 09:40:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/05/13 15:53, Phil Blundell wrote:
> On Mon, 2013-05-13 at 12:32 +0100, Tomas Frydrych wrote:
>> On 13/05/13 12:06, Burton, Ross wrote:
>>> The problem with bbappends is that they break every time the package
>>> in oe-core changes version.
>>
>> I see this as a good thing; if I maintain a bbappend, I want to know
>> when the base package changes its a version, and I get an immediate
>> error due to bbappend to a non-existent file.
> 
> Personally, for the .bbappends that I maintain, I would much rather not
> have to go around renaming a bunch of files every time I merge a new
> version of oe-core and all the recipes get upgraded. 
> 
> But, if you enjoy the errors, you could easily enough get them back even
> if the filenames didn't change:
> 
> python() {
>     tolerable_pvs = [ '1.0', '1.1', '1.2' ]
>     pv = d.getVar('PV', True)
>     if not pv in tolerable_pvs:
>         bb.fatal("encountered intolerable version %s of underlying recipe, please adjust me accordingly" % pv)
> }
> 
> or something.  One could wrap that in some extra sugar and put it in
> base.bbclass if having the boilerplate in each .bbappend is unappealing.

I do like this approach; I'd probably wrap it in a class and let the
bbappend maintainer to decide if their bbappend deserves this or not.


Tomas



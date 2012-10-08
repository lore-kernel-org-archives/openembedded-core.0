Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TL9hD-0003ko-2F for openembedded-core@lists.openembedded.org;
	Mon, 08 Oct 2012 11:32:19 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q989JBoX017558;
	Mon, 8 Oct 2012 10:19:11 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17236-01; Mon,  8 Oct 2012 10:19:05 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q989J18w017551
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 8 Oct 2012 10:19:02 +0100
Message-ID: <1349687945.15658.100.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 08 Oct 2012 10:19:05 +0100
In-Reply-To: <CAPj87rNGezr_kJevYaykFK6hf-o+gfd2Wji=813BJqseWYKzBA@mail.gmail.com>
References: <1349437649.15658.20.camel@ted>
	<CAPj87rO=rnyWBjnoMnx=2QCZ3BoMqfiq1w+Vf8qZAmMLyJg-sg@mail.gmail.com>
	<CAPj87rM0BH_eU+6j66Gq7+mrPs2JbrwDZdu58gqwJ_34vNeKmg@mail.gmail.com>
	<1349683286.15658.91.camel@ted>
	<CAPj87rNGezr_kJevYaykFK6hf-o+gfd2Wji=813BJqseWYKzBA@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libdrm: Explicitly disable the cairo dependency
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
X-List-Received-Date: Mon, 08 Oct 2012 09:32:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-10-08 at 19:32 +1100, Daniel Stone wrote:
> Hi,
> 
> On 8 October 2012 19:01, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Mon, 2012-10-08 at 16:44 +1100, Daniel Stone wrote:
> >> > which has already been submitted upstream:
> >> > http://lists.freedesktop.org/archives/dri-devel/2012-October/028514.html
> >
> > Thanks for that, sending something upstream was on my todo list but I
> > needed to fix the breaking builds more urgently.
> 
> Understandable - happily the patch has already merged.  There's a
> patchset in git://git.collabora.com/~daniels/poky which reverts your
> original patch, adds a new patch for 2.4.39 with the backport of the
> upstream patch, and bumps the git SRCREV to one with this patch
> already merged.  Should I submit this to the Yocto list? (I'm told
> that submitting Poky patches to oe-core is the worst kind of error.)

Please do send the patch. It likely won't go into the release branch as
I'm trying not to make more changes there than we have to but will make
it into master, if not this instant, shortly.

Cheers,

Richard




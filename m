Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QSAvf-00034q-2m for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 18:39:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p52GaHLw018075
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Jun 2011 17:36:17 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17392-03 for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2011 17:36:13 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p52Ga7Oo018065
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Jun 2011 17:36:09 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4DE7BA3F.4060600@mentor.com>
References: <cover.1306931844.git.dexuan.cui@intel.com>
	<4DE67440.1020405@mentor.com> <1306950977.27470.461.camel@rex>
	<4DE69582.2090508@mentor.com>
	<1306958729.3119.3.camel@lenovo.internal.reciva.com>
	<4DE6A43A.3050401@mentor.com>
	<1306961135.3119.13.camel@lenovo.internal.reciva.com>
	<4DE6A836.3040004@mentor.com> <1307023591.27470.549.camel@rex>
	<4DE79D69.7080806@mentor.com> <1307025426.2529.209.camel@phil-desktop>
	<4DE7BA3F.4060600@mentor.com>
Date: Thu, 02 Jun 2011 17:35:45 +0100
Message-ID: <1307032545.27470.580.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC v1 PATCH 00/16] populate perl-native into its own	directory
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
X-List-Received-Date: Thu, 02 Jun 2011 16:39:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-02 at 09:28 -0700, Tom Rini wrote:
> On 06/02/2011 07:37 AM, Phil Blundell wrote:
> > On Thu, 2011-06-02 at 07:25 -0700, Tom Rini wrote:
> >> But help2man is just the easy/common case.  Heck, it _may_ blow up even
> >> with the host help2man instead of help2man-native, if a recipe uses
> >> system-wide help2man and perlnative.bbclass.  The root problem (again,
> >> from memory) is that since we modify PERL5LIB and so on, when we do
> >> that, we've opened ourselves up for system-wide perl trying to use
> >> perl-native's stuff.
> > 
> > Ah right, I think I see what you're getting at now.
> > 
> > If we've got a clean separation between perl-native and host perl,
> > though, can't we now just eliminate all of that futzing with PERL5LIB in
> > cpan.bbclass and such like places?  perl-native already knows how to
> > look in the right places within the sysroot for its modules so there
> > should be no need for anything else to be overriding it.
> 
> Well, my question is, does it, really?

If it doesn't it really does need to get fixed. I've not seen any
evidence this has been the problem but it still could be.

>   Even if we're using the sstate
> cache from /foo/oecore/tmp over in /bar/oecore/tmp (and /foo/oecore/tmp
> is rm -rf'd) ?  Since we've got a create_wrapper around perl and
> perl${PV} it should be I suppose (or is easily added there), but I'd
> feel a lot better with some testing of the above case (and the updates
> to cpan*bbclass).

I only took the perl-native DEPENDS patch on the condition this gets
fixed properly. The patches that are there look to do that, at least for
OE-Core. If there are further issues we're going to have to take them as
they arise as I have an objection to crippling the build dependencies
because perl is broken. Really this could use some TLC from someone with
experience in the area...

Cheers,

Richard





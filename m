Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id CE8316EADD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 16:45:06 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s1EGiXbW021167; Fri, 14 Feb 2014 16:44:33 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id FA4ug0S2bSVq; Fri, 14 Feb 2014 16:44:33 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s1EGiUXM021151
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 14 Feb 2014 16:44:32 GMT
Message-ID: <1392396265.14081.73.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Darren Hart <dvhart@linux.intel.com>
Date: Fri, 14 Feb 2014 16:44:25 +0000
In-Reply-To: <CF238059.6D5FB%dvhart@linux.intel.com>
References: <1392250819-10123-1-git-send-email-joaohf@gmail.com>
	<1392250819-10123-3-git-send-email-joaohf@gmail.com>
	<1392291238.14081.10.camel@ted> <CF225582.6D067%dvhart@linux.intel.com>
	<1392392807.14081.51.camel@ted> <CF238059.6D5FB%dvhart@linux.intel.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] cml1.bbclass: Add fragmentconfig task to cml1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Feb 2014 16:45:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2014-02-14 at 08:15 -0800, Darren Hart wrote:
> On 2/14/14, 7:46, "Richard Purdie" <richard.purdie@linuxfoundation.org>
> wrote:
> 
> >On Thu, 2014-02-13 at 11:00 -0800, Darren Hart wrote:
> >> On 2/13/14, 3:33, "Richard Purdie" <richard.purdie@linuxfoundation.org>
> >> wrote:
> >> 
> >> >On Wed, 2014-02-12 at 22:20 -0200, João Henrique Ferreira de Freitas
> >> >wrote:
> >> >> fragmentconfig() is a new task that makes a diff between the
> >> >> old and new config files and writes to the fragment.cfg result file.
> >> >> menuconfig() always copy the original config file, so the user
> >> >> doesn't need to copy it.
> >> >> 
> >> >> Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>
> >> >> ---
> >> >>  meta/classes/cml1.bbclass | 35 +++++++++++++++++++++++++++++++++++
> >> >>  1 file changed, 35 insertions(+)
> >> >> 
> >> >> diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
> >> >> index e292ecb..2053361 100644
> >> >> --- a/meta/classes/cml1.bbclass
> >> >> +++ b/meta/classes/cml1.bbclass
> >> 
> >> One more thought on this. As this is currently linux-yocto specific,
> >>does
> >> it belong in cml1.bbclass? It may make sense in busybox as well, so
> >>maybe
> >> this is the right place.
> >> 
> >> RP, do you have a preference?
> >
> >Its starting to head in a direction we could probably use a
> >kern-tools.bbclass to keep the code in a common place.
> 
> I wonder if something like kconfig.bbclass, rather than tying it to the
> linux-yocto tooling (as it doesn't use any of the tooling to create the
> fragment). Busybox could then use this, for example (not that it couldn't
> include kern-tools.bbclass, it just seems a bit less natural to do so).

Well, busybox does DEPEND on the kern-tools-native package. cml1.bbclass
is effectively a kconfig.bbclass. I'd be ok with this code there, the
fragment is kern-tools specific at this point but its not a big deal...

Cheers,

Richard



Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UNtAO-0007dL-DS for openembedded-core@lists.openembedded.org;
	Fri, 05 Apr 2013 01:02:00 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r34MtKG1024117; Thu, 4 Apr 2013 23:55:20 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id XoR70ftvpINA; Thu,  4 Apr 2013 23:55:20 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r34MtB5i024107
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 4 Apr 2013 23:55:13 +0100
Message-ID: <1365115464.6526.124.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 04 Apr 2013 23:44:24 +0100
In-Reply-To: <248A454E-7AEF-4AFB-9200-EB361D589EF7@gmail.com>
References: <1365077355-17673-1-git-send-email-mihai.prica@intel.com>
	<E88E88F5-90AE-4280-AE38-735E593E6DC6@gmail.com>
	<97BD068FB200C44AA73C2B641F162ECF97E89B@IRSMSX101.ger.corp.intel.com>
	<1365092291.6526.114.camel@ted>
	<248A454E-7AEF-4AFB-9200-EB361D589EF7@gmail.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] qemu: Enabled SDL when compiling for target architecture
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
X-List-Received-Date: Thu, 04 Apr 2013 23:02:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-04-04 at 11:07 -0700, Khem Raj wrote:
> On Apr 4, 2013, at 9:18 AM, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> 
> > I'd ultimately like to see PACKAGECONFIG used here but we haven't
> > managed the right patchset yet so I took this one earlier today as a
> > short term fix :/.
> 
> i think its not a good thing for headless systems as I said earlier there are additional packages showing
> up on target for no reasons, 

"no reason" isn't true, there are use cases where this is breaking for
some users.

> I could reverse it via a bbappend in my own layer but thats not pleasant

So we need to make this a PACKAGECONFIG option which can be controlled
from the distro, no argument.

We've had various problems getting the patch right for this, that is the
main issue. You'd have to look at the archives to see what those are.

Cheers,

Richard





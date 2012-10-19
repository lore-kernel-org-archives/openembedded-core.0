Received: from smtpout.karoo.kcom.com ([212.50.160.34])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mac@mcrowe.com>) id 1TPG67-00029O-L7
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Oct 2012 19:10:59 +0200
X-IronPort-AV: E=Sophos;i="4.80,613,1344207600"; d="scan'208";a="667335930"
Received: from deneb.mcrowe.com ([82.152.148.4])
	by smtpout.karoo.kcom.com with ESMTP; 19 Oct 2012 17:57:38 +0100
Received: from mac by deneb.mcrowe.com with local (Exim 4.72)
	(envelope-from <mac@mcrowe.com>)
	id 1TPFtC-00041u-8X; Fri, 19 Oct 2012 17:57:38 +0100
Date: Fri, 19 Oct 2012 17:57:38 +0100
From: Mike Crowe <mac@mcrowe.com>
To: Chris Larson <clarson@kergoth.com>,
	openembedded-core@lists.openembedded.org
Message-ID: <20121019165738.GC14620@mcrowe.com>
References: <20121019153834.GA13159@mcrowe.com>
	<CABcZANkWq0YZ38E9cCDvoJvpou0eunXJcHUUQCnbhRmDm_oQLg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABcZANkWq0YZ38E9cCDvoJvpou0eunXJcHUUQCnbhRmDm_oQLg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Using SSTATE_MIRRORS with sstate subdirectories
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
X-List-Received-Date: Fri, 19 Oct 2012 17:10:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 19, 2012 at 08:46:23AM -0700, Chris Larson wrote:
> On Fri, Oct 19, 2012 at 8:38 AM, Mike Crowe <mac@mcrowe.com> wrote:
> > I'm having trouble using SSTATE_MIRRORS as suggested at
> > https://wiki.yoctoproject.org/wiki/Enable_sstate_cache :
> >
> > SSTATE_MIRRORS ?= "file://.* file:///private/sstate-cache/"
> 
> SSTATE_MIRRORS ?= "file://.* file:///private/sstate-cache/PATH"

Thanks for your reply.

Although that works for the simple case, if I try and do something
more adventurous like:

SSTATE_MIRRORS = "\
file://Debian-testing/.* file:///private/sstate-cache/Debian-6.0.6/PATH \n \
file://.* file:///private/sstate-cache/PATH \n \
"

Then I get paths like:

DEBUG: For url file://Debian-testing/8c/sstate-tar-replacement-native-x86_64-linux-1.26-r3-x86_64-2-8cc4342260b064ace38e0aa1acf2f618_populate-sysroot.tgz returning file:///private/sstate-cache/Debian-6.0.6/Debian-testing/8c/sstate-tar-replacement-native-x86_64-linux-1.26-r3-x86_64-2-8cc4342260b064ace38e0aa1acf2f618_populate-sysroot.tgz

so I really would like to be able to say:

"file://Debian-testing/(.*) file:///private/sstate-cache/Debian-6.0.6/\1"

Thanks.

Mike.



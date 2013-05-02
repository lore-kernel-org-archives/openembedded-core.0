Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UXvAp-00021c-E0
	for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 17:11:56 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 02 May 2013 07:54:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,597,1363158000"; d="scan'208";a="327721064"
Received: from unknown (HELO helios.localnet) ([10.255.12.165])
	by fmsmga001.fm.intel.com with ESMTP; 02 May 2013 07:53:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 02 May 2013 15:53:34 +0100
Message-ID: <2062050.YyQC8Ghe9x@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-19-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <1367506179.5379.130.camel@ted>
References: <CALbNGRTYCh8aB_JNpL7T-80PzybUN9KMJmZ=_GP6AfkrJmAccw@mail.gmail.com>
	<1556536.BsQG791ajX@helios> <1367506179.5379.130.camel@ted>
MIME-Version: 1.0
Subject: Re: useradd.bbclass question
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
X-List-Received-Date: Thu, 02 May 2013 15:12:05 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 02 May 2013 15:49:39 Richard Purdie wrote:
> On Thu, 2013-05-02 at 15:34 +0100, Paul Eggleton wrote:
> > Right, do_install will be well before this stuff happens and it is not a
> > fakeroot task anyway. This needs to be moved to a postinstall script
> > (which
> > should be able to run during image creation).
> 
> Er, yes, do_install is a fakeroot task and you should be able to make
> something like this work from do_install. We went to a lot of effort to
> ensure the preinst scripts work correctly (see dbus as an example recipe
> that uses this).

Oops. I'll have to admit that I assumed this without checking. Andreas, please 
ignore my advice.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



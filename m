Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UOcy7-0001QS-9G
	for openembedded-core@lists.openembedded.org;
	Sun, 07 Apr 2013 01:56:26 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 06 Apr 2013 16:39:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,421,1363158000"; d="scan'208";a="318115566"
Received: from unknown (HELO helios.localnet) ([10.255.14.16])
	by fmsmga002.fm.intel.com with ESMTP; 06 Apr 2013 16:39:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org, Gary Thomas <gary@mlbassoc.com>
Date: Sun, 07 Apr 2013 00:39:03 +0100
Message-ID: <1774512.QpcBWiQjzK@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.1 (Linux/3.5.0-26-generic; KDE/4.10.1; i686; ; )
In-Reply-To: <CABcZANnh=K=H-gGFbTTHH0hJsxyK_F+m4Z7k1oFZ2=+wzFbFBg@mail.gmail.com>
References: <51601264.7060807@mlbassoc.com>
	<CABcZANnh=K=H-gGFbTTHH0hJsxyK_F+m4Z7k1oFZ2=+wzFbFBg@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: Incorrect FILESPATH usages
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
X-List-Received-Date: Sat, 06 Apr 2013 23:56:31 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 06 April 2013 15:14:20 Chris Larson wrote:
> On Sat, Apr 6, 2013 at 5:17 AM, Gary Thomas <gary@mlbassoc.com> wrote:
> > I have run across a problem where a main recipe is written in
> > such a way that makes using .bbappend impossible.  This happens
> > if the main recipe has an explicit assignment for FILESPATH.
> > In this case, the .bbappend is unable to add to that path, e.g.
> > to add a machine specific patch, etc.
> 
> If the explicit definition calls base_set_filespath, then FILESEXTRAPATHS
> can still be used.

Also a number of the examples given are using .= which should also be 
acceptable and won't interfere with FILESEXTRAPATHS usage in bbappends. 
However the ones that just assign it to a value without base_set_filespath - 
especially when they're covering directories that are already handled by the 
default value of FILESPATH - should be removed.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



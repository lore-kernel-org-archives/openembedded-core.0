Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QYhDQ-000694-82
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Jun 2011 18:20:44 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 20 Jun 2011 09:17:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,395,1304319600"; d="scan'208";a="15966946"
Received: from vorpal.jf.intel.com (HELO [10.7.199.159]) ([10.7.199.159])
	by orsmga002.jf.intel.com with ESMTP; 20 Jun 2011 09:17:02 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jun 2011 09:20:59 -0700
In-Reply-To: <4DFE0FD9.4010400@mvista.com>
References: <cover.1308365562.git.josh@linux.intel.com>
	<f0a7d48483260e9251d74216d7569de1a029d035.1308365562.git.josh@linux.intel.com>
	<4DFE0FD9.4010400@mvista.com>
X-Mailer: Evolution 3.0.2 (3.0.2-2.fc15) 
Message-ID: <1308586859.2202.1.camel@vorpal.jf.intel.com>
Mime-Version: 1.0
Subject: Re: [RFC PATCH 2/2] sanity: implement network connectivity test
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
X-List-Received-Date: Mon, 20 Jun 2011 16:20:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-06-19 at 08:03 -0700, Jeremy Puhlman wrote:
> > +    test_uris= ["http://yoctoproject.org/about",
> > +                "https://eula-downloads.yoctoproject.org/crownbay/crownbay-bernard-5.0.0",
> > +                "git://git.yoctoproject.org/yocto-firewall-test;protocol=git;rev=HEAD"]
> > +    retval = ""
> 
> These should probably be set as setable from the meta data. It is a
> reasonable default, but hard coding it with out a way to change it is
> probably not what we want.

Agreed.

> 
> > +
> > +    # Only check connectivity if network and this check enabled
> > +    # Because it's a fairy heavy test allow disabling of just this sanity test
> > +    # by setting DISABLE_NETWORK_SANITY
> > +    data = bb.data.createCopy(d)
> > +    network_disabled = not bb.data.getVar('BB_NO_NETWORK', data, True)
> > +    check_disabled = bb.data.getVar('DISABLE_NETWORK_SANITY', data, True)
> > +    if check_disabled or network_disabled:
> 
> Completely minor gnit. The copy here isn't needed until you start
> setting the DL_DIR. Why not wait til after the check to see if we need
> to do it.

Good catch!

> 
> Otherwise seem like a solid idea.
> 

Thanks for the review Jeremy, v2 on it's way later today.

Cheers,
Joshua
-- 
Joshua Lock
        Yocto Project Build Monkey
        Intel Open Source Technology Centre




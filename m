Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Rci0p-0003Gn-9G
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 19:32:35 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Dec 2011 10:25:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="89174704"
Received: from rmoore1-desk5.amr.corp.intel.com (HELO [10.7.199.156])
	([10.7.199.156])
	by orsmga002.jf.intel.com with ESMTP; 19 Dec 2011 10:25:31 -0800
Message-ID: <4EEF8199.9090007@linux.intel.com>
Date: Mon, 19 Dec 2011 10:25:29 -0800
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <201112170258.10212.schnitzeltony@gmx.de>
In-Reply-To: <201112170258.10212.schnitzeltony@gmx.de>
Subject: Re: require *.bbappend
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
X-List-Received-Date: Mon, 19 Dec 2011 18:32:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

On 16/12/11 17:58, Andreas Müller wrote:
> Hi
> 
> I have the following use case:
> 
> In my working layer I would like to have a recipe adding functionality to a 
> recipe from another layer (e.g systemd-image.bb from angstrom) with a different 
> name ( -> no bbappend ). How about
> 
> * create systemd-image.bbapend with just 'FILESEXTRAPATHS := "${THISDIR}"' to 
> get it into the scope of my layer
> * create a recipe  which contains 'require systemd-image.bbappend'
> 
> Currently parser complains that systemd-image.bbappend is not a BitBake file. 

I think this should work and the issue you're seeing is that require
wants a relative PATH from BBPATH.

i.e. require recipes-images/angstrom/systemd-image.bb

Cheers,
Joshua
-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre



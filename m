Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R6fva-0000SA-2p
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 11:50:46 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 Sep 2011 02:45:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,422,1312182000"; d="scan'208";a="53084133"
Received: from unknown (HELO helios.localnet) ([10.255.14.247])
	by azsmga001.ch.intel.com with ESMTP; 22 Sep 2011 02:45:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Dmitry Eremin-Solenikov" <dbaryshkov@gmail.com>
Date: Thu, 22 Sep 2011 10:45:22 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <1316630404-10336-1-git-send-email-dbaryshkov@gmail.com>
	<1316670516.13622.30.camel@ted>
	<CALT56yMOnRAYnGFozDaO6_sjN9=iReVrwyDzOUqwkLS6oZMS5g@mail.gmail.com>
In-Reply-To: <CALT56yMOnRAYnGFozDaO6_sjN9=iReVrwyDzOUqwkLS6oZMS5g@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201109221045.22340.paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 17/17] package.bbclass: make unshipped files a fatal error
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
X-List-Received-Date: Thu, 22 Sep 2011 09:50:46 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 22 September 2011 07:36:23 Dmitry Eremin-Solenikov wrote:
> Nice idea! On the rights of a feature request:
> It would be nice to allow user to:
> 1) specify the severity of the QA problems (warn, error, fatal) on a
> global + per-qa-check level

To affect the severity of warnings on a global basis you should be able to use 
ERROR_QA / WARN_QA, although I have not tried this.

> 2) specify an override for some of the checks, so that the packager
> can specify that
> e.g. QA check for .so links in a non-dev packages should be ignored
> for cgroups-pam package for /lib/security/pam*.so lib.

For per-package, you can set for example INSANE_SKIP_${PN} += "dev-so" to 
disable the .so links in non-dev package QA warning.

More details (e.g. the name for each QA check) can be found in insane.bbclass.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



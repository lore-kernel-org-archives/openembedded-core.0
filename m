Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SAHQE-0005CF-TU
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 10:01:35 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 21 Mar 2012 01:52:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="119911532"
Received: from unknown (HELO helios.localnet) ([10.252.123.190])
	by orsmga001.jf.intel.com with ESMTP; 21 Mar 2012 01:52:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Wed, 21 Mar 2012 08:52:37 +0000
Message-ID: <333082295.tACmPZfEAB@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <4F6948EC.5050309@windriver.com>
References: <4F6948EC.5050309@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: runqemu doesn't work with graphics through ssh
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
X-List-Received-Date: Wed, 21 Mar 2012 09:01:35 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 21 March 2012 11:20:12 Robert Yang wrote:
> The runqemu doesn't work with graphics through ssh, here are the
> reproduce steps:
> 
> 1) ssh -X (or -Y) to a host
> 2) runqemu qemux86
> 
> The qemu window would leap and leap, and can't be closed by click
> the "close" button or "crtl-c".
> 
> the "runqemu nographic qemux86"
> 
> This happens on: Fedora 13 64bit and Ubuntu 11.10 64bit, the ssh connection
> is from Ubuntu 11.10 32bit.

I regularly do this from my Fedora 14 64-bit my machine to my Ubuntu 11.10 32-
bit machine and do not have any such problem. Has this just started happening 
for you or had you not tried this configuration until now?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



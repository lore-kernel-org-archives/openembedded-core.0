Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UXRAf-0001H3-ES
	for openembedded-core@lists.openembedded.org;
	Wed, 01 May 2013 09:09:49 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 30 Apr 2013 23:51:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,587,1363158000"; d="scan'208";a="330536160"
Received: from unknown (HELO helios.localnet) ([10.255.12.178])
	by fmsmga002.fm.intel.com with ESMTP; 30 Apr 2013 23:51:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 01 May 2013 07:51:50 +0100
Message-ID: <1427152.sXvBYQKc3Y@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-19-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <91BED47F-18E9-4E12-AED1-0137D93E9251@gmail.com>
References: <cover.1367340369.git.paul.eggleton@linux.intel.com>
	<c4a83801dc67074b524dd33c56ba9eed819def6f.1367340369.git.paul.eggleton@linux.intel.com>
	<91BED47F-18E9-4E12-AED1-0137D93E9251@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/5] bitbake.conf: set SERIAL_CONSOLES from SERIAL_CONSOLE by default
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
X-List-Received-Date: Wed, 01 May 2013 07:09:50 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 30 April 2013 14:42:46 Khem Raj wrote:
> On Apr 30, 2013, at 9:52 AM, Paul Eggleton <paul.eggleton@linux.intel.com> 
wrote:
> > This is the first step in deprecating SERIAL_CONSOLE without affecting
> > machine configurations that still use it.
> 
> Did you mean deprecating SERIAL_CONSOLES or SERIAL_CONSOLE

I mean deprecating SERIAL_CONSOLE. SERIAL_CONSOLES is the newer replacement, 
supporting multiple consoles e.g.

SERIAL_CONSOLES = "115200;ttyS0 38400;ttyS1"

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



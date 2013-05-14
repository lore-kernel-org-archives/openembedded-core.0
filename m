Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UcGhm-0004wy-FQ
	for openembedded-core@lists.openembedded.org;
	Tue, 14 May 2013 16:59:58 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 14 May 2013 07:41:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,671,1363158000"; d="scan'208";a="337413271"
Received: from unknown (HELO helios.localnet) ([10.255.12.153])
	by fmsmga002.fm.intel.com with ESMTP; 14 May 2013 07:41:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 May 2013 15:41:40 +0100
Message-ID: <3105853.8sfX5FGQrr@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-19-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <CAMKF1srAGRK=9BP5VrqhH50VrtWb+PFL5G5P-EEBPefb16xxTA@mail.gmail.com>
References: <1368513918-16448-1-git-send-email-raj.khem@gmail.com>
	<1368525912.25898.15.camel@ted>
	<CAMKF1srAGRK=9BP5VrqhH50VrtWb+PFL5G5P-EEBPefb16xxTA@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pam: Add libtirpc to build dependencies
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
X-List-Received-Date: Tue, 14 May 2013 15:00:06 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 14 May 2013 07:33:49 Khem Raj wrote:
> On Tuesday, May 14, 2013, RicharPurdie <richard.purdie@linuxfoundation.org>
> wrote:
> > On Mon, 2013-05-13 at 23:45 -0700, Khem Raj wrote:
> >> libtirpc is looked for by configure and if found
> >> its enabled. So lets make it consistent and enable
> >> it always
> >> 
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >> 
> >>  meta/recipes-extended/pam/libpam_1.1.6.bb |    2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > What is the benefit of this dependency?
> 
> When building from sstate the build of libpam would fail during configure
> if the machine who populated sstate had libtirpc staged before building
> libpam and with high parallelism its quite often

Understood, but the question was what is the benefit of the added dependency on 
libtirpc; i.e. should we really be explicitly enabling this or explicitly 
disabling it?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3942E6F534
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Mar 2014 10:48:27 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 13 Mar 2014 03:48:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,646,1389772800"; d="scan'208";a="497657704"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.120.214])
	by fmsmga002.fm.intel.com with ESMTP; 13 Mar 2014 03:48:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Chong Lu <Chong.Lu@windriver.com>
Date: Thu, 13 Mar 2014 10:48:26 +0000
Message-ID: <2030673.Kzq9aKKzPX@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.3 (Linux/3.13.6-200.fc20.x86_64; KDE/4.12.3; x86_64; ; )
In-Reply-To: <3035449.StOc9XfpzV@peggleto-mobl5.ger.corp.intel.com>
References: <cover.1394093112.git.Chong.Lu@windriver.com>
	<5321803B.90400@windriver.com>
	<3035449.StOc9XfpzV@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] dbus: fix a hard dependency about dbus-ptest
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Mar 2014 10:48:28 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 13 March 2014 10:01:10 Paul Eggleton wrote:
> On Thursday 13 March 2014 17:54:03 Chong Lu wrote:
> > On 03/06/2014 06:04 PM, Burton, Ross wrote:
> > > On 6 March 2014 08:06, Chong Lu <Chong.Lu@windriver.com> wrote:
> > >> +PACKAGES += "dbus-ptest"
> > >> +ALLOW_EMPTY_${PN}-ptest = "1"
> > >> +RDEPENDS_${PN}-ptest = "${@base_contains('IMAGE_FEATURES',
> > >> 'ptest-pkgs',
> > >> 'dbus-test-ptest', 'dbus-test', d)}"
> > > 
> > > Clearly I wasn't thinking clearly last week.  You can't check
> > > IMAGE_FEATURES in a non-image recipe so this isn't a good solution.
> > 
> > Do you have any suggestion about this issue?
> > If we don't check IMAGE_FEATURES, I have no way to resolve this problem
> > that only build but not install ptest. I'm very confused.
> 
> This should check DISTRO_FEATURES, not IMAGE_FEATURES.

Actually even a check on DISTRO_FEATURES may not be needed; if ${PN}-ptest is 
not in PACKAGES then RDEPENDS_${PN}-ptest should be ignored completely.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


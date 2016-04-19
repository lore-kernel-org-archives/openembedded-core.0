Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 007E860088
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 02:44:34 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP; 18 Apr 2016 19:44:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,504,1455004800"; d="scan'208";a="87677109"
Received: from sadnan1-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.175.36])
	by fmsmga004.fm.intel.com with ESMTP; 18 Apr 2016 19:44:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Apr 2016 14:44:15 +1200
Message-ID: <2128894.poWFMP4dMf@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.4.6-301.fc23.x86_64; KDE/4.14.18; x86_64; ;
	)
In-Reply-To: <CACS+7ZTFxKWOtWW4G07i0q8J5a9jWKmKfu_hamPLQZRwcfYXmQ@mail.gmail.com>
References: <1460485532-13735-1-git-send-email-danismostlikely@gmail.com>
	<CAJTo0La7Avjd3-LCBmE_cdqx1Nf47URDnj_iOrd9-7hM6wJWuA@mail.gmail.com>
	<CACS+7ZTFxKWOtWW4G07i0q8J5a9jWKmKfu_hamPLQZRwcfYXmQ@mail.gmail.com>
MIME-Version: 1.0
Cc: yocto-security@yoctoproject.org
Subject: Re: [PATCH 3/3] git: update to 2.8.1
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
X-List-Received-Date: Tue, 19 Apr 2016 02:44:35 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On the other hand, AFAICT we are currently still vulnerable to a remote code
execution issue:

  https://ma.ttias.be/remote-code-execution-git-versions-client-server-2-7-1-cve-2016-2324-cve-2016-2315/

Given we provide git for native use in the buildtools as well as on target
I think we really ought to be addressing this before release. Whether we
should do that by upgrading to 2.7.4 or attempting to apply patches I'm
not sure.

Cheers,
Paul

On Tue, 12 Apr 2016 13:48:26 Dan McGregor wrote:
> Works for me. I'm not in a hurry.
> 
> On 12 April 2016 at 13:41, Burton, Ross <ross.burton@intel.com> wrote:
> > Far too late for master/krogoth, this can be merged after they've
> > branched.
> > 
> > Ross
> > 
> > On 12 April 2016 at 19:25, Dan McGregor <danismostlikely@gmail.com> wrote:
> >> From: Dan McGregor <dan.mcgregor@usask.ca>
> >> 
> >> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> >> ---
> >> 
> >>  meta/recipes-devtools/git/git_2.7.2.bb | 11 -----------
> >>  meta/recipes-devtools/git/git_2.8.1.bb | 11 +++++++++++
> >>  2 files changed, 11 insertions(+), 11 deletions(-)
> >>  delete mode 100644 meta/recipes-devtools/git/git_2.7.2.bb
> >>  create mode 100644 meta/recipes-devtools/git/git_2.8.1.bb
> >> 
> >> diff --git a/meta/recipes-devtools/git/git_2.7.2.bb
> >> b/meta/recipes-devtools/git/git_2.7.2.bb
> >> deleted file mode 100644
> >> index 3fd7151..0000000
> >> --- a/meta/recipes-devtools/git/git_2.7.2.bb
> >> +++ /dev/null
> >> @@ -1,11 +0,0 @@
> >> -require git.inc
> >> -
> >> -EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
> >> -
> >> ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
> >> -                 "
> >> -EXTRA_OEMAKE += "NO_GETTEXT=1"
> >> -
> >> -SRC_URI[tarball.md5sum] = "162ddc6c9b243899ad67ebd6b1c166b1"
> >> -SRC_URI[tarball.sha256sum] =
> >> "58959e3ef3046403216a157dfc683c4d7f0dd83365463b8dd87063ded940a0df"
> >> -SRC_URI[manpages.md5sum] = "7bb067d6363f537b92c3b8b813ff9ed6"
> >> -SRC_URI[manpages.sha256sum] =
> >> "e6b5481fd6e24a1d1b155ef17363b313d47025bf6da880737fa872ab78e24f15"
> >> diff --git a/meta/recipes-devtools/git/git_2.8.1.bb
> >> b/meta/recipes-devtools/git/git_2.8.1.bb
> >> new file mode 100644
> >> index 0000000..8978b72
> >> --- /dev/null
> >> +++ b/meta/recipes-devtools/git/git_2.8.1.bb
> >> @@ -0,0 +1,11 @@
> >> +require git.inc
> >> +
> >> +EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
> >> +
> >> ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
> >> +                 "
> >> +EXTRA_OEMAKE += "NO_GETTEXT=1"
> >> +
> >> +SRC_URI[tarball.md5sum] = "1a12555182c1e9f781bc30a5c5f9515e"
> >> +SRC_URI[tarball.sha256sum] =
> >> "cfc66324179b9ed62ee02833f29d39935f4ab66874125a3ab9d5bb9055c0cb67"
> >> +SRC_URI[manpages.md5sum] = "60552f15a90b9fcdc1b92b222e2d2379"
> >> +SRC_URI[manpages.sha256sum] =
> >> "df46de0c172049f935cc3736361b263c5ff289b77077c73053e63ae83fcf43f4"
> >> --
> >> 2.8.1
> >> 
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 

Paul Eggleton
Intel Open Source Technology Centre


Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E486D601E3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 12:13:44 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 20 May 2015 05:13:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,464,1427785200"; d="scan'208";a="496032952"
Received: from tkkaskin-mobl3.ger.corp.intel.com (HELO [10.252.2.251])
	([10.252.2.251])
	by FMSMGA003.fm.intel.com with ESMTP; 20 May 2015 05:13:42 -0700
Message-ID: <1432124022.3930.9.camel@tkkaskin-mobl3.ger.corp.intel.com>
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Wed, 20 May 2015 15:13:42 +0300
In-Reply-To: <1432123669.28910.57.camel@linuxfoundation.org>
References: <1431952843-25139-1-git-send-email-tanu.kaskinen@linux.intel.com>
	<1431952843-25139-2-git-send-email-tanu.kaskinen@linux.intel.com>
	<1432123669.28910.57.camel@linuxfoundation.org>
Organization: Intel Finland Oy - BIC 0357606-4 - PL 281, 00181 Helsinki
X-Mailer: Evolution 3.10.4 (3.10.4-4.fc20) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/5] alsa-plugins: initial recipe
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
X-List-Received-Date: Wed, 20 May 2015 12:13:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-05-20 at 13:07 +0100, Richard Purdie wrote:
> On Mon, 2015-05-18 at 15:40 +0300, Tanu Kaskinen wrote:
> > When PulseAudio is installed, alsa-plugins is needed to provide
> > compatibility for ALSA applications.
> > 
> > The dependencies are set up so that pulseaudio-server depends on
> > alsa-plugins-pulseaudio-conf, and alsa-plugins-pulseaudio-conf depends
> > on the PulseAudio plugins. This should make the ALSA->PulseAudio
> > compatibility configuration work out of the box, while leaving the
> > PulseAudio specific configuration out on systems that don't have
> > pulseaudio-server installed.
> > 
> > Signed-off-by: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
> > ---
> >  .../recipes-multimedia/alsa/alsa-plugins_1.0.29.bb | 81 ++++++++++++++++++++++
> >  meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |  5 ++
> >  2 files changed, 86 insertions(+)
> >  create mode 100644 meta/recipes-multimedia/alsa/alsa-plugins_1.0.29.bb
> 
> Running this through the autobuilder revealed:
> https://autobuilder.yoctoproject.org/main/builders/nightly-ipk/builds/303/steps/BuildImages/logs/stdio
> which I'm guessing comes from this patch but I haven't bisected.

Yep, Ross already complained about the same thing. A fix is forthcoming.

-- 
Tanu



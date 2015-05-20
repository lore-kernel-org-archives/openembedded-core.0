Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 274F2601E3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 11:27:09 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 20 May 2015 04:27:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,464,1427785200"; d="scan'208";a="496015064"
Received: from tkkaskin-mobl3.ger.corp.intel.com (HELO [10.252.2.251])
	([10.252.2.251])
	by FMSMGA003.fm.intel.com with ESMTP; 20 May 2015 04:27:09 -0700
Message-ID: <1432121229.3930.4.camel@tkkaskin-mobl3.ger.corp.intel.com>
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 20 May 2015 14:27:09 +0300
In-Reply-To: <CAJTo0LYu+bbDe+ybzfKcZ-xk-=YAaTNX7enkVyAvdwOubNm7Pw@mail.gmail.com>
References: <1431952843-25139-1-git-send-email-tanu.kaskinen@linux.intel.com>
	<1431952843-25139-2-git-send-email-tanu.kaskinen@linux.intel.com>
	<CAJTo0LYu+bbDe+ybzfKcZ-xk-=YAaTNX7enkVyAvdwOubNm7Pw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - PL 281, 00181 Helsinki
X-Mailer: Evolution 3.10.4 (3.10.4-4.fc20) 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 20 May 2015 11:27:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-05-20 at 10:00 +0100, Burton, Ross wrote:
> 
> On 18 May 2015 at 13:40, Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
> wrote:
>         When PulseAudio is installed, alsa-plugins is needed to
>         provide
>         compatibility for ALSA applications.
>         
>         The dependencies are set up so that pulseaudio-server depends
>         on
>         alsa-plugins-pulseaudio-conf, and alsa-plugins-pulseaudio-conf
>         depends
>         on the PulseAudio plugins. This should make the
>         ALSA->PulseAudio
>         compatibility configuration work out of the box, while leaving
>         the
>         PulseAudio specific configuration out on systems that don't
>         have
>         pulseaudio-server installed.
> 
>  * satisfy_dependencies_for: Cannot satisfy the following dependencies
> for alsa-plugins-dev:
>  * alsa-plugins (= 1.0.29-r0) * 
>  * opkg_install_cmd: Cannot install package alsa-plugins-dev.

Oops! In the future, when adding any new packages, I probably should try
building images with those packages installed.

> There's a default RDEPENDS_${PN}-dev = ${PN}, but as alsa-plugins
> doesn't exist that isn't very useful.  Then again shipping the .la
> files for the loadable modules isn't very useful either (Linux doesn't
> need them to load modules, and nothing will link against them).  
> 
> 
> So, instead of:
> 
> 
> +FILES_${PN}-dev += "${libdir}/alsa-lib/*.la"
> 
> 
> 
> we should just delete the .la files in the do_install_append().

Right, the -dev package is obviously pointless in this case. I could
have realized that just by thinking a bit more while writing the
recipe...

-- 
Tanu



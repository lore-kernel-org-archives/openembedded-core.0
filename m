Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1TCWEB-000686-8u
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 15:46:39 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 Sep 2012 06:34:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,423,1344236400"; d="scan'208";a="193060985"
Received: from unknown (HELO [10.255.13.148]) ([10.255.13.148])
	by orsmga001.jf.intel.com with ESMTP; 14 Sep 2012 06:34:02 -0700
Message-ID: <1347629642.19399.124.camel@empanada>
From: Tom Zanussi <tom.zanussi@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 14 Sep 2012 08:34:02 -0500
In-Reply-To: <CAJTo0LYHQjL=2vSP=SNcT9csSd8vyGm=d-9_8TRh5SC18h7bCg@mail.gmail.com>
References: <cover.1347534093.git.paul.eggleton@linux.intel.com>
	<6ccf7a1f517e37ce7a8467f4a2432b1ae957e837.1347534093.git.paul.eggleton@linux.intel.com>
	<5052CE86.6030302@linux.intel.com>
	<CAJTo0LYHQjL=2vSP=SNcT9csSd8vyGm=d-9_8TRh5SC18h7bCg@mail.gmail.com>
X-Mailer: Evolution 3.4.1 (3.4.1-2.fc17) 
Mime-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] gst-ffmpeg: add LICENSE_FLAGS
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
X-List-Received-Date: Fri, 14 Sep 2012 13:46:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-09-14 at 10:23 +0100, Burton, Ross wrote:
> On 14 September 2012 07:28, Saul Wold <sgw@linux.intel.com> wrote:
> > ERROR: Nothing RPROVIDES 'gst-ffmpeg' (but
> > /srv/home/pokybuild/yocto-autobuilder/yocto-slave/meta-intel-gpl/build/yocto/meta-intel/common/recipes-multimedia/gstreamer/gst-va-intel.bb
> > RDEPENDS on or otherwise requires it)
> 
> That's interesting, I wasn't aware gst-va required ffmpeg.  At the
> most it should be a recommends as elements are pluggable, and to be
> honest I'm pretty sure that's a bad dependency.
> 

So some of the meta-intel BSPs add this as RRECOMMENDS to get video
acceleration support under gstreamer:

MACHINE_EXTRA_RRECOMMENDS += "gst-va-intel"

and that adds a runtime dependency on gst-ffmpeg, which in turn uses a
local ffmpeg that does this to enable video video acceleration:

        --enable-vaapi \

but also does this to avoid being 'commercial':

        --enable-gpl \

So unless there's something that requires gst-ffmpeg to be commercial, I
don't think gst-ffmpeg actually needs commercial LICENSE_FLAGS.  What
was the reason it was added now after all this time in the first place?

Tom

> Ross
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core





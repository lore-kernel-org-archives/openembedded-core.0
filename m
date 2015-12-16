Return-Path: <sgw@linux.intel.com>
X-Greylist: delayed 568 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 16 Dec 2015 22:03:34 UTC
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 2D71370016
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 22:03:34 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 16 Dec 2015 13:54:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,438,1444719600"; d="scan'208";a="14492285"
Received: from mlmcgint-mobl.amr.corp.intel.com ([10.252.195.82])
	by fmsmga004.fm.intel.com with ESMTP; 16 Dec 2015 13:54:06 -0800
Message-ID: <1450302846.3199.211.camel@linux.intel.com>
From: Saul Wold <sgw@linux.intel.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 16 Dec 2015 13:54:06 -0800
In-Reply-To: <CAP71Wjz2XDTzzd0pO6FAXAc715QDaxY+FyOk_NoFOfoCoaOptg@mail.gmail.com>
References: <1450294001-6610-1-git-send-email-sgw@linux.intel.com>
	<CAP71Wjz2XDTzzd0pO6FAXAc715QDaxY+FyOk_NoFOfoCoaOptg@mail.gmail.com>
X-Mailer: Evolution 3.18.1 (3.18.1-1.fc23) 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libdrm: Upgrade to 2.4.64
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
X-List-Received-Date: Wed, 16 Dec 2015 22:03:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2015-12-16 at 21:32 +0100, Nicolas Dechesne wrote:
> On Wed, Dec 16, 2015 at 8:26 PM, Saul Wold <sgw@linux.intel.com>
> wrote:
> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> > ---
> >  meta/recipes-graphics/drm/{libdrm_2.4.62.bb => libdrm_2.4.64.bb} |
> > 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >  rename meta/recipes-graphics/drm/{libdrm_2.4.62.bb =>
> > libdrm_2.4.64.bb} (92%)
> > 
> > diff --git a/meta/recipes-graphics/drm/libdrm_2.4.62.bb
> > b/meta/recipes-graphics/drm/libdrm_2.4.64.bb
> > similarity index 92%
> > rename from meta/recipes-graphics/drm/libdrm_2.4.62.bb
> > rename to meta/recipes-graphics/drm/libdrm_2.4.64.bb
> > index ea6305e..cb0efe1 100644
> > --- a/meta/recipes-graphics/drm/libdrm_2.4.62.bb
> > +++ b/meta/recipes-graphics/drm/libdrm_2.4.64.bb
> 
> why not 2.4.65 which is the current most recent release?
> 
My bad, will refresh for 2.4.65, looked in the wrong place!

> > @@ -12,8 +12,9 @@ DEPENDS = "libpthread-stubs udev libpciaccess"
> > 
> >  SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
> >             file://installtests.patch "
> > -SRC_URI[md5sum] = "c9291bae0e5ca65d1483821d3698d3ab"
> > -SRC_URI[sha256sum] =
> > "906c294bdbe1c94c3ca084305d61a6e5a8367f3b4986e6cc13b1e9b3f75931dc"
> > +
> 
> Is this extra line intentional?
> 
Yes, we would typically separate the SRC_URI from the checksums for
easier reading. A predominant number of recipes have the space.

Sau!


> > +SRC_URI[md5sum] = "543b2d28359cf33974fa0e772dd61732"
> > +SRC_URI[sha256sum] =
> > "b60786fe7d6e42adb3966ce1a658f63fec528d537396381cbda93bcc99a934b6"
> > 
> >  inherit autotools pkgconfig
> > 
> > --
> > 2.5.0
> > 
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core


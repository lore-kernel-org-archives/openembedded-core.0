Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7413261A47
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 15:42:28 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 20 Jun 2013 08:42:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,905,1363158000"; d="scan'208";a="356835956"
Received: from unknown (HELO helios.localnet) ([10.252.122.59])
	by orsmga002.jf.intel.com with ESMTP; 20 Jun 2013 08:42:28 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 20 Jun 2013 16:42:27 +0100
Message-ID: <1402287.LPEgl0HhT9@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.3 (Linux/3.8.0-25-generic; KDE/4.10.3; i686; ; )
In-Reply-To: <CAP71WjzvRgqYtJdBVt_epRVZ5bb4aVbPiEq8z4fw-EfEsnVgGg@mail.gmail.com>
References: <CAP71WjxJxpWwa5UV4PpN=f0rL00UpPJ_VKJ4LmEu=AVBRdVo2A@mail.gmail.com>
	<CAP71WjzvRgqYtJdBVt_epRVZ5bb4aVbPiEq8z4fw-EfEsnVgGg@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Issues with Qt5/mesa and eglfs
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
X-List-Received-Date: Thu, 20 Jun 2013 15:42:28 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Nicolas,

On Thursday 20 June 2013 09:46:36 Nicolas Dechesne wrote:
> resending on proper mailling list, +cc Paul as it's dylan related.
> 
> 
> On Thu, Jun 20, 2013 at 9:15 AM, Nicolas Dechesne <
> 
> nicolas.dechesne@linaro.org> wrote:
> > hi there,
> > 
> > i am trying to build Qt5/meta-qt5 with dylan branch in a non X11 distro,
> > and i got failures during the Qt5 configure step (when auto-detecting EGL
> > feature). Looking into the issue, the good news is that it seems to be
> > fixed in oe-core/master with:
> > 
> > d7033f4 mesa: upgrade to 9.1.3
> > 
> > thanks to this :
> >     Add EGL-Mutate-NativeDisplayType-depending-on-config.patch to build
> > 
> > correctly in
> > 
> >     a non-X11 environment.
> >     
> >     Drop dont-fail-if-libX11-isnt-installed.patch and
> >     fix-egl-compilation-without-x11-headers.patch as they were backports.
> > 
> > Would you guys consider 'backporting' this patch onto dylan a viable
> > thing? I will make the backport, but it would be nice if you can confirm
> > that it can be merged in dylan.

I wasn't watching closely but my impression is there were a large number of 
changes associated with the mesa upgrade. Is the upgrade itself necessary for 
the fix?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


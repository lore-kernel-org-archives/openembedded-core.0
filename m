Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TQNqt-0006tz-MU
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 21:39:55 +0200
Received: from mail-ie0-f197.google.com ([209.85.223.197])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 22 Oct 2012 12:26:03 -0700
Received: by mail-ie0-f197.google.com with SMTP id 9so8433916iec.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2012 12:26:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=L4j5nZmcHq0hHR0g4MVdcFgdnfAUnRPQqjcxF2wM3xQ=;
	b=hY4546fKvL2t3NJxrFaFVunIp0w8jYHG7wf5yihVxIJdv8Xq6YP21oG5ltkN2wtvcm
	NcUeVBz0e8Q+aYVYi2dq3eZaUx5hi1f7yH3hMVLL0OGG3C5sTAPifKwTlCIWnOjAX5i/
	FUsf/C4/QV/5X/kHsk1ddOXifG2OyLLW7VLUFwrK+GfMb/pIElwhvh2p3NMGCazdLWZg
	85O8j93RtgiTeLstEfgeUPOddv3sOvPGSRY+sSRMEtrWNOC3TgruyfQdxk8qWHSEsRbe
	U9KNGldg3HnMt1XtLi1jHne+9W0cicesXbCQgTHXDqEKTKaDJgQe10W1FSHlH1GJ18rV
	8/8w==
Received: by 10.60.170.15 with SMTP id ai15mr9017855oec.62.1350933988408;
	Mon, 22 Oct 2012 12:26:28 -0700 (PDT)
Received: by 10.60.170.15 with SMTP id ai15mr9017848oec.62.1350933988339; Mon,
	22 Oct 2012 12:26:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.46.70 with HTTP; Mon, 22 Oct 2012 12:26:08 -0700 (PDT)
In-Reply-To: <1350927160.3259.343.camel@phil-desktop>
References: <CAJTo0LboPRF7Oxnwh8QS6b6ReS-1-P+=r04L54QRptPnHfV5oQ@mail.gmail.com>
	<1350927160.3259.343.camel@phil-desktop>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 22 Oct 2012 20:26:08 +0100
Message-ID: <CAJTo0LbGCeaYa5a5C=y1nzPONKFggpJkmorODdXkad4CDDC5cA@mail.gmail.com>
To: Phil Blundell <philb@gnu.org>
X-Gm-Message-State: ALoCoQkQueNLPyNEKCpbK44xBrhTYCL6j8io4ClJvIUWV9pxMDg7O3tF88q8qx2uVHxPefqqCE38ijY50LswfGjKb2Xu5dCY6oj1P2uTXNKYKWPWqHSLqAeSXbByWB/KXPDUUC1oFcudyHqQSGfVqYF6PCVNP0Fpwdqp8PAbNK6j4NjyIStdjA3R9AywoEoX8GgDJRL9c/1k
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [RFC] OpenGL packaging/staging policy
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
X-List-Received-Date: Mon, 22 Oct 2012 19:39:55 -0000
Content-Type: text/plain; charset=UTF-8

On 22 October 2012 18:32, Phil Blundell <philb@gnu.org> wrote:
> Different GL libraries will have different vendor extensions and Mesa's
> headers won't necessarily know about them.  If the vendor ships the
> extension bits in a custom header (rather than jamming them into a
> modified glext.h) then this could be worked around by staging the
> headers separately, but you're still left with the problem that Mesa's
> libGL.so might now be missing symbols that are required during
> linking.

This was a concern, and this is a RFC for a reason.

In my (admittedly limited) experience, it's fairly common for
applications to treat vendor's GL headers are references and
copy/paste the bits they want for this exact reason.  Imaging a game
engine that wants to use a nVidia extension *and* and ATI extension
(depending on the runtime environment) that isn't yet in the standard
GL headers - it can't be expected to compile against both GL
implementations.

If there's a clear popular example of an application that insists to
be built against a specific vendor's GL and that behaviour can't be
described as broken (and fixed with a few lines of patch), then this
is a solid counter-argument.

Ross



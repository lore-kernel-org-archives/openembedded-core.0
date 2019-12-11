Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
	[209.85.219.65])
	by mail.openembedded.org (Postfix) with ESMTP id 79D007DE74
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2019 22:25:20 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id p2so123833qvo.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2019 14:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5t0hiA9JDyjUvZ4VPV8moFdGxgkcR17Fz4n5K65g/Eo=;
	b=nl0pOfpXhp46+bi+XDjYMk23dHApxH28YfFKOryYuVmtdk8eKxFaXcv9KbY5iEOh6r
	o5yU1TfNrcP+DvpFtKB4lwf9i0zP/+s9x09KZ2WkzFBE40Hai3qbUuogPq0zCBZa8ndQ
	CTA+1ebH/cFBRT+DX5vx9ciLKBd7M7fkD8rVtYBzlg0l1GCilCsXTTLza6U6YG3tj0Ke
	axBlZEZyU9XsJOymqZ/fwmzK41Q0d5yB0hL6FhJ1njzlYC8mdo+v+NhuF1iRIqQgluDm
	iDVYFb6sbZ9MleXPNl7juXsOqawxzJKK0Nxx2201ZdC3EcWvTwzLkE9eDOZZfd3yJjsc
	DNiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5t0hiA9JDyjUvZ4VPV8moFdGxgkcR17Fz4n5K65g/Eo=;
	b=Q42YsO8Cyj9yc4OLiz8NYY+u1bTzOgIoapKmm1id9u0zzDWqId4nVzDoskN+nCgnxX
	1U8qHl9Ol3zCSprHQ6HmqY32YhO1FOPn+UysJUy98TlMvW26+q7f+Wf+RI7Bt5smar0j
	msFtaK5PYUo3oG+1nNwmPEB3ofPFUwPRiJvFh0XByOk2Uo5QCCcVSr3140ZSRxvj45Pl
	OowcogR/glTpbE936g43GQPFocBKOPgINIDpBpE7S8BCV/zvpcLpeQZBxs6RwYcMjSLq
	+IE2FfX9R7fKidLdC/ezQM8/jR7t7bNFHDcVPFRsGy5Qdr79eMecx5m3HQPCCzLAsh1a
	rogA==
X-Gm-Message-State: APjAAAVTr7P3B/fBfATi4iIK+fHl7uTkZq+HRS98W6NeVa+oWFtpQ1Nw
	6M55hj+a0aLqDSFXW8XROHUC8V46qQAYn6IFiG0=
X-Google-Smtp-Source: APXvYqzKxZOrcIPtE+pFNHw4QL38858tZKIi4xdhNxaSFA6w6jbDCRfumt85tflZeR/1aVzv5I00SJsL2HnxRKzxVkE=
X-Received: by 2002:ad4:478b:: with SMTP id z11mr5376440qvy.185.1576103120886; 
	Wed, 11 Dec 2019 14:25:20 -0800 (PST)
MIME-Version: 1.0
References: <20191211172334.11377-1-twoerner@gmail.com>
	<CAMKF1srKC=Z5r56=hZj5Q7trKW+LG-NDp7JqLXZqaoWGcDqinQ@mail.gmail.com>
	<ba1800a3-2a7c-fc40-dcb2-1dc75db15970@intel.com>
In-Reply-To: <ba1800a3-2a7c-fc40-dcb2-1dc75db15970@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Dec 2019 14:24:54 -0800
Message-ID: <CAMKF1sqhPFHDxZEwKxtSZuAVKEmp-CJ8M9dDE-6=S3tYf3Z4Gw@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa.inc: allow the user to choose the build type
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
X-List-Received-Date: Wed, 11 Dec 2019 22:25:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 11, 2019 at 2:13 PM Ross Burton <ross.burton@intel.com> wrote:
>
> On 11/12/2019 18:40, Khem Raj wrote:
> > On Wed, Dec 11, 2019 at 9:23 AM Trevor Woerner <twoerner@gmail.com> wrote:
> >>
> >> Upstream mesa can either be built as a debug release (the default) or a
> >> production release. This patch allows the user to choose which one they
> >> want by setting MESA_BUILD_TYPE to either 'production' or 'debug' as
> >> they see fit. Under OpenEmbedded a production build will be performed by
> >> default.
> >>
> >> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> >> ---
> >>   meta/recipes-graphics/mesa/mesa.inc | 13 +++++++++++++
> >>   1 file changed, 13 insertions(+)
> >>
> >> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> >> index 5838207e6b..9ad9f2e370 100644
> >> --- a/meta/recipes-graphics/mesa/mesa.inc
> >> +++ b/meta/recipes-graphics/mesa/mesa.inc
> >> @@ -46,6 +46,19 @@ export WANT_LLVM_RELEASE = "${MESA_LLVM_RELEASE}"
> >>
> >>   MESA_LLVM_RELEASE ?= "${LLVMVERSION}"
> >>
> >> +# set the MESA_BUILD_TYPE to either 'release' (default) or 'debug'
> >> +# by default the upstream mesa sources build a debug release
> >> +# here we assume the user will want a release build by default
> >> +MESA_BUILD_TYPE ?= "release"
> >> +def check_buildtype(d):
> >> +    _buildtype = d.getVar('MESA_BUILD_TYPE')
> >> +    if _buildtype not in ['release', 'debug']:
> >> +        bb.fatal("unknown build type (%s), please set MESA_BUILD_TYPE to either 'release' or 'debug'" % _buildtype)
> >> +    if _buildtype == 'debug':
> >> +        return 'debugoptimized'
> >> +    return 'plain'
> >> +MESON_BUILDTYPE = "${@check_buildtype(d)}"
> >> +
> >
> > Should this also be controlled with DEBUG_BUILD knob
>
> Not convinced.  From what Trevor said on IRC, a Mesa debug build is more
> than just symbols but full on debug output.

I understand that.
DEBUG_BUILD and DEBUG_OPTIMIZATION are two different things
I am not saying tie it to DEBUG_OPTIMIZATION
>
> Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


Return-Path: <elizabeth.flanagan@intel.com>
Received: from mail-vb0-f48.google.com (mail-vb0-f48.google.com
	[209.85.212.48])
	by mail.openembedded.org (Postfix) with ESMTP id 8403E61AD1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 19:20:00 +0000 (UTC)
Received: by mail-vb0-f48.google.com with SMTP id w15so4888245vbf.21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jul 2013 12:20:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=sOKfm1zH4t6GQqId6jptWyk/asLdhZhWf+z0ohXHKc0=;
	b=lyvTStkRfDYX5mz+FHs0kAistn3YVMWcbFPFgw07mcIuXpFXjxTVIk05X94qYSFoMb
	Ck3/M2YSTCj+jEnD70JxVbDgxOlQT5/eyo7a59oegnJwnqslRJlbdj8iGcj2il9cfhtA
	b+Ss2csfY1pi4OsZhQEVqQmtJbhTDhD7ruTB7IbrJNrA0H4S+dnSuMJ3lyr1fAH72a33
	rOmT/Y4Ez1B/BvCbK4YvM2nQkcIUQvfprfZHIr8u+cu0pf7SpHUz50oRBemIljSkTeuF
	J8T486OYSA4g4X8eg7sCTI0pZXnI6HevhGBIarIwPW+EH1DvD5+Eqa5955XBG+2sn3qS
	1bcw==
MIME-Version: 1.0
X-Received: by 10.221.4.4 with SMTP id oa4mr11793663vcb.70.1372792800995; Tue,
	02 Jul 2013 12:20:00 -0700 (PDT)
Received: by 10.52.114.170 with HTTP; Tue, 2 Jul 2013 12:20:00 -0700 (PDT)
In-Reply-To: <1372791267.2074.25.camel@pb-ThinkPad-R50e>
References: <1372787148-9023-1-git-send-email-elizabeth.flanagan@intel.com>
	<1372791267.2074.25.camel@pb-ThinkPad-R50e>
Date: Tue, 2 Jul 2013 12:20:00 -0700
Message-ID: <CAPhnLPBiYU6CGXZV-Y8khPD593iGO5AtgHMeFRMHtf3hG8jNnw@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Phil Blundell <pb@pbcl.net>
X-Gm-Message-State: ALoCoQmQ649dqlFB5WVFD2b0IswW8lmyuaRxrigOdMHUHHpr/rtziaWBMcIr0IKXNvsUy9Q52aPC
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] layer.conf: Bumping LAYERVERSION_core
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
X-List-Received-Date: Tue, 02 Jul 2013 19:20:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

This goes back to my RFC:

http://comments.gmane.org/gmane.comp.handhelds.openembedded.core/39016

As we are removing meta-toolchain* and replacing it with bitbake
<imagename> -c populate_sdk this causes issues with those of us who
need to do automated builds both on the current development branch and
on prior development branches.

Example: For prior releases, I need to build meta-toolchain*. Without
having a simple way to figure out where this is no longer the case, I
(and other folks who run automated builds) end up having to jump
through a lot of hoops trying to figure out where this layer changed.
Utilizing LAYERVERSION_* to do it makes sense as there is a
significant change that would cause issues for build engineers. Prior
to this I was utilizing LCONF, which was the wrong solution, but just
happened to work in the example I'm thinking of.

-b

On Tue, Jul 2, 2013 at 11:54 AM, Phil Blundell <pb@pbcl.net> wrote:
> On Tue, 2013-07-02 at 10:45 -0700, Elizabeth Flanagan wrote:
>> Bumping LAYERVERSION_core to denote where meta-toolchain* is being
>> depreciated.
>
> This commit message doesn't provide much explanation of what exactly is
> going on and why this constitutes "significant changes that will
> cause compatibility issues with other layers".  Can you clarify?
>
> thanks
>
> p.
>
>



-- 
Elizabeth Flanagan
Yocto Project
Build and Release


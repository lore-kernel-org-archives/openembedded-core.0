Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f177.google.com (mail-ob0-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 8238561A47
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2013 00:33:35 +0000 (UTC)
Received: by mail-ob0-f177.google.com with SMTP id ta17so7771731obb.22
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 17:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=Gzv9+/JjJtDgcq3OBAKUNzfvWKz5IwZxjGWZJEnff3I=;
	b=HlPpSXyBzj7zOQr/4mCgLaarmGeQnhWtSCTU+YtWWAP3dm/RKSaRqfxlelHHcLZvuv
	vYApX502umHfvc/jJXYIXafO0eJ/5jX3tk/xBcHs8KP8GvzBLUcqTsFes+tKWYnuA3kQ
	cnE9bief1+mk3vLwwKYVKMKmHAFziTye4EpyfTN8SW6O8ce9XEqpFijuORQgAo+eGbeh
	psfhUUTxo5MEQxhw/QxBN6fY4Oj86IPUQvAQT5+0NV7pEmQeKGV3bYAkUByC724moNAs
	lHovdNkfMNGMYsCOFzebcg5YhwBiBXPjtP31nWQjcUsM1xc13h8sIvs+Ur90mB24gU10
	S+Zw==
MIME-Version: 1.0
X-Received: by 10.182.61.105 with SMTP id o9mr2524231obr.54.1371774815843;
	Thu, 20 Jun 2013 17:33:35 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.98.133 with HTTP; Thu, 20 Jun 2013 17:33:35 -0700 (PDT)
In-Reply-To: <CAPhnLPBBK1=GohMDVCSGseg=DWn_Ac32p+UjjbGff585rWTG_w@mail.gmail.com>
References: <CAPhnLPBBK1=GohMDVCSGseg=DWn_Ac32p+UjjbGff585rWTG_w@mail.gmail.com>
Date: Thu, 20 Jun 2013 21:33:35 -0300
X-Google-Sender-Auth: 3QCGYADPbZ8rzR3ROwHKZAVbOjQ
Message-ID: <CAP9ODKoKYJ+nzTjPoNCdFA9OxEDpTzmeNiEUb7HChgvYEv0irQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Utilizing LAYERVERSION_ to identify breaking changes to a layer
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
X-List-Received-Date: Fri, 21 Jun 2013 00:33:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jun 20, 2013 at 7:56 PM, Flanagan, Elizabeth
<elizabeth.flanagan@intel.com> wrote:
> I know I've run into this issue and I'm going to bet that other folks
> have as well.
>
> When running some sort of continuous integration system (in my case,
> yocto-autobuilder), I need to build to at least two releases back. The
> problem is, sometimes, local.conf and bblayers.conf requirements
> change, for example, a layer needs a BBMASK for the prior release but
> can't have it for the current one or a layer gets split so that I need
> to add two directories to BBLAYERS as opposed to just the one that I
> used a few commits back. I currently have no great way of figuring
> that out and it has causes immense amounts of pain.

I am sorry but I didn't follow what it will help. Can you please
provide an example?

I always thought the right way to handle it is to have a branch...

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


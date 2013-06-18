Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f53.google.com (mail-vb0-f53.google.com
	[209.85.212.53])
	by mail.openembedded.org (Postfix) with ESMTP id A6C0E601DB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 14:56:27 +0000 (UTC)
Received: by mail-vb0-f53.google.com with SMTP id p12so2884916vbe.26
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 07:56:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=bvpe2XDrrUQcCAj5yaYLi+O8UFmKVDRSVlMzG+HoiF4=;
	b=gu0AdGCbxLJsvgJa1c/nO9Tx9/61f74QG6tb79Tt+S2lEXTHeHcQoxN2OqIybm2YIx
	5d7+lPx+hNdoonN+h6myaeyPqBI5PfmTbzNuJL0jVKsJ4C4Jb7+iPI0x7VphuErPlTHZ
	X3/xQs866Yuj6qAKgXvamgPEPStHgi9fmyvnFcdXmMqAlVCTiRKoNClmuGd63GHz28Sa
	oGVIuegB1rEm+kf0yK1YUfRvmt9dVY7L5D9Lh6sHc4IdZWF83AI60e201XtyhRSJAAFG
	B8F9w9jJ8iKii61iUwG6CHLwUkTHSvEgH3VQp6TciqvcrrSugYiKd+YH8bfQYUOeZxps
	qq2Q==
X-Received: by 10.52.29.179 with SMTP id l19mr1696772vdh.51.1371567387964;
	Tue, 18 Jun 2013 07:56:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Tue, 18 Jun 2013 07:56:06 -0700 (PDT)
In-Reply-To: <1371566573.6580.59.camel@phil-desktop.brightsign>
References: <CAJTo0LbHu=CyeCL=yvyBrUtc0i==ybVXQSXDVkVqMy4jsyoEfg@mail.gmail.com>
	<1371566573.6580.59.camel@phil-desktop.brightsign>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 18 Jun 2013 15:56:06 +0100
Message-ID: <CAJTo0LZD46Gckm=PGRw2NdSBibREWUzJbG_zhVtcAAqtAunn+w@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
X-Gm-Message-State: ALoCoQnXRmeV5sG75cjV2hBpH0vyHLAWwkhb6bNZIsuAgDNv9uVSQ6NAdRNVU7SCVW0ca9B06T7C
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: magic libtool .la removal
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
X-List-Received-Date: Tue, 18 Jun 2013 14:56:27 -0000
Content-Type: text/plain; charset=UTF-8

On 18 June 2013 15:42, Phil Blundell <pb@pbcl.net> wrote:
> FWIW, I still have the patch from:
>
> http://lists.openembedded.org/pipermail/openembedded-core/2012-October/069912.html
>
> in my local tree and it seems to be working fine (although I don't have
> any particular interest in libltdt so it's conceivable that this might
> be broken).

I also remember discussion with Colin Walters about ostree, which at
one point only removed from $libdir itself (my "libdir" argument) but
now removes all .la files.  Colin, the commit that changed the la
killing to recurse didn't have a rationale - can you clarify this?  If
ostree can get away with removing all, them maybe we don't need the
"libdir" option at all.

Ross


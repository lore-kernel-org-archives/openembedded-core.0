Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f54.google.com (mail-vb0-f54.google.com
	[209.85.212.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6EA376007C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 09:54:22 +0000 (UTC)
Received: by mail-vb0-f54.google.com with SMTP id q12so4543247vbe.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 02:54:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=OCivlZdwYURdMi2m8N/R7f2Qm7pWGJMv818trres4dw=;
	b=lTeFwbHevSPEoqUiUSUMyW4gSwFYD4kterqAe0PvybYTOnskiArhd8fglNQwu+oKHb
	vMZmJ8QNSxGQtWkAOTCr+ABpoC7LBkyupQGOFmpPy4CKIZFJQRugy9BF9IxrSF4k5jTB
	g69xt+Iu9pby6wAmgBwEgnRzTFkNtpjtujTyBqfVTmyEAMjWfi9xPanjSFaSIe9GGyj3
	L1A8dlfKh3AzC5dfYhlUIvLaCsmVefKUbH1jSuY0JugA5E/6ktvyM4+nL/euMvpvvM/s
	O1eaDWgPDNdN5M4IipNUISKDJ2NxomCQRpXJRoVKSBzv5eTFwBez1L6p6reOWGjZxoyp
	QNRA==
X-Received: by 10.58.181.225 with SMTP id dz1mr2588693vec.95.1371722062841;
	Thu, 20 Jun 2013 02:54:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Thu, 20 Jun 2013 02:54:02 -0700 (PDT)
In-Reply-To: <1371710061.8611.26.camel@pb-ThinkPad-R50e>
References: <1371693296-6834-1-git-send-email-net147@gmail.com>
	<1371710061.8611.26.camel@pb-ThinkPad-R50e>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Jun 2013 10:54:02 +0100
Message-ID: <CAJTo0Lauq-sL5=JQzqE=Nf2dvOZe+o8x1Kqb3B+dkPn0V5fA6Q@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
X-Gm-Message-State: ALoCoQmlIApgvacoB2i0R5ziIWYWXhSZkzg0bqPRo5LDizeNfo8SbJxp0tOpTlc5fbm3GSktChrS
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libx11: enable Xcms by default
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
X-List-Received-Date: Thu, 20 Jun 2013 09:54:23 -0000
Content-Type: text/plain; charset=UTF-8

On 20 June 2013 07:34, Phil Blundell <pb@pbcl.net> wrote:
> The comment that you are deleting suggests that this behaviour is by
> design:
>
>> -# Let people with incredibly archaic requirements enable Xcms, but disable it by
>> -# default.
>
> Since there's already a PACKAGECONFIG option for this, can't you just
> enable that in your distro configuration rather than changing the
> default?  I don't think it's ever been the expectation that the default
> settings will represent "maximum functionality".

That comment is from me, but I'm actually coming around to enabling
Xcms by default and letting people who care about the size increase
turn it off.  As Jonathan discovered, it's entirely possible to use
Xcms without knowing it - whilst the colour management bit is likely
never used, the colour parsing code is.

Ross


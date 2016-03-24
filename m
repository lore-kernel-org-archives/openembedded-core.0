Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 17EEA60110
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 18:32:06 +0000 (UTC)
Received: from elite.brightsigndigital.co.uk ([213.210.30.29]
	helo=phil-desktop) by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <pb@pbcl.net>)
	id 1ajA3B-0000SZ-N5; Thu, 24 Mar 2016 19:32:06 +0100
Message-ID: <1458844322.3476.198.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Andre McCurdy <armccurdy@gmail.com>, Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Mar 2016 18:32:02 +0000
In-Reply-To: <CAJ86T=VjwZD9qKnhyX6-0xHQVRph1e0FSkwR7OWWJPQsvnOnnQ@mail.gmail.com>
References: <1458789553-3629-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1spVnsTtz4Wwa562aVaafzSUR3tJrrvstRGjRhT-VGOUAw@mail.gmail.com>
	<CAJ86T=X4fDmNRjWv4nNPX3U3+Ak=z+2psGtTgFvt4-ga7b_sEg@mail.gmail.com>
	<CAMKF1sofsW2HYMNzDOc9WKKs2ADejfX+VcwqaYx5fEof4g6ngQ@mail.gmail.com>
	<CAJ86T=VjwZD9qKnhyX6-0xHQVRph1e0FSkwR7OWWJPQsvnOnnQ@mail.gmail.com>
X-Mailer: Evolution 3.18.3-1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-configure-common.inc: duplicate armv7a over-ride for armv8a
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
X-List-Received-Date: Thu, 24 Mar 2016 18:32:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2016-03-24 at 10:37 -0700, Andre McCurdy wrote:
> 
> Renaming armv8a -> aarch32 is going to affect almost every line in
> the patch. We should probably drop the current patch from master-
> next.

"AArch32" applies retrospectively to all older versions of the ARM
architecture as well, so it's not obvious to me that a straight rename
of the existing "armv8a" override to "aarch32" would be the right thing
either. 

I think the whole approach to ARMv8 and AArch64 in OE needs to be
carefully thought through before we start landing any patches for that
stuff.  We have a tangled enough maze of overrides right now and I
think we should make all efforts to avoid it getting worse.

p.



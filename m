Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 32823770CF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 10:49:58 +0000 (UTC)
Received: from cpc5-cmbg17-2-0-cust97.5-4.cable.virginm.net ([86.30.112.98]
	helo=phil-desktop)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1Zmg6f-0005Bs-Ua; Thu, 15 Oct 2015 12:49:58 +0200
Message-ID: <1444906192.5251.63.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Jens Rehsack <rehsack@gmail.com>, OE-core
	<openembedded-core@lists.openembedded.org>
Date: Thu, 15 Oct 2015 11:49:52 +0100
In-Reply-To: <AEAA8709-CF45-4759-BDEF-24201C0B19DE@gmail.com>
References: <AEAA8709-CF45-4759-BDEF-24201C0B19DE@gmail.com>
X-Mailer: Evolution 3.16.5-1 
Mime-Version: 1.0
Subject: Re: [PATCH 2/2] ARM: handle missing thumb suffix
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
X-List-Received-Date: Thu, 15 Oct 2015 10:49:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-10-13 at 22:37 +0200, Jens Rehsack wrote:
> When enabling tune for arm926ejs, poky optionally appends suffixes 
> for thumb and dsp support. Since sometimes arm926ejse (ARM code) and 
> sometime arm926ejste (thumb code) is used in PACKAGE_ARCH, allow 
> both.

It seems like it is a bug for "arm926ejste" ever to be showing up in
PACKAGE_ARCH, and it would be better to fix the packaging code to not
do that.  ARM926EJ-S is a CPU not an architecture.

p.



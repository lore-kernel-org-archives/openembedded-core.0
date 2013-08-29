Return-Path: <walters@verbum.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
	[66.111.4.28])
	by mail.openembedded.org (Postfix) with ESMTP id 658586B275
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 11:35:22 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.mail.srv.osa [10.202.2.45])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 7C53621D73;
	Thu, 29 Aug 2013 07:35:21 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute5.internal (MEProxy); Thu, 29 Aug 2013 07:35:21 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=subject:from:to:cc:in-reply-to:references
	:content-type:date:message-id:mime-version
	:content-transfer-encoding; s=smtpout; bh=KuKeLkFB5cUD4YWHEZHrGX
	BoAyk=; b=EJ1UDLfx6DqTM7h7W1SvkhtVUlbMZQHHpCsB+ilyYs50+bCeGNxTrE
	XDRF6VouyrP2ONLPexdXxkszWECGLz4BQUbp3BLzZOxkfnGHFBYDCg1nDh7YfGrZ
	G1eJdSgHox5byM6rmKEbAHJi5nVY6YUk8yM4MjCVKg/bR0Db8Q88k=
X-Sasl-enc: gqTW+i4BSdV0TkfGMFJjJuBTyXc4AQ/f+FykmKjZb1KD 1377776121
Received: from [192.168.1.2] (unknown [66.31.18.51])
	by mail.messagingengine.com (Postfix) with ESMTPA id 1F17D680090;
	Thu, 29 Aug 2013 07:35:21 -0400 (EDT)
From: Colin Walters <walters@verbum.org>
To: "Stanacar, StefanX" <stefanx.stanacar@intel.com>
In-Reply-To: <1377775123.9984.7.camel@firebird.rb.intel.com>
References: <cover.1372413711.git.stefanx.stanacar@intel.com>
	<3047815ee6268db95c3916960eb31508fb7729f6.1372413711.git.stefanx.stanacar@intel.com>
	<1375732226.4750.25.camel@localhost>
	<1377775123.9984.7.camel@firebird.rb.intel.com>
Date: Thu, 29 Aug 2013 07:35:20 -0400
Message-ID: <1377776120.20072.16.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 (2.32.3-21.el6) 
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 5/8] lib/oeqa/utils/qemurunner.py: class to handle qemu instance
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
X-List-Received-Date: Thu, 29 Aug 2013 11:35:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-08-29 at 11:18 +0000, Stanacar, StefanX wrote:

> That sounds really cool, nice job! 
> I might be wrong but doesn't that require virtio support in the target
> kernel (which is something we can't expect to have)?

Yes...although you could do the same over TCP, it'd just require more
gymnastics on the host and guest side.   The driver is just 12k here on
this RHEL6 box; I have it built in to the kernel for my OE target so I
don't know how large it is offhand there.





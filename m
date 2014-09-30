Return-Path: <walters@verbum.org>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id 162EE715B5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 13:26:41 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by gateway2.nyi.internal (Postfix) with ESMTP id EF54E20971
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 09:26:42 -0400 (EDT)
Received: from web2 ([10.202.2.212])
	by compute5.internal (MEProxy); Tue, 30 Sep 2014 09:26:42 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:x-sasl-enc:from:to:cc
	:mime-version:content-transfer-encoding:content-type:in-reply-to
	:references:subject:date; s=smtpout; bh=Qsa1QLCGTTjaBB1/JZi0n6sB
	fhE=; b=CBEy0zmcXpWyTjH5tYuJiuP9r+ZN2ONP8otSQ8nvAHJl3xfk034jG0jB
	7TQTUOCDP5/MN3n6sH+/KLsCfKl7RjyAwIgll7w4RZVKFrXkSIIiiKCHV3wpd5as
	r8341TcnfrPI2CyPDYbyoHmx6/ry65YPnARmUls2/rLHdhOainE=
Received: by web2.nyi.internal (Postfix, from userid 99)
	id CE020540122; Tue, 30 Sep 2014 09:26:42 -0400 (EDT)
Message-Id: <1412083602.3102889.173435581.79A86724@webmail.messagingengine.com>
X-Sasl-Enc: mG6RG/+KaVuo96ptm+sB8bsNYC41IpXs3wOPc39u32IS 1412083602
From: Colin Walters <walters@verbum.org>
To: "Burton, Ross" <ross.burton@intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>
MIME-Version: 1.0
X-Mailer: MessagingEngine.com Webmail Interface - ajax-3bf5bee3
In-Reply-To: <CAJTo0Lb8k5W3dwfgtodG=zh9GEFr4CBdzd+BOav7jV=s9vHCQQ@mail.gmail.com>
References: <1411802545-17081-1-git-send-email-koen@dominion.thruhere.net>
	<1411802545-17081-2-git-send-email-koen@dominion.thruhere.net>
	<1412024343.2853314.173154429.5067015A@webmail.messagingengine.com>
	<18401A03-E69C-43BB-9956-13955179B13A@dominion.thruhere.net>
	<CAJTo0Lb8k5W3dwfgtodG=zh9GEFr4CBdzd+BOav7jV=s9vHCQQ@mail.gmail.com>
Date: Tue, 30 Sep 2014 09:26:42 -0400
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] systemd 216: add system user factory files to CONFFILES
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
X-List-Received-Date: Tue, 30 Sep 2014 13:26:43 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain

On Tue, Sep 30, 2014, at 05:36 AM, Burton, Ross wrote:
> On 30 September 2014 08:39, Koen Kooi <koen@dominion.thruhere.net> wrote:
> > The real question is: do we want to keep changes to these files on package upgrade or wipe them out?
> 
> They're in /usr, so they get overwritten.

The reason I mention this is in the OSTree model at least, /usr is
*always* a readonly bind mount, and mutation is not permitted by admins.
 If something is insufficient with the handling of /etc here, let's get
that fixed in upstream systemd.




Return-Path: <tanuk@iki.fi>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
	[66.111.4.28])
	by mail.openembedded.org (Postfix) with ESMTP id 001EB7763A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2016 19:52:36 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 6E5DA20216
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2016 15:52:37 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute1.internal (MEProxy); Tue, 06 Sep 2016 15:52:37 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-sasl-enc:x-sasl-enc; s=smtpout; bh=P+2BYbzo6UHXdNz
	b0AU/RdCLczA=; b=GXS0ER48gT9Aq+ENCghoJlSJIwdCrM7rGwu5GRkBZYFaq6Q
	HEzGu+YWypc830Nky9m4cRlAmw5wy/iZ0p7r8d8gBSFcblI5IKXrGLcbVB+7wxho
	Mzhkk3+mWeFR+vSIYdzlUtXnur36XDueLJz84XV6RF7jyvaiLBdLlMgGUGNE=
X-Sasl-enc: 1bm2rvKgD3dLWelPLdsL4vc83ngfugnEGBZwTp47GVtQ 1473191557
Received: from laptop (a88-113-211-72.elisa-laajakaista.fi [88.113.211.72])
	by mail.messagingengine.com (Postfix) with ESMTPA id E5F5DCCDB8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2016 15:52:36 -0400 (EDT)
Message-ID: <1473191555.3099.7.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Tue, 06 Sep 2016 22:52:35 +0300
In-Reply-To: <8545e7af-49ad-8975-01d6-ed9d2cc6c577@gmail.com>
References: <1470256891-20386-1-git-send-email-tanuk@iki.fi>
	<1473156037.3139.82.camel@iki.fi>
	<8545e7af-49ad-8975-01d6-ed9d2cc6c577@gmail.com>
X-Mailer: Evolution 3.20.5-1 
Mime-Version: 1.0
Subject: Re: [PATCH][krogoth] pulseaudio: fix crash when disconnecting bluetooth devices
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
X-List-Received-Date: Tue, 06 Sep 2016 19:52:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-09-06 at 08:44 -0700, akuster808 wrote:
> 
> On 09/06/2016 03:00 AM, Tanu Kaskinen wrote:
> > 
> > Ping? I sent this patch for krogoth (and a similar patch for jethro)
> > about a month ago, but it hasn't been applied yet. This is the first
> > time I'm sending patches for past releases - are there other hoops to
> > jump through than adding the [krogoth] tag to the mail subject?
> I have this sitting in my krogoth-next contrib branch. Did that right 
> before my holiday so I did not send out a message.
> 
> should be in the next pull request I do.

Thanks! I was just too impatient, then :)

-- 
Tanu


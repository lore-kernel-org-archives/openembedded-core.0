Return-Path: <tanuk@iki.fi>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id B421275CF1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 13:49:59 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id BF06A22B47
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 09:49:58 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute4.internal (MEProxy); Tue, 15 Sep 2015 09:49:58 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-sasl-enc:x-sasl-enc; s=smtpout; bh=zbuUfDThgFtncco
	cHW5fQiysYf0=; b=fLiZUXc+4xKZqgjPq+242aYFN6Vgzca4uLTs3cCXaeja2g2
	xt3oF9rJwdt75/3J4DKNvhqEvLWrK7tpBqRvtEjbduKh7MiUZNgcWARTl0lWtMkl
	ZAaSGPL88zLjlHhbziRmGISfkAM/M8Ri2uCdtT866xfswJpv5OSzSP1xvUt8=
X-Sasl-enc: EI/HASuCtpWrUk/7Hbz5B2q7BRjPuvhsDq5UMPCX2KLW 1442324998
Received: from laptop (a88-114-110-232.elisa-laajakaista.fi [88.114.110.232])
	by mail.messagingengine.com (Postfix) with ESMTPA id 2C0AE680176;
	Tue, 15 Sep 2015 09:49:58 -0400 (EDT)
Message-ID: <1442324997.1922.7.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: Andrew Shadura <andrew.shadura@collabora.co.uk>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 15 Sep 2015 16:49:57 +0300
In-Reply-To: <55F814DC.2050403@collabora.co.uk>
References: <1440666021-11411-1-git-send-email-andrew.shadura@collabora.co.uk>
	<1442227275-19855-1-git-send-email-andrew.shadura@collabora.co.uk>
	<1442317009.1922.4.camel@iki.fi> <55F814DC.2050403@collabora.co.uk>
X-Mailer: Evolution 3.16.5-1 
Mime-Version: 1.0
Subject: Re: [PATCH v3 1/2] dbus: add user sessions support
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
X-List-Received-Date: Tue, 15 Sep 2015 13:49:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-09-15 at 14:53 +0200, Andrew Shadura wrote:
> On 15/09/15 13:36, Tanu Kaskinen wrote:
> > I think user-session should be enabled by default when systemd is in
> > DISTRO_FEATURES. Some services, e.g. PulseAudio, can fully enable their
> > systemd integration only if dbus is compiled with --enable-user
> > -session.
> 
> I think so too, but I think it's worth a separate patch, right?

I think this patch could already have it "right", but I don't really
mind either way.

-- 
Tanu


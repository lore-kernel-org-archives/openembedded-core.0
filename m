Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1URjHG-0002Qf-0R
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 15:17:09 +0200
Received: from compute5.internal (compute5.nyi.mail.srv.osa [10.202.2.45])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 33DCF20B33;
	Mon, 15 Apr 2013 08:59:31 -0400 (EDT)
Received: from frontend2.nyi.mail.srv.osa ([10.202.2.161])
	by compute5.internal (MEProxy); Mon, 15 Apr 2013 08:59:31 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=subject:from:to:cc:in-reply-to:references
	:content-type:date:message-id:mime-version
	:content-transfer-encoding; s=smtpout; bh=hNCsJZhLM98aTfl4fRKNGO
	K2xA8=; b=UI2GXXAWT4AWmF3YF7MFjQcygwimRxAGJjEIxKBQJc92ywAUemuqtv
	TfnJHWupt16LiEOcyyH6L8bGBCo2f3LYbnodk3IB5h446QCZc6DpcBx2zw+B1AQL
	gYTHY5s8Jck+h1ztxfTm9RRu9RNMD3EpMzX3wkBZzzgx5cVDHriFQ=
X-Sasl-enc: zUhOMNhlPuMvs3ZRhsCS507jsb4p/V7AMUjgxAzojnOo 1366030770
Received: from [10.0.0.87] (unknown [46.65.197.113])
	by mail.messagingengine.com (Postfix) with ESMTPA id 6C0EE200148;
	Mon, 15 Apr 2013 08:59:30 -0400 (EDT)
From: Colin Walters <walters@verbum.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1366028557.8670.34.camel@ted>
References: <1365848719.16702.74.camel@ted>
	<1365944532.5651.12.camel@localhost>  <1365953596.8670.9.camel@ted>
	<1366020508.2896.16.camel@localhost>  <1366025504.8670.30.camel@ted>
	<1366027932.32176.4.camel@localhost>  <1366028557.8670.34.camel@ted>
Date: Mon, 15 Apr 2013 08:59:28 -0400
Message-ID: <1366030768.32176.9.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 (2.28.3-30.el6) 
Cc: mclasen@redhat.com,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdk-pixbuf: Fix libpng determinism issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Apr 2013 13:17:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-04-15 at 13:22 +0100, Richard Purdie wrote:
> On Mon, 2013-04-15 at 08:12 -0400, Colin Walters wrote:
> > On Mon, 2013-04-15 at 12:31 +0100, Richard Purdie wrote:
> > 
> > > It will make our builds work again for now until the next time someone
> > > upgrades libpng and and then it will potentially silently start using an
> > > old version in some builds :(.
> > 
> > So something like the attached on top of the previous patch?
> > 
> > If this looks good I'll push both to master.
> 
> Looks good to me, thanks!

Both pushed to git, thanks.

<nag>
If OE was building from git as it should, your original patch could have
been a ready-to-upstream "git format-patch" style instead of the default
"Upstream-Status: inappropriate" non-git patches =/
</nag>











Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDACCD1CDC6
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 14:29:32 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8903.1765290570966630812
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Dec 2025 06:29:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=p67SJocQ;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZJh9U4VoDpckj7OM+U0zrSgOQOv06ChnaMgNsGkCLfA=; b=p67SJocQk/nAMMOTxRY0VCYUI6
	221d52Zr+T6rWprY9U07HirSHO8gqz+rDGhaB65wp+ovVByaunSGoUkySdmcLWjy9i6wHkT7ljncs
	Cv7bMXS/aaOUXl7Arhw8TrOoMNzPVVv2xUOa3t/AEcp/uuONrK9lp/VuXjD28ZO9daNsxbbxFmc25
	xqCQfT1cxAsvnAwy9ESuBfz7/ViAMQp11oStGLa6TQhF9ofizZy+HJY6Q1C+StkOqZQG+D8YvuX/v
	23csPCbBH+jDN9C5jpHW8y1nOMRCGHe1zbijcbkxkvAskJczWTFmTqTZyER6A+Y49uKyOKAnXOxkh
	nYwQBwBw==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:51186 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vSyiX-0000000GVD2-1mTj;
	Tue, 09 Dec 2025 09:29:29 -0500
Date: Tue, 9 Dec 2025 09:31:00 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
    OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] cpio_2.15.bb: delete superfluous ptest RDEPENDS
 on "ptest-runner"
In-Reply-To: <a65db7a8c4cca0cd162e74f57302a038e5935887.camel@linuxfoundation.org>
Message-ID: <afafac9e-cfa9-aa12-a795-1f2e15a04b3a@crashcourse.ca>
References: <f5199a88-ed0b-0423-3aae-61f882f8e6ca@crashcourse.ca>  <e6e064db5ac30f5e711d45b657dfa89f1ad9e2b3.camel@linuxfoundation.org>  <CANNYZj9+ms2uySPOy96hgMgy07rF2eUTLMNfKyQaB=zyXOwzSw@mail.gmail.com>
 <a65db7a8c4cca0cd162e74f57302a038e5935887.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1375832188-1765290669=:306900"
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 14:29:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227442

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1375832188-1765290669=:306900
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 9 Dec 2025, Richard Purdie wrote:

> On Tue, 2025-12-09 at 13:19 +0100, Alexander Kanavin wrote:
> > On Tue, 9 Dec 2025 at 13:06, Richard Purdie via
> > lists.openembedded.org
> > <richard.purdie=linuxfoundation.org@lists.openembedded.org> wrote:
> > > >  DEPENDS:append:class-target = "
> > > > ${@bb.utils.contains('PTEST_ENABLED', '1', 'ptest-runner', '',
> > > > d)}"
> > > >  PACKAGE_WRITE_DEPS:append:class-target = "
> > > > ${@bb.utils.contains('PTEST_ENABLED', '1', 'ptest-runner', '',
> > > > d)}"
> > > >
> > > > -RDEPENDS:${PN}-ptest += "ptest-runner coreutils"
> > > > +RDEPENDS:${PN}-ptest += "coreutils"
> > > The reason is this package requires the user from that dependency,
> > > it
> > > doesn't work without out. That is an RDEPENDS, not a RRECOMMENDS.
> > >
> > > So whilst it isn't too obvious, I'd say the recipe is in fact
> > > correct?
> >
> > ptest-runner dependency is set in three different ways as seen above.
> > Are all three really necessary for ensuring the ptest user
> > requirement
> > is fulfilled?
>
> user group dependencies between recipes are tricky to get right and
> each of the above pieces does appear to fulfil a specific need. I have
> a suspicion that yes, the bits are all needed.
>
> I don't like that 'design' but right now, it is probably where we end
> up.

  i'll have to re-read these last few posts to truly grok what is
happening here, but i appreciate your patience in explaining what is
clearly a bit of an obscure quirk.

rday
--8323329-1375832188-1765290669=:306900--


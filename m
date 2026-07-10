Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9D1FC43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 09:07:54 +0000 (UTC)
Received: from deneb.mcrowe.com (deneb.mcrowe.com [88.97.37.36])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8758.1783674465438791646
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 02:07:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20260328 header.b=iJ4nMUIp;
 spf=pass (domain: mcrowe.com, ip: 88.97.37.36, mailfrom: mac@mcrowe.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20260328; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=xOnL47sBYhHAbf2s2cSOASDB1XAISseXkxaAbmSwbmw=; b=iJ4nMUIpUfnNpw2KwaVIfraqr7
	mBcLHkzVtWsJEN/RQ1GvsgNn6yX0BQ21Qz4yu86omitZzVid5UWQRQaQnDAf2W6lN5xoQGMSWKgAU
	gSZgB8DVrY5TgSVNLLHaLBxcdOkg60xQhReQe7hDEEjBmHh+z3YRNykIxJ4gsZjf4dpI1KOv7j4l2
	Q1ZwlugySkCRKz3ogLszGUv1VryXgHJVfJI5JCHuLFKBqzZMsmyx6w1FVPgEUGKh+LY9LkvUJOa+h
	iInPSbm+xK23h6ycCokIRHSAJPhsBb+vjwV8EZAlzvsgkYfZ/Kd+7yqflWr76gvnj/Vn50cobwEIw
	YnrBwPtg==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.98.2)
	(envelope-from <mac@mcrowe.com>)
	id 1wi7Cw-00000002XqU-33Ln;
	Fri, 10 Jul 2026 10:07:42 +0100
Date: Fri, 10 Jul 2026 10:07:42 +0100
From: Mike Crowe <mac@mcrowe.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	Alex Kiernan <alex.kiernan@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [scarthgap][PATCH] dropbear: Disable DSS correctly
Message-ID: <alC2XjkPiCD1RpJV@mcrowe.com>
References: <20260629165056.2489582-1-mac@mcrowe.com>
 <DJS7O5671XMZ.OZRLCFBNZFYP@smile.fr>
 <ak_xh2CM7n4X8_c_@mcrowe.com>
 <CAO5Uq5Sh7MuFmb=xhQ=kaeyZcBaCDgjfTZ-Uwa25+swo66e3TA@mail.gmail.com>
 <DJUPP65UURBF.TY8K27J2AQTP@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DJUPP65UURBF.TY8K27J2AQTP@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 09:07:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240622

On Friday 10 July 2026 at 09:27:39 +0200, Yoann Congal wrote:
> On Thu Jul 9, 2026 at 9:33 PM CEST, Alex Kiernan wrote:
> > On Thu, Jul 9, 2026 at 8:07 PM Mike Crowe via lists.openembedded.org
> > <mac=mcrowe.com@lists.openembedded.org> wrote:
> >> I wasn't aware that I was expected to add one to the patch itself for a
> >> backport.
> >>
> >> https://docs.yoctoproject.org/scarthgap/contributor-guide/recipe-style-guide.html
> >> doesn't seem to say that a SoB should be added to the patch. It does say:
> >>
> >> | Of course, if another person later takes care of submitting this patch
> >> | upstream, the status should be changed to Submitted [where], and an
> >> | additional Signed-off-by: line should be added to the patch by the person
> >> | claiming responsibility for upstreaming.
> >>
> >> which sort of implies that a SoB should be added for original patches that
> >> are suitable for upstreaming but this patch is a backport which originated
> >> upstream (without a SoB) which isn't the same thing.
> >>
> >> Adding a SoB to an unmodified upstream backport patch feels like
> >> appropriation on my part, but I can do so if that's the policy.

> > You're certifying that the patch you're submitting is appropriately
> > licensed; it says nothing about who authored it.

> I agree with Alex: As the one requesting the backport, you are the one
> signing-off on this particular operation. The original author had
> nothing to do with that.

I thought that I did that with the signed-off-by in the openembedded-core
commit message.

> I created a bug to request clarification in the doc on this point:
> 16356 – Clarify trailers usage (Signed-off-by, ...) in imported patches
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=16356

Thanks. It feels like this needs an equivalent of
oe.qa.check_upstream_status(). Such a check would currently fail since
there are lots of existing patches that lack signed-off-bys and adding them
would be significant work because each one would need to be manually
checked. :( I suppose the check could also allow "Not-signed-off-by:
<openembedded-core@lists.openembedded.org>" or similar as a workaround for
existing patches with a plan to eventually remove it as the patches are
updated.

v2 sent with signed-off-by in the patch.

Thanks.

Mike.


Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41601C4332F
	for <webhook@archiver.kernel.org>; Sun, 10 Oct 2021 17:23:06 +0000 (UTC)
Received: from avasout02.plus.net (avasout02.plus.net [212.159.14.17])
 by mx.groups.io with SMTP id smtpd.web09.977.1633886583597169662
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Oct 2021 10:23:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=YKqFFWAG;
 spf=pass (domain: mcrowe.com, ip: 212.159.14.17, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id ZcXMmpQk5rasdZcXNmYTqI; Sun, 10 Oct 2021 18:23:02 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=dIE9ZNRb c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=kj9zAlcOel0A:10 a=8gfv0ekSlNoA:10 a=Q4-j1AaZAAAA:8 a=-An2I_7KAAAA:8
 a=Z5xjbbde_3SJMFZEfZ8A:9 a=CjuIK1q_8ugA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=Sq34B_EcNBM9_nrAYB9S:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description; bh=/24Z1nQGaiAbnv36kQqgU+6TYBlrDphzkDWTAo7ho4E=; b=YKqFF
	WAGfPMdVRgxW50LJgpACOohDbXFh/RVF4Iixmb2HVmLbPKjFByjWGHDKJ6nYYp8ynB6dP6LJF+vvy
	kM7Q3PLcAEQmVU/UTScthSDtyfGNce+R8AcWu1kTW5Rz5MC3Yl2YCFP2mvfTnThW10v5/wheU1SpQ
	v42eLfJo52lHEQZ7J4JwJKZAt9LpH0pmEE1HqfbFwlV1gdGF+y5whc4OYa9BQNKvsKgpX7j1Mcydo
	Em73drHH4MpkdE1gOu5ZzOJ4f/JzKIyt7VDedM7n0c+myIhv9u8PbDG+le60O9LOC/a1Jw99LLFq1
	cil0snSb+FRh0fdj5lnAh68KrzHPQ==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.94.2)
	(envelope-from <mac@mcrowe.com>)
	id 1mZcXL-00CP2b-UM; Sun, 10 Oct 2021 18:22:59 +0100
Date: Sun, 10 Oct 2021 18:22:59 +0100
From: "mac@mcrowe.com" <mac@mcrowe.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] license: Allow treating missing license as
 error
Message-ID: <YWMhc6fntFOIK29B@mcrowe.com>
References: <20211008085330.3031018-1-mac@mcrowe.com>
 <52fa4ac2b9ae4501aa2a7fe654e43c10@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52fa4ac2b9ae4501aa2a7fe654e43c10@axis.com>
X-CMAE-Envelope: 
 MS4wfL5VCfvOF2BJGXp+/gzV6tCXFVxwgNu4Mn17xDNvf0WCjHDvvXuPfEVtCCgQbEsNL2VIfQUJ1IiOHAQP3TeCmyBj8MQAtoNHYtTRDc37bDoo+y3XWdq8
 xEzh1qjODF78Yt2K1L3pnPpane+rv4NUG3a7D4cKnOvems4hJM5FKzitsN56DP/RrLm1Ma64weTrPg==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Oct 2021 17:23:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156792

On Saturday 09 October 2021 at 15:51:35 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Mike Crowe via
> > lists.openembedded.org
> > Sent: den 8 oktober 2021 10:54
> > To: openembedded-core@lists.openembedded.org
> > Cc: Mike Crowe <mac@mcrowe.com>
> > Subject: [OE-core] [PATCH] license: Allow treating missing license as
> > error
> > 
> > Use mechanism inspired by insane.bbclass to allow individual recipes or
> > other configuration to determine whether a missing licence should be
> > treated as a warning (as it is now) or as an error. This is controlled
> > by whether the error class is in WARN_LICENSE or ERROR_LICENSE.
> > 
> > Use bb.fatal in the error case to ensure that the task really fails. If
> > only bb.error is used then do_populate_lic isn't re-run on subsequent
> > builds which could lead to the error being missed.
> > 
> > Signed-off-by: Mike Crowe <mac@mcrowe.com>
> > ---
> >  meta/classes/license.bbclass | 19 ++++++++++++++++++-
> >  1 file changed, 18 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> > index 45d912741d..1805f18076 100644
> > --- a/meta/classes/license.bbclass
> > +++ b/meta/classes/license.bbclass
> > @@ -12,6 +12,23 @@ LICENSE_CREATE_PACKAGE ??= "0"
> >  LICENSE_PACKAGE_SUFFIX ??= "-lic"
> >  LICENSE_FILES_DIRECTORY ??= "${datadir}/licenses/"
> > 
> > +# Elect whether a given type of error is a warning or error, they may
> > +# have been set by other files.
> > +WARN_LICENSE ?= "no-license"
> > +ERROR_LICENSE ?= ""
> > +WARN_LICENSE[doc] = "Space-separated list of license problems that should be reported only as warnings"
> > +ERROR_LICENSE[doc] = "Space-separated list of license problems that should be reported as errors"
> > +
> > +def package_license_handle_error(error_class, error_msg, d):
> > +    if error_class in (d.getVar("ERROR_LICENSE") or "").split():
> > +        package_qa_write_error(error_class, error_msg, d)
> > +        bb.fatal("License Issue: %s [%s]" % (error_msg, error_class))
> > +    elif error_class in (d.getVar("WARN_LICENSE") or "").split():
> > +        package_qa_write_error(error_class, error_msg, d)
> > +        bb.warn("License Issue: %s [%s]" % (error_msg, error_class))
> > +    else:
> > +        bb.note("QA Issue: %s [%s]" % (error_msg, error_class))
> 
> Change "QA Issue" to "License Issue" for consistency.

Whoops. Thanks for spotting that. I've posted v2 with it fixed.

Mike.


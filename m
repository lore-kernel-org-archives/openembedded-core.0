Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5C6AA793EE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2018 15:49:40 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id f10-v6so3204018wrs.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2018 08:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=1TgJn2Epeas4CdbzdHc2AcZ2vhHUSaY8lNN2nWVzu3s=;
	b=Pu81gbN2yWHoSNOl+eKZedz8NOpKCONap94EIPaoUPLA2eZjBv6DdwVPynFvQZi9Rp
	ibrk3TxDdKtHxJXTXZxlrcUKB53jMFT35U8dRaIaQHXbRv3KlrRy5xZsHZVR3W8feNKY
	X4T68m+YCWfTzofchkzh5Yv/9A/RYrMiJE/TE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=1TgJn2Epeas4CdbzdHc2AcZ2vhHUSaY8lNN2nWVzu3s=;
	b=UC2NQdY/DnfX22FOExp6Iag5JAlZVou/HyZEKA45voPgMh6Tz7IbjNxMsKms0aeiYr
	VSpEqHFV+w89pvHyPpXICrLV4DvHXwOxAR2oTDIKmBh9Ec6QRmwKyPzCQjPb3GC/x+uf
	fgkpk/jQgXcx9zHBRmcgAoR5XBZScOn0h/AC/d1Y8aRdOBhUt+hdPEdkGVD6frHCKiWR
	Rx268GOZLrkItjo8atj3ess+9VPWV73sDTFRG2c8iZhzEVrJAyNQFKMkWnjC17ca1kZA
	paK45HyN8BNsh5QVTugdwctUC/84/X7zTU34RMOof4pawJoOo+r5cpomWbBSnh0cUKOY
	V/xQ==
X-Gm-Message-State: ABuFfoihOM90gw5vR2yJc0s9b5GTq1lymLtlBrx+3tui3BtzBd4WG9JG
	ZpmXFvdnCSdMVJpEasdI9LLXwQ==
X-Google-Smtp-Source: ACcGV63Mom+U2JFrefNaJtsyFuQmLTrkdG+kmGqFIWlm8qze8PorM+QFiiBNzVtn+a0nKZ5PPmYHIg==
X-Received: by 2002:adf:f4ce:: with SMTP id
	h14-v6mr9722249wrp.259.1538063381015; 
	Thu, 27 Sep 2018 08:49:41 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s10-v6sm2349651wrw.35.2018.09.27.08.49.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 27 Sep 2018 08:49:39 -0700 (PDT)
Message-ID: <fa8191d7fe16aa538783377bd40e0ec8f809b8c1.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Mark Hatle <mark.hatle@windriver.com>, mingli.yu@windriver.com, 
	openembedded-core@lists.openembedded.org
Date: Thu, 27 Sep 2018 16:49:38 +0100
In-Reply-To: <23abed17-72c1-e4e0-0bae-b5b35943c2a5@windriver.com>
References: <1538025770-242527-1-git-send-email-mingli.yu@windriver.com>
	<d79e0565cb496dba5c031a3a6c6be7559c9207d2.camel@linuxfoundation.org>
	<23abed17-72c1-e4e0-0bae-b5b35943c2a5@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Subject: Re: [PATCH] sysklogd.inc: add syslogd.8 to ALTERNATIVE_${PN}-doc
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
X-List-Received-Date: Thu, 27 Sep 2018 15:49:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-09-27 at 10:19 -0500, Mark Hatle wrote:
> On 9/27/18 4:36 AM, richard.purdie@linuxfoundation.org wrote:
> > On Thu, 2018-09-27 at 13:22 +0800, mingli.yu@windriver.com wrote:
> > > From: Mark Hatle <mark.hatle@windriver.com>
> > > 
> > > Other recipes, such as meta-networking inetutils
> > > may also provide a man page for syslogd.8.
> > > Use the alternatives mechanism to select the man
> > > page to display.
> > > 
> > > This is a partial revert of commit:
> > > 988aad01b20c18a8850db0ad6dc547525d94116c
> > > 
> > > Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> > > Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> > > ---
> > >  meta/recipes-extended/sysklogd/sysklogd.inc | 6 +++++-
> > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > I'm not sure I like the sound of this. Why would it provide a man
> > page
> > but not the actual tool itself?
> > 
> > At the very least this needs a better explanation but I'm not sure
> > it
> > sounds correct or is something we want to encourage.
> 
> The syslogd 'tool' is provided by both recipes in their respective 'runtime'
> packages.  In the inet case, it is inetutils-syslogd, which has an appropriate
> RCONFLICTS with the syslogd version.  So only one or the other will be
> installed.  This is the conflict resolution the original commit of
> "988aad01b20c18a8850db0ad6dc547525d94116c" was referring to.
> 
> HOWEVER, both syslogd and inetutils each only have a singular 'doc' package.
> (As do most packages it seems.)  Since this is the case, there and syslogd and
> inetutils (not syslogd part) is requested for this configuration -- AND ---
> doc-pkgs are configured in, you get an error of conflicting files.
> 
> Thus a partial revert of the prior work enabled documentation to be installed
> correctly.
> 
> Now does the documentation match whichever package was installed, maybe not...
> but this isn't a big deal as it turns out, since most syslogd share a common set
> of arguments and those are the things a run-time user would query from the man
> pages.
> 
> The only alternative is to start spliting up the docs into their relevant
> subpackages, as we have the runtime items.  But this then complicates the
> doc-pkgs processing and related...

This makes much more sense with more information. Could someone rewrite
the commit message please?

Cheers,

Richard


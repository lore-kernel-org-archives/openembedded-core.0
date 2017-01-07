Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 7325F719C8
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Jan 2017 08:06:59 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id p127so72808878iop.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Jan 2017 00:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=1q7AA5GMLzaCJI8E3qm92sI8PrJb8obPz3S8FiqYB6A=;
	b=W5iPiD8L93D+pNLJgWWGzJu6mPZLDRd/7zU5S7NG6GPAO19sLU4NvGK7szMxtLXSfO
	CpKjrPPsK7MUvMLPsOLE3c7CEbtyO5sYD8W/WA2Se9ajEg4Qs+wnabCWljhkOUQg6zv0
	dcFD3RwDv2kwBTPBlecQT8Z3jfY77v6369N/rDWXYMN8pb1rj2FVEOgUqYO5ot5vw5Ek
	+kx7emSUaECaxG3otaV9BZdUEHUbGBB3lXDFHHdVflC9i7o8URnBbMSV3wJg5kxUHlYw
	wxk8pGN4aqS5oiRRubnPKpAmCsQOy993WxIRUa5mljkN24nyeO8KNkNvCzXhvairfQ7k
	5sDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=1q7AA5GMLzaCJI8E3qm92sI8PrJb8obPz3S8FiqYB6A=;
	b=SP5cIi7ZV4gk/fY7OGbYwYcJrvy4a20a1FQmOoj+ghPg6367znRDyzc1eb0XCF4FT2
	E7S77q2xzOgxltuc9374yINm5n4rqNKeiZsv5RXwmE73hbSE4oYHvzsvwQ0llh2sfn2h
	w06qbZqwE3qzDWTLC5U+v83qrf51wpBxgWzmdhM4bg8ZVuQXzOCACUDe1dSnqrS2nmnA
	sCOGOxGSyd0pf5iVv3sGWxdja5NdNsPDM19SfD1x7qblEaw1voEIF8xHvyEoahuSZnl+
	S26Y69jP1E0fzO9RJmBonbsB2zvm6hNRRbg7aHlvX1wkQ3qwRtKpI2W9chUyg4Xcozbx
	+Dmw==
X-Gm-Message-State: AIkVDXLvFwothq2Th2rsZ09bxeqPFjybFbZRQKesmKV5Vgnlj0IUXXP3N2mcqJ5ZD1GP32C+
X-Received: by 10.107.171.4 with SMTP id u4mr60938635ioe.102.1483776420008;
	Sat, 07 Jan 2017 00:07:00 -0800 (PST)
Received: from pohly-mobl1 (p5DE8F82B.dip0.t-ipconnect.de. [93.232.248.43])
	by smtp.gmail.com with ESMTPSA id
	m128sm2843110itm.16.2017.01.07.00.06.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 07 Jan 2017 00:06:58 -0800 (PST)
Message-ID: <1483776414.4383.22.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Phil Blundell <pb@pbcl.net>
Date: Sat, 07 Jan 2017 09:06:54 +0100
In-Reply-To: <1483737447.4360.180.camel@pbcl.net>
References: <1483630732-3560-1-git-send-email-patrick.ohly@intel.com>
	<1483737447.4360.180.camel@pbcl.net>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] rootfs-postcommands.bbclass: sort passwd entries
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
X-List-Received-Date: Sat, 07 Jan 2017 08:07:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-01-06 at 21:17 +0000, Phil Blundell wrote:
> On Thu, 2017-01-05 at 16:38 +0100, Patrick Ohly wrote:
> > The /etc passwd files in a rootfs consist of the default entries from
> > base-passwd plus anything that gets added by preinst scripts or
> > extrausers.bbclass.
> > 
> > The execution order of preinst scripts is not perfectly
> > deterministic,
> > or at least unrelated changes caused it to change in a
> > non-deterministic way, resulting in irrelevant changes in the order
> > of
> > passwd entries.
> > 
> > Such re-ordering is bad for reproducible builds and file-based update
> > mechanisms like swupd which work best if changes are as minimal as
> > possible.
> > 
> > To achieve that, the files get sorted in a post-processing command,
> > enabled by default.
> 
> Won't the numeric UIDs still be non-deterministic, though?  If the goal
> is reproducible builds then it doesn't sound as though this quite fixes
> the problem.

Yes, but there's already a solution for that problem:
useradd-staticids.bbclass

I was assuming that someone who wants identical files is already using
that. Should it be mentioned in a comment next to the new feature?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.





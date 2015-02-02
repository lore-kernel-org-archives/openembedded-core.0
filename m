Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f169.google.com (mail-yk0-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id 9C32260043
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Feb 2015 20:50:07 +0000 (UTC)
Received: by mail-yk0-f169.google.com with SMTP id 200so22856119ykr.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Feb 2015 12:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=LZHTHnxmsnKG9llRvWL1X23fX4h6dQBdMbgrR2TLUWM=;
	b=wFZmkIHCz4jk9Okr+wQjEU7OzqsjPMwwi+BMVUjhaxJUCEttX0rJ/JkwSpdMUBmZPL
	dCGWP9KTx5LKRzZbyyGI9twCcngIuqjrbWHvdNTmPH5w4JBmHbIsCrvjKxTuXqR6Auis
	viUzIx/xMzLQm0V4nCEZoi0WFPSWE4dP3YneCJtFllc3KM0+lC7AVh7kdPYxgrPwubi4
	VQyPwoxD7j7T0Qv+CGjHHMMnbftFLmPNTPiDHB7LygkrkTY2wfB/35FHcXSyPxkgPqIn
	EP/FVzH9Yll0pBwUPxH+Il9Jo+qZOoDjK8rbP+g77ma5DtH/1MIdmoxs8mDbyc+06jXR
	u/wA==
MIME-Version: 1.0
X-Received: by 10.236.44.70 with SMTP id m46mr9182020yhb.136.1422910208031;
	Mon, 02 Feb 2015 12:50:08 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.143 with HTTP; Mon, 2 Feb 2015 12:50:07 -0800 (PST)
In-Reply-To: <1422713174-18522-2-git-send-email-mike.looijmans@topic.nl>
References: <1422713174-18522-1-git-send-email-mike.looijmans@topic.nl>
	<1422713174-18522-2-git-send-email-mike.looijmans@topic.nl>
Date: Mon, 2 Feb 2015 18:50:07 -0200
X-Google-Sender-Auth: EM1lUM07bwmqtedG1Vvup5RSTXw
Message-ID: <CAP9ODKrsWm4CiaYmP5UJOa_9jm9F+rRNnPTWWe_WXfLXRKrOiA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: Mike Looijmans <milo-software@users.sourceforge.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] fetch2/__init__.py: Make get_srcrev output configurable
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
X-List-Received-Date: Mon, 02 Feb 2015 20:50:09 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Jan 31, 2015 at 12:06 PM, Mike Looijmans
<mike.looijmans@topic.nl> wrote:
> From: Mike Looijmans <milo-software@users.sourceforge.net>
>
> The idea here is to support package version numbering similar to gitpkgv in
> meta-openembedded. This commit is the first step towards such functionality.
>
> The original plan was to add a "get_pretty_srcrev" method to the fetcher, as
> per Richard's suggestion [1]. While writing this, I noticed that it would
> become a copy of get_srcrev with only two lines changed. So to create something
> more Pythonic than a boolean argument and conditionals around the calls to the
> fetcher's sortable_revision, I just made the method to be called on the fetcher
> an argument to the method. Defaulting to 'sortable_revision' prevents affecting
> existing code.
>
> Now if the git fetcher were to implement, say 'gitpkgv_revision' one could
> set the following in a recipe:
>   PKGV="1.2+${@bb.fetch2.get_srcrev(d, 'gitpkgv_revision')}"
> and this would yield the same result as gitpkgv's GITPKGV variable.
>
> See for the discussion leading to this change:
> [1] http://lists.openembedded.org/pipermail/openembedded-core/2015-January/100345.html
>
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>

I do enjoyed all the design but the way to set the PKGV.

Maybe we could have a way to do it more transparently? Any idea how?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


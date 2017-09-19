Return-Path: <twoerner@gmail.com>
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6EB2877E06
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 16:57:22 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id s18so267226qta.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 09:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jOnXlg61KSObvJIkK3w1xCjNdEwIgcjQtUAh3aoBnXg=;
	b=Jb+zWay0e2YXr5XBo/39YtMU+um0AD/iaM1NQkoFwmrR8gPFW6/8JXzKLwoOXFKZjK
	Dn+mmSvyLYOFnfevK7u/0y+D6vtJYQbtRKnVA6LdHQkj4Y/BbW5cAgor++U9aKhYO5HT
	GiR6AgQ7j1sR7Je52dSm5lmxHYPYGG/lS5SIq0dMdxzC2Zh8Fb9Ocif7IUqZTvPs6oLj
	tPfO+Q/RYggyXmBECX5a6P4T7vrUTulIslQY7UtIbYTitdHR41Bjf7QPCWxvxoCyUU+6
	SAWPJI7nKMKQTDOpR5C/L/dzccqsHBCpi+UM3CI+1kiym3JE0TfYy2o89iWHEsi2Yc6+
	FP0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jOnXlg61KSObvJIkK3w1xCjNdEwIgcjQtUAh3aoBnXg=;
	b=muNpSvGWh8Rs2iMJbSCXcKGSs+91StdIFQJ8cqJhzGtsn51fyr0iq7sq/J/xegFbb3
	aYDNEpNTj+HiXR0G40NcMBLk6rOftLRbOC776rrmP9gAbQoPQQfJ/pCiNXllvPPayLkt
	yDzMZqHPs32ox/CE1dbdlOI/dYVNqECkVvdZEvxaQlBUHCbItxpG+/qiXIg+5DNxSW+5
	0qOWN5g5XTKvjj4sPLihnk6+9KG35YF7r8fk/ks99U5OvWwzQitf/lzsnAvA7y3mzSE/
	qh6TI8qLRx7fHDScwx9M5ZyojlafDKc1mVccCLtLnrZPNmg7D8/9JVw9MeDqPqcTQMbN
	w6Xw==
X-Gm-Message-State: AHPjjUhhZ8N/K9GaFYB+ZMsFQJWaQKoSiPqc6lyV0WcaU2muWLOgkxAT
	idBiZqHPa9ZIyKxlfsNYZGQkfsWvS/C28eoAuxxwkw==
X-Google-Smtp-Source: AOwi7QDAV3d5DIeVfdBeCLnLfbnDR1WUpgX+SEuRMRsh3IaHlhHRSVMgCUsHAq76TrHy9/O4OSu7FxYHeheaB6gYNC8=
X-Received: by 10.237.57.38 with SMTP id l35mr3154587qte.118.1505840243376;
	Tue, 19 Sep 2017 09:57:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.74 with HTTP; Tue, 19 Sep 2017 09:57:22 -0700 (PDT)
In-Reply-To: <20170918231230.256dbd81@seebsdell>
References: <20170918133410.31388-1-alexander.kanavin@linux.intel.com>
	<CAHUNapTtXFnCurGoVtWKL=7v7Spxj4Hg2JqGh530ktRGgVgOyg@mail.gmail.com>
	<20170918181847.594b6943@seebsdell>
	<CAHUNapRP0E5Qb909WpJqZm9LncV0-4Kw-kY5Y9CFO-Zd1AUNNA@mail.gmail.com>
	<20170918231230.256dbd81@seebsdell>
From: Trevor Woerner <twoerner@gmail.com>
Date: Tue, 19 Sep 2017 12:57:22 -0400
Message-ID: <CAHUNapSC9EMHCs6agiLrkwHyZ4n=j6u_vP+3sDHd7wm0NVV7qw@mail.gmail.com>
To: Seebs <seebs@seebs.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] pseudo: use epoll API on Linux
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
X-List-Received-Date: Tue, 19 Sep 2017 16:57:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 19, 2017 at 12:12 AM, Seebs <seebs@seebs.net> wrote:
> On Mon, 18 Sep 2017 19:41:03 -0400
> Trevor Woerner <twoerner@gmail.com> wrote:
>
>> Would you be open to a co-maintainership? Maybe a co-maintainer who
>> doesn't push to master directly?
>
> Maybe? I don't know, I'd need to think about that a bit. I recognize
> that there's a need to get some of this stuff fixed, but I think the
> amount of busy I've been recently is probably transient and not likely
> to happen very often.

Okay, sounds good. I'm glad to hear it's just a transient thing. I was
under a mistaken impression.


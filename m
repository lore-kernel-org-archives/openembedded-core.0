Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f178.google.com (mail-qc0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 20BAC7039A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 18:56:36 +0000 (UTC)
Received: by mail-qc0-f178.google.com with SMTP id x3so1986954qcv.23
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 11:56:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=g83OwK5BAbqqS8af7GBLwTBFYa7ZF2nMLoRLbPfiUNQ=;
	b=Adwra/scvL68HnAEGuR+os31+PMY/CRtumQkCxKqL4L5KJGOt9dfCtf4n9NxYv6ueg
	TIyA18AogPI4TpGcTxud2RQjkJ8MzMa3rBbkyf085B1cJgy5umm6NZBYAu600QhxIxjS
	0iGRGUeroFuL+7qSz8xLNjcSs2ivmV8//gZC0CZjbEyq/+4RCBE0LdysO7IFO4EyGIfA
	OpAXekE/+ulPgu2ZcgcgaCSYal5gXgGu+m7zYCPFdB7JZyjNEbT4oWHegLBqFvgDn/9A
	jjP6C+ima6K7OxaKdKopDvQOpl+5DRlBEQxZU+3gY+BR1APzU7gKyaqR1RqPhYonWdPS
	D7RA==
X-Gm-Message-State: ALoCoQm/GWVTbUmR3d6IcAvbrC7z553lYXtWxSbdWO7OcSCS6noWAsXgTvKg+ut09A+3bkkPY3yU
X-Received: by 10.224.122.83 with SMTP id k19mr9347987qar.78.1405364197824;
	Mon, 14 Jul 2014 11:56:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.99 with HTTP; Mon, 14 Jul 2014 11:56:17 -0700 (PDT)
In-Reply-To: <53C41827.7060002@linux.intel.com>
References: <cover.1405335436.git.roxana.ciobanu@intel.com>
	<bdbcbfeed06623ac20632e04036ff5eb15e53258.1405335436.git.roxana.ciobanu@intel.com>
	<53C41827.7060002@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 14 Jul 2014 19:56:17 +0100
Message-ID: <CAJTo0LbJHs+m8QMGqT23PQLh2yQ4mmXvj9=CGBQnwmOhWkdMTQ@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/1] latencytop: fix mount error
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
X-List-Received-Date: Mon, 14 Jul 2014 18:56:37 -0000
Content-Type: text/plain; charset=UTF-8

On 14 July 2014 18:49, Saul Wold <sgw@linux.intel.com> wrote:
> Why do two stats here?  Can't you stat an entry inside of the
> /sys/kernel/debug directory?

It's the idiomatic "is this a mount point" test: look at the device
number inside and outside the hopeful mount point, and if they're
different then there's a mount.  You need to stat twice to determine
this.

Ross


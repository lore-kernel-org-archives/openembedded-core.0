Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id E84286FD16
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Oct 2014 03:56:22 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id r10so270371igi.14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 20:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=/O8SxuMeG7f8rYqeig2Vqqk1ozWJ7o5V/YWMZ4aYx98=;
	b=jDWDJqxLWmioUGHUPsE4mpRNsz9RsoxjzXDL8u2d3j5NyFXCaUwetS1BNKKKpBfkvO
	0rg3ELqGOOMqm6oHGPzfVqpSGk5qn++OF3UFdPrXqGfagjVn9p7o4tQOaYcoXUCmOqkz
	1JhEJnm5dzTZbY1AR3230AIU7LYGUuu+xwRTJJ0Inixoxrg3REtnRzYiDYfdbX61CmVb
	aIEyCugfinSS9jFa0gliWMdmZkG+M7aoZYlyzeY1Mf+O6f2ZaRyDKGatS1BLFKVB15BJ
	MfvqD1zClnSP4R1Fmv3sE/vOxmceR9NCdWYdnzZU6ylT0wAkzkw3bHuR9zFqKmht1PSJ
	qlCA==
X-Received: by 10.42.62.6 with SMTP id w6mr12714694ich.24.1412135783346; Tue,
	30 Sep 2014 20:56:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.179.5 with HTTP; Tue, 30 Sep 2014 20:55:53 -0700 (PDT)
In-Reply-To: <20141001013231.GQ2480@denix.org>
References: <1411647477-12992-1-git-send-email-sledz@dresearch-fe.de>
	<20141001005520.GO2480@denix.org>
	<CAMKF1sqJ=QsZWNWe436Q6hNaegEm6HMj76JtXU-gZBhrkRutAQ@mail.gmail.com>
	<20141001013231.GQ2480@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 30 Sep 2014 20:55:53 -0700
Message-ID: <CAMKF1sqa2JtVOhv7f0P=_HfSnrL2kfd2QmP+GM_FsM3zb-xq=g@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [daisy][PATCH 1/3] layer.conf: Add in useradd dependencies as ABISAFE dependencies
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
X-List-Received-Date: Wed, 01 Oct 2014 03:56:26 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 30, 2014 at 6:32 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Tue, Sep 30, 2014 at 06:25:57PM -0700, Khem Raj wrote:
>> On Tue, Sep 30, 2014 at 5:55 PM, Denys Dmytriyenko <denis@denix.org> wrote:
>> > This line above ^^^^ has a very long trail of whitespaces and it got commited
>> > that way, unfortunately :(
>>
>> Better was if you commented before it went in.
>
> And how would you suggest I was supposed to see it?? Nobody saw it. My email
> client is no different than others - it doesn't mark trailing whitespaces. The
> reason I saw it is because I ran "git log -p" on the file and that explicitly
> highlights trailing whitespaces in BRIGHT RED... :)

just for that may be we should start using gerrit ;)

>
> --
> Denys


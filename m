Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id AA5EF73AD4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2015 13:07:18 +0000 (UTC)
Received: by lbbrr9 with SMTP id rr9so10324017lbb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2015 06:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=p2oATya+/0csSfzearoDtWSDvF1i3jAETYQiIBa7jrg=;
	b=i3K62liFCPjdrUNHAdx1AW/Gj+hf586uGgtBSjUQ98CGIpa2/0BBljUr7fwqORGgSS
	ysP30s3dHkzb4WJytGrFVjgk9kMciaC3TW8dW/TXs1k74mUVN7QeOQG9ibigeEchibiy
	WHGoYHzjndvYpWQDVMpSniMzks5yq3tSMR0uNwTPqinxmXCU3mTkctXHtzGdoXW5nxIz
	DgNKVLUczeRVPYp1FVXvMp6h+Uz/zURmSUfGPyyOBsv6zaHZi+0RWL+nnBU0wsoeRph4
	wbt4DMABwLqiz/mvu1JQ87USoy+howY/SNShHR2fRqPyP0WefaE1HiLDIgV5liDq7Tjt
	fQyQ==
MIME-Version: 1.0
X-Received: by 10.112.173.41 with SMTP id bh9mr71979535lbc.107.1426856838691; 
	Fri, 20 Mar 2015 06:07:18 -0700 (PDT)
Received: by 10.152.146.4 with HTTP; Fri, 20 Mar 2015 06:07:18 -0700 (PDT)
In-Reply-To: <1347436503-17966-1-git-send-email-raj.khem@gmail.com>
References: <1347436503-17966-1-git-send-email-raj.khem@gmail.com>
Date: Fri, 20 Mar 2015 14:07:18 +0100
Message-ID: <CAC1BbcR=K2mc7Z94+wpoWKCwzCzGqTfMuV2PQYU3u04TGZgmqQ@mail.gmail.com>
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 3/3] uclibc: Revert systemd regressing patch from upsteam uclibc and uprev SRCREV
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
X-List-Received-Date: Fri, 20 Mar 2015 13:07:21 -0000
Content-Type: text/plain; charset=UTF-8

On 12 September 2012 at 09:55, Khem Raj <raj.khem@gmail.com> wrote:
> This patch is causing systemd based systemd to not boot

>  meta/recipes-core/uclibc/uclibc-git.inc            |    5 +-
>  ...nt.c-wtent.c-move-functions-from-utxent.c.patch |  321 ++++++++++++++++++++
>  2 files changed, 324 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-Revert-utent.c-wtent.c-move-functions-from-utxent.c.patch

Khem,

Do you remember what exactly this was fixing?

I don't immediately see how reverting it makes sense..
Many thanks in advance for a hint or reproducer or instructions on how
to reproduce!


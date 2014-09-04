Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f169.google.com (mail-qc0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 90307714AF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Sep 2014 19:12:31 +0000 (UTC)
Received: by mail-qc0-f169.google.com with SMTP id l6so11240746qcy.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Sep 2014 12:12:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=OlVkwtLl3QD58zBodWAd39Cmxe5elLm50HEvb7O2FJE=;
	b=TZQd+lZ9bBZhUe5d1fSLDUWqTmBEpsXvFA1Jqg9r7qFkHH5l4iZAVrm/IoGCNPBJ14
	FiFhOABsuUHGB9pSHtntZaCxcSepFeEOn1293CCXfsDKmlKKwa4ZrmQ9V8oCtKWfv/eC
	ZT7xdmuXqXtHozrzb4rv29TOVg6jzsS8Q/bDfxXGzxJMSMH1/oQPCmoQCd12pAm5cDKl
	mTVUzH6RtXt6Y0utcdZOK5ra6BU9JYO655smweRGo0DqFOPMQTgjDL1B87hLGitXM3gf
	281KWIqxLAeZ4UY1OYoJMAYAQArN3ryiU5zcP0rMK0B41CzDYCz7Dg2IZQtlghO1jLaU
	bbTg==
X-Gm-Message-State: ALoCoQnPTqQ0V9PWwtRygliJivT/YKm3y3uvVb6YZFTIPXYixkZhI1MTjwVLeCMj822qnzagY7IY
X-Received: by 10.224.38.10 with SMTP id z10mr10522117qad.52.1409857952060;
	Thu, 04 Sep 2014 12:12:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Thu, 4 Sep 2014 12:12:11 -0700 (PDT)
In-Reply-To: <lyha0nb5cg.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <CAJTo0LaRETJdKG-bL+40YtGrVjs4MLVLiydybSUj5ALa2tyxUQ@mail.gmail.com>
	<lysik75pyt.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LbNG14cHQN8JewwOd-Z0rBOeSpEQKHOQguSQweiQzLVtQ@mail.gmail.com>
	<540896F8.9040805@pabigot.com>
	<lyiol3uxra.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CALbNGRRTcV8bst1tQYNZ-z6w7_aSXT3=pVMVLRQncDw4TwQEow@mail.gmail.com>
	<lyha0nb5cg.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 4 Sep 2014 20:12:11 +0100
Message-ID: <CAJTo0LY9RwZzJ7KhON4EHq-PuLC7z3jcv4_B-u94EZUJWUYvgg@mail.gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] Style issue for recipes
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
X-List-Received-Date: Thu, 04 Sep 2014 19:12:31 -0000
Content-Type: text/plain; charset=UTF-8

On 4 September 2014 19:36, Enrico Scholz
<enrico.scholz@sigma-chemnitz.de> wrote:
>> Did you ever use 'git blame' for few lines most recipes have?
>
> In other projects (e.g. linux kernel) I am using C-x v g in emacs very
> often to see when/why a certain line was added.  In some OE recipes I
> would like to do the same...

Personally I find git blame totally disappointing in general, and
would love to see a "history browser" UI that let me see the history
of a line in a file without having to repeatedly git blame, get hash,
show hash, realise that change was whitespace, git blame hash^, rinse,
repeat.

If someone knows a good UI for blame-digging then please let me know!

Ross


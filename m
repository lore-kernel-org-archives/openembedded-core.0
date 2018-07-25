Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id DCE6A789BD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 20:44:50 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id 16-v6so10639375itl.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 13:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=N9J7qgx8/F3ADAWzPI8+j/EtH0sAqWYRg4VvgEjqOes=;
	b=gW1oAmoCgEzQiqYkZLS+iu+bFeelZMOZYNquNJeNdZldTcubBeMJW04cESYiSI/z/1
	7IcRwruQav4YWYXSkPw2tvOhq4nv0chHXdz8OgB6R60kyes8DAkabAEIAa+CjzlgjROA
	mOJx2qR498Hy42wDXDca0lc1IF8oK7ElHmZTBG+rkl6qO1ZQnHeitFSYJUk7XDqxEfqr
	m2xZ0hclr+xuVLkIaZkUqbGqw+wAdWoFDaefWtmT/oukxgCXbxFBvmGSQq9ERNKHqr6J
	F24OcJ72J/klPEcxsV0HJFCw6JLn8rx1SQ6bY6fzTSKUjE5M73LXnvDgwzkY5c5lyOSP
	ObhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=N9J7qgx8/F3ADAWzPI8+j/EtH0sAqWYRg4VvgEjqOes=;
	b=Ybxu82XHlhblnKma64vB47cYhMXQEzKjlvCED2jbIlCm9+TbLfg7HBa3BKk6n/4oVs
	EzkZ5JGMUjUwh6WmKfTNhlMpuU2x20QeDECPh6sEMAbfVkSh7AclrDFG5+2tOMb1yFtn
	U3fyZps+mO5ecxaQ/b+7WspAp7MDG1OIqDm6TmHOvGF6PhBA6Dxq7cejB9Lp0wFEjnMN
	ThBrsN9MBdvm4xP0ZbNpdnRJp2lnmjTesK/oLkCvOGv06s5LzpLuP90YZjImhBKMLIVm
	zOx69dD4n7K70UP2uMIdNcVnjkdObPcNacVE0NalFwTlguiSe1HBOYLthuCHxbBRA7GT
	hHxQ==
X-Gm-Message-State: AOUpUlGldSd3SVEAd+pHmK0gza74btLQTKMfANyrJqcdge0yFdftqIhy
	OhgKwL+qZ0HS6gPNQjoh2IQ=
X-Google-Smtp-Source: AAOMgpdj2Q5AmcLaqP71VZZ5Ab/FVNxEAd9Bv0pMyzcU1qYKSkYNOeJGquF+t9VylDKjnltzn+VoKw==
X-Received: by 2002:a24:d0d1:: with SMTP id
	m200-v6mr7201371itg.89.1532551490890; 
	Wed, 25 Jul 2018 13:44:50 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	l16-v6sm3043324itb.34.2018.07.25.13.44.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 25 Jul 2018 13:44:50 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1645be9a5bddedbe73060398dd03608173a7d62d.camel@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, "Burton, Ross"
	<ross.burton@intel.com>
Date: Wed, 25 Jul 2018 15:44:49 -0500
In-Reply-To: <CADkTA4PQ0hqtn2iYSNEUNYss2jGOotg03i+tK2xU4nYHACGsQA@mail.gmail.com>
References: <20180725183529.4478-1-JPEWhacker@gmail.com>
	<CAJTo0LZZU9_XSu3+HBmDEjKFgS_znfTkdyzBSd-XChXaEncnow@mail.gmail.com>
	<CADkTA4MOJMPrdbxuFUp5Nchv=2MJaztUpmodRqC7QPrRWaZg9g@mail.gmail.com>
	<CAJTo0LbSCjmpOD0fnLCfT87OaGdOU2B8_SbZMeka9LB-RLiWSw@mail.gmail.com>
	<CADkTA4M_67sat73QPFaXeuo522=Nt_qdLcUjoc-KSMYvXHMDpQ@mail.gmail.com>
	<CADkTA4PQ0hqtn2iYSNEUNYss2jGOotg03i+tK2xU4nYHACGsQA@mail.gmail.com>
X-Mailer: Evolution 3.28.3 (3.28.3-1.fc28) 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes/kernel-yocto: Cleanup getstatusoutput usage
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
X-List-Received-Date: Wed, 25 Jul 2018 20:44:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-07-25 at 16:32 -0400, Bruce Ashfield wrote:
> On Wed, Jul 25, 2018 at 4:20 PM, Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
> > On Wed, Jul 25, 2018 at 4:17 PM, Burton, Ross <ross.burton@intel.co
> > m> wrote:
> > > On 25 July 2018 at 21:05, Bruce Ashfield <bruce.ashfield@gmail.co
> > > m> wrote:
> > > > My question about the change .. is why ? I really don't like
> > > > cleanup
> > > > patches on principle, and want things pinned to a bug, a
> > > > performance
> > > > issue or something else.
> > > 
> > > See a post by RP to the oe-core list a few days ago: a general
> > > cleanup
> > > of Python code that spawns is well overdue.  In this case
> > > oe.utils.getstatusoutpus is a wrapper that just calls a
> > > deprecated
> > > function in subprocess, is best to pass arguments as an array
> > > instead
> > > of string, best not to use a shell, etc.
> > 
> > ah ok.
> > 
> > I still don't like it, but it is what it is.
> 
> ... and I found the original email, I see the part about things being
> depreciated. Makes sense.
> 
> I'll queue it up and run some tests on some intentionally bad BSPs.

Works for me.

I wasn't sure about if the subprocess exceptions should be fatal or
not. Suppressing them maintained the old behavior, but it didn't quite
seem "correct" to me.

Thanks,
Joshua Watt


> 
> Bruce
> 
> > 
> > My comment stands, I'll figure out how to incorporate this and send
> > it
> > along with my next pull request.
> > 
> > Bruce
> > 
> > > 
> > > Ross
> > 
> > 
> > 
> > --
> > "Thou shalt not follow the NULL pointer, for chaos and madness
> > await
> > thee at its end"
> 
> 
> 


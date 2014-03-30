Return-Path: <paul.betafive@gmail.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id A88386F609;
	Sun, 30 Mar 2014 16:09:46 +0000 (UTC)
Received: by mail-vc0-f176.google.com with SMTP id lc6so7347576vcb.7
	for <multiple recipients>; Sun, 30 Mar 2014 09:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=KCv2JeJeqFr/K2Z7us9M/r6wqMwM0POM75TyJMi1SiE=;
	b=wztavuQmuGGhYNPxINb8buKI5z18bnbVtQ1sisMJUPOXkq+NZeu5r5koOHAwqOdOG0
	mSgTX6GcDWu6qdVelAsODiVFuH2VT6Ty8BB/2DnxBZGL33Wj1XYEz8OMnesilxJ2V8RR
	EC3cLVkkXoDYe/5/QhunErLq8wJC1eu/B+6SUzUgJRnMRBcLI/nSmP4jppZKxwyr47cp
	kMP763sI7b8VX3P7Ep2/ADHsiZsKy3Enred//sHMyqzitVuoIY9K84INf3FoLxzLTxmZ
	3IixD6Xz+pdpcES8Kcg+eB+gOE0jIKve2PoxylPvjl95KVdSI+23h2wfPl2hqFfAoJdF
	TAKw==
X-Received: by 10.52.65.132 with SMTP id x4mr652205vds.36.1396195787895; Sun,
	30 Mar 2014 09:09:47 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.239.135 with HTTP; Sun, 30 Mar 2014 09:09:07 -0700 (PDT)
In-Reply-To: <20140330013103.GD2428@jama>
References: <20140330013103.GD2428@jama>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Sun, 30 Mar 2014 17:09:07 +0100
X-Google-Sender-Auth: UHGDkZvXQK7blkTKDbDOthcp0c8
Message-ID: <CANyK_8e=+AnUG_Bby0eqPPXgSPxmnTyPY0RHNPUXL8XG-ct7ug@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Openembedded Discussion <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Quality of meta-oe metadata
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
X-List-Received-Date: Sun, 30 Mar 2014 16:09:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 30 March 2014 02:31, Martin Jansa <martin.jansa@gmail.com> wrote:
> There are always 20+ failed tasks in those
> big builds and just reading the numbers isn't good indicator of quality,
> because sooner you break something in dependency tree, fewer recipes will
> be actually tested, so fewer failed tasks often means that something
> important is broken.
>

Sorry to double reply but had a thought on this one thing in particular.

Is there any way to list recipes (or tasks) which weren't executed
because a dependency failed? I know we see this at the start of the
build if dependencies can't be satisfied, I'm thinking tasks with
satisfied dependencies but then those dependencies fail.

Being able to see that chain for each build may help us prioritise. It
would also show whether a failure disappearing was due to the issue
being fixed or the recipe no longer being attempted due to a new
failure somewhere else.

Thanks,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk


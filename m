Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id D8D1865D4F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Nov 2014 03:02:47 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id a13so787759igq.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Nov 2014 19:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=VnXb7wH/EJ+7pnhEnhCzKxmh5ktHKrOX9Nlgp6vift8=;
	b=XWEIhVQ7eClto3GzpWj8u+XXje4FqbvVr4sTS+V5zoI1tCNDtS1nvoX9gBfN7rqssn
	I6i3QMT75u3Ci1cr3jVFynU52scROklCUOut2h0fu9+YT7y+b7TSwt7c1vHjjLtuR+oj
	odba5UQBKra1F3jiVvnBceSWeQ6E0kxj0JP/HK9LrqTYdTxozfnY/T7qc8hTkVdSp++4
	ESbFScWH+j2sfCN60pATuX3sNRl1PzBbaXKxKYWDQ/2hKSIIU+u/FtU7tUxJSDWZkD9b
	eogRZZoVSwumvLdSVLbR58ub4eaSLjBWKEOIukxBA5QSq/GK4jNxeaToTZNTUSxZknP6
	s8GA==
X-Received: by 10.50.164.133 with SMTP id yq5mr10686361igb.4.1416020568014;
	Fri, 14 Nov 2014 19:02:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.169.2 with HTTP; Fri, 14 Nov 2014 19:02:17 -0800 (PST)
In-Reply-To: <20141114162131.GG15651@jupiter.iwi.intel.com>
References: <20141114162131.GG15651@jupiter.iwi.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Nov 2014 19:02:17 -0800
Message-ID: <CAMKF1sp_GjrCpo8A5iXHc7S7iiwn7KRE4sk+3UT1x15vVWc2fw@mail.gmail.com>
To: Brendan Le Foll <brendan.le.foll@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: uclibc recipes in oe-core versioning & using upstream
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
X-List-Received-Date: Sat, 15 Nov 2014 03:02:58 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 14, 2014 at 8:21 AM, Brendan Le Foll
<brendan.le.foll@intel.com> wrote:
> I'm trying to understand the logic behind the uclibc recipes, it seems
> it is using fairly random points in history of git master and not the
> 0.9.33 point releases that have been made.
>
> What is the logic behind that and why not use the upstream release
> builds as a starting point?

last uclibc release has been long time ago. We need newer features
especially for systemd to work.
are you seeing some issues with what we have ? and its always top of
master. We pick a master version
and then stabilize it to whatever we can. btw. uclibc master does not
move at a faster pace where it breaks often
so its ok to use it.

>
> Thanks,
> Brendan


Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3B11F70DF3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Aug 2014 01:34:53 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id h15so3522032igd.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 18:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=RH7fOn6TtPUzlhnjL2EOz8dX27mk/EGFNBwoFkrxkdk=;
	b=l6n3yVQgzqW4+35SKVdL11j4bEAZtG2Y1yWDkhR/zKPzw1OXj+hNqOrRU1QNVf6Yoa
	sCOob/aCwxmpo7nRPyxcY9lpfGUuRPo9gL7+D4hLJKYOr96y75EwVW8ooCu8Pq9lQivZ
	JbFtN7ep/5WuN+tOJkJeR6ZaTMNOmjDu6BDw5Mkrjljz+D/KCmlR4LST9N0vDMHcsKUw
	sD+z8xrR7BElY3gXAcOdvIr99l46wzK7SU+k0cdyhJesfrLL1Xklom45pf4DUBxYpL53
	DJFr3dEsbch9nZknyqhHin17Y1bT2NmvcXTqoU1Nvsjz3649o7KGsi1w4XKpDDDcHuss
	Vgrw==
X-Received: by 10.42.216.135 with SMTP id hi7mr4825037icb.12.1408152894524;
	Fri, 15 Aug 2014 18:34:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.126.103 with HTTP; Fri, 15 Aug 2014 18:34:24 -0700 (PDT)
In-Reply-To: <1408123065.21596.32.camel@ted>
References: <1408009882-28210-1-git-send-email-raj.khem@gmail.com>
	<1408123065.21596.32.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Aug 2014 18:34:24 -0700
Message-ID: <CAMKF1sr3qkviDchhQ+gj0f1VZ4Kj6Su1_SWpJAxn5j2CeJev=Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: Repace if-else with case and add musl triplet
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
X-List-Received-Date: Sat, 16 Aug 2014 01:34:56 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 15, 2014 at 10:17 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> This breaks x32 builds:
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-x32/builds/204/steps/BuildImages/logs/stdio
>
> (target doesn't end up set to linux-x32 which it needs to be)
>

oops it will also break mips64/n32 :(. I have posted a V2 to address
both the issues


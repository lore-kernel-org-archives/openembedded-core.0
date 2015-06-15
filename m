Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 48EC860097
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 11:42:52 +0000 (UTC)
Received: by pdjm12 with SMTP id m12so71201771pdj.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 04:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=Extb2jE9JltD+lKD1fQH7Px7ZUKnD0iP2V6vR/Oi9aA=;
	b=mp6sDoDjwX5edZzvGVUaGCREzvZedap2FQnquw22tcN8XOYm+9BWkE7uoiIzn5N5ep
	QPWaPyITr55/pjzCpaKndvf0Crq3cBxhYdL1UGkongBzKGsB+9aQaFtcxDKLQfNinr+2
	35iypaukF8l8sLVBd+X424LcGhEjSaQiOZWx/r5zKdcw11yxiM7V5rioYO+AAPON9+XF
	blQrlLHYkOQX3FsVyYyh3rLxZiuGVy/2g3Q3UQ0D+le/bcvte5ueY02q+mmPb7CkDTHa
	G78JoTXA0YMr/yVjYwhBr4eGHPeJpPldhfJdDxRxoo7O0rXSNGrd9PNywsus89QZn24A
	I9gA==
MIME-Version: 1.0
X-Received: by 10.68.167.197 with SMTP id zq5mr47642613pbb.85.1434368573667;
	Mon, 15 Jun 2015 04:42:53 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.70.34.109 with HTTP; Mon, 15 Jun 2015 04:42:53 -0700 (PDT)
In-Reply-To: <557E0A58.7010809@gmail.com>
References: <cover.1433771147.git.alejandro.hernandez@linux.intel.com>
	<c677cd4c037f5eea0ecc49300baac9731c41b1c0.1433771147.git.alejandro.hernandez@linux.intel.com>
	<557D178A.5050509@gmail.com>
	<CAMKF1sqHATLXo8i55Z+MjFdfb=Ra-pCYR8h=jjtgxGp5e36ewA@mail.gmail.com>
	<557E0A58.7010809@gmail.com>
Date: Mon, 15 Jun 2015 08:42:53 -0300
X-Google-Sender-Auth: 6_295AOxm8nrbVyNbbiQeQjBy6Y
Message-ID: <CAP9ODKpoeV5ZhZMVFv_B6yVW_PHS=xMfUrLQueJTqCQxtj=_2A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: akuster808 <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2][dizzy] python-nose: backport it to dizzy
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
X-List-Received-Date: Mon, 15 Jun 2015 11:42:57 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jun 14, 2015 at 8:12 PM, akuster808 <akuster808@gmail.com> wrote:
> On 6/14/15 9:13 AM, Khem Raj wrote:
>> On Sun, Jun 14, 2015 at 1:56 AM, akuster808 <akuster808@gmail.com> wrote:
>>> Alejandro,
>>>
>>> This looks to be a new recipe. I don't believe dizzy is taking new features.
>> Contextual. If its a leaf recipe in terms of dependencies, I don't see any harm.
>
> It is still  a new recipe.  If adding new recipes is something that
> should be allowed on a maintenance release, then the policy should be
> updated. I still not in favor of adding new recipes nor features to a
> maintenance release.

We should help people to move to Fido, not to stay in Dizzy. I am
against this backport as Fido is already out. I would be fine to add
new recipes for Fido as it helps people to stay in a Stable release
but for oldstable I see no benefit.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


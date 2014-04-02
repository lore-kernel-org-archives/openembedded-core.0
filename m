Return-Path: <paul.betafive@gmail.com>
Received: from mail-vc0-f178.google.com (mail-vc0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2F68A6F23F;
	Wed,  2 Apr 2014 17:03:40 +0000 (UTC)
Received: by mail-vc0-f178.google.com with SMTP id im17so714990vcb.23
	for <multiple recipients>; Wed, 02 Apr 2014 10:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=LFK9SzDEXz5H+VpsaLf+9CNhTokv5la6iN7wq37Eh74=;
	b=WfOxR3Q5vN3ANpRFu/tXF8cSD0n5WfIv55PmT9q3hYfiBa8H1u/+tteTjQS6pfZ6DX
	nPmHmMvtguQaidq47BQU/E+xYGdt7ZpGm4CQ4z72hLF+XZFYNQmsJsv8CivzvGz1+iH+
	HS2KEJ2xqJTnICuN2CC/VrTyAcLrW0xZrHp3N5z8vcE8QLd2m1eUp+mtsdVzmMVBgvGH
	H+HzLJIi3T8jrZ8hatLlKSFxzH8quoi7PdKpcMhZ+PQ25cn2Pep1gPincC2ylWAiPfj8
	3P3bW1wAS41Rbta6wb5yR5f2cDte3xR9iaZ4fxEteTv8rs8gfMTXomnX0LNMzzUnimqI
	YYQA==
X-Received: by 10.52.120.6 with SMTP id ky6mr1781391vdb.38.1396458221166; Wed,
	02 Apr 2014 10:03:41 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.239.135 with HTTP; Wed, 2 Apr 2014 10:03:01 -0700 (PDT)
In-Reply-To: <CAMKF1sqOCs_OYkZU2ng9FmViPyJx1AjdViSquZWzbgFT=XZdoA@mail.gmail.com>
References: <CAMKF1soKZqqmQUVCQnUqS1GV1FO5KictTO+=up=d7Jw3+QhXMw@mail.gmail.com>
	<CAJTo0LYF0VNwy7=rhmr7U_=tXwJtPOax3AKttn66q3qD_QXd2w@mail.gmail.com>
	<CANyK_8deVKbC6xOUQHubvphfwQCQefHGWCt7Mp1QM4DUVXja5g@mail.gmail.com>
	<CAMKF1sqPB+QCvPHHcxsU+ExBmNWg9jPXajkAR_FdKpJ76-x9dg@mail.gmail.com>
	<CANyK_8er+2sjvU1csLOEpZ06qCL4h+bP2ecUYYGzyiEw0kXzQw@mail.gmail.com>
	<CAMKF1spno7Np8FXr3JXw3_W72+vRkchzZ8J5X+3e4RCFY+6nLg@mail.gmail.com>
	<CANyK_8f_V247P1UWaeG-7YwBq4MrHQ=+69NOgW8LUZ4_Xgx2qA@mail.gmail.com>
	<CAP9ODKp-+31rJmK6uY1QA6nvG4hDuNT79JVeeivY5XeOCu2etw@mail.gmail.com>
	<CAMKF1sqOCs_OYkZU2ng9FmViPyJx1AjdViSquZWzbgFT=XZdoA@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Wed, 2 Apr 2014 18:03:01 +0100
X-Google-Sender-Auth: jYngYwt8EFyoIxm8uLwFV3VCDug
Message-ID: <CANyK_8fC4kkDgqovwuTx5kN0Y2hcyDT7HStii4hxz_CN3D=atA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	OE-devel <openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] initial support for musl libc with OE/Yocto Project
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
X-List-Received-Date: Wed, 02 Apr 2014 17:03:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 2 April 2014 17:35, Khem Raj <raj.khem@gmail.com> wrote:
>
> I have got core-image-minimal building for arm now. All changes are
> pushed to contrib tree this includes util-linux fixes too.
>

You've fixed util-linux in a different way to me, I added qsort_r to
musl whereas you've removed it's use from util-linux. I'm not bothered
which one we use if both work. We do now have 4 people looking at
util-linux fixes: Me, you and Robert Yang (as util-linux-native
doesn't build on Centos 5.10 due to the same qsort_r usage) here in
oe-core and Karel Zak from upstream (as they want to fix it for their
next release). I think we need to pick one fix (probably yours if it's
tested and working in another distro) and get it applied to oe-core
master.

Your latest commit "glibc-2.0: Fix build issues that arise on musl"
should say glib not glibc. Other than that, your glib fix is better
than mine (I did add <string.h> but didn't add the
'--with-libiconv=gnu' option, instead I set musl as the provider of
virtual/libiconv).

>>>
>>> I think we should ask for a new repo to be setup on
>>> git.yoctoproject.org for meta-musl. I'm happy to be one of the
>>> maintainers for that, I hope that you are as well and maybe a couple
>>> of the others who were interested could also help. I think having a
>>> few people as maintainers is important as we're all already fairly
>>> busy on other projects.
>>>
>>> Once the layer is setup we can move the recipes off your branch of
>>> oe-core and into the layer as time permits. That would just leave the
>>> changes which need to go into oe-core on your branch.
>
> The changes are not very intrusive, I think it is of value to include recipe
> fixes in the layers they belong too and most of changes to packages are worthy
> of upstreaming. The patches for compilers aren't final yet and they
> will be rebased
> as I add other architectures one after another. I am not convinced yet
> if we would need a layer of its own.
> A layer is premature at this point of
> time. if you fix something thats not on there you can share by pushing
> into another contrib tree and inform me
> I can include the fixes into this tree.

I don't currently have access to -contrib as I haven't previously needed it.

I also think it's pretty low visibility and difficult to comment on
particular patches compared to having a layer with patches being sent
to the yocto@yoctoproject.org list for review.

Do you think all of this will eventually be accepted into oe-core? I
didn't think musl would be while our support for it is fairly
experimental.

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk


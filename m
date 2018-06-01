Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1DF28747D7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 03:07:20 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id b77-v6so1819615vkb.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 20:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oEM9iJQQ4JSWJO/NQNYczq7Il2tDXlnBeXllpyYpzx0=;
	b=bxelhxMCuHY+/KUm+HOZAD8xr4MoEYbGlHcTnA4rdIrlpjSeZt3NePdIPJ5nLdOn8m
	yR3U8CnQN84qZKO5bX/fhpPKBrdA/88iIKwRlHaW9jwHrK3nPsNwsiYp6DYTUMtcz86G
	tIiJIH7Vx1LHQZoOAFpC4jm0puens1zTQz5PEIHkTbW/tcV6Y8IKPLrt/rd2R51zBAH9
	whl/rzc8ucxvjG5SS9V4jcJy8Kyz/byMmF0YJ6tGnwk2zBzSv/+W3q4ivHM+SdMYxCVF
	DRJ0WvrxE3I4Y1KSNy4+pmUmZeU8/Y59Bgf7hPlcq9oKys19V2VbWKCiXPweXHU8HF1A
	6djw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oEM9iJQQ4JSWJO/NQNYczq7Il2tDXlnBeXllpyYpzx0=;
	b=aEgiPlkcMvEbDXcwJQzMvVH8z39ZXyPG+I3TuBjUEdx96E4v8VKpTf8pgXE5Y5GBnM
	ASjX0dbkSDpcfAWHp0clcNenb2nBiclxzVZJFo0tg1wMBxMrzAd6nvC2VwfdfNNyYGPl
	QE9egU7sgvyStXeReDFsfrfCuv4krbGdnlnoieqjHcf1EYMuutmGqx/Xp+mRGYVhtt8D
	GIVnYmdlLNTioJZ8mTg2XbdVeoa8ncBAYPrDWkP3p4IfkuemSZoW5KarQXuCIB97aqph
	hgy+S9bNGQD0xne0djfscGFECaJzfASZDt5EWFpB9RZg6Cmpra1xCMP0qBh1cqP4dnVv
	t3rA==
X-Gm-Message-State: ALKqPwdVSSfQwlMKM2xlUZgj9TGI3jmQzLuHuWz3pEtI4BQoZVWXyuBU
	4WgirtmfBQOHsJmQjEdQaR+tvD+aaQnpYEMuP9Y=
X-Google-Smtp-Source: ADUXVKLvxklESi+8Dm+8wD1T8cM5tttQrXFfQTGlboNlO0Us5qG3yyOpn9uzeY1r1xzb/YOp0LC5rx08ZlrfAxiostk=
X-Received: by 2002:a1f:1551:: with SMTP id
	78-v6mr5174401vkv.174.1527822441609; 
	Thu, 31 May 2018 20:07:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Thu, 31 May 2018 20:07:21 -0700 (PDT)
In-Reply-To: <CAHUNapRaJVnECsz3rU2CV265xOJLMPUARfsHZGn-CnY_Kn4j3Q@mail.gmail.com>
References: <20180531200659.28877-1-twoerner@gmail.com>
	<CAJ86T=XTDOZYzdUTBLSO39XeBu6QhV0U5+U=iGd_hM0OwBXH_Q@mail.gmail.com>
	<CAHUNapRaJVnECsz3rU2CV265xOJLMPUARfsHZGn-CnY_Kn4j3Q@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 31 May 2018 20:07:21 -0700
Message-ID: <CAJ86T=W3ju53TA-za4LMYXKtEqvLvj9B=DjMO+Tu=nsnG7Jehg@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [devtool][PATCH] devtool deploy-target: optionally specify package
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
X-List-Received-Date: Fri, 01 Jun 2018 03:07:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 31, 2018 at 7:23 PM, Trevor Woerner <twoerner@gmail.com> wrote:
> Hi Andre, thanks for taking an interest!
>
> On Thu, May 31, 2018 at 6:22 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> On Thu, May 31, 2018 at 1:06 PM, Trevor Woerner <twoerner@gmail.com>
>> wrote:
>> > Instead of installing an entire recipe's build output (i.e. ${D}), allow
>> > the
>> > user to optionally specify a package from said recipe to be installed
>> > exclusively (i.e. ${PKGDEST}/<package>).
>>
>> I'm not a big devtool user myself, but I'm curious about the
>> situations where you might need this?
>
> Earlier today I was working on recipes for some software which recently
> added the feature to dlopen() one of a couple shared objects based on
> various conditions. But instead of dlopen()'ing the SONAME, they were
> dlopen()'ing the raw .so file. OE's default packaging, of course, added the
> *.so.0 and *.so.0.0.0 files to the ${PN} package, and the raw *.so files to
> the ${PN}-dev package. So when the app tried to run, it failed.

Sounds familiar. I used to maintain this patch for the mesa recipe to
workaround a similar issue in Qt:

  http://lists.openembedded.org/pipermail/openembedded-devel/2015-May/101455.html

I don't know if later versions of Qt still show the problem (and of
course, the workaround in the mesa recipe was never merged...).

> Investigating, I realised there were two things I could do: 1) add the raw
> *.so files to the ${PN} package (with INSANE_SKIP += "dev-so") or 2) fix the
> app. I decided to try #2, with the help of devtool.
>
> I made one small change to the app, "devtool deploy-target"'ed it, and,
> AMAZINGLY, everything worked!! Wow, what luck! ... or not.
>
> Investigating, I discovered that "devtool deploy-target"'s only mode of
> operation is to upload the entire recipe's ${D} directory (i.e.
> ${WORKDIR}/image) to the target! I hope you'll be as surprised by that as am
> I. Considering ${D} includes *.a files, man pages, raw *.so files,
> pkgconfigs, (... thankfully it doesn't also include the -dbg packages) that
> is a lot of stuff to be uploading to the target, a lot of wrong stuff, and
> in my case that hindered my work. Most target filesystems are only 10%
> larger than required to hold their contents, so uploading static libraries,
> man pages, pkgconfigs, etc is not great.
>
> Specifically, these unwanted raw *.so files were hindering my work. My only
> two options were: 1) to use "devtool deploy-target" as-is and then have to
> manually delete all the .so files or 2) come up with a better solution. I
> went with #2 (again).
>
> Many recipes generate just a couple packages: ${PN}, -dbg, -doc, -dev,
> -staticdev, -locale. But some generate a whole bunch. In my case my recipe
> is generating a lot of packages, but I only wanted to investigate one. This
> patch allows a developer to focus on just one package, instead of the entire
> recipe.

All seems reasonable to me. Thanks for taking the time to explain all
the details!

I wonder whether the default behaviour should just be to not deploy
files from the -dev package?

>> Are the going to be problems if users want to deploy more than one
>> package (or switch between a full deploy and a package) and don't
>> deploy and undeploy in the right order?
>
>
> In my patch I added a --package option to "devtool deploy-target" but not to
> "devtool undeploy-target". devtool keeps track of what files were uploaded
> by creating a per-package list on the target itself (in /.devtool). When you
> undeploy a recipe, it simply looks for this recipe file on the target, reads
> the files listed there, and undeploys each of the files in that list.
>
> Therefore, mixing and matching deploys and undeploys amongst recipes don't
> interfere with each other.
>
> I checked at the time, but I'm not 100% sure now, but I believe if one
> deploys two packages from one recipe, the on-target file gets appended. But
> now I'm not 100% sure, so I'll verify this tomorrow (thanks for the
> reminder). As such, under my scheme, you can deploy recipes and packages at
> will, but then only undeploy the whole kit and caboodle in one go; given a
> recipe name to undeploy, whatever it finds in the on-target record will get
> undeployed.
>
> I think any developer will find this reasonable behaviour (but maybe not?).

If that's how it works then it seems reasonable to me.

> In any case, my patch doesn't affect any existing workflows. If a developer
> never notices the new --package option and simply continues to use "devtool
> deploy-target" with just a recipe name, the behaviour will be exactly the
> same. Only when the --package option is used will the new behaviour occur.
>
> I'll verify deploying multiple packages from the same recipe to confirm they
> append the list file. I'll also verify deploying the same package multiple
> times (although my guess is there'll be no difference between this and the
> existing behaviour should one deploy the same recipe multiple times).


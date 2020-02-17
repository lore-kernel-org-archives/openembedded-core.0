Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id ACC43613E1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 11:02:19 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id a6so17963357wme.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 03:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=OBER4hRlr1mqvY6FS65thmj/UIW/Vuba9CILc6InClA=;
	b=QhQwstwuxQNlfwszf9pKa4/ZHw+pYrlNNPNl7ycyio2Ucze03nvTPTZyPgwetJpfy6
	+EglTFX8NWtxAuOmSpBDQAzUoIzlEzALDEE5hOSZ1fKPUxrj1cLs9Kntbs720hyY4B9F
	M2+7uYyxXv+8+xuEpP5Frr3vaED1kUpjKjn7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=OBER4hRlr1mqvY6FS65thmj/UIW/Vuba9CILc6InClA=;
	b=dHsFSrMciwxdFi78Xn7b4aZvkDDEmXg6gyHz5VdGCGbjiX075363a+sM31atZvVWn1
	19ayy7vEqsuInGkqDvEdJS/TL/+AN1zek5JSNwNAzlP681ZudrfjuzUeD/0UAkYPfImX
	FGHCkP7T5RG8PfgySC+B3j8cBnmW9ABbjj5WFcTI9ygVM9D46Kowsy3uWqxgKa7+oO8C
	YQthTfHoC178UJaqJcivzr9M9JUKObwWmDttmYJpf1DZXfRhygyfASlVvIsWyHeDUiYm
	LDb0/dr2yxKqAwb5Vu/6zYIkFg6e9Sq5MNh6spyj8rMuUKruNZjNh/ZvF+sWKx7nhIIv
	cVNA==
X-Gm-Message-State: APjAAAWE2MEccpbRwjCfTw1eCFubiImVmpNfbM1Oti2rjQfIMFjshI6c
	/HYr52JWg9NuhIGPxQ9aZklEYg==
X-Google-Smtp-Source: APXvYqxh7GQw5D20Va7WZRauekUtb3efmw/AclBnrDXyQ9Wts1J9yMYcnn61SFAkv3hM99ZZ/QexuA==
X-Received: by 2002:a05:600c:2c13:: with SMTP id
	q19mr22098596wmg.144.1581937339976; 
	Mon, 17 Feb 2020 03:02:19 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id a9sm480715wrn.3.2020.02.17.03.02.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 17 Feb 2020 03:02:19 -0800 (PST)
Message-ID: <27b8a3c9ab5911804cdb2a8c1cc64b8073c6b1d9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 17 Feb 2020 11:02:18 +0000
In-Reply-To: <CAJdd5GZJ7CWVfg9jEgybK1aRLqFxFpvd7G-EtsVvfn+WFK-pbg@mail.gmail.com>
References: <20200212031435.792802-1-JPEWhacker@gmail.com>
	<ae6aa1fd185955181b81170757887c3b19a9767c.camel@linuxfoundation.org>
	<CAJdd5GZJ7CWVfg9jEgybK1aRLqFxFpvd7G-EtsVvfn+WFK-pbg@mail.gmail.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] oeqa: Run diffoscop on saved output
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
X-List-Received-Date: Mon, 17 Feb 2020 11:02:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-02-16 at 12:27 -0600, Joshua Watt wrote:
> On Sat, Feb 15, 2020, 5:07 AM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> > On Tue, 2020-02-11 at 21:14 -0600, Joshua Watt wrote:
> > > Adds recipes to build the diffoscope tool and run it when the OEQA
> > > reproducible build test saves output to a local path. This should
> > > make
> > > it much easier to debug reproducible build issues from the
> > > autobuilder,
> > > since the published output can be easily viewed on the website.
> > > 
> > > Joshua Watt (4):
> > >   python: Add libarchive-c recipe
> > >   python: Add magic recipe
> > >   recipes-support: Add diffoscope recipe
> > >   oeqa: reproducible: Run diffoscope on saved output
> > 
> > Thanks!
> > 
> > The first production use:
> > 
> > https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20200215-t1s21q9r/packages/diff-html/
> > 
> > :)
> 
> That's great!
> 
> > I am a bit puzzled/concerned about how this hasn't been removed
> > from
> > the system yet as it should have been, unless its the hashequiv
> > problem
> > with timestamps continuing to cause problems. Need to fix my
> > patch...
> 
> It looks like a directory ordering issue to me, since the timestamps
> are the same. One way to really flush these out would be to use
> disorderfs (https://salsa.debian.org/reproducible-builds/disorderfs)
> which permutates the order in which entries are listed in a
> directory, but I think we should try to get "wider" coverage (more
> recipes) before we try that.

Its more complicated unfortunately. We should have fixed the directory
order issue with:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=09c6a41b751d080f0c12fc4172a31d1dbe760b0b

However issues which shows signs of that bug still persisted in the
reproducibility test results.

I theorised that since opkg-utils is in ABISAFE, the change wasn't
accounted for. I therefore merged:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=5fd3eb4bda651bddf4e4dc76d456333c70df4ddc

However with current master, we're seeing the above reproducible build
failure. I checked in a build and its using this sstate object for
comparison:

pub/sstate/b0/ca/sstate\:matchbox-config-gtk\:core2-64-poky-linux\:0.2\:r0\:core2-64\:3\:b0ca3b3559d37ba8de8ade8b282baa5082e612ef6590d3ff94fcebe38e9f17b9_package_write_ipk.tgz.siginfo

which is interesting in that its from 2nd Feb (predating both commits
above) and doesn't show the above change to package_ipk.bbclass.

The change to package_ipk means the task's own basehash has to have
changed which means it *has* to have rerun. Somehow hashequiv has then
marked it as equivalent.

I guess the issue may be that in some builds, this did generate output
that was equivalent and things have then raced so this "broken" sstate
object has persisted.

The question then becomes, how to we get this out the cache?! I'm not
entirely sure how we can :(

(obviously I can cleansstate a few things which I'll do now but its not
good this can't recover even through metadata changes)

Cheers,

Richard





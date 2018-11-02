Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f175.google.com (mail-it1-f175.google.com
	[209.85.166.175])
	by mail.openembedded.org (Postfix) with ESMTP id 5038C79F82
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Nov 2018 16:09:19 +0000 (UTC)
Received: by mail-it1-f175.google.com with SMTP id p64-v6so3888798itp.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Nov 2018 09:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1psEeQYq1f+5ttoGjaWCIQ9tUUU4W/GN7tZ9KPKYh7A=;
	b=Iw9u0Tr2aEjo88cxCc5nnD6O92hh74JZTdLpoMch52hFGy9Tq/DmIO9xty6vxWJSR0
	ZvxmYpMjT10jHtqNrOWib5Mx3jos8vFAhgiQXZIa/HyfCj/gJd29zet8JZB7SzTUIBVQ
	j9m/qPyLxMDC3kQBqAvpukey5YJjAfEvkOO6sTZGw4aKxnVYsAzWRKKstm5KbL5DjWGW
	txzxp163/Bl9GFsLDnVjtpPy1Uut7zbnuMeMTwPsJCuo6iU9npVFakCEvu5J0cuMiFKH
	4YBBo6j4iuyXO12OwAD1Mi6XUY/0brrr7wJn3EknB3xAb3KSpjC04YfeJ25WpGiyvPWr
	/enQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1psEeQYq1f+5ttoGjaWCIQ9tUUU4W/GN7tZ9KPKYh7A=;
	b=GzX+swc+hgJUAPWvqmTPVDiwfL4jImX/qXbo04Kv7LUrQXtxEOq3rSyN0dlvtZmSB1
	yn+/MSf1kwduk4UDu/IqFL0b/Ro/OJb+gluH1FqjARsUJ3Oot60SbrjtZdLkJHtyuXCf
	FcRgq5EMDuUVuP/2gk8u2xooYfBWebbaAvaddkKfg1iEu3cp0IiIDYwLA4cLO4nmmv9k
	ytDeKrXISNBbhV9HPXz9cyVQB9KHemEh29DBkxRZ6lWYRl1AW4kyuqWXpeDuwF3DaXBI
	y8ZMQWQEvl0y+5Sos29vGk2ampFqdfpOTrilKeoxGZoxNjdS4m7wZ7tYSayDLyLtv0Cp
	dPRQ==
X-Gm-Message-State: AGRZ1gLB7JXfW0b1VX6+c+QeFraIoiY8ZaueoPMO71oclty4/HWKlDrs
	q+9PTfeoOMoR+1frVljyw8VQM3XlT+N7GsOK1VgAsg==
X-Google-Smtp-Source: AJdET5euKrUYqbLrE+72QUGDm0wGlMj7o9jGexihSRNnqPom3IQ2CvFf2pbeyUh9HtmpD4Q7mC0cr191qMeILOnIzoY=
X-Received: by 2002:a05:660c:a06:: with SMTP id e6mr312700itk.62.1541174960342;
	Fri, 02 Nov 2018 09:09:20 -0700 (PDT)
MIME-Version: 1.0
References: <20181031144648.28277-1-sno@netbsd.org>
	<CAJTo0LYJrmBh1_3AXZXH7xBY1KSCG_9buGfsqtG-D2MLRb=Qmg@mail.gmail.com>
	<9750133E-11F8-4833-9CBF-DB7B6998E3AE@netbsd.org>
In-Reply-To: <9750133E-11F8-4833-9CBF-DB7B6998E3AE@netbsd.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 2 Nov 2018 16:09:08 +0000
Message-ID: <CAJTo0LYqMLLp9T89CvR0jzSLuiHH7w2M2rrdoE0z-tS54ity9Q@mail.gmail.com>
To: Jens Rehsack <sno@netbsd.org>
Cc: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v8] python3{,-native}: update to 3.7.0
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
X-List-Received-Date: Fri, 02 Nov 2018 16:09:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 2 Nov 2018 at 16:05, Jens Rehsack <sno@netbsd.org> wrote:
>
>
>
> Am 02.11.2018 um 16:57 schrieb Burton, Ross <ross.burton@intel.com>:
>
> It appears that Python 3.6 or 3.7 removed os.errno as an alias for
> errno, as this is failing in wic:
>
> |   File "/home/ross/Yocto/poky/scripts/lib/wic/filemap.py", line 397,
> in _invoke_fiemap
> |     if err.errno == os.errno.EOPNOTSUPP:
> | AttributeError: module 'os' has no attribute 'errno'
>
> Easily fixed, but obviously this wasn't used to build a wic image
> with.  How much testing has this upgrade had?
>
>
> v8 didn't had the same amount of testing as v5 had - I built a lot of images
> using wic with v5 (and run some python3 scripts on target).
> But I can't say which python was used by that test ...
>
> However - I detected I made a mistake somewhere between v3 and v4
> during rebase (which explains why Alejandro is still complaining ...), so
> I decided instead of doing a v9 I go ahead to 3.7.1 update ...
>
> Are there some reasonable tests I can run on legacy code to see what
> needs updates after that?

I'd say a world build of oe-core and execution of the test suite
(python3 -mtest) is a minimum level of testing, throwing meta-python
at it too would be good.

I'm currently running the regression tests so will report back if
anything fails.

Ross


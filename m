Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 59716606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 21:28:30 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id c3so4942597vkb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 14:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=k3tpS+b6C5R5KVl3cadMZdBAbdMGNiLm+FSewSMnElw=;
	b=blk4OxTVTFcIwquCRZQUHLQAiBAqA02MCThsq4fmK0X+yaaMRIZAdTz3JE4qpdyRAD
	cATAh2Y1lNo/PH2BkO1VgqSMMiOiWeQwH1UO80k3I3onF1fNGVfME/KekrFdpmP4pNOV
	qvnhPaoek+h77/Vb5q1sN12/rjdrQp8wXwmlE57HNRtLuSRWj+vCFsOTyWfLD8bvN1Pm
	0J7b83CN3nTJIjW/XjDohvi0EpHw+1MosPZFfF4EnYgiHjcFxpS3TanY7QYqMInofe6x
	xaazvVL9u5ZSmhGW6/ncqxtwl4DEQGKMcgYVwRzWbPKZ4gkYUMCfRaH6idGaJ6Ib1LXM
	OAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=k3tpS+b6C5R5KVl3cadMZdBAbdMGNiLm+FSewSMnElw=;
	b=WkYxRKPK1NfC2sd4493vxHLD5q5xWSdyAmCPRPnP6Ng1b9Iuc8VQMhAnBciKehrP2B
	l7zAYXX28qAA/FO3JH/Ter07f6peW86RoVBBXJErrUvRoPV3Y2RSIIQZbIhOr0cEGCZF
	NiTPACcj3DsweWHRE8gBVhZDJs+7fqGedo/fVDIhOaUP6JyeOcBnuuu4yWcc3lXzgswn
	wpQgBEvf5yn/5oKiAEG7U/piAk/f+TwDeKw9ODLBuvQ8p5h8JPOvbyx1frpKCrqOIj86
	Q8GU270TT6CEUawDZthbTtycLFAcfmBMKleQmdC9uQrbxVX2wDvxCvlmOpI52BZ6hlPB
	iM6A==
X-Gm-Message-State: AD7BkJLaGFWHxq5EKZ+isKH+VhiQAUb25v3SVeuxyLsVoR3jColdjbXJpTSzfHD7OEJMzfkdTwu0gpLPBJbx/A==
MIME-Version: 1.0
X-Received: by 10.31.54.194 with SMTP id d185mr6656657vka.130.1458163710643;
	Wed, 16 Mar 2016 14:28:30 -0700 (PDT)
Received: by 10.159.35.45 with HTTP; Wed, 16 Mar 2016 14:28:30 -0700 (PDT)
In-Reply-To: <56781.10.252.1.171.1458145410.squirrel@linux.intel.com>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
	<15c0b6ce47e45b3be9db55c6b32bb2830766e932.1457535622.git.alexander.kanavin@linux.intel.com>
	<CALbNGRSZXjynMUy2B3Ke9k4g=DwFnhb2eO=xpJj4fGXHT2HBMw@mail.gmail.com>
	<56E8315D.2080906@linux.intel.com>
	<CAMKF1srbyaUBZO0Lu49x0FKoZR+-6CQcMX6h5ze8r4z9Yu6oHw@mail.gmail.com>
	<53372.10.252.1.171.1458080995.squirrel@linux.intel.com>
	<CALbNGRQwKQpougA7Jus51MKUsC=TmAiqf0mptLUebeodsB6_yA@mail.gmail.com>
	<56781.10.252.1.171.1458145410.squirrel@linux.intel.com>
Date: Wed, 16 Mar 2016 22:28:30 +0100
Message-ID: <CALbNGRQJGWRmXdBnCDVa9X=S5n_VrtycaKrWa=UpBf_mJOt3RA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/24] python3-native: use the previous version of python-config script
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
X-List-Received-Date: Wed, 16 Mar 2016 21:28:30 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 16, 2016 at 5:23 PM,  <alexander.kanavin@linux.intel.com> wrote:
>>> Apologies for being terse. I should've explained that when building
>>> recipes that make use of this script, it will be run with the native
>>> python (instead of host python) because native python will come first in
>>> the PATH, and so the version reported will be correct, because native
>>> python will match target python. This is set up in pythonnative.bbclass
>>> for python 2, and in python3native.bbclass for python 3.
>> Sorry but I don't get it: The script reports the version of host's
>> python which might be different from what we are building native and
>> cross. When something is trying to link against python libs and is
>> using this script this crashes for host's with python < 3.5. This is a
>> bug. It should be either corrected or using of pkg-config should be
>> enforced if possible.
>
> The script reports the version of the host python, because you are running
> it with the host python. If you run it with the native python, it will
> report version of the native python. All recipes that need to execute
> python code as a part of their build are doing that, and therefore are
> getting the correct version.
This was the missing bit for me. Seems for some reason (qmake-native?
- see below) my recipe is running host's python.
> Where is the bug here? Can you demonstrate
> it? (by something else than running the script using host python,
> obviously)
>
> I agree that we should generally get rid of such custom,
> separately-maintained configuration scripts and migrate everything to
> pkgconfig, but that is a separate issue.
>
>> By the way: What was wrong with the shell script exactly? We have used
>> it for long time and it reported the correct version.
>
> The shell script was introduced with Python 3.4. All previous versions of
> python, including python 2.x, are using a different, python-based version
> of the script, to which we do some patching so that it reports things
> correctly in our cross-compilation environment. [1]
>
> The problem with the shell script is that it lacks those tweaks, and
> things break down when you try to build python3-based software with it.
> Specifically, I ran into issues building pygobject 3.x, and after trying
> to fix the shell script, I gave up and reverted to tried and tested
> python-based version - which is what this patch does. I believe the
> problem wasn't noticed earlier, because prior to pygobject 3.x there was
> no other python3-based software using python-config.
>
> Now you need to be exact: where and how did you use the shell script for a
> long time? Why should oe-core start using it, if it's known to be broken
> and requires patching?
>
Ok 'long time' was an assumption I have to regret but [1] first failed
when I updated 3.4 -> 3.5 (due to hard coded version in qmake pri -
file) and then failed again after updating to pythonic python3-config.
I know the fix I chose then is bad hack, but I tried to backport an
upstream solution and that failed for reasons we discuss here: linking
python3.4m which does not exist.

Thanks for explanation and sorry for shouting out - I'll rework that
recipe to use pkg-config as it is interested in version of python's
libraries - not the interpreter scripts are running on.

[1] https://github.com/schnitzeltony/meta-qt5-extra/blob/master/recipes-misc/recipes-cad/antimony/antimony_0.9.0c.bb

Andreas


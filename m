Return-Path: <asselsm@gmail.com>
Received: from mail-yb0-f195.google.com (mail-yb0-f195.google.com
	[209.85.213.195])
	by mail.openembedded.org (Postfix) with ESMTP id C5E2771C7A;
	Mon, 18 Dec 2017 16:56:31 +0000 (UTC)
Received: by mail-yb0-f195.google.com with SMTP id r4so11512838ybd.12;
	Mon, 18 Dec 2017 08:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fSXQcpNz4o/WLBFWK/Bbn9QMGLR6p7GsgT/3gL9KsWU=;
	b=p8N2QdjpJpcsILuwj8hWCOk+EQ0G4pA5f69eYIFqtF2GamDCIj+X8Axvj1lys1Cs6t
	/AArUswAjEe8ZdQIfgHjZfkoq9YR/HfXkV+zF6jPzV5o6MtwcMjvACKk/THB3HnrOQKB
	SCPaof7hQUIvMpjdLKMjr6MtL9CMAg5pNFEJZq2s5ZbkqeJGEsS4zbLPyEs5xPU+L7Tw
	w7sAO+Xd20t/dxA0m/aJwCw8v9rVZgBHfZmoEJhdMrOoXQm/NN59/6tJPDg6ltXrJpK0
	PnFtZm7xBkhsT1k/Y8uv9IcTXz8raPYZ85MVpaUSDugB4t4ziOgos2aQbDJcrJ/fEPK7
	rLRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=fSXQcpNz4o/WLBFWK/Bbn9QMGLR6p7GsgT/3gL9KsWU=;
	b=ESyll3pUYFsEnnKotR9DEhH3zerhuAbW+h5TogPzpbDDyLRlW3sypE/oehE/GInP3g
	rpZbARZFsUNyO83wxj50+pw+TCsDEef199f2/xY6tEfEqoNE89lkLqHANJjm0fIrh0Th
	XG33gFXozxPYx53bCwp747bNV6DS45OLB0n9d7CgjxDbfW24x97fDWKyY5q1bmiThTd4
	uTgB3b3VphBNlW5UcTicIq1hJPQNvVZMPeSp9aTVZqk9f0dqIkVFxgmGtYBj1tL4cK5N
	qP7/dCZIiTSIHyiOdTAg7cxuJQOQZT4Oxm00NOA4FO2iO+bY+aB4DZ414gj3+f7hDL5f
	LzFQ==
X-Gm-Message-State: AKGB3mJoiRhRky3E3RuGpeB2Z79XIrbLrBOpA05b0efrokQa21Rp32SO
	HWdcK8X8xVfRSxd8Cr7+T20jsoHyY7+AFAQc7Kg=
X-Google-Smtp-Source: ACJfBotnPLJkubc0s99F4v7FMuZ4xX7gmRhr//O0/ZUXQD+c8x5P+lg6kdziqSiIcs/oAiuHw0/J2wNjncglcisB+ko=
X-Received: by 10.37.244.82 with SMTP id p18mr353560ybe.6.1513616192789; Mon,
	18 Dec 2017 08:56:32 -0800 (PST)
MIME-Version: 1.0
Reply-To: mark.asselstine@windriver.com
Sender: asselsm@gmail.com
Received: by 10.37.189.69 with HTTP; Mon, 18 Dec 2017 08:56:32 -0800 (PST)
In-Reply-To: <711527ad-77fa-947f-2186-1d7835e1783e@linux.intel.com>
References: <1512414044-1012-1-git-send-email-mark.asselstine@windriver.com>
	<CADNbA1qnmF3-MKo=fqQQeWEedE5A-wzkUkCgdCNArOePjMaXQw@mail.gmail.com>
	<CAPuovEKdqQP35XwP3bgBrE4EFbM2LwpHrHzxF3my9qaWfAaCbA@mail.gmail.com>
	<CABcZANku-aE5a69GpJxXmd2F0+uYVhiRZB3Uut7F2RG1e3R9EA@mail.gmail.com>
	<CAPuovEJNf=qefXX6wKJGaH+HkM6aan49AgVQ3TEWVWPSCn3cNw@mail.gmail.com>
	<711527ad-77fa-947f-2186-1d7835e1783e@linux.intel.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Mon, 18 Dec 2017 11:56:32 -0500
X-Google-Sender-Auth: 7KDeyj1Kob7xAfUSkbXGKF4_03k
Message-ID: <CAPuovE+yd0kA_MmT4GuqXgvNDASsKLszL4uiypKDSa31icwgXg@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [meta-python][PATCH] python-pyroute2: uprev to v0.4.21 (from 0.3.22)
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
X-List-Received-Date: Mon, 18 Dec 2017 16:56:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 18, 2017 at 11:37 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 12/18/2017 06:15 PM, Mark Asselstine wrote:
>>
>> On Mon, Dec 18, 2017 at 10:36 AM, Christopher Larson <kergoth@gmail.com>
>> wrote:
>>>
>>> All our python recipes should be explicitly listing the python module
>>> packages they require. No python module recipes should be depending on
>>> python-modules or python3-modules, but explicitly what they require.
>>
>>
>> This is a giant PITA for little gain in my opinion. The typical python
>> 'vehicles' to define dependencies, things like setup.py, requires.txt,
>> requirements.txt..., never bother to list stdlibs. These are standard
>> libs that are just expected to be there. If a system is being
>> installed with only select python modules it will behave differently
>> than python found on any other system violating the rule of least
>> surprise. On top of this most of these modules are ~40K in size and
>> there are roughly 60 in the stdlib so the size gain in installing a
>> few vs. all of them is extremely negligible. All of this seems to add
>> way more work and churn that outweighs any real benefit.
>
>
> I tend to agree with this. Add also the situation that the yocto project
> needs to upgrade oe-core to python 3.6 as soon as possible, and to 3.7 soon
> after, no one has enough time to do this rather non-trivial job, and I'm
> beginning to wonder if the best way out is to remove the module splitting
> altogether, and write a clean, simple and maintainable python3 recipe from
> scratch with minimal amount of custom patching and hopefully no write-only
> hacks.
>
> Alex

Thanks Alex for the support. To get a better idea as to what the size
delta is I took the installed sizes from a rootfs logfile and the
total size for all modules (python2.7) is 6.5M python-misc is almost
2M of this and python-codecs contributing over 0.5M. The savings will
never be the full 6.5M as there will always be python-lang and some
other modules needed. There was a time where 32M restrictions existed
are some systems but are we really seeing devices with these
restrictions any more? what about exploring not shipping the pyc
files? I would much rather see this than imposing so much work and
churn for very little gain. Anyways, maybe this isn't the best forum
for this and it should be brought up to the architecture group.

Mark

>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


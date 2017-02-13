Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f172.google.com (mail-ua0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id D4F48731CA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 15:45:25 +0000 (UTC)
Received: by mail-ua0-f172.google.com with SMTP id 96so67881392uaq.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 07:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wJtm29njnlEF2ds4MeYFBdjK1t1mEdbmvDl9+wGGLzw=;
	b=atTNTh42bqBXbS/LBXnLHP7MVION8yHMarVQR5owXb/4pmOTKJgSa/Mq3jAMa6DL3b
	iY9Ij27S0giqkv7LYb7scHfWooxFhzF8sroFUjwZaKxqaL+MZ6JQ5lo6Oj/u1p7Tqqov
	BRGb7CX04/+gi2TtW8jqqUESnumqD52tUmJ1IhQkDmHKL3dijegQ4gbypnG1o3t6BzrR
	+65zwzNgaIh90DZsSUEEuNktnYh0b0d8KsnqN+HO6fyyB+mXpLbbhKqNrw26m8ptN5fU
	SKv0+6hP9ujqCkAidAFIj+RYi1zeU/DKV5EbcXRQILmAUW9fRQcFq2+DOmmaEFvlIj1B
	EMHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wJtm29njnlEF2ds4MeYFBdjK1t1mEdbmvDl9+wGGLzw=;
	b=ckluKvyTUjE/K+ZesjBbD2GskVhdB9t38leljIGnOWirClbQSxLpG7MrsdcCbmitDl
	9qKd7+tgWhQMyYfBzDZuUQGigJUZbXjyIBE9ZMKFioLjbK5pc1W+1bhSuR/4oduIjSmL
	uAI2dBgivJc3zEJhYNrNpV5mPPX9FhHt5PYMHtBZKfkCyheMgThYCL+z4LiZp4hTvhcW
	hPk9Lcajld/OxjdAQT0ILTi9e4XiGua4zvy0XOSllrGMhcWRx8+/yNVtx3rco2EfIWWn
	iNBQgAXsKVvS3bcIOQ6od8DIGC7T44ytmbb+DuNlUBFo6JPhhjwisYj4nxR29ryNMQtZ
	B8xA==
X-Gm-Message-State: AMke39n2wJ1RStSOcPBkwWF0lzioR8LAYeAJtUO/lghUBs00Or2a/sld8gZhZQGmPcsuqk9vXFiHWA2rmxnxEA==
X-Received: by 10.176.1.119 with SMTP id 110mr10902497uak.143.1487000725871;
	Mon, 13 Feb 2017 07:45:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.91.68 with HTTP; Mon, 13 Feb 2017 07:45:25 -0800 (PST)
In-Reply-To: <1486999455.13854.241.camel@intel.com>
References: <CALbNGRSgxbz1F2YLzQ-F2Fn+01hiA4LAoDgQuQ-qLg9KMVTHAw@mail.gmail.com>
	<CALbNGRR1+yVyMC1O1G1mCYp8e87Q2kucGEgs-dL0P3KHxi8WCQ@mail.gmail.com>
	<CA+chaQcHBzDJ4UbW1NCex70T56PL02+agOZBMoK4=Q1WWSm2EA@mail.gmail.com>
	<1486999455.13854.241.camel@intel.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Mon, 13 Feb 2017 16:45:25 +0100
Message-ID: <CALbNGRQns-G9XOtS8wGetnAAYVv7Z+F+2h3rLQ2XxgSiSBwHWQ@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Does recipe specific sysrooot (or whatelse in current oe) break native dependencies?
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
X-List-Received-Date: Mon, 13 Feb 2017 15:45:26 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 13, 2017 at 4:24 PM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> On Mon, 2017-02-13 at 15:36 +0100, Martin Jansa wrote:
>> Hi Andreas,
>>
>>
>> I think it's feature which was already there, but almost never
>> triggered (even in test-dependencies.sh tests), but with RSS it fails
>> reliably.
>>
>>
>> See:
>> http://lists.openembedded.org/pipermail/openembedded-core/2016-July/124435.html

Richard wrote
| What it does mean is that any recipe needing a -native recipe to build
| should list it in DEPENDS directly, not rely on other dependencies to
| pull it in for them. This applies to pkgconfig-native, intltool-native
| and also to wayland-native.

This answers my question and leaves me unhappy - I am out for a while..

Andreas


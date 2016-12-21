Return-Path: <fathi.boudra@linaro.org>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 02C2D774A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 18:17:58 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id g23so155738003wme.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 10:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=49jz5ncFSJQ4uodwTdDOb5OaigrmZcZyNsT/wYo6Atc=;
	b=Jjir6TqpokXRhXJLh7HqNMJ0wUQTqwgZm9BlcDIUGowHfNgbebJDR3r81wtg6HH4TE
	csZ7WmQNz4JBOBe5ZATspQlOiJg1hsTdfrCUT+qvWe0soizs+oZBbMqceMcMdShBXBI8
	5zDgAinH6sxbqCeozQrwhDOHM1FJ+xSRr3+EI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=49jz5ncFSJQ4uodwTdDOb5OaigrmZcZyNsT/wYo6Atc=;
	b=KNgsRBFzeXQ/EIH+w8OWTgWvTzzwdwYhJlbPX/ITPsNopgclrw9mRKebaj/8vHlrjD
	qShU4zlc/9xSSQMX02fzIppP8+cDWGP1giy0nvJldvBWXCENkTQF2e6LR+NUB4DQAhXf
	c81ZAYdElIo/UXDlzVp3Axsqfn3oozoC5U0uIUpfqb0fH+g8MgwDjlVreBY3Xp+z6/pH
	c+/fJNJacvfICXVe8T6hQCR1cuba89TwhgAv5Cityh3DFvbl7xdrgjczBXB16sOYRle1
	KZhH49VSXKfbNBWCAYbgksGMO6LLizOn0vGYYK+xnboFnjLGUFkjIzaIeut3KExpL/6f
	Oq3g==
X-Gm-Message-State: AIkVDXKhTqFUo1u/MZ1rb+7xc9OZ24uWOFJp3nWXRGd1DY+hkSCvsSWKjjcHVdyFbJ8u/ATo1BIFw6yhTNVEnOdJ
X-Received: by 10.28.64.136 with SMTP id n130mr3318837wma.45.1482344279229;
	Wed, 21 Dec 2016 10:17:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.19.69 with HTTP; Wed, 21 Dec 2016 10:17:58 -0800 (PST)
In-Reply-To: <1482334714.6937.34.camel@intel.com>
References: <cover.1482324587.git.patrick.ohly@intel.com>
	<374bb6a728f368a801f961fb524290f205bb4625.1482324587.git.patrick.ohly@intel.com>
	<CAGNsrLBx=+yvgDAsaqz8mYm30WG0TVEV3eR2PNMj+VHK4ceSOw@mail.gmail.com>
	<1482334714.6937.34.camel@intel.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
Date: Wed, 21 Dec 2016 20:17:58 +0200
Message-ID: <CAGNsrLDcdnhghoQOPcAtdmEQ9hTBHM0GHmFErzTYc5Jv0-Y8ug@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: meta-luv <luv@lists.01.org>, "Neri, Ricardo" <ricardo.neri@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/9] iasl: move from meta-luv to OE-core
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
X-List-Received-Date: Wed, 21 Dec 2016 18:17:59 -0000
Content-Type: text/plain; charset=UTF-8

On 21 December 2016 at 17:38, Patrick Ohly <patrick.ohly@intel.com> wrote:
> On Wed, 2016-12-21 at 16:11 +0200, Fathi Boudra wrote:
>> On 21 December 2016 at 15:11, Patrick Ohly <patrick.ohly@intel.com> wrote:
>> > iasl is also provided by the meta-oe layer's acpica recipe. iasl is a
>> > bit simpler and thus seems more suitable for OE-core.
>>
>> Simpler in what sense?
>
> Less code to compile, which might matter for people who just want a
> working UEFI for qemu and nothing else. I haven't measured the
> difference, though.

to build, it's taking 3-4 minutes on a 3 year old laptop (i5-2520m @ 2.5 Ghz).

>>  acpica recipe is trivial and provide fully acpica tools.
>> Would you mind to import meta-oe acpica recipe instead of providing a
>> reduced set of acpica for not much benefit?
>
> I don't have a strong opinion about this and would be fine with moving
> acpica to OE-core instead, too.

It would be nice. thanks.

> --
> Best Regards, Patrick Ohly
>
> The content of this message is my personal opinion only and although
> I am an employee of Intel, the statements I make here in no way
> represent Intel's position on the issue, nor am I authorized to speak
> on behalf of Intel on this matter.


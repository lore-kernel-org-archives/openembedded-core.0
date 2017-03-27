Return-Path: <twoerner@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 21AC46FFFE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 18:01:11 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id d188so9296640vka.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 11:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lizuePc8epe9Yrt1JtoB1974Tw3VSh9k1g8KblxkCoE=;
	b=MceC6GBPRxL+GmiLTtCVVUjrtssdZRurr9Ns8VD4d9VAn1qZjy+1zrGXqZG3C5NOxU
	LgofIOn1XcwDc5Kiu0vNGNlAXP1u7tq3TzsDEPgx+KcBUZudUj0oUGg8y7IDCc35P1BO
	CQ7hzQYtfq77ABFjf45GhqG7tHu/6sgNuEP1PVNQlFHpcjYIRtM5V53GYwknkfg6o2dd
	2PwKcVcVTvaAKrxwUeSf1AFHLvqYwvsKLaoiVDFOi3by6Dn2S9Pndnt+16kBJmh4yG7n
	r3JLSvruaz69Ssi4eItGeoKJfkk1PvxMyWTAzCFjW4OOA+XYSKmu4m6yz0h6WfPv4jdn
	oLMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lizuePc8epe9Yrt1JtoB1974Tw3VSh9k1g8KblxkCoE=;
	b=GXMYnayBtZRXMTHaKoL5FlceMkiY8Rn5eL9MNmxgKbzH46gRRQZZK9HQcMeMKClBav
	tV32k0LzBCM9Euh3j+yNLMSom0G2tU6CQ/aWCnRMlX7QTvDFNLa6wv0w718FnKyLV+ry
	9wbsc3Iqc2s02mO1Yf8x9WQWwqY/yvGNkrBe8IO8LSXdk6TzGqGwo80UQbg6pO8E1gZ3
	06WjWCSgsCZZZA4jDNblzRUjtJ5nS2m+te7oufpLdik1eWi867b9Qy24HSzBhT6vJ2PI
	oqVqPhgJbqBhXpTGQdNq5NWZbPGUCyf5FzQd8Tna1zvHZ5PeSZTAZulUldRSnJjg0qDM
	l91Q==
X-Gm-Message-State: AFeK/H0daZdsPn+wkpvY53YHx9nSxcdxY5OUem/Qn85zKpsi0DjTpN9ScKABSL0hg03huXA+FJ7HjZoE7QLrGQ==
X-Received: by 10.159.53.105 with SMTP id o96mr9411249uao.113.1490637672626;
	Mon, 27 Mar 2017 11:01:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.43.65 with HTTP; Mon, 27 Mar 2017 11:01:12 -0700 (PDT)
In-Reply-To: <CAJTo0LZ1NQOtX9_=VEA00o5=_oV0GoEdwYOBHtOvQd6Evpn8TQ@mail.gmail.com>
References: <20170325051947.21433-1-twoerner@gmail.com>
	<CAJTo0LZsmYeQXDKTJm0PTjwbnvaKrQzg_w=0gOQaSjfiL14aMw@mail.gmail.com>
	<20170327151053.GA30578@linux-uys3>
	<CAJTo0LZ1NQOtX9_=VEA00o5=_oV0GoEdwYOBHtOvQd6Evpn8TQ@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Mon, 27 Mar 2017 14:01:12 -0400
Message-ID: <CAHUNapTSk0GxrpYTGYsuu3dLBEmY0u4R-AEqt1q6Bw0QZXgwFg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xserver-nodm-init: option to remove cursor
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
X-List-Received-Date: Mon, 27 Mar 2017 18:01:12 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 27, 2017 at 11:14 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 27 March 2017 at 16:10, Trevor Woerner <twoerner@gmail.com> wrote:
>>
>> What I want is to get rid of the mouse pointer completely. Formfactor has
>> variables that would appear to affect things like rotation and whether or
>> not
>> the calibration routine gets called when X starts up. I don't see anything
>> in
>> there that can disable the showing of the pointer.
>
>
> The touchscreen variable results in the X startup scripts hiding the cursor.

Oh, I see what you're saying... on *SATO*. Agreed. On _sato_ setting
HAVE_TOUCHSCREEN set to 1 hides the cursor:
meta/recipes-sato/machbox-session-sato/session

But what about on plain ol' core-image-x11? Although I wasn't aware of
formfactor before, using it now it still doesn't solve the issue for
me. The existing mechanism tweaks the pointer at the window manager
level, my proposed patch tweaks the pointer at the X server level
which (I'm arguing) is a better place to adjust it. This way it's
independent of everything (except which display server you're using).


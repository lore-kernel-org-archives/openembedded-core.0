Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id BA96175089
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2018 22:52:14 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id i185-v6so110232vkg.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2018 15:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pCh+QBlBlyx567Tm1NYO36HOx7LKHOe81Cv3PmAeeBo=;
	b=LfRpi4BBcYY21ClWNWHJ3+g5/to8PdLTBIzJvOlX7/y14tp/lPPjc5RTnE00UrohG0
	xg3sOQoAqgO6S9gKsU+r/qsJ+IiFLlDo7+CYhECydFjv1jyuHtNeGbCIS4gQ/BAXQZQT
	px7KmGLOGmkMxNvLUrFYTR4HxxdZahp4Fg1io6N9cl/akMHe+8CYEhpQj6skXV3nbn/o
	OYkDTOXKHxrA8A3y71wnFwFQd8UzSBjpEqPegcUS1ua7KoPYRraP+2TiZadMDfazmE1J
	qFtVjQUM4V3GmwUSpSQ+THPKxAhDjLd3Ri7kokw7iSc62zlAD1IlipVBo/JlNuZXXa58
	VepA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pCh+QBlBlyx567Tm1NYO36HOx7LKHOe81Cv3PmAeeBo=;
	b=LMfrtWKLf6+gt5JLmfJie5kvtVmpv8gR71qhS7Kf7NBtYKYz1icdvhCbWIN+dgKtc0
	Vv943+5FK/mx35l+2EoSdRufiYkd5Ab2f7SLJM5xXNK0EJ4Ql2dpntKMQ0TsfIyzOUu7
	tuOnTz0G3z7wzepUz8Abi8dYBVTGT2hZWmAupdg+SZHu5sa39xDH4zNSP7VmSf/TYK17
	O4jj6hVKBjefkHhyPAFx4EBMZgy7J4pyZsSVe+R66Z0lfjKaGcJfALCXdIgpsspVDsO8
	CuA17lv0gwhRxxt0tqC+yMRyjh4ZXyDDFmMYKQ0pbjFLI2aJCjgoMtCOZD++egpmAc1Q
	amDw==
X-Gm-Message-State: ALQs6tBkCBTEiOXc/BYvgOgOL5OhJK2AppgciGJnDGWljSi02FRZ3aHB
	Sz/qM92oVT3Lu4eQuQNm6BxW1I5omSgO4/u5lBg=
X-Google-Smtp-Source: AB8JxZpp/pzmDpMS4Uuq/5l3otCmKQ2Mg6V5tVPJw6Vy1igml697T2zLFgikBYhXh6c7d4w03Ax8XR1YiYZBTJKSsm8=
X-Received: by 2002:a1f:9e17:: with SMTP id
	h23-v6mr18050043vke.24.1525906335281; 
	Wed, 09 May 2018 15:52:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.48.148 with HTTP; Wed, 9 May 2018 15:52:14 -0700 (PDT)
In-Reply-To: <CAMKF1sqTLPYtMDpA6Sb0VBoJZQACMBpBvcAWCCGDdy0=2uD99g@mail.gmail.com>
References: <1525902408-6796-1-git-send-email-armccurdy@gmail.com>
	<1525902408-6796-2-git-send-email-armccurdy@gmail.com>
	<CAMKF1sqTLPYtMDpA6Sb0VBoJZQACMBpBvcAWCCGDdy0=2uD99g@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 9 May 2018 15:52:14 -0700
Message-ID: <CAJ86T=XzZuCPkBMCPNSPOnbvJev45bWw_mjYpptMOyeHWgHjsw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/8] babeltrace: move ASNEEDED over-ride into the babeltrace recipe
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
X-List-Received-Date: Wed, 09 May 2018 22:52:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 9, 2018 at 3:04 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, May 9, 2018 at 2:46 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> Move the recipe specific over-ride for ASNEEDED into the recipe to
>> make it more apparent that the over-ride is being applied (and that
>> it should be re-checked on version updates, etc).
>>
>
> I think this patchset is good however two things, squash all Oe-core as-needed
> moves to one commit.

As someone who regularly backports upstream changes to maintenance
branches, single oe-core commits which touch multiple recipes are a
bit of a pain to deal with... so I'd prefer to keep one commit per
recipe unless there's a clear reason not to?

> secondly, check if they are still needed, if so then a line
> or two documenting what the problem is may be as a followup

Determining whether ASNEEDED needs to be over-ridden isn't always
straightforward as the symptoms of getting it wrong may only show up
at run time. I can do some testing but perhaps the maintainers of
these recipes should be involved with that too. I agree that should be
a followup task.

> Thirdly, deleted as-needed.inc and append this option to TARGET_LDFLAGS
> directly in bitbake.conf

Yes, I'm planning to do that.

>> Also misc minor recipe cleanup (re-order variables to follow the OE
>> style guide, etc).
>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  meta/conf/distro/include/as-needed.inc        |  1 -
>>  meta/recipes-kernel/lttng/babeltrace_1.5.5.bb | 12 ++++++------
>>  2 files changed, 6 insertions(+), 7 deletions(-)
>>
>> diff --git a/meta/conf/distro/include/as-needed.inc b/meta/conf/distro/include/as-needed.inc
>> index 6a8ad9d..38de3a1 100644
>> --- a/meta/conf/distro/include/as-needed.inc
>> +++ b/meta/conf/distro/include/as-needed.inc
>> @@ -1,7 +1,6 @@
>>
>>  ASNEEDED = "-Wl,--as-needed"
>>
>> -ASNEEDED_pn-babeltrace = ""
>>  ASNEEDED_pn-console-tools = ""
>>  ASNEEDED_pn-distcc = ""
>>  ASNEEDED_pn-openobex = ""
>> diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.5.bb b/meta/recipes-kernel/lttng/babeltrace_1.5.5.bb
>> index 5d7a7ef..2a2fa1e 100644
>> --- a/meta/recipes-kernel/lttng/babeltrace_1.5.5.bb
>> +++ b/meta/recipes-kernel/lttng/babeltrace_1.5.5.bb
>> @@ -2,18 +2,18 @@ SUMMARY = "Babeltrace - Trace Format Babel Tower"
>>  DESCRIPTION = "Babeltrace provides trace read and write libraries in host side, as well as a trace converter, which used to convert LTTng 2.0 traces into human-readable log."
>>  HOMEPAGE = "http://www.efficios.com/babeltrace/"
>>  BUGTRACKER = "https://bugs.lttng.org/projects/babeltrace"
>> -
>>  LICENSE = "MIT & GPLv2"
>>  LIC_FILES_CHKSUM = "file://LICENSE;md5=76ba15dd76a248e1dd526bca0e2125fa"
>>
>>  DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
>>
>> -inherit autotools pkgconfig
>> +SRC_URI = "git://git.linuxfoundation.org/diamon/babeltrace.git;branch=stable-1.5"
>> +SRCREV = "d68a4daf85c73ab7d7070de0c98d0c170af4758e"
>> +
>> +S = "${WORKDIR}/git"
>>
>> -SRC_URI = "git://git.linuxfoundation.org/diamon/babeltrace.git;branch=stable-1.5 \
>> -"
>> +inherit autotools pkgconfig
>>
>>  EXTRA_OECONF = "--disable-debug-info"
>>
>> -S = "${WORKDIR}/git"
>> -SRCREV = "d68a4daf85c73ab7d7070de0c98d0c170af4758e"
>> +ASNEEDED = ""
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


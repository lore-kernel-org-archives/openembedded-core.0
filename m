Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 41FAE60CAD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2020 14:39:36 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id r21so2447395edq.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Feb 2020 06:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yQByjDwFK9aHd+fG1VUiL4ZxU8wJ5Nw3rmZCy6UOlTo=;
	b=TfDBHmziWlZuQeTzf89fScwvMaKpJIv72YkoLpgyVrPL5rha7cdyxCT947ZzS4SS1A
	VMjUj0Ocdz7edE8zYlQhdQfdqNFzI3CiDr8HuvckNlc7yS0IhHqE9sre2xyuUfysMjpG
	SvqEJXC8/ZXw+U5mFs9fr4ha2CBreoFFL+FPjOpJJiNnt/KkIMgP6F1ZBsgO2iItIChu
	bS5xjqXtBR3LvwrCTbjrVMHlML/a0f8suIY7M01ZVtiOLLcqlvfD4vj5IGPHd34PGp7p
	bYkTREEQcW4SQ0S02Sgu6z+OUciUe2hOkj5BKrkvRaQ26rR7tD1wE4CDzzpvcQhKkpWZ
	fBhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yQByjDwFK9aHd+fG1VUiL4ZxU8wJ5Nw3rmZCy6UOlTo=;
	b=qates/kMW16KuTp/4vjs7gKP70Tmiwov/jaa9DuR1KReM/gsC0/wWEuixXVWHKr/sy
	P2nVqNF6vmfmy9Y9q941bo1H/a5dXvWw890dWQ064s+dDBH4KKwNDTPK7INLq2N9v9+f
	EjJm6YKjCxhPQgFn1k2rK4akbEBG6JnHykRM3Oo0N98RJHoxuGO4u215+8I+TCuDI5TX
	+4UpMXUM69tMsFFzli2lKAi4bADm2AbNDieg3sQjB2QLS8rU0K80zWnS+Nkc/t3jHhMw
	Jy0TIGC84VJN6TpqTAyBu2P6ZUcJPgW3TenDHtQ58tky8gCv9gbWTbaBHAm7hsoGqA9W
	9p7w==
X-Gm-Message-State: APjAAAXI7ANm33ugdl2E/QlpB4DArjuRM3UpjzUgDC2krLD8cIm4nn9G
	u00GgeslQhfB/6EydiRM6nRihhK40Me2Hn/QlQLJOP7a
X-Google-Smtp-Source: APXvYqyOroB5p5vBQr/tWpl1Bc8jrmY51WM7YDvX5E58BndkcVXROHJm4bhjZhMrjOo/zcUbkvDrWXbbpfHQmWtA0ws=
X-Received: by 2002:a17:906:9716:: with SMTP id
	k22mr29304590ejx.233.1580913576774; 
	Wed, 05 Feb 2020 06:39:36 -0800 (PST)
MIME-Version: 1.0
References: <20200205024241.27828-1-Martin.Jansa@gmail.com>
	<20200205024241.27828-4-Martin.Jansa@gmail.com>
	<CADkTA4P-C8xPVcscM3DfUJ28KR19gcHW7s1X-dbU-5FN68+DaA@mail.gmail.com>
	<CA+chaQfTcJNTnEo-kexWvM0tyq_UN2nh0rvsFO9OiB4JvN=HAQ@mail.gmail.com>
In-Reply-To: <CA+chaQfTcJNTnEo-kexWvM0tyq_UN2nh0rvsFO9OiB4JvN=HAQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 5 Feb 2020 09:39:25 -0500
Message-ID: <CADkTA4NtWnMqxygpsfwEuQ6pcJR=3QOuE9K1wmmLp4boTsHaBA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] kern-tools-native: use more common S value and oe_runmake
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
X-List-Received-Date: Wed, 05 Feb 2020 14:39:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 5, 2020 at 8:57 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> OK, the patchdir cleanup won't be needed as you've already applied that .patch file in the repo.
>
> But I have forgot to update LIC_FILES_CHKSUM, which shouldn't have the "git/" anymore as it's relative to ${S}.
>
> LIC_FILES_CHKSUM = "file://tools/kgit;beginline=5;endline=9;md5=9c30e971d435e249624278c3e343e501"
>
> Please adjust in your consolidated pull requests.

Absolutely, I tweaked and squashed it here.

But I've definitely taken the cleanups, since there's no valid reason
to make it so hard to patch (even if I grab and merge things).

Cheers,

Bruce

>
> On Wed, Feb 5, 2020 at 3:54 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>>
>> On Tue, Feb 4, 2020 at 9:42 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>> >
>> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> > ---
>> >  .../kern-tools/kern-tools-native_git.bb               | 11 +++++++----
>> >  1 file changed, 7 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
>> > index 8053483355..28080e510f 100644
>> > --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
>> > +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
>> > @@ -11,16 +11,19 @@ PV = "0.2+git${SRCPV}"
>> >  inherit native
>> >
>> >  SRC_URI = "git://git.yoctoproject.org/yocto-kernel-tools.git"
>> > -S = "${WORKDIR}"
>> > +S = "${WORKDIR}/git"
>>
>> While not common, this was on purpose.  This isn't something that is
>> typically patched, it is something I queue and bump for release.
>>
>> So I'm ok with the cleanup, but I'll drop the patch tweaking part when
>> I queue for test, since I'll have the patch already in the repo.
>>
>> Bruce
>>
>> >  UPSTREAM_CHECK_COMMITS = "1"
>> >
>> > +do_configure() {
>> > +       :
>> > +}
>> > +
>> >  do_compile() {
>> >         :
>> >  }
>> >
>> >  do_install() {
>> > -       cd ${S}/git
>> > -       make DESTDIR=${D}${bindir} install
>> > +       oe_runmake DESTDIR=${D}${bindir} install
>> >  }
>> >
>> > -SRC_URI += "file://0001-merge_config.sh-pass-LD-variable-from-shell-environm.patch;patchdir=git"
>> > +SRC_URI += "file://0001-merge_config.sh-pass-LD-variable-from-shell-environm.patch"
>> > --
>> > 2.20.1
>> >
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


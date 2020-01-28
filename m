Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
	[209.85.219.67])
	by mail.openembedded.org (Postfix) with ESMTP id A3BD360273
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 19:03:43 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id p2so6780967qvo.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 11:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QozR75qxA2nqj+3mdjevU3c4k54maVvDKq56Vdak+wQ=;
	b=ahOcrOxXdIk9PKLZssrhzkatxj/iifuCSNA6pn5ckXntwl9h3QIEBsBIFcLh0zOKi4
	3ccjRuTznrdYPKKx85Q70f8Fkpl34FMgIABA0tBH4qUw0w1RM/sUaN6otPr7lOeXaDB3
	WRXheHAmktbZjwbHTs8jl9DrRuBuC+XOMe5HK0IaAQ0BeoMR29bsy9vXN7PtZw3A/Hgm
	dvGs0wAVJnJ71wzUAfdT1KW3tc9nUJUXGYexAhIV+/pLqFzUfN0ejh5a6PN/ZrQGOOw1
	LDSjUG0EqbiLYS0MoCgmWfpSCFvLJooZAGRTkRGeq0iIsass+2NBc/GW6Ov1kD9cxYmK
	XlEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QozR75qxA2nqj+3mdjevU3c4k54maVvDKq56Vdak+wQ=;
	b=ZpgtBtajoIhzRFiNJtJkNw+2MI+UMG7Lf7+eMyiqNmm8f3woETl593QJPGew+0PfOB
	7soA4aSHI+IZ15natdejJirr6UQUo8bklK5VHvji3GZLrFFymsNo3kXBjCwHrTIsu+fE
	cw+LLkITNzXE5nauC8avpRv49D09K03GxKbS8zqUH5ElezFg0H7TEO2SFKEZgKJTXlqR
	415tjBujB5aggtTDpaAcKXFnRwSb7YXxiFW/VtH9dRDb7UR3u+KR+KDyij/0gE4VOBz1
	Woiyj8UjTMb1dRk4uvwXxwAMkb+VZJSQlDTWdW4dR8k21jkt/bicNzQAEtuJcaPRwjSo
	3PIQ==
X-Gm-Message-State: APjAAAUJOEtz6Qkeh5m05fFY860Cq2pidD4JxNK+x9InuqgKlwnSYVFh
	ptsjycM9OJigPsPSqV+GaTiwsl1R50m+co11oQM=
X-Google-Smtp-Source: APXvYqyJ81a2g7lrxhJ+Q4S9VlcFyU7WxYGL+uRDZFtiGemuN8h6l5ZbUpFnY8Qyh4OPzr4VbUbRB/917Ntg+liuuis=
X-Received: by 2002:ad4:478b:: with SMTP id z11mr24217762qvy.185.1580238224041;
	Tue, 28 Jan 2020 11:03:44 -0800 (PST)
MIME-Version: 1.0
References: <cover.1580066507.git.raj.khem@gmail.com>
	<d6dd73600145030ed93604364c66b129c8d843af.1580066507.git.raj.khem@gmail.com>
	<20200128110213.3ji3swjy2km22d7e@jama>
	<CAMKF1srz05b3nEVD7tNautZJ5E1WEObajGXi6miukyEVOQaJLw@mail.gmail.com>
	<CANNYZj-e+_y_=FbvoTALYduvi=yRy7j+VhDqHtr8nvmzkp1msA@mail.gmail.com>
	<CAMKF1sqkSGcEFRN-2LKrYKO0WbxSxVX8i9JhgxvQSL3OTSY+aQ@mail.gmail.com>
	<CANNYZj9bce0cVH4b+CPdG7RNnu_F=bWVGHoo9=QG_UPbo-Gvtg@mail.gmail.com>
In-Reply-To: <CANNYZj9bce0cVH4b+CPdG7RNnu_F=bWVGHoo9=QG_UPbo-Gvtg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Jan 2020 11:03:16 -0800
Message-ID: <CAMKF1sqpU8jJa1Qscq8coKdhy2vCi-v+xdQJ6BgJhkD7P0BM+A@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 06/13] glibc: Update to final 2.31 release
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
X-List-Received-Date: Tue, 28 Jan 2020 19:03:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 28, 2020 at 11:00 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Sure, and testing prior to actual releases is very beneficial and appreciated. I only wanted to make sure we don't tag something as 2.31 final when it's still a pre-release.
>

yes we wont :)

> Alex
>
> On Tue, 28 Jan 2020 at 19:45, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Tue, Jan 28, 2020 at 9:48 AM Alexander Kanavin
>> <alex.kanavin@gmail.com> wrote:
>> >
>> > But 2.31 hasn't yet been released or tagged?
>> >
>>
>> No, it will be released first week of February, given how much work is
>> required for upgrading
>> some of these core pieces, getting some early testing and reporting
>> any regressions and addressing
>> them while time is left in release works well for OE as well as
>> upstream components. So I usually
>> do pre-release updates for glibc and gcc for these reasons.
>>
>> > http://sourceware.org/git/?p=glibc.git
>> >
>> >
>> > Alex
>> >
>> > On Tue, 28 Jan 2020 at 17:06, Khem Raj <raj.khem@gmail.com> wrote:
>> >>
>> >>
>> >>
>> >> On Tue, Jan 28, 2020 at 3:02 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>> >>>
>> >>> On Sun, Jan 26, 2020 at 11:27:43AM -0800, Khem Raj wrote:
>> >>> > Drop ppc 8xx clear cache optimization, which we have been carrying
>> >>> > through eglibc days, it has been redone in glibc now
>> >>> >
>> >>> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> >>> > ---
>> >>> >  .../glibc/cross-localedef-native_2.31.bb      |   9 +-
>> >>> >  meta/recipes-core/glibc/glibc-version.inc     |   2 +-
>> >>>
>> >>> ...
>> >>>
>> >>> > diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
>> >>> > index dca1916e80..c2cfb7e2f1 100644
>> >>> > --- a/meta/recipes-core/glibc/glibc-version.inc
>> >>> > +++ b/meta/recipes-core/glibc/glibc-version.inc
>> >>> > @@ -1,6 +1,6 @@
>> >>> >  SRCBRANCH ?= "master"
>> >>> >  PV = "2.30.9000"
>> >>>
>> >>> Should this be 2.31 if the SRCREV is the final version?
>> >>
>> >>
>> >> Yes
>> >>
>> >>>
>> >>>
>> >>> > -SRCREV_glibc ?= "def9c08c94da60bfb746644d56cffbe7a9de3477"
>> >>> > +SRCREV_glibc ?= "352bb99754ae7c83ff1b974f9c52244e974c9410"
>> >>> >  SRCREV_localedef ?= "cd9f958c4c94a638fa7b2b4e21627364f1a1a655"
>> >>> >
>> >>> >  GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
>> >>> ...
>> >>
>> >> --
>> >> _______________________________________________
>> >> Openembedded-core mailing list
>> >> Openembedded-core@lists.openembedded.org
>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core


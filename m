Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5DCB17EEC0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 04:23:25 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id a15so1023389qtn.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jul 2019 21:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=BpGXaX8yDkwjWkV9fSdS2zyqxURU+kLCzKFqlWQ+F0U=;
	b=VBu4b4COlqv/0uHKgF2BhaiB7YSu6S1Ld6QeUtjnHhKcY2cyUmdT8Q7uqCfzzlpdai
	4GLDI0g0Nfe9ZLqlztcar7DYBIoF/i/2snNfAEBqdRqsZqZmjSMdDMGDjNF+7sZIzJm4
	g3lOH52OJblssuh+AAUdLoj3gmWm13xK06Du+JPqxI+/HQVj9eL38yT/E/iB0jy/yBOh
	V2zWdIGMdCAIJQ8WD3NhT8Hp1+ho2st1Y10BY158rD7fLm5SqSsISwoOBor0Otzo267d
	zsj4bSRIxK8cwyS+Ff1HjO/fiw2NRA0FjSeBIucRD36ozp8/ITykZMMSAlFfUyuNKqeF
	f/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BpGXaX8yDkwjWkV9fSdS2zyqxURU+kLCzKFqlWQ+F0U=;
	b=GVZSJv2+xzyHAPhsGyg63troxNNY1rgci6yc2L+8qDOOLvNb3F3GF+6gAPokvkfLm5
	v3wj3OMcNdLUK/y949RYsiAkqd0C2ZdKJPm9m74qQoW4Y5liozHxExbAL6O1iMI1Ypn/
	G8nWR/QnamFnd40ibl5FRaB7srs8wQFBfQPXaFTyYRoebIiyltiGzs5zQHZPtO481Swd
	OPeP14RweOlihdSt9goCi1qXjH8PZ/zvLZuVuwShsOB1huVkzE2XwvwMb4icqOJoIWvN
	gRhMNVjCYDH0CYJ+8auD71rsJMLIJgeIqltHAITTDC1GW+Xx406wVktVHJpq9BfSUQcy
	Qw4A==
X-Gm-Message-State: APjAAAUZO+y3fzmNBK62QvDBYZIByERL9k8ltBj0OATjZhWizAWWajLw
	7ZJ73wfKFgGzgNWPuUMxfsUml2vUMcwCK1j/Yp1uF7HB
X-Google-Smtp-Source: APXvYqzVHNULuKFY/XMcwA+D/269xxqnnWGRmQaXQBZflxcsxJXtdi9TRmvFCbCtCnMgxHi45/UM39UwIZoOiczuJtY=
X-Received: by 2002:a0c:bd1d:: with SMTP id m29mr23029451qvg.181.1562732605801;
	Tue, 09 Jul 2019 21:23:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190627154415.1924-1-open.source@oleksandr-kravchuk.com>
	<6586c7ca-10da-ae60-2494-1d3a605047a7@windriver.com>
	<580bb0ee-537c-1250-8e4f-0eae6ad0dad3@oleksandr-kravchuk.com>
In-Reply-To: <580bb0ee-537c-1250-8e4f-0eae6ad0dad3@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Jul 2019 21:23:11 -0700
Message-ID: <CAMKF1squHhx-kqU-eaiz1=s4sKDfzbY9oQdYkLK2h4rOkAggPA@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] autoconf-archive: update to 2019.01.06
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
X-List-Received-Date: Wed, 10 Jul 2019 04:23:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 2, 2019 at 10:54 AM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Hi Robert,
>
> Unfortunately I do not have an answer. I failed an issue:
> https://github.com/rsyslog/rsyslog/issues/3738
>
> Let's see what the project suggests.
>

can we have autoconf logs before and after this upgrade ?
its detecting something differently.

> On 02/07/2019 12:34, Robert Yang wrote:
> > Hi Oleksandr,
> >
> > This patch makes
> > meta-openembedded/meta-oe/recipes-extended/rsyslog/librelp_1.4.0.bb
> > and
> > meta-secure-core/meta-tpm2/recipes-tpm/tpm2-tss/tpm2-tss_git.bb
> >
> > fail to build. E.g.:
> >
> > MACHINE = "qemux86"
> > $ bitbake librelp
> >
> > ../../git/src/cmdif.h:52:13: error: no previous declaration for
> > 'relpSCSyslog' [-Werror=missing-declarations]
> >    52 |  relpRetVal relp##type##C##cmd(relpFrame_t LIBRELP_ATTR_UNUSED
> > *pFrame, relpSess_t *pSess) \
> >       |             ^~~~
> > ../../git/src/scsyslog.c:45:1: note: in expansion of macro 'BEGINcommand'
> >
> >
> > $ bitbake rsyslog
> > Makefile:14636: *** missing separator.  Stop.
> >
> > The errors are wild, do you have any ideas on how to fix them, please?
> >
> > // Robert
> >
> > On 6/27/19 11:44 PM, Oleksandr Kravchuk wrote:
> >> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> >> ---
> >>   ...f-archive_2018.03.13.bb => autoconf-archive_2019.01.06.bb} | 4 ++--
> >>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>   rename
> >> meta/recipes-devtools/autoconf-archive/{autoconf-archive_2018.03.13.bb
> >> => autoconf-archive_2019.01.06.bb} (78%)
> >>
> >> diff --git
> >> a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2018.03.13.bb
> >> b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2019.01.06.bb
> >> similarity index 78%
> >> rename from
> >> meta/recipes-devtools/autoconf-archive/autoconf-archive_2018.03.13.bb
> >> rename to
> >> meta/recipes-devtools/autoconf-archive/autoconf-archive_2019.01.06.bb
> >> index 7d62e52ab8..985a254fcc 100644
> >> ---
> >> a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2018.03.13.bb
> >> +++
> >> b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2019.01.06.bb
> >> @@ -6,8 +6,8 @@ LIC_FILES_CHKSUM =
> >> "file://COPYING;md5=11cc2d3ee574f9d6b7ee797bdce4d423 \
> >>       file://COPYING.EXCEPTION;md5=fdef168ebff3bc2f13664c365a5fb515"
> >>     SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
> >> -SRC_URI[md5sum] = "46b13a5936372297b6d49980327a3c35"
> >> -SRC_URI[sha256sum] =
> >> "6175f90d9fa64c4d939bdbb3e8511ae0ee2134863a2c7bf8d9733819efa6e159"
> >> +SRC_URI[md5sum] = "d46413c8b00a125b1529bae385bbec55"
> >> +SRC_URI[sha256sum] =
> >> "17195c833098da79de5778ee90948f4c5d90ed1a0cf8391b4ab348e2ec511e3f"
> >>     inherit autotools allarch
> >>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


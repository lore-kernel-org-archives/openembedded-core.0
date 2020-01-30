Return-Path: <sumit.garg@linaro.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id EB4E5600FB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 13:26:57 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id d16so3990291wre.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 05:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wu81+znsQVlO4GDXSknkCVCJqM91YpuGTjqELTmM4Xs=;
	b=dqU46jNcyp5Dy43+T3qx5xOFe/GT/f45C6jIMJ+L6i7lollmlmG7+K48lYpw0sikx+
	nwJkyyyZLJAhVJCfP+0YDPDoIjseTsnw08l8WJFECohQYuVlB3Gy+RBgGgMy3hh/1VHA
	iVhq6mIYS4+SK/ODS6qIPYvOIvZ4SYUOD384hJQtYhV1+kpALPu8KTC0HFEJJOmpbTnG
	i7RFZRGF3P3dSZrhNxBmdpbdlb3/THSe/wkWh/bQPPEV7IabR5YyYZAMNRt6HURQtLc9
	QNkSePTwhzfQCrYZicouDzHyDBH4hrYWZ/g764QbLcMO0r0elsC5rfTRNI2wIXY5mYzl
	JiCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wu81+znsQVlO4GDXSknkCVCJqM91YpuGTjqELTmM4Xs=;
	b=Q09uvSmCmqU6pshQkXA05R1o9D4QkHEmQjd0Pr5psLHXCgi6VZwE0nUzpOeCHG1p6Z
	rvX9siPAQ0I6h7lrneC/8PsJ8r2dYg8pm8/dN/PKHSywOzJllSV4SybrKGyj2a6s3HTC
	SaS/SnUGSCHB+FYW504Sfg7tx/FfFUb1hjrudkr8EBD83rWqXJuiofnL6UONdbGwHt/K
	uwBiLTB2RK6NplQaWojYGbNoFiSXJ4j+/BQ6seXJyI/lIFi5YbLqXpfsNCmgP8v98BXV
	TpYwCZ8QYOM4MOjsFBbxI3fFlZSzkVjTnIooe8rB+en4vx7+W4Cqlqn8+w2WJejYZdRa
	+sBA==
X-Gm-Message-State: APjAAAUms+7RsGg3ePFVygkqdseV8bn+Y63aajK2Jt3/YEU+Q0oVQ0D2
	y7c+ReFZwO00qQ2MuqEzsFRamJZM6TMWX5ib0wr61FJDF9c=
X-Google-Smtp-Source: APXvYqxhbfQVJIg/PpuW9mCbR1ghByrWUApLFIj4i85ItfNYF5RCdWHaZK/NaQTy0+VZI3DmUSFOV1aM4XIcN5BBaU4=
X-Received: by 2002:a19:e011:: with SMTP id x17mr2145941lfg.59.1580376655616; 
	Thu, 30 Jan 2020 01:30:55 -0800 (PST)
MIME-Version: 1.0
References: <1579595173-23336-1-git-send-email-sumit.garg@linaro.org>
	<2736c79c-ff8e-3d90-52cd-b264bba74d09@gmail.com>
	<CANNYZj9pLvB+buTyq0gWx_1Jh0D8V1SwyDdwbEOkmKfMLUGhxQ@mail.gmail.com>
In-Reply-To: <CANNYZj9pLvB+buTyq0gWx_1Jh0D8V1SwyDdwbEOkmKfMLUGhxQ@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 30 Jan 2020 15:00:43 +0530
Message-ID: <CAFA6WYNwY50OVknFYLdMEwRaDW4d-OD8HMBsWwrnmfAaEcL8wA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	akuster808 <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [zeus][PATCH] core: recipes: fix some native tools dependencies
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
X-List-Received-Date: Fri, 31 Jan 2020 09:28:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Jan 2020 at 22:00, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> I think a separate, somewhat different patch was sent for master?
>

Correct.

Patch for master: https://patchwork.openembedded.org/patch/169288/
Patch for zeus: https://patchwork.openembedded.org/patch/169289/

-Sumit

> Alex
>
> On Wed, 29 Jan 2020 at 17:15, akuster808 <akuster808@gmail.com> wrote:
>>
>>
>>
>> On 1/21/20 12:26 AM, Sumit Garg wrote:
>> > Some native tools dependency issues were seen while building with
>> > external GCC tool-set rather than source GCC tool-set. While building
>> > with source tool-set these dependencies were implicitly met which is not
>> > the case with external tool-set. So explicitly state these native tools
>> > dependencies.
>> Do these changes need to be in master?
>>
>> - armin
>> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
>> > ---
>> >  meta/recipes-extended/man-db/man-db_2.8.7.bb       | 2 +-
>> >  meta/recipes-extended/psmisc/psmisc.inc            | 2 +-
>> >  meta/recipes-graphics/xorg-app/xorg-app-common.inc | 2 +-
>> >  3 files changed, 3 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/meta/recipes-extended/man-db/man-db_2.8.7.bb b/meta/recipes-extended/man-db/man-db_2.8.7.bb
>> > index 083b237..0d73b03 100644
>> > --- a/meta/recipes-extended/man-db/man-db_2.8.7.bb
>> > +++ b/meta/recipes-extended/man-db/man-db_2.8.7.bb
>> > @@ -10,7 +10,7 @@ SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz \
>> >  SRC_URI[md5sum] = "ec0b23c8314a1654c4d059b2c18ce43d"
>> >  SRC_URI[sha256sum] = "b9cd5bb996305d08bfe9e1114edc30b4c97be807093b88af8033ed1cf9beb326"
>> >
>> > -DEPENDS = "libpipeline gdbm groff-native base-passwd"
>> > +DEPENDS = "libpipeline gdbm groff-native base-passwd flex-native"
>> >  RDEPENDS_${PN} += "base-passwd"
>> >
>> >  # | /usr/src/debug/man-db/2.8.0-r0/man-db-2.8.0/src/whatis.c:939: undefined reference to `_nl_msg_cat_cntr'
>> > diff --git a/meta/recipes-extended/psmisc/psmisc.inc b/meta/recipes-extended/psmisc/psmisc.inc
>> > index 594a10c..6de5acb 100644
>> > --- a/meta/recipes-extended/psmisc/psmisc.inc
>> > +++ b/meta/recipes-extended/psmisc/psmisc.inc
>> > @@ -7,7 +7,7 @@ command sends a specified signal (SIGTERM if nothing is specified) to \
>> >  processes identified by name.  The fuser command identifies the PIDs \
>> >  of processes that are using specified files or filesystems."
>> >  SECTION = "base"
>> > -DEPENDS = "ncurses virtual/libintl gettext-native"
>> > +DEPENDS = "ncurses virtual/libintl gettext-native xz-native"
>> >  LICENSE = "GPLv2"
>> >
>> >  SRC_URI = "${SOURCEFORGE_MIRROR}/psmisc/psmisc-${PV}.tar.gz"
>> > diff --git a/meta/recipes-graphics/xorg-app/xorg-app-common.inc b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
>> > index 3529cb2..211e399 100644
>> > --- a/meta/recipes-graphics/xorg-app/xorg-app-common.inc
>> > +++ b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
>> > @@ -12,6 +12,6 @@ INC_PR = "r8"
>> >
>> >  SRC_URI = "${XORG_MIRROR}/individual/app/${BPN}-${PV}.tar.bz2"
>> >
>> > -inherit autotools pkgconfig distro_features_check
>> > +inherit autotools pkgconfig distro_features_check gettext
>> >
>> >  FILES_${PN} += " ${libdir}/X11/${BPN} ${datadir}/X11/app-defaults/"
>>


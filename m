Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id DB573745A7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Nov 2018 16:21:56 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id h19-v6so6896607iog.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Nov 2018 08:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Nz9CWXO6kZeZsamTZGjRtVyXKuWim3BNMo7POBnyyqk=;
	b=SKP3UFgkpqi2vZqn7QUzDuVte2ySLzVdEhy3aZFkX/fl3aTE+nA8B7onZlLSpyUnt1
	cJMzCgVkIEA5IRJdKO2sswNdkTQOFCzgiJ5wVPGcFL7q122GYN44je9CZ1Yq0FYJQq8+
	c3w7/HcxZnhN8B2fYBn6hJ6VYW33FjJCu4ILol0axjzterCklGlMgWjOupHzSgAMKSdh
	cIVD3TJ2QyDVT2hWidxOeWS8Rhd69HGYoQUPsKVhbolYdE9X91F1cVbLjj0+8C0SHLf+
	H2BzDqhsK4tpcVq84rAwZoJil5np3O3Z4/QdW36mjOnYxK4hv+aIjdqWYnJdJierHvhf
	yrrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Nz9CWXO6kZeZsamTZGjRtVyXKuWim3BNMo7POBnyyqk=;
	b=k3J+vbUBGp54yn9dBrVZpppLVmE1sqOWTGdbM3SVncpjAhOScO43CjubKyubnSH7HE
	ak0ny0irnFt8knyJpnLE2acMobBByoOxN0AZdq2llnn90tOoGVstkY8k8mE0f22AFTT+
	dbQHR4n5dhnvBltahO5hNOEP997YQewW3gh0AKujIgplP05cA+DDPkPG+Mu2QmXq/YGV
	2xnVpQ4U3TZmB+D43oPMs31MZYu1ilrPkKaaphraPzMG9AY5W5tgosCN9l2TPMf0+K30
	3jBEpS4L0caQrCpaJjXVgrv+M0gd/DeKoggWoVEFDQYgTEl6PhGtLr3uf3yQisj98bOl
	mrlw==
X-Gm-Message-State: AGRZ1gKJx6SGIpTs2I4CRrsg7Lt+JyEu2tduHFoBS8QEzhWVixjQM47U
	ut1mC9u9bAWdX7dIy11gXDy1IPKwXLT17bjlv/7VvQ==
X-Google-Smtp-Source: AJdET5d0TTC5o68U6JKa9Nu3RmWM6J5If+eaRBC/d9TPmY+KxFb+pR9NSJDUk7fi279MuS4WZUdKuaXg5yepfHhTP/4=
X-Received: by 2002:a6b:fb0a:: with SMTP id
	h10-v6mr13070937iog.270.1541434917780; 
	Mon, 05 Nov 2018 08:21:57 -0800 (PST)
MIME-Version: 1.0
References: <20181103131223.28268-1-sno@netbsd.org>
	<11534e53929f6a521560cdf97f71b6af61afdb29.camel@linuxfoundation.org>
	<CAJTo0LbMLafivJjzW-12cJe11Jf5jxkJch9LsaqEEXpH40iJ6A@mail.gmail.com>
	<CAJTo0LYsR=JRaJD27r69XPwLm0_c5W0wa2UTDpG9Sb4Ndj+kdw@mail.gmail.com>
In-Reply-To: <CAJTo0LYsR=JRaJD27r69XPwLm0_c5W0wa2UTDpG9Sb4Ndj+kdw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 5 Nov 2018 16:21:46 +0000
Message-ID: <CAJTo0LZuBC7gUb2D_xp-jJLKxygfecdS7PBKB-_gw+LE1m=5aA@mail.gmail.com>
To: "Purdie, Richard" <richard.purdie@linuxfoundation.org>
Cc: Jens Rehsack <sno@netbsd.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sqlite3_3: Update to 3.25.2
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
X-List-Received-Date: Mon, 05 Nov 2018 16:21:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 Nov 2018 at 16:11, Burton, Ross <ross.burton@intel.com> wrote:
> On Mon, 5 Nov 2018 at 11:43, Burton, Ross <ross.burton@intel.com> wrote:
> > Mining the list archive shows that we keep on getting sqlite upgrades
> > which fail like this.  Maxin reported that it was due to the
> > full-text-search code enabling itself and failing to build, so one
> > solution is to explicitly turn it off.
>
> Did some digging.
>
> FTS5 is enabled by default, this needs log() from libm.  If enabled,
> AC_SEARCH_LIBS is used to find log() and libm.so, and this bonus
> dependency that is needed if statically linking is recorded in
> sqlite3.pc.  Pseudo then builds, statically links to pseudo, but also
> hard-codes the link line instead of using pkgconfig so this -lm isn't
> added, resulting in a link failure on upgrade.
>
> So that explains why the autobuilder explodes when this upgrade
> happens, but doesn't explain how it builds for everyone who submits
> the upgrade...

This patch I can confirm makes pseudo build:

-PACKAGECONFIG ?= ""
+PACKAGECONFIG ?= "fts5"
 PACKAGECONFIG_class-native = ""

 PACKAGECONFIG[editline] = "--enable-editline,--disable-editline,libedit"
 PACKAGECONFIG[readline] =
"--enable-readline,--disable-readline,readline ncurses"
+PACKAGECONFIG[fts5] = "--enable-fts5,--disable-fts5"

But that's a little ugly.  The alternative is more invasive and would
involve teaching pseudo to use pkgconfig to find sqlite3, but I'm not
convinced we want to add pkg-config-native to the depends on pseudo,
so I'm wondering if the third way is to just make pseudo always link
to libm.so.

Ross


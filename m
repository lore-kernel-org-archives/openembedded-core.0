Return-Path: <alex.kiernan@gmail.com>
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
	[209.85.222.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1295D7C6A6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Mar 2019 12:06:32 +0000 (UTC)
Received: by mail-ua1-f68.google.com with SMTP id s26so7489259uao.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Mar 2019 04:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=u8i0NQeKQZ3NqW6j6bNov/Pt3DnfxUhKhRzjyEnjs24=;
	b=KpFmF2W7S9Vnzv1j+AyW1RqO5FDkf/3FQaqcgBPpW/V7M6XtX/TWj+p7nuQMlkpQzC
	KtOEL8i0RjUSOMshBVEwysJsB5myeUjCMVNV6LA2uZ0xQEJitkLiTdgspz6oLkrVdhi3
	djag0ftH7LlblN7pGib2zSvu+Af5p1rNAhl7M/+4D4QA9CJThtNWI3BQdtKggrGmGeLz
	h/3qQeJBePlw8WulW1csyvnOFkydmqo3c0pgqbJ6zFPHsHeH21lgkx6Bo3W43bPiQoQI
	SooPLO9GYwet+FUFQd/2AL5ojS4wSfBkTf3EeBPTvpM9ULRHu+h8QACsJhsfd1kAThEM
	ZuIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=u8i0NQeKQZ3NqW6j6bNov/Pt3DnfxUhKhRzjyEnjs24=;
	b=YDt+w6AEFXIztJw5pQ1NIpX13XjsGnTuDICYdV2h/ou9fkwCkkNP5Xt/RSVTJ7WkaA
	Pw1nvRcG3bZl1i/glFwUXu+563gVkqYz5+e5Gh67Y1I6fZpTqS1tUmcHB+YM36nS9FBr
	C0hZN5ZIQv5+bNakZFgTNS3eJ1FF2JnMG6qbosbqYxmlzjmcT2ZAN8sz33vPTthEB6mU
	8YhH6jgx0l6l0l/w13QAQafaHwTASSefxdvmxGJl2suo4eh2jMILcx9dIxWvE1qYvFtw
	0LyWndwEaFrMYk/+WvMnEsVUBjeEPRlWoa7zMwFVswfPG2xOU49gsAziiMp6FvBOe4kG
	DQjg==
X-Gm-Message-State: APjAAAU7WihDr5wUWHjliPPGqwDKgjIeq0+MPuVsDaLZmtk5bh5Mtp2A
	5CkaCEDcWmQ3EAfFWgblEq0ACiGRpQdeqgKO99Y=
X-Google-Smtp-Source: APXvYqw7zfyPoOtoOirzuXG++6Wh/aXpKSad1qxWb9Xr2Mwdp8JPrFJYowSSvKrUnb0lQdBvKa4QOobUgbTD7iG+DSY=
X-Received: by 2002:ab0:6950:: with SMTP id c16mr1024586uas.0.1551787593092;
	Tue, 05 Mar 2019 04:06:33 -0800 (PST)
MIME-Version: 1.0
References: <cover.1551430235.git.Qi.Chen@windriver.com>
In-Reply-To: <cover.1551430235.git.Qi.Chen@windriver.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 5 Mar 2019 12:06:21 +0000
Message-ID: <CAO5Uq5Q5EpYx=+LOFp-m8y0ZfzsbUjGccHe+ArskYrm_S8jUog@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Upgrade systemd to 241
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
X-List-Received-Date: Tue, 05 Mar 2019 12:06:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 1, 2019 at 8:42 AM Chen Qi <Qi.Chen@windriver.com> wrote:
>
>
> The following changes since commit 4d275d97b6c572fe11668ac16d2c77c018340c7c:
>
>   perl: apply a native-only patch only to -native (2019-02-28 17:49:40 +0000)
>
> are available in the git repository at:
>
>   git://git.pokylinux.org/poky-contrib ChenQi/systemd-241
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/systemd-241
>
> Chen Qi (3):
>   systemd: upgrade to 241
>   systemd-conf: add version info in recipe name
>   systemd-boot: upgrade to 241
>

This upgrade seems to cause problems with the on-disk timestamp for
systemd-timesyncd. Having started writing what goes on, it's actually
in the systemd NEWS for 240:

* DynamicUser=yes is dropped from systemd-networkd.service,
  systemd-resolved.service and systemd-timesyncd.service, which was
  enabled in v239 for systemd-networkd.service and systemd-resolved.service,
  and since v236 for systemd-timesyncd.service. The users and groups
  systemd-network, systemd-resolve and systemd-timesync are created
  by systemd-sysusers again. Distributors or system administrators
  may need to create these users and groups if they not exist (or need
  to re-enable DynamicUser= for those units) while upgrading systemd.
  Also, the clock file for systemd-timesyncd may need to move from
  /var/lib/private/systemd/timesync/clock to /var/lib/systemd/timesync/clock.

It's the last bit that's tripping things up. I'm not sure I can think
of a good way of expressing that fixup using tmpfiles. I can use a
ConditionNeedsUpdate=/var to catch it locally (I'm using OSTree, and
OSTree successfully triggers that), but I don't know how useful that
approach will be to others.

-- 
Alex Kiernan


Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id B44D076050
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Nov 2018 16:11:48 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id w7-v6so13358250itd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Nov 2018 08:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ORPUI7gCpvWcPqCpJ2Mci1jfIlDEBUeS9d4NSnT5vs4=;
	b=muZcUVW4XbUG+vZZuq8ZC4/VHx8y8OAHpU64y0vif/iJIfEdz/1nKdJnjy4BWfkYMq
	N1vwwl8+lqPAqD2uhXL1X9OPvXF/BlF3SM2KsrmMnZ94DGQkP8BCis21FMTxqPykynAE
	qIFGsarL2ZknABpo1T2Mm+COqjjzwPXLyc11IeoOLcAZh2+qSR0/wYPRii4YYcFvVAV/
	iEU3ic6lJonjQwXnhL1Lzf3ITXcvRLL8Rjn6WjZr1DrYxQzpGvinwNIbof+seTjZvUdm
	FYiGFDI11D1j6aNmB58ZlK3i4vzcnUln0f7+uuSxPgkrD/KMBJsVcbjQOPufvDj/WL4C
	rluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ORPUI7gCpvWcPqCpJ2Mci1jfIlDEBUeS9d4NSnT5vs4=;
	b=p4WZz1EHU0k/x6C2f1ikEMVmQlGnA7QS4otls+ZMDU5qLQKBdwzoAX1cuqBZz5Oini
	a3U8EgbOOtuG/9j+Szs3okqZ6Skdj+7i6bAZbEwBxL3aGmhWVUACRan+c6BKcCI3t1z1
	DdBrmeDqilSGYT4tFO5T3Hc1piQlFbw/C9CFfOfzq5AFgGFpNfXicFGC52EDTIDOR0e7
	eA4KsFELgdkWe42YQofh0qMVyiMDpJHjlcH60ZiPuEaHUCTBX811NrUuRne66wBnpeL8
	+crc+KAEBJFI1nJrPyyG8C7czIK8DEi3zr+NA0VsWoYOoQgOJyUTkXjpK8uL++96Q/1Q
	ZLuA==
X-Gm-Message-State: AGRZ1gJOJA8FHCm8nw4Jzdcfeu+ginr3QpdZ+DTo6JEkb5yj8bwWZWN8
	Q4hpWP4eUovPVCLl3hbxtOFhqE5N0fzPjlNxCyGXLg==
X-Google-Smtp-Source: AJdET5ejtwIjMcMDAug/xptrEoSQla2IWtUX2cGuBcNE4yctKMUjbdDU+1/A2IB5YQQov2H0XddqttEJwhChD/1nHsU=
X-Received: by 2002:a24:9287:: with SMTP id
	l129-v6mr6878655itd.26.1541434309731; 
	Mon, 05 Nov 2018 08:11:49 -0800 (PST)
MIME-Version: 1.0
References: <20181103131223.28268-1-sno@netbsd.org>
	<11534e53929f6a521560cdf97f71b6af61afdb29.camel@linuxfoundation.org>
	<CAJTo0LbMLafivJjzW-12cJe11Jf5jxkJch9LsaqEEXpH40iJ6A@mail.gmail.com>
In-Reply-To: <CAJTo0LbMLafivJjzW-12cJe11Jf5jxkJch9LsaqEEXpH40iJ6A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 5 Nov 2018 16:11:38 +0000
Message-ID: <CAJTo0LYsR=JRaJD27r69XPwLm0_c5W0wa2UTDpG9Sb4Ndj+kdw@mail.gmail.com>
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
X-List-Received-Date: Mon, 05 Nov 2018 16:11:48 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 Nov 2018 at 11:43, Burton, Ross <ross.burton@intel.com> wrote:
> Mining the list archive shows that we keep on getting sqlite upgrades
> which fail like this.  Maxin reported that it was due to the
> full-text-search code enabling itself and failing to build, so one
> solution is to explicitly turn it off.

Did some digging.

FTS5 is enabled by default, this needs log() from libm.  If enabled,
AC_SEARCH_LIBS is used to find log() and libm.so, and this bonus
dependency that is needed if statically linking is recorded in
sqlite3.pc.  Pseudo then builds, statically links to pseudo, but also
hard-codes the link line instead of using pkgconfig so this -lm isn't
added, resulting in a link failure on upgrade.

So that explains why the autobuilder explodes when this upgrade
happens, but doesn't explain how it builds for everyone who submits
the upgrade...

Ross


Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
	[209.85.222.173])
	by mail.openembedded.org (Postfix) with ESMTP id DF23A7C080
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Jan 2019 18:30:41 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id c21so9391984qkl.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Jan 2019 10:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Ud7/kA+DzcDglEQ3JBdg9VdDqqESoy8WYETOpz8nSjk=;
	b=LMHUzm3PI0/qMHCpk3B/Yj359emuehAo6kOXA/g3BRBNa9VqP/1RcbLId1ER3U4E21
	U98mnvLSgBriv8e+3bRoRIHDCTZFEBvoBywP8W0WCqp2l832LpBen3ON1fvbBsipCLBP
	e4PwOkfFiDfNRAVOkJPHCJlSAUmoLnRnNa+Jg/xeSrkC/Ml7Ydu9uUSti6vco5Ay0Hu7
	vlsMzqhJ2YDlf6MyFTRY1YcufjbV2a1q2EvKVPQvjgQHp+YkH3dsz/JU9NA8CfByZ7Wv
	f3TI796iof5m1Y4SsommUQaKrY4K1GccEGDOvIngDwnBdV+kpRQx97UaTGvioVhqJytP
	PF0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Ud7/kA+DzcDglEQ3JBdg9VdDqqESoy8WYETOpz8nSjk=;
	b=QMzullyu7lgZZaUG/QWLz5AhKzaflfYBxJroau71Zj7DZyMCQlciWwClOpHlgxXuez
	vl7OghEGGWz2eRo3Ix9mlRAvwLQUt+GnqZAX4yHPzK4870Wu9//SJrYWIufdaVfj8oyT
	CdDmwHLF4eygSxR8P43Ow3mHeccgby0LNa63A96MLFpZe1p4TatHTAsWRhu6dsB9j5dm
	tt0bEHGMuieKgNJ9a1mZ6BUOV4I25OXO1uzJpMLtVRy3ohYD2vXpb5I50YXkvPIqdNtY
	mY8R0p/PedJia9h93+r5bQN60ky4Nap+xIIap/25VOPLeN96d1BDxpN/KZZkRbNuCTQf
	OIMQ==
X-Gm-Message-State: AJcUukdLDr4UeJod6sxTe7zo2EJitOlsHflHq6OBMbYZ4GQp30qzvBXL
	7v8a1JhV+7dvjuVwtzY1DuXpXUBd8J4kxkeOOeo=
X-Google-Smtp-Source: ALg8bN71DP2GbRuSA6z32YuU8ViG9vFJhI6rpjU9yEo9TnYuwEvLmTjW+j8o5HenGilMmWg3ktLtClCB/rRxb0RhqE0=
X-Received: by 2002:a37:ac05:: with SMTP id e5mr20572910qkm.102.1547404242524; 
	Sun, 13 Jan 2019 10:30:42 -0800 (PST)
MIME-Version: 1.0
References: <cover.1547316462.git.bruce.ashfield@windriver.com>
	<a5bbd32ecd957f036a9b1e47cc4e3c813d206111.1547316462.git.bruce.ashfield@windriver.com>
	<CAMKF1sokO=RakSBuZy-o4cMBB5EYzDrEJ+R7ZtfzyddNaxqKQw@mail.gmail.com>
	<230139f6-ad04-7033-5da8-3617b8a7a6a9@windriver.com>
	<CAMKF1srt-KM61LaOmvorNY8SvQ98dAB36-HmMz0b3Zym1gMudA@mail.gmail.com>
	<CAKmqyKMyqXnY3Cpmg4-_pz5WDCf3N_-obBvOKnyu=ETpQ2m2rA@mail.gmail.com>
In-Reply-To: <CAKmqyKMyqXnY3Cpmg4-_pz5WDCf3N_-obBvOKnyu=ETpQ2m2rA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 13 Jan 2019 10:30:16 -0800
Message-ID: <CAMKF1sruevMMXjRreTLeyBXnzgXM0WaGYge-tFfk8GC9aXpfMQ@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] linux-yocto/4.19: introduce qemuriscv64 and qemuarma15 BSP definitions
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
X-List-Received-Date: Sun, 13 Jan 2019 18:30:42 -0000
Content-Type: text/plain; charset="UTF-8"

> Working on it! Waiting for an improved boot loader.

thanks for update Alistrair.


Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
	[209.85.210.47])
	by mail.openembedded.org (Postfix) with ESMTP id 9B6377D1A2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 14:08:10 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id c16so18434079otn.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 07:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YhscvmLH0OIYws/abV8JGFlCNVNuXNwQhQEYcH/o6t4=;
	b=TDYiYB5kzCYW2/LGtW/uQq37RA0z04nQTOiBOrodRSAqsKADZkxRrsyHvI6a8lduTK
	YL3H45PpY2PUHLex+urL6qJvaT2KAFKUJjHiN1usaLUPPnT/pzhFNHA4n5rzJuSMiX8N
	KiuZFMJmjF61cOb+QhfprfQGCLBTF9qbd5VD7dcE6py+DX6vQ+JRfG42UD9IXhTevNfb
	6FuB3seYl0w9zvbELNggCK823qsAt7xCu/mZy48kLrj9JYNRBaMji4i2HiTCIwIuMLcu
	FEcsNT7ly88WUA8dCCff8xRa/bc1e4//K91pa5IiNyh8a+0fffEoiCr/27gQNuBFh1DP
	iSAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YhscvmLH0OIYws/abV8JGFlCNVNuXNwQhQEYcH/o6t4=;
	b=buUx+/zhyKcEwDOLmmLUIPs7Qo/G4sHABmgswg2KBkPXvJsd1m47KZX9YbPpgIj7H7
	KtrkREG8n4+Bj2FceJPHFRI2r34lIupq7fEaW/ZEqM+KyZCTxAD0rM7b6vzI/Y4Z9Nr5
	54ZozU+5+M0yy/kl224OKJR8R7594AA/TMDy7q6tXwh9/aWh3wr/sBfRt2UhutWLbDei
	QFMsaytSLBJjyEWDYWD/R+dzvQUPvIKduxZSoV3huFRbe3NFZZA3ywNyXv5Ll46wdtBR
	l2Izl5HyZPCxNldy/PQaoanizCFKOJkSgsWauAhOBqqIW1IZBEekikijuDMvYM1uKg1X
	ZILg==
X-Gm-Message-State: APjAAAWd0U/Gxh9HCQkwJRLNHXyQqn+YhiTXu4xKp6HiM4yr/UQDXHr5
	rdFMV1xI4/+ILky0zM7cUun+rnpcyrIc2L8yrXk=
X-Google-Smtp-Source: APXvYqzB1f3Gq5gDC4qbfVCydxKPMH/TVGslwEEajhwpT09BPASVc5dS94AM0ws9NbINkUHYqJAa7yCk4iLnnlbZwBA=
X-Received: by 2002:a9d:68ce:: with SMTP id i14mr5242372oto.293.1553782091663; 
	Thu, 28 Mar 2019 07:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1553775186.git.Qi.Chen@windriver.com>
	<a1544536fd186e7326faec46f7e35c6a1d33e45e.1553775186.git.Qi.Chen@windriver.com>
	<CANNYZj_xbMheU=FEenRYkccJwxG10mJPHSqmwekt+EqAV=FumA@mail.gmail.com>
	<CAJTo0La3fza0yn=dcWYWjSh00oJD1NQg8UMDOYSN0w_y4qODXw@mail.gmail.com>
	<CAJTo0LYwZ0WNNsA0Wm+uzAsuAHHiRzKOE=aGZZOkRfa56Furpg@mail.gmail.com>
	<20190328134644.GK18421@bill-the-cat>
	<CAJTo0LYw1UPfhZy0oJZ5+D=nL0THTaFF4M-1gR8YdqGykB-JmQ@mail.gmail.com>
In-Reply-To: <CAJTo0LYw1UPfhZy0oJZ5+D=nL0THTaFF4M-1gR8YdqGykB-JmQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 28 Mar 2019 15:08:00 +0100
Message-ID: <CANNYZj-qn9M=hrJoAh-U7SpiUqZ5v2ctC5AzBKM0yoDkT8q6pw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Tom Rini <trini@konsulko.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] binutils: fix PV to respect upstream tag and also cve database
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
X-List-Received-Date: Thu, 28 Mar 2019 14:08:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Mar 2019 at 14:51, Burton, Ross <ross.burton@intel.com> wrote:

> Bumping PE is even worse as a PE never goes away.  I say we leave it
> as it is, and ask upstream nicely if they'll match the tag/version in
> the future.

The tag and version upstream are both 2.32. It's Khem who declared PV
to be 2.32.0 :)

Alex


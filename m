Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id 2D1E677E1B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 02:45:34 +0000 (UTC)
Received: by mail-wr0-f175.google.com with SMTP id v104so1354715wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 19:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=Dq/iq4L6An51e4BCLO72ZS4gKzeFALSw0r3Keb8nkxA=;
	b=v8kUirQ+F4egdrbaMcMhKh/XTZKXpZofOHtd/AM1AACtP8I3ErNKEknkN12CttJolj
	9ZaO0f/l60p81bJobU+eh48CyagoRViBHmiSfuF+Ac03wATslstF2puMDWrcoTmpMUte
	cbj3mZ5BEA81pXiHcHzGOH8j5ICth33KrFLuMCzMmc930nxRpZbSECYB2NowtoEu9w1S
	rT7JagZ6CLfLVasDEGxUr39ytAjKTi0aljvnSXAj9io51cYHScSHtPB21J9Jqs2aAiIM
	dOCKQZpuytsY62V5zTh8pQeOd4HM2K9U+yBQ4WRxbfcWLeEkT8dIYCzRbZegeCgGzitS
	OQgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=Dq/iq4L6An51e4BCLO72ZS4gKzeFALSw0r3Keb8nkxA=;
	b=f6LwGO/3xHg3G9PUUaSTNeWE2JUL6sivj4l+nkvzF2HlStMpI3TZvc7e/d+EQO2C4K
	7T5siup9XCqFqAtZG1OeRtroN+I/M0RCIWkWGJATMxQakDBP9v+WQBV9lwX1xKcN6nNY
	jK6n1nT5coBicfpRi/6rwYhCCSRlCm9qqLaf6nVN69Q28pxtjRYa3N6JDKcGV7cqV1IH
	jQR5qNYgHnPmlMvDtYKao46cQ0rrmljmYRT4ykBFjNpIGz/xB7Eyd+Ljutbuh9/GQs1F
	XgJkIg/Z40dkf2QFifKqixDyhpHjG5NFlLRloQnCs1bGV53r8E1LmHiSq1m4JUlhb4ro
	fYzQ==
X-Gm-Message-State: AODbwcDL8pJQxiCKWBn65nL7W4S6hrb7qAsJprhLmGrVBXY1UAyDOrx+
	VDVu75d2SmVWCUS7ZOk=
X-Received: by 10.223.136.201 with SMTP id g9mr10877762wrg.42.1496198735391;
	Tue, 30 May 2017 19:45:35 -0700 (PDT)
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com.
	[209.85.128.182]) by smtp.gmail.com with ESMTPSA id
	b81sm20889070wmf.7.2017.05.30.19.45.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 May 2017 19:45:34 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wr0-f182.google.com with SMTP id j27so1329677wre.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 19:45:34 -0700 (PDT)
X-Received: by 10.223.138.194 with SMTP id z2mr8785728wrz.66.1496198734157;
	Tue, 30 May 2017 19:45:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.236.75 with HTTP; Tue, 30 May 2017 19:45:33 -0700 (PDT)
In-Reply-To: <20170531023456.29567-1-JPEWhacker@gmail.com>
References: <CAJdd5GYuBbqarXs38M91atDyQhz17EcPDE9yKme-oiwDjCtaaA@mail.gmail.com>
	<20170531023456.29567-1-JPEWhacker@gmail.com>
Date: Tue, 30 May 2017 23:45:33 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoQarQGGZS4Wu4i3MJO0j3Ms9_5qQuO-n_muxVpR-BhWg@mail.gmail.com>
Message-ID: <CAP9ODKoQarQGGZS4Wu4i3MJO0j3Ms9_5qQuO-n_muxVpR-BhWg@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v6] openssh: Atomically generate host keys
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
X-List-Received-Date: Wed, 31 May 2017 02:45:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 30, 2017 at 11:34 PM, Joshua Watt <jpewhacker@gmail.com> wrote:
> Generating the host keys atomically prevents power interruptions during
> the first boot from leaving the key files incomplete, which often
> prevents users from being able to ssh into the device.
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>

It does make a lot of sense. The only consideration I have is that
this might be a simple rework on the recipe:

       install -d ${D}${libexecdir}/${BPN}
       install -m 0755 ${WORKDIR}/sshd-check-key ${D}${libexecdir}/${BPN}

can be replaced with:

       install -Dm 0755 ${WORKDIR}/sshd-check-key
${D}${libexecdir}/${BPN}/sshd-check-key

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


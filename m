Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id 479A47D00B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 11:05:40 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id u15so8105706otq.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 04:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CAmjVhE6yMJeZOPKfAzswBLp4y8t8Zi7YycnKPk22r4=;
	b=AE2CVsBeB0/8Tvm+84PTSYXVbHaX1xVH7AnUjzUPzsnZ821YzeqDm3yqdqoaIjCV2N
	x0sXEWMLwr/abHgfJk8pbw2VXuEjSUewWPWQSRBK8vy8rNHEmqbRzASOL9QbAKWysVU6
	tBXZ0bwq6mb1hbYt1Mm9/oo2M02GMNN9Y9DbWHYfGRdWHhxDyEYf0v4v8Bf3G21Ogg4I
	jd3tOkxjyITqyzm+2EjsyAWAjugdOQJ2DklhP2Cr1/nucBelCRClMxpkaQu5uoseu0sy
	K1Z4l7WLTDNl4iKjwJ4SUo+O08eh9jUCitDbNfcHPVYcWiuFxw5qRD19MNj/JofAkM1i
	aKsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CAmjVhE6yMJeZOPKfAzswBLp4y8t8Zi7YycnKPk22r4=;
	b=AOMzSuyI6laM50MI5H4lfqUBgq+l1ENJQdpeMQOAoAoicE93UgtlryCSJySYHlWLSX
	N+cJ0H7i+o5h6sdEPwaoZPm07uIO4YzQVXlstZXRzXr4eWipdBw2uxDfy8E7psqF9EpJ
	WPnBQ3qeKdMOKGct0PB3W7E4ugzD/0+1+lcuzQV5YyX9cL11LPjklOZlAgGYHYhcn0Kl
	ZBNVBO34NFLfXevA7iMhxC2O1ASGoACZHhH543oxGHpukuFCSgoyVK60btavVzlcbu4U
	w7a5K7vRQADYjcW7c1qz6p6MUeHvsBDtyTssI4bKmb7/TPWwUfsBiV656fjBUfg3/yJS
	DagA==
X-Gm-Message-State: APjAAAX6zBk4wbDMmwhfZIS/Sgj1cDIUFMNY+ZUZY3QPj65bZ/vpHVaf
	cPiLSoVdRLZn34BtOx6fJDGMABplVIHp0FQEtv8=
X-Google-Smtp-Source: APXvYqw0Qz4zMmPVu0TsXiTMsoPyxvUNlr4xRaN6ORbmr5semlg41jaOEfMlY3KlP5z3PF7c8xL2gFtotGrO9FOfJj8=
X-Received: by 2002:a9d:68ce:: with SMTP id i14mr19851114oto.293.1554116741165;
	Mon, 01 Apr 2019 04:05:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190328012606.18550-1-zangrc.fnst@cn.fujitsu.com>
	<CAJTo0LbmYz0v9ce44H65+vxFffiC3wnmGNXB9XoxeR6-v0TnEQ@mail.gmail.com>
In-Reply-To: <CAJTo0LbmYz0v9ce44H65+vxFffiC3wnmGNXB9XoxeR6-v0TnEQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 1 Apr 2019 13:05:29 +0200
Message-ID: <CANNYZj_=Pmt-XopUmD1nEUqbOUVC5uVX3h2Q0KUvbYwDo0SK+Q@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ethtool:upgrade 4.19 -> 5.0
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
X-List-Received-Date: Mon, 01 Apr 2019 11:05:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 1 Apr 2019 at 13:04, Burton, Ross <ross.burton@intel.com> wrote:
>
>  WARNING: ethtool-5.0-r0 do_patch:
> Some of the context lines in patches were ignored. This can lead to
> incorrectly applied patches.
> The context lines in the patches can be updated with devtool:
>
>     devtool modify <recipe>
>     devtool finish --force-patch-refresh <recipe> <layer_path>
>
> Then the updated patches and the source tree (in devtool's workspace)
> should be reviewed to make sure the patches apply in the correct place
> and don't introduce duplicate lines (which can, and does happen
> when some of the context is ignored). Further information:
> http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
> Details:
> Applying patch avoid_parallel_tests.patch
> patching file configure.ac
> Hunk #1 succeeded at 2 with fuzz 1.
>
> Another patch is already on the list that doesn't have this problem,
> but please fix all warnings.
>
> Ross

Generally, do use 'devtool upgrade', as it will automatically refresh
the patches context for you.

Alex


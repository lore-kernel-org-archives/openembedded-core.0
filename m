Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 621886C4B1
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Dec 2018 18:59:12 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id p17so11436019qtl.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Dec 2018 10:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=D++jTHDCR6qEnhLz9OpsI6V4FlEw9B94QssJ7thTavI=;
	b=O8XAIU1n+liVG0yiKtsf5GOfV9azHuWciR20HpNC7tHVh6zwhKoucU5YJbnCagdvDX
	DtA6uqCNqQnaeb9OGiNdi679rngGAkgpeeA6NKdl7BdE+jJ9l4/rptbQS+2THMa/QZ8F
	wRH2OfwcR2kU9mPcKLFOwNzi6oB92ob3X42gsyJPk+7Mt5LFxSx4DZH+E63Pp9utR3NJ
	hG8GPwLHQZpnKChz/3yNYIiyybh/P3Y1L6LuvZnoTFpoBFPFyfbInfUnf9uDp305XYlW
	wW49mGYCp5x/sWHq2PO95H7riQnzOcIvtYfLVSE91fRLhTEKCLOk7q1jGqz7pnaUSmTY
	pxlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=D++jTHDCR6qEnhLz9OpsI6V4FlEw9B94QssJ7thTavI=;
	b=ct3KCRjtSGDWDlRlQl+nky7rY51UrlQ/h9GazryDJvyDaKJqtxHgkHaArjvEvVquT5
	7i00uSVRirNHqGBKwEq1bwtaTIiAMFFGle9Knh7EgO1J2T+4aaeT+9DoyWdhRZsyz0xs
	lCHwcpPJck7wfhVEei3FGQiriZ0dmpA+NRZJZClH2MZMYttjfWukN2fgUGgTmROQRUEj
	XlvvD0Sr35h/Le1xsZj5UUL9WLmmRNxp4UBNtqgkbm0Yk7Wm6mhGP91HdruyJZOsTBt5
	//nxj7nqst20NJKHSlkvCjHCYUbUvoaCrcP9pxq7LbjB4WiesUvZxeAEt410hiE0w8rf
	uvzA==
X-Gm-Message-State: AA+aEWa1+ejM5jiLwA2zGYWnW0kTGZOAjtSzg9Wp9fW5TmJX5tlSnm6P
	StFUElaQyoCK+5Inqp4Ncd1aybfMmnD5i6J3n0o=
X-Google-Smtp-Source: AFSGD/UnlNILsvsMPuM68HD55kD/Em1VF20M3VK2qSCeKo3dgNO6np6O1XfebpZr1qRw48/w6iuq4jRJI68NS5cFyFE=
X-Received: by 2002:ac8:16d8:: with SMTP id y24mr13125929qtk.253.1543777153114;
	Sun, 02 Dec 2018 10:59:13 -0800 (PST)
MIME-Version: 1.0
References: <20181122154136.121480-1-alex.kanavin@gmail.com>
	<CAMKF1sqst3bNey6Gwf2bTa_oKOVrFjKsWcPcM4sbAYTp3SxA3g@mail.gmail.com>
	<CANNYZj_H=i+Oa9JKaXaAVW6_vy-9o5YgDOHE76g1Q9L5=K5Jog@mail.gmail.com>
	<CAMKF1sr7mXJzgwbzer0=UUbUoEYgXM7x=0ZUjTQn6_c-3ZC3Vw@mail.gmail.com>
	<CAMKF1spTysVajGbSQrSAafq1zomuK+WbPwJZCmjFr1x9sO3Rig@mail.gmail.com>
	<CANNYZj_mcJf2wLugm4t9qTbrmK5+fVD62hyiR1q1__NP7UzzjA@mail.gmail.com>
In-Reply-To: <CANNYZj_mcJf2wLugm4t9qTbrmK5+fVD62hyiR1q1__NP7UzzjA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 2 Dec 2018 10:58:46 -0800
Message-ID: <CAMKF1sr9V+Rihat0f7OZ-aVkxH2b+s8XYtPJNekD1nJAmXJ0aA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/16] gobject-introspection: update to 1.58.1
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
X-List-Received-Date: Sun, 02 Dec 2018 18:59:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Dec 2, 2018 at 3:23 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Tue, 27 Nov 2018 at 20:00, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > and here is another qemu crash on qemumips seen lately after these updates.
> >
> > http://errors.yoctoproject.org/Errors/Details/202380/
> >
> > look for "Segmentation fault"
> >
>
> I just tried this on qemumips with poky master, and couldn't
> reproduce. Qemu works without crashing.

I think this regression happens on certain host distros. E.g. ubuntu 16.06
ubuntu 14.04, centos7 I could not reproduce it on ubuntu 18.04 or archlinux

>
> Alex


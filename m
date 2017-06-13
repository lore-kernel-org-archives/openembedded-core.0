Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 379F6782F6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 16:38:32 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id u19so179554385qta.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 09:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=q2JqBQgRCtXk+W/v/3PUCK243iXlCpjIBu6mp22zeNo=;
	b=ucX2Os7NtX+DyVkAiW1CXzvC3fPBZTaYsEe0mTWm6Bc7eJ+4GbyB3TC7K9BBDmkIKj
	O+GaEkq3clqydz4E2/KRdemO3ql1ibVtS5R7OAbMo2exkPK2e9lGAvVrEs02MFBF3H+u
	G4+wuwzWxJN39/83kaLGlDf9f7eN8inypb4U7ui0TwIgS3uQ+MJf2uu+IQP8bUYj7XDP
	8dKJjqeMi6Q3dKgHklq7eC8Pa93C5dr+26DCT6WTeOve6fkHXCcyVeODWh6cY8BKUxR+
	GXY2bTvK4Kw0XQasl44ZmrpjlX4/fsbDNNJq6jy9i7/5ekl9xO7WIeajwgchekkWrRvr
	V2Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=q2JqBQgRCtXk+W/v/3PUCK243iXlCpjIBu6mp22zeNo=;
	b=sd8OpNJ7h3oCdfKNYwUDuX1LP1ZUJMe6dzaB1tUsVo1LxiZNMlQRZB51KCCSSJ7KOC
	TFC9uGlbFYFLHJFgWiMwxaaiBBT8CqoVcpkGrwxJH0o7tF0i1nhCIgMgKkL7hgOw+LXB
	8mIzYpMp3WYE1f5IZDicbKFc8T0IhdtMYyEPCEY4kbA5n64bNwf6dQCOdM4JB9qdCvlc
	UDlhlDWSWJ8rlrTpLBeK96raXAKsQpRlrpEawsVFDVbAE1qLqZWocV/ulOvkRHA6Mojk
	NBnvkYqtmFvYKHjy9ByJcj1ko5Q2CZwme5paGeKu+1JQtm13IdnSePhe19aBM5yDWMHa
	8nOA==
X-Gm-Message-State: AKS2vOxg8dLuKVxnL351AnqLVbyUIEp4ITXIg8UYKa/zvuo8qyDJLkb4
	G2ChqngpIWqxd6tTl68Zc/mIG6g8PSAo
X-Received: by 10.200.45.206 with SMTP id q14mr1058986qta.177.1497371914067;
	Tue, 13 Jun 2017 09:38:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Tue, 13 Jun 2017 09:38:13 -0700 (PDT)
In-Reply-To: <55c25692-acb4-01d7-5c6d-c180508b8729@xevo.com>
References: <3bd366a6-a31c-e4c8-688c-e24e84f1520c@web.de>
	<2af19119-fac3-8ce3-fb36-c4aaf64163b7@xevo.com>
	<4e18dc00-1800-f2dd-797a-7e0a380467c4@xevo.com>
	<b51b0f8b-e21b-087b-5225-38fb8040479f@siemens.com>
	<8098d7e7-b887-4c4f-6dba-db9065c97571@xevo.com>
	<CAJTo0LbrkS8oG1s05KcMu6mREZwd-+h2aGwo7cLXjJc08XrMeA@mail.gmail.com>
	<f64173c1-2746-06cc-d283-6d42c670cb69@xevo.com>
	<CAJTo0LbpaXG07FouMMN5qa7zVUqkgxAG5OciFXQmhCzoSxrrEQ@mail.gmail.com>
	<55c25692-acb4-01d7-5c6d-c180508b8729@xevo.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 13 Jun 2017 17:38:13 +0100
Message-ID: <CAJTo0Lagk3XBDGYsCb0UpjmYDNWPQwjqnTsAMDPd9DSP5Xq7Uw@mail.gmail.com>
To: Martin Kelly <mkelly@xevo.com>
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tcf-agent: Fix daemon termination
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
X-List-Received-Date: Tue, 13 Jun 2017 16:38:33 -0000
Content-Type: multipart/alternative; boundary="001a1137925608f8b10551da1179"

--001a1137925608f8b10551da1179
Content-Type: text/plain; charset="UTF-8"

On 13 June 2017 at 17:35, Martin Kelly <mkelly@xevo.com> wrote:

> Alright, makes sense. Do the patches look OK to you?
>

Yes, they're both in master now.

Ross

--001a1137925608f8b10551da1179
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 June 2017 at 17:35, Martin Kelly <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:mkelly@xevo.com" target=3D"_blank">mkelly@xevo.com</a>&gt;</span> wrote=
:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><div id=3D":9p" class=3D"a3s aXjCH m15c=
a24ffcdebbabb">Alright, makes sense. Do the patches look OK to you?</div></=
blockquote><div><br></div><div>Yes, they&#39;re both in master now.</div><d=
iv><br></div><div>Ross=C2=A0</div></div></div></div>

--001a1137925608f8b10551da1179--

Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id AA78B7391D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jul 2015 08:19:08 +0000 (UTC)
Received: by qgii30 with SMTP id i30so80799085qgi.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Jul 2015 01:19:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=j88DDX+RzoUw7WlDvz+o54gFO07vAvMGD5rDV23dzFQ=;
	b=es2GKXJLM9YQ4fsWF6SYTfDnNtP7ZTDwqKNZKt1GcJwVRNwbUdFKfg98fYb1GDgm4D
	32j9dGGM/+Q5qvv82dfo9G4rAdnpXw5BxqbJeaBS4QYcZ4xH58b2eKsqkjdgNGrUkS0e
	4AYj6tALmqxTm7iN6LJmG6aoyRs46qXVUHO+L9m4QyoIJUMUw6JMh+fZAMN7b8BPccFz
	bgVqZQXi5kZkxTI9Xcm7TJet9MBevKVSVIc6X6N3xuAJvtHr6f80r/p3O/fk7yHQjk3s
	Ny5pmtcOBKtD8YGBGnQtgmbjV+KUSTuJKvxqq5+SZqbqqgoyMn8/pHr+p1kwcbBczxgz
	dawA==
X-Gm-Message-State: ALoCoQkuYRtFX7sZZEGcXE/fxBdWWVbSzdW1/5HFOJAwRxupnxbEsrZHlNtO2At9MKZsgIvo8Gnc
X-Received: by 10.140.235.19 with SMTP id g19mr5178235qhc.52.1436257148093;
	Tue, 07 Jul 2015 01:19:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 7 Jul 2015 01:18:48 -0700 (PDT)
In-Reply-To: <1B56A49860EB2D45ADE3731B15C959FDB29591@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1436147494-44348-1-git-send-email-leimaohui@cn.fujitsu.com>
	<CAJ86T=XJeo31ntBEw16vCPuTyAwYvsij_Aoq=EKgRyhCnYyzOw@mail.gmail.com>
	<1B56A49860EB2D45ADE3731B15C959FDB29591@G08CNEXMBPEKD01.g08.fujitsu.local>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 7 Jul 2015 09:18:48 +0100
Message-ID: <CAJTo0LZx5mPc+2_wmO8WfYs-s5smFuZYyAmYfZS4Bv+BoW7SEA@mail.gmail.com>
To: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: FW: [oe] [meta-oe][PATCH] parted_1.8.6.bb: add parted that not GPLv3
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
X-List-Received-Date: Tue, 07 Jul 2015 08:19:10 -0000
Content-Type: multipart/alternative; boundary=001a11376dac1e631c051a44ad26

--001a11376dac1e631c051a44ad26
Content-Type: text/plain; charset=UTF-8

On 7 July 2015 at 04:50, Lei, Maohui <leimaohui@cn.fujitsu.com> wrote:

> Can non-GPLv3 parted be added into oe-core? I think not everybody wants to
> use the GPLv3 version.
>

There's a good argument for this, so send a tested patch and it can be
reviewed.

Ross

--001a11376dac1e631c051a44ad26
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 July 2015 at 04:50, Lei, Maohui <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:leimaohui@cn.fujitsu.com" target=3D"_blank">leimaohui@cn.fujitsu.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":32k" class=
=3D"a3s" style=3D"overflow:hidden">Can non-GPLv3 parted be added into oe-co=
re? I think not everybody wants to use the GPLv3 version.<br></div></blockq=
uote><div><br></div><div>There&#39;s a good argument for this, so send a te=
sted patch and it can be reviewed.</div><div><br></div><div>Ross=C2=A0</div=
></div></div></div>

--001a11376dac1e631c051a44ad26--

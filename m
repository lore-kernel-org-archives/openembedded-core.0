Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id C64136AC37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 21:06:06 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id x131so234828288ite.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 14:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+Cgjh3kpHDp8J0e9/F5ha1VvQQjHwySTkZYKnvbR65c=;
	b=xZ0e+UHhUCj7Rowc6d3ayDPet4n+KhSZVSbw1NljUMTu0pbLhtAsgX78DuWoXa+gKm
	F2jVQgktyGuhduXFgNpq6Wgz3Qlv46fQxOROy8/zGlzBHgHia/uzC9S6lEpR6woOyXWY
	Xj9n13RI6ZHW6d8XfHICvRkvRqdPU8LE7RLUn8XHJmQStyy256K8EbUjmrIvgvNxCUzU
	md1CTheUwaCpRhxi4sbDC7GD2qjx53RRTzOKTO7Tiou+PIArLZOK9ZlsL5sPi+zfWznL
	ccOZS9NUmE+05bLaELL3keNh5IKovxwOJzmPw/rnaC47xBQ1rmwhAUTEHA1E44iczhQ7
	/PeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+Cgjh3kpHDp8J0e9/F5ha1VvQQjHwySTkZYKnvbR65c=;
	b=nGTnqxz7jVIZcGFJeoCh1x5vMfCJKJvFhnEwi4zhSHfQwDz2vTXWOvluNbyQb217RM
	gNWSPAxsADE2DMrOxvjOEjxfDccqoDsd1LG681Ln/w+uOjLYd0FxWJbkMML6GbUWP59e
	nscviRuFRZLOuJhBXOtg6l8KWED/WeVdyoke3Hzxyw63/VMibucj6L2cB54M6yrPdPtl
	GGzuBexsKu+QzsDM8DFjXeDO/Ax7FK5RojYoxTDoXWuLkgbRCKF5+YxV7OJyegNu5dU8
	zja5v54WILr77b0pYH55WQxKDdNtaLVKxeM1wxeGQeaX7nE9eG5Ypih1zRmEoM2IvH3h
	Iung==
X-Gm-Message-State: AE9vXwOR1haY3H9DjMHVYGxb/WFLaFb5W6jRCuP2e/pot19DwwseizAfeVLfhvZoP//0fcj/JbUqNbESi6rWgwn6
X-Received: by 10.107.135.142 with SMTP id r14mr6901952ioi.133.1472072767120; 
	Wed, 24 Aug 2016 14:06:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Wed, 24 Aug 2016 14:05:46 -0700 (PDT)
In-Reply-To: <1471011020888.78139@saabgroup.com>
References: <1471011020888.78139@saabgroup.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 Aug 2016 22:05:46 +0100
Message-ID: <CAJTo0Lb32sv=S2q=5YQAHgWRd__8hv1iTHpb8CyPssCgfQvcWA@mail.gmail.com>
To: Waldo Mattias <Mattias.Waldo@saabgroup.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: include signing keys when copying files required for module builds
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
X-List-Received-Date: Wed, 24 Aug 2016 21:06:06 -0000
Content-Type: multipart/alternative; boundary=001a113eccbc5e38bd053ad7a633

--001a113eccbc5e38bd053ad7a633
Content-Type: text/plain; charset=UTF-8

On 12 August 2016 at 15:10, Waldo Mattias <Mattias.Waldo@saabgroup.com>
wrote:

> The absence of certs/signing_key.* in $kerneldir made signing of
> out-of-tree kernel modules fail (silently). Add copying of these files
> during the shared_workdir task.
>

This doesn't apply to current master, can you rebase and resend?

Ross

--001a113eccbc5e38bd053ad7a633
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 August 2016 at 15:10, Waldo Mattias <span dir=3D"ltr">&lt;<a href=3D"=
mailto:Mattias.Waldo@saabgroup.com" target=3D"_blank">Mattias.Waldo@saabgro=
up.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":=
2m3" class=3D"a3s aXjCH m1567fc3dd6fccbe2">The absence of certs/signing_key=
.* in $kerneldir made signing of<br>
out-of-tree kernel modules fail (silently). Add copying of these files<br>
during the shared_workdir task.</div></blockquote></div><br>This doesn&#39;=
t apply to current master, can you rebase and resend?</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113eccbc5e38bd053ad7a633--

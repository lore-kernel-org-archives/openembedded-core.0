Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4E81A75CF1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 10:52:50 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id u186so8798953ita.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 03:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eFmqD2RsMT+L8jmn5QCfldBFqPs5sfSZtnUzpk9pbEo=;
	b=b4V7nx8McN1IBMomyrnMQq3FAsiyVY1N1aBAGHdOY7enlMpITYphiRKkKlU/Y/wnfQ
	TvsRzpdhG6m5PAgk2VvUj2ki2+0EtBoCwi6dji+ZgunMtlayq3Ds9geQnmIQ4HvxjYjS
	GKNjjgMk9Bnukk9a+3UEnpk6Jlt7oF2diSFmqXeuLa7485fjKH39KnmAOalw9nNKRflL
	Zip6RPaCs2dlgUfMRTLy51Lg9KIxQhAhDb0z/80a9gCZyT0CKULr7/A4an7eBA2iS2fS
	+QO1U2Q3qP2eltTix4+BFIr8dmbhFRQ5cFOep9ZBJZGyHOFXCHl4b1lTMMN9vKI1r3M2
	rZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eFmqD2RsMT+L8jmn5QCfldBFqPs5sfSZtnUzpk9pbEo=;
	b=Z0jaiSGbz36gKUUW/S28ycQirIevduUtvTvi+zaGRCJZaCTGl6xIncJ6Xr23aGduty
	IzaSlxb35WzxoRvC2Jm6sHkwTyQICuP1z8uoaduGCH7k2BFHHYJ/NCtrTMLjSKInqemi
	BJRsrMWR2yES1siipUxuZftE4DoxlBF9F9xN+LKBWQ9wSUPYMgtJQB7ar5LUumlO6TLf
	EW3DKLw3/ubo93DK5Euyc+JcfaGRNIsZTx6gAFTHWIwonFYPiDnrwpAzIbR0N6+crhJ7
	s0xSmNh5O7/JBVI7w44Yi/O0CJ4Y9cobdgNv7Bk1X7OX7UkB+JttjL9CC8f+lIzB937r
	R3WA==
X-Gm-Message-State: AEkoouvDT+dzecb7/WREOXAcfo3EjUhSezLAhBL+A7IPM3mV73HD1iKCp9qlMVjMwAnjWzAjESiXf4/nAnBuuUGG
X-Received: by 10.36.57.211 with SMTP id l202mr2484841ita.22.1470999171251;
	Fri, 12 Aug 2016 03:52:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Fri, 12 Aug 2016 03:52:30 -0700 (PDT)
In-Reply-To: <20160812104859.c5zhna6xj24eptct@jama>
References: <1470997583-13210-1-git-send-email-ross.burton@intel.com>
	<20160812104859.c5zhna6xj24eptct@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 12 Aug 2016 11:52:30 +0100
Message-ID: <CAJTo0LbfrOUh1TiuMxBRQyCuB-xB+6RyvrU+x9Gz9P+ZVMhwdw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] curl: upgrade to 7.50.1
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
X-List-Received-Date: Fri, 12 Aug 2016 10:52:53 -0000
Content-Type: multipart/alternative; boundary=001a114ab3ca115f0c0539ddaf4c

--001a114ab3ca115f0c0539ddaf4c
Content-Type: text/plain; charset=UTF-8

On 12 August 2016 at 11:48, Martin Jansa <martin.jansa@gmail.com> wrote:

> If the <= is correct, then you might reuse this from Armin's commit:
>
> This fixes 3 CVES:
>
> CVE-2016-5419
> CVE-2016-5420
> CVE-2016-5421
>
> Affects curl <= 7.50.0
>

Yes, good point.

Ross

--001a114ab3ca115f0c0539ddaf4c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 August 2016 at 11:48, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3ka" class=
=3D"a3s aXjCH m1567e5ec29d28a32">If the &lt;=3D is correct, then you might =
reuse this from Armin&#39;s commit:<br>
<br>
This fixes 3 CVES:<br>
<br>
CVE-2016-5419<br>
CVE-2016-5420<br>
CVE-2016-5421<br>
<br>
Affects curl &lt;=3D 7.50.0</div></blockquote></div><br>Yes, good point.</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</di=
v></div>

--001a114ab3ca115f0c0539ddaf4c--

Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f178.google.com (mail-it1-f178.google.com
	[209.85.166.178])
	by mail.openembedded.org (Postfix) with ESMTP id 275CB7E16D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 09:42:23 +0000 (UTC)
Received: by mail-it1-f178.google.com with SMTP id g23so2287869iti.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 02:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=6Jtc7Qu2ofRRGX4FNuS9R1o5vpxp2EcgCjtR9FEbJk0=;
	b=WSwU3jzH8eneIsyWZGUGaGdmqRjksSzgm9FRkQAb7Oj7PsTNOCWxun0OUvvfk7a7WU
	fTtZXKnGkEeKzWwh9P3nHjCp8VFHQn8W2EEzZUHM3arM+60ZOC+kIkNmTSioBNI8HiDD
	2DJ9hrdg2rEVNQSn7OVAYkniJYG339x1FS/MHrpmQmf3ONVRamOOuzuB+AkBsSBceioe
	MGBfNyOmRBiQKjQip3iRJpbV8O/LsQCFDuF/fAXHxUZ94yJabSM6oa4vCA+Mabm8AwwG
	01UsoNSE0PSnV3uY6TYS5UkOqNSoJXcF7wagIQNzYoU/R6vdVXPCWdHZVdbzEYp3sv5m
	3/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=6Jtc7Qu2ofRRGX4FNuS9R1o5vpxp2EcgCjtR9FEbJk0=;
	b=ix8Q5vlPM2w4nMD4dE9vwZCrR286ZcwTNs9CXj3YsC5Kx97ErwovAWeEmhoYiI8pRj
	OgKzWkoKTAab8NWBBpWrHzUU6pfggchG8jagp/P0njyslBI20PRoA9fAwiIABCT2hQi/
	EeFzsLq9IX25fEmkjnWgfJpTd4sjWlhbUL/FD++2HXMNRTFx2X1IbYo9SiCA4cjykjKh
	fcmW52fUVTCjtMvQ5BbdGg//WACU5ymb3QvD8t/5XdYvlUQTEX5uA/cbUC0zZwS/ukhz
	zxtGGb7Q0mWJ6/b6pG6xdNZorjnrGoo3NVf9gYpWqxFnRj9Me4qzxSo2VO8h226MErM8
	Zc9Q==
X-Gm-Message-State: APjAAAW9wX1I82lgrT0RoRKz67VJ3UUQBmvnvGmL2nIVvNjQyg6rbSyF
	kmCYSfchTZ5477uqrHqE45Puzu/QGhDa5Z6Ui7/2Dw==
X-Google-Smtp-Source: APXvYqyiCjW4BPTuraUQZlI0uErod36IMF79AX1FELIVe9l2M1iSy3L3av4sRcwyBUntTn2ipb4lRppcqw7TnTDkMm4=
X-Received: by 2002:a24:ee03:: with SMTP id b3mr2899036iti.158.1558431743985; 
	Tue, 21 May 2019 02:42:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190417133941.31087-1-schnitzeltony@gmail.com>
	<CALbNGRSJs_KncbefGSSPN_u_KYOrCnEsfSTeLJKLXeFQ7guEPQ@mail.gmail.com>
	<CALbNGRSC=NjtUg=JxzmaZbjEj8BhH1NGPTRTs=iU34ftM8s=JQ@mail.gmail.com>
	<CALbNGRTCng3BDqz-Phy2chgUQJYuwHmcymmL0z+ad+YGy+nd-A@mail.gmail.com>
In-Reply-To: <CALbNGRTCng3BDqz-Phy2chgUQJYuwHmcymmL0z+ad+YGy+nd-A@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 21 May 2019 11:42:12 +0200
Message-ID: <CALbNGRSN609Q1RHAkFODAh-3mTtRENdMv52XWJEv9RnUiLsxmw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][thud] adwaita-icon-theme: do not delete symbolic svg but pack them in ${PN}-symbolic
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
X-List-Received-Date: Tue, 21 May 2019 09:42:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 14, 2019 at 9:47 AM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Tue, May 7, 2019 at 12:51 PM Andreas M=C3=BCller <schnitzeltony@gmail.=
com> wrote:
> >
> > On Tue, Apr 30, 2019 at 8:20 AM Andreas M=C3=BCller <schnitzeltony@gmai=
l.com> wrote:
> > >
> > > On Wed, Apr 17, 2019 at 3:39 PM Andreas M=C3=BCller <schnitzeltony@gm=
ail.com> wrote:
> > > >
> > > > This fixes:
> > > > * gtk-icon-browser: for symbolic view almost all icons were missing
> > > > * xfce's thunar: 'home' and 'up' icons were missing. Had a long dis=
cussion with
> > > >   XFCE-people [1] and asked here [2].
> > > >
> > > > How could I overlook the most obvious...
> > > >
> > > > [1] https://bugzilla.xfce.org/show_bug.cgi?id=3D14443
> > > > [2] http://lists.openembedded.org/pipermail/openembedded-core/2018-=
November/275815.html
> > > >
> > > > (From OE-Core rev: 0911e7d2f5443210b594a198ada8465af7a2fc78)
> > > >
> > > > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > ping?
> > Something wrong with this bugfix?
> >
> pingediping

Should write some auto-ping script..

PING


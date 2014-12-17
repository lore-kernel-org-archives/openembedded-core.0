Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 3802F7270A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Dec 2014 22:05:46 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id a108so12374004qge.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Dec 2014 14:05:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Qo6KAWm5OV+zJAt6jEuRvQNOwbHMPZyjqotlmdK4I3E=;
	b=OlcZtSZkUXALcUOr3bLQpGg8qLQAaeVK4657F6XA4wX+IILt0Q7ArCu/x3uuim82kU
	Nibi0EpJ6dKFGzDVufCNARzR8peIFPZimsQpaI0gvWF4JofI35Is8/K6XpTor2N7gw51
	0CY/9Rq3IbRVhCdHFnmtkxUzSKt07lX74/lzCCh341ic3y2GGNVS2z4JbQ3XQe0QLPhf
	7Tuo49NiKmW0dhU326n7v1nwGRV9PteX4aoI1L1zA+KszGsz/S1UsYGoMHsimn2rFBXP
	lS8+0dtO2stVjUE8TdVA1ZA3t2gTGCjsN3kZ08f5wKB5JkiXaB3EkZZtTwP+ivY9YZLB
	1+3A==
X-Gm-Message-State: ALoCoQk3apiOpv5cEazcKh0QwPciSTC+94KMRAyUyADo/l+1kcAUEEPmkHbl4rJM/A27VM1Nj3cq
X-Received: by 10.140.94.229 with SMTP id g92mr76718711qge.77.1418853946698;
	Wed, 17 Dec 2014 14:05:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Wed, 17 Dec 2014 14:05:26 -0800 (PST)
In-Reply-To: <CAJTo0Las47QCiUb-sjfgUOd9ZQK0=bOVWd5fHr618+0DLGsDjg@mail.gmail.com>
References: <1417688866-8329-1-git-send-email-mike.looijmans@topic.nl>
	<1417773539-19172-1-git-send-email-mike.looijmans@topic.nl>
	<CAJTo0Las47QCiUb-sjfgUOd9ZQK0=bOVWd5fHr618+0DLGsDjg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 17 Dec 2014 22:05:26 +0000
Message-ID: <CAJTo0LaZwwmfOUeczisfj28C7TYWH9=EDyR-=O882O-L4w90VA@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] busybox-mdev: Support automatic mounting of block devices
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
X-List-Received-Date: Wed, 17 Dec 2014 22:05:54 -0000
Content-Type: multipart/alternative; boundary=001a113a0e8e7b4495050a70ad31

--001a113a0e8e7b4495050a70ad31
Content-Type: text/plain; charset=UTF-8

On 17 December 2014 at 22:03, Burton, Ross <ross.burton@intel.com> wrote:
>
> Thanks for this, but can this script be put into a separate recipe to make
> it even easier for people who don't want it, or want their own version?
> The prior art here is the udev automounting script which is in
> udev-extraconf.


That embarrassing moment when you realise that Otavio said the same thing
twelve days earlier. :)
Ross

--001a113a0e8e7b4495050a70ad31
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 December 2014 at 22:03, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D=
"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&=
gt;</span> wrote:<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">Thanks for this, but can th=
is script be put into a separate recipe to make it even easier for people w=
ho don&#39;t want it, or want their own version?=C2=A0 The prior art here i=
s the udev automounting script which is in udev-extraconf.</blockquote></di=
v><br>That embarrassing moment when you realise that Otavio said the same t=
hing twelve days earlier. :)</div><div class=3D"gmail_extra">Ross</div></di=
v>

--001a113a0e8e7b4495050a70ad31--

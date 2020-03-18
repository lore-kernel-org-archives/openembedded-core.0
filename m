Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1078860B2E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2020 23:18:15 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id f28so211300qkk.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2020 16:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=gbAkvUNITxsra+YNy+bLii011mdSiUVxjEvzFcAvn58=;
	b=wr19EhjRBmQo5KOUG4ztLF2SG9Wotvyq6tPpKMFcN8dnUM1a7kg9h9i0GXQEuSP53L
	O8rrp+R5/19DKqFu6VaA/bvkL5Fcj9uZwskGjtERFgberzEj2bAHHfn9g+GSqj2e7yzN
	3TJmob8Mt9quq04rtgQtkbY2Ku3kCOnZXIc03BPEfbxNKiNCAZJw6QYVKRMsaU4i5hDz
	FNbOlsDi/LVNfWcck//iteeu5ZDPkAr9h9cniBWfPtuJCPxARvOwq5JqHZjVvV6ZN5j6
	aMAXWwk5mxNToWPQg1Y9xXXesBZzwm5G2rkBM59ozo3R8EnRbueyh8/InK8hKceLpOs2
	/cTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=gbAkvUNITxsra+YNy+bLii011mdSiUVxjEvzFcAvn58=;
	b=GasY9uuR7u7fOB9OKdAWKln0guSh2a23tfjmrmzLPMo70+PHhxOy7wjCbeMPGrXZVQ
	KQhTxVXTIfK8/lNjCmKI3g7b/LSyRh9iKD2YzHTobAARpIHMdzEvcek4L/WCqaLhLaOB
	TX7eNTdyGY3Yj8Pxu1l7l73HksUwitw5hcgLiatI0IL61+rQDxDUFOCrKE+UxGLitar2
	fBXSd8hn33tvNuYGd6hIXUYUuMybgz5zTqTTZGE7DxGyLl9gH2vte4uMHJRDuyfrju6d
	Spn9pirdenfV63w6XyyW2iLP7lCoKqvzJL+jm7i4gGZQ8gXjAK696LeBpEK+YWRnvuV+
	FHdw==
X-Gm-Message-State: ANhLgQ2GXb5qNKHq3j2YV9ibyrR3/FLHHTj6f8D9z8vUPWUzF88S1WkC
	HlJ1vBOQg1tNn/OW3xl03Br4n/mBY2FvhQ==
X-Google-Smtp-Source: ADFU+vtfSCfRSc1HIMuMWwtNI6nVrvFmPRFNE9DDPPMX+9nN5kgjg0wiZOJvP+5lTHvztAwaR6lV2A==
X-Received: by 2002:a37:47d3:: with SMTP id u202mr330526qka.264.1584573496506; 
	Wed, 18 Mar 2020 16:18:16 -0700 (PDT)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com.
	[209.85.222.170])
	by smtp.gmail.com with ESMTPSA id b6sm195460qtj.15.2020.03.18.16.18.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 18 Mar 2020 16:18:15 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f170.google.com with SMTP id s11so253541qks.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2020 16:18:15 -0700 (PDT)
X-Received: by 2002:a37:9ad0:: with SMTP id c199mr304072qke.277.1584573495226; 
	Wed, 18 Mar 2020 16:18:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200317152303.4600-1-alex.kiernan@gmail.com>
	<20200317152303.4600-2-alex.kiernan@gmail.com>
	<CAP9ODKoAXWCgREiSr2xRkGNNvEEwtz6Mzhqx0gK+0mQu6a+kFw@mail.gmail.com>
	<CAO5Uq5Q9_KUQ7ccoZHj8yHp+naDcJTWiHWdu684Rvj+_=FmHzg@mail.gmail.com>
In-Reply-To: <CAO5Uq5Q9_KUQ7ccoZHj8yHp+naDcJTWiHWdu684Rvj+_=FmHzg@mail.gmail.com>
Date: Wed, 18 Mar 2020 20:18:03 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpYESOprjfk+FD0Q0SXoc6u0j2UXQbgDLRuFZjz_9oyPg@mail.gmail.com>
Message-ID: <CAP9ODKpYESOprjfk+FD0Q0SXoc6u0j2UXQbgDLRuFZjz_9oyPg@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 01/11] systemd: Package udev rules explicitly
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
X-List-Received-Date: Wed, 18 Mar 2020 23:18:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 18, 2020 at 2:19 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> On Wed, Mar 18, 2020 at 3:02 AM Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
> >
> > On Tue, Mar 17, 2020 at 12:29 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
> > > udev is packaged before systemd so any wildcard inclusions in FILES will
> > > override later specifics. List all udev rules explicitly so that the
> > > systemd specific rules, packaged alongside systemd, appear in the
> > > correct package.
> > >
> > > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> >
> > I believe udev ought to be on PACKAGE_BEFORE_PN so it is still handled
> > with the wildcard and allow for easier maintenance in future.
> >
>
> It's done with an =+ at the moment, replacing it with
> PACKAGE_BEFORE_PN would certainly make it clearer (and avoid holes
> where dev/dbg stuff could leak through). But I don't think that helps
> with the greedy wildcard problem - we have:
>
> FILES_udev += "...
>                ${rootlibexecdir}/udev/rules.d/*.rules \
>
> and
>
> FILES_${PN} = " ...
>                 ${nonarch_base_libdir}/udev/rules.d/70-uaccess.rules \
>                 ${nonarch_base_libdir}/udev/rules.d/71-seat.rules \
>                 ${nonarch_base_libdir}/udev/rules.d/73-seat-late.rules \
>                 ${nonarch_base_libdir}/udev/rules.d/99-systemd.rules \
>
> Where the FILES_udev consumes all the rules before ${PN} gets a look
> in, unless there's some magic I'm overlooking?
>
> The inconsistent path usage wants fixing too... I'd not noticed that before!

Oh, now I see. This is indeed a real problem.

A more long-term friendly approach would be to create a new
${PN}-rules package which is packaged before udev and is added as
rdepends on ${PN}. Another alternative is package ${PN} prior udev.

Personally I dislike listing all rules as we can easily miss a removal
of any in the future and the list become outdated.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750


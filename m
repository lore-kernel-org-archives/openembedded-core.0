Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
	[209.85.160.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8A20E6C1D5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 13:05:42 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id w14so32105503qto.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 06:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=dykhqMhx8s/J6U5PWe3yJ02+EXeBBFyu6RIs4G1lGIg=;
	b=AvyvKTOlaErBr73OaW753vqJznX9fXwPhAS2VI46YnzD9D6a1R+ou4iszbGqmPtQb3
	F5Bu0bu8TznVhNPabC6O3T6+66w7xBto+0vxKLkO3HCQprkLL6TwyzE/uZarP/sOlh0O
	Mj3h1hgFeObwDTe0TI+J3vo9e66VpVRtwgDSQw0FVQHQb27lFKB9nd+15J74rgFi6apR
	OXU/3cjFXuXRdSbbzVZtWZWhInSMBFY81rcHdz1pQeirzzjp98TP1fBKYtLiMozMO/hb
	2LhgM/uN9nShyz5kATuIhlOWw/yIWmjNjsJICW1mddA4N5QmotUDuv/6N5uEwGP4Elcm
	iJTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=dykhqMhx8s/J6U5PWe3yJ02+EXeBBFyu6RIs4G1lGIg=;
	b=nhDIdO7np5X2nzgTj5WBwcJ3mz8jD5wauodfwjsWmRc5t1+fMig3z4AmmNM0Hur2wh
	MJLSTAutmHmm/OsLyOQDl8zX52lbG+LoRoN707jGukyIYHReSfXZ7N8+3WyMLo+kpibK
	T/Y9Nt+ebbnxZIY88M/kB5Dn5LGqy28fQzTgBe5iL7/f+MQjjiw8YBar2Xr9qkrjn1gA
	hErVwhmuFrGu8UmmSgcG0hnlp2rlw6jCn6c8jZa5eja9V0pdVqGNUebeuwhoflFqT1jP
	0+ySoYyngY6ycFP3aSw+QlE9z7gW74gx59A57lHL1z+DLUwN2S/7c3DYAP5PKNbfH3Cd
	ZFug==
X-Gm-Message-State: APjAAAWqtnNmoyVbbHc+0xoLBi78vn9SFS2h+enRxxp9/tKSpYIF3JAD
	uvkTPebjzIvijC/mOf+rQ0U+gF0VMruYtiXPPVU5rO6aGO+QFg==
X-Google-Smtp-Source: APXvYqzeQsXhxY5BOd0SNRgqj0IzbahoyzGxhVFEDJzxAvHP2EQg6/glGRWJYgkJSjijI7mx40mGtGL8M6i40srN/eY=
X-Received: by 2002:ac8:7617:: with SMTP id t23mr8912302qtq.88.1571835942749; 
	Wed, 23 Oct 2019 06:05:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1sq83g8Zu3FmqWtdpJAePA6XsGnWZ5Z6HN9A6YvT8Socjw@mail.gmail.com>
In-Reply-To: <CAMKF1sq83g8Zu3FmqWtdpJAePA6XsGnWZ5Z6HN9A6YvT8Socjw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Oct 2019 14:05:16 +0100
Message-ID: <CAMKF1srJZNAkUKNiExu7xDbCBOHcOvOUvr-7+xHCCB=BQjawxw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: new meta-oe failures from master-next
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
X-List-Received-Date: Wed, 23 Oct 2019 13:05:42 -0000
Content-Type: text/plain; charset="UTF-8"

here is AB failure link

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/56

On Wed, Oct 23, 2019 at 2:03 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Hi Richard
>
> New master-next I see these fails
>
> https://errors.yoctoproject.org/Errors/Build/91645/
>
> First two are important one's we already know why
> ti-display-sharing-fw fails to fetch


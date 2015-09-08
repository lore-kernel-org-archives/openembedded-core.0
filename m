Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 634C575E80
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 18:39:47 +0000 (UTC)
Received: by igxx6 with SMTP id x6so23531850igx.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Sep 2015 11:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=9F+C5v8zjcY6R+n6VMVok/TpHoWxCxwtR7OhwsPMy9M=;
	b=wGpS+YU7n/w23fTLUiv4BayTmrFNh+73Hrh13LkOgjw1qK8AN5rw12hQeeeBzvfAbu
	B3z4fTgubqq+zccgsQ8sC76gzLrimNGxm6Ma4w36oMZWIO7aEFghhl8kFxvXCRfQJf+I
	2NFhXDggzgxJ4Kh/Zs+ILG8yQybb14q7tdsHqW1MRFr0S+gDugelkUy0sGW9Fz4QA95R
	IRvSJ9BYhDj0WgNS7x3c7dMqpc2SjMSvqUWgQRD0smHP5065qt750SEFBLdepoOlT61h
	Wyy7OmTiK67ndxClVEpFHYD5HqLCsxqEY7w1jd3+piR9uAQRaQa0mPmCqs9Ug49lxwsC
	GyMw==
X-Received: by 10.50.72.41 with SMTP id a9mr45052818igv.77.1441737587159; Tue,
	08 Sep 2015 11:39:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.130 with HTTP; Tue, 8 Sep 2015 11:39:17 -0700 (PDT)
In-Reply-To: <55EF2670.6040101@gmail.com>
References: <8B394616-9009-4FF4-828C-561A859D34B3@gmail.com>
	<20150901215512.GE2458@jama>
	<CAP9ODKq=HsV79hXhHeCwdhpF6uhHdCxYrhC53Kt5+Pe6Qdpf1w@mail.gmail.com>
	<255516EC-098E-457B-A2E6-2F7C953CAA8D@gmail.com>
	<CAP9ODKp9Vkw-vHNp1PMqE1eTfmW8-s5o6+0JYTv=sFEHm9nc1g@mail.gmail.com>
	<1441177787.24871.33.camel@linuxfoundation.org>
	<55EF2670.6040101@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Sep 2015 11:39:17 -0700
Message-ID: <CAMKF1sogs9sRR_07nOxZrvvOxXj_=ioqNr=_vN+hr+VFf2BO6A@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Patch merge process
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
X-List-Received-Date: Tue, 08 Sep 2015 18:39:49 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 8, 2015 at 11:18 AM, Trevor Woerner <twoerner@gmail.com> wrote:
> If Richard doesn't want to use gerrit for OE-core, that doesn't exclude
> others from using it for the layers they manage, does it?

yes, however, we should prefer this to run on oe domain, its better
for project and then if most of layers use it its fine too, it could
end up
with same situation as patchwork where oe-core and bitbake do not use
it actively. other layers do. its not ideal situation but its ok as
long as
its makes people productive, we could be open for options its matter
of volunteers then maintaining the infra for these services.


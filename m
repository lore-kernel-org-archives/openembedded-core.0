Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id 14ED960720
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 16:58:51 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id d19so19004605qtq.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 08:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pJ7Lf9KnjKET/8vlb5XwmnU36PODlXiosxhC81uFCmE=;
	b=UvZ79e+Jlx4AuHyC68A5P4HQ3HqWazkd2uyzhprdIQWbqN79IJkM8ktDTlcqWXy/hF
	qcZAKRal3PCipZ/rf1OTgaKbrXJw2Xi7fW6WsNlUHxlhd0pM2pu6LNyn1MM+FTRSaeZv
	MDDq7J/4Ere9zt/LEIjDwmqgnNdEr8GkYafw7YQ3sSdb0fJVq0cV19rzR8rcu38zxI8J
	OxMwbZmuyBAQxFxkg9EKDIejqA5MjfNpbxcRqCFc4lwD7Z1yOTC6ogdashW6XU0VBy1P
	iZwnfCzBKrluCNvypYHZ/xbodEB1XBaeAg0rI2aM5WHtEkAVcIz1fN84H/01fChIdHvb
	tx/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pJ7Lf9KnjKET/8vlb5XwmnU36PODlXiosxhC81uFCmE=;
	b=U1kx8MFNMqEIy2VImd3/abQ19qxEusSd3knC97XKcNBLv0DGkQ0y5C1gTwjBa9da/I
	jVsaYNmzXyMLcmdfW3BTmGcc92qhr0h6n3JsIgSGZtlwZM8qkt4Oc7vPhVwEUXwnnBAo
	svnWSxiBy4ZV37/5FmPdAxPVHLZeDet3EHL+xQNCXSZoc1w4z2G6YgPfv6fx4TBFn8Ya
	1JrshJbc08xz7xqHgK0NE9tvTjBHOpapYDfnq2Pk+E9sWeegdlf4E946plrQt8LzMp9a
	aQHHz6o6Vd7YVhqiBGhXnPLo5wx/0hSFSrsdAgNvuuNl+pcBuwRYr34gpnNqUmqya8Es
	LIRg==
X-Gm-Message-State: AJcUukcAVyx0tCw77sqKW2/ywUbHBlcUL53yOYyM0ApABrm85ToAiOT5
	E/mvqsvpilWkceWK0z07q1M0Ez2yC73eQ3NYELI=
X-Google-Smtp-Source: ALg8bN6SrxQi3HVyfqsjK17ahvvKCmGlCxWgx1DHgzKFJEvWekHmteZ6JrdkOn9f4rKVPJda2aX1+qs2OwVhMcpW7jc=
X-Received: by 2002:a0c:d80f:: with SMTP id h15mr21501185qvj.228.1548694732753;
	Mon, 28 Jan 2019 08:58:52 -0800 (PST)
MIME-Version: 1.0
References: <20190128111732.16387-1-marcusc@axis.com>
	<CANNYZj-Ppan8+qjppbBasLG-D73Gh3qLNBmDOhpNPKgyxmn7Bw@mail.gmail.com>
In-Reply-To: <CANNYZj-Ppan8+qjppbBasLG-D73Gh3qLNBmDOhpNPKgyxmn7Bw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Jan 2019 08:58:26 -0800
Message-ID: <CAMKF1spXbECaXfrM0X3xAYgEFYHar2AYDSLrZZGWZ2PZKvTEww@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/3] systemd: Fixes Security fix CVE-2018-16864 - CVE-2018-16866
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
X-List-Received-Date: Mon, 28 Jan 2019 16:58:52 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 28, 2019 at 3:20 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Maybe it's better to update systemd to latest upstream release?
>

Indeed but I would suggest to go to 241 which is in RC stage within
week of 240 release

> Alex
>
> On Mon, 28 Jan 2019 at 12:17, Marcus Cooper <marcus.cooper@axis.com> wrote:
> >
> > Changed in v2:
> >  - Added CVE tag, Upstream-Status tag and Sign-off-by tags.
> >  - removed the verification of the entry length in the header
> >  - squashed CVE-2018-16865 patches into one
> >  - CVE-2018-16866 patch now taken from systemd-stable and includes
> >    an additional heap buffer overflow fix.
> >
> > Marcus Cooper (3):
> >   systemd: Security fix CVE-2018-16864
> >   systemd: Security fix CVE-2018-16865
> >   systemd: Security fix CVE-2018-16866
> >
> >  ...-not-store-the-iovec-entry-for-process-co.patch | 208 +++++++++++++++++++++
> >  ...rnald-set-a-limit-on-the-number-of-fields.patch | 139 ++++++++++++++
> >  ...nal-fix-out-of-bounds-read-CVE-2018-16866.patch |  49 +++++
> >  meta/recipes-core/systemd/systemd_239.bb           |   3 +
> >  4 files changed, 399 insertions(+)
> >  create mode 100644 meta/recipes-core/systemd/systemd/0024-journald-do-not-store-the-iovec-entry-for-process-co.patch
> >  create mode 100644 meta/recipes-core/systemd/systemd/0025-journald-set-a-limit-on-the-number-of-fields.patch
> >  create mode 100644 meta/recipes-core/systemd/systemd/0026-journal-fix-out-of-bounds-read-CVE-2018-16866.patch
> >
> > --
> > 2.11.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


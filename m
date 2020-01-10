Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
	[209.85.219.54])
	by mail.openembedded.org (Postfix) with ESMTP id 049267FF4D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 18:47:04 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id t6so1205029qvs.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 10:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Z1hNtDi+G+YtHde+cxR4FDXRM+Su7rd0JsytuR3LvR0=;
	b=sdo2Qg5qYQSZU33JLkZtSFHQNxZ32p+QQqe19M/hzUYbFKkwAebRCBUibPZdbWljSa
	WPwZOlo8WTYM1iA10MizJp3ZC4Yphs+6eqeIUdULu4rfZEDpJ7tJsoJ6ffA0+56gF2c2
	6XaQaCZr682tgypdB4NH0r126J5O14XIbrmivBXMAGDjROKmColkCyn86MV4UqcFHniY
	3VmRrlKNpcUyEK5iPcaxDdXqe7FFAA65nOU8hx+Zy9FX6hvKdjjfCAcbeF0Cc1yGWWjz
	CU3bcgsUShsIYS4ZTz0IpTnDsJrI7nOzZE4pBNY8ukSB8UP+iSec2Z0Hm0QGJxMuC4ZX
	pxGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Z1hNtDi+G+YtHde+cxR4FDXRM+Su7rd0JsytuR3LvR0=;
	b=UuikFv0RztkfQInRMUEVn5v7UKO4u0G39WO7+9sQLWcLpju8tHyKruRiLCS7+0X7DR
	aZx3k3AMOPByj09o7uSsftlPlk5w8EcmpsJkrdJc4mC2aizowzAHC295c+fD96EOBIth
	fGxKegiL9v0RJ9ySuOfvRS/5RlQdnj2rZThz+IPcMKE2xzf4KVOPgFv68N6IQmdrfQ6a
	4+e9b6tyBE5HFdT1P/7EYcMoacJ7384dqXseQUz6ghWgu48mPkqU7C2ERO60MCIeqdvR
	fXYI/Eu7oonwSrcJc6jAUw8fspN/wG6rJ9dPImyBUw0/MPMnA3CgESkbOjwCi0MkRKxm
	z/uw==
X-Gm-Message-State: APjAAAW9h8OXsh7lUem0/oiuQWbYiLgExwtzLfazu5Iuwur/0L99e0aw
	8oILf7KINV0llmo9tlGZh8z5m9q3bRn6MtnKEbiu2XGM
X-Google-Smtp-Source: APXvYqyRK4DhTfoytjxjeCOFf4dD5Su6MBpjN09GuEJ5Z+apj1pSiypXBKtjwbWxLIekFaGTqDkacY5XBIEDuM0YgB0=
X-Received: by 2002:ad4:4389:: with SMTP id s9mr18701qvr.99.1578682025395;
	Fri, 10 Jan 2020 10:47:05 -0800 (PST)
MIME-Version: 1.0
References: <20200110165302.27426-1-git@andred.net>
In-Reply-To: <20200110165302.27426-1-git@andred.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 10 Jan 2020 10:46:39 -0800
Message-ID: <CAMKF1srewTnyB9w_gpWNyEv-wy8V+YFQKBPUgD+eH7a9BsA=3w@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/16] site updates (autotools / coreutils)
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
X-List-Received-Date: Fri, 10 Jan 2020 18:47:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2020 at 8:53 AM Andr=C3=A9 Draszik <git@andred.net> wrote:
>
> Hi,
>
> For the following updates, I have run the autotools tests
> (m4 macros) on the target on an up-to-date musl (32bit arm)
> system, as well as taken the results from my host machine
> for glibc (64bit, glibc 2.29)
>
> These help to prevent coreutils from compiling lots of
> useless wrappers, as many of the tests are testing long
> fixed bugs that are not relevant anymore, since in most
> cases the m4 macros assume the worst when cross-compiling.
>

These changes are really good, looking at them it occurred to me that
we might have
to mention that what we assume in terms of Glibc and musl versions. So
external toolchain
providers and users can take notice.  Perhaps in the documentation or
some such place.
Otherwise this patchset looks fine to me

> Cheers,
> Andr=C3=A9
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


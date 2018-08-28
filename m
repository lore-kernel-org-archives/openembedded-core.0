Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id C292A6010D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 07:10:47 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id q204-v6so1010655oig.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 00:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ydNo5Z5iH3r3XJu/6r6vK/anmxwh4MDfE/k8Aetmzqo=;
	b=ewRjp1Nos4JCSa06rciuvxXvohbNBJvy+NKRcFMXET/ZECUI1u7LLeNsB5yb1BbG09
	IjJiemCpguTromzcWUIzR79EgxjeFAgVUkVgbaLVFUSrb6/X6lPTpCxWDYgRu59bUhKx
	zgZRnieOplqGrw9lifT8/QVMZzeMPnq0dn59sxHoOctuUPNZy0156Dw7skvr3fG1Cen+
	m66lpoLV/pXjBVx6KFJNr3LnhDPQIUOPYFrb4GdSuCfYpJEPZXhIj73dwowcU+U4njol
	av7G2uziupb0JYby5yhGTHLuj/4mjIIFxzJAv6AxlMDK0GhfuH6BiWoKs5ZBzLjJbgaY
	dAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ydNo5Z5iH3r3XJu/6r6vK/anmxwh4MDfE/k8Aetmzqo=;
	b=i9lHks2Yd18p1zseabVRtE0jpxp1T8wxXYhrBuWuFr4NRUV/7Q/hQ2snJhN2AVYICH
	6hx8TkXXQ56/YJLQv4fYSx9aYD89vXAIokVq7NsFLkaSEiOl6tJH0LGHSV+I/KPZ7lfr
	LtHgHqQNQeXt5yNs9HovqTvz5zHDD1+YHy8JQtKBSjmjG/FUTnVVOZWVvrKQwyzF8pJ5
	Ac1j3w6Qvd9h9+j1+AUA8MIA92sQTL7p9snH2K5gUDrtqdyHYmLk/+kVqpywl5w8FpBO
	vs7WundixpfuiSTrdg07YfS2nKZ6I+inxAjSPzObRWlqjgPdbKQVV15GH0OGeMLZHubQ
	bHfQ==
X-Gm-Message-State: APzg51ApLJ8mSJocNLc+ikUGp60+3z9Uydo0qPoo00CP6L/JyDrGFe51
	QqfPYp3BpbNH+inoTmPU1+AM4yeJ6YeV4CpnHzBCbg==
X-Google-Smtp-Source: ANB0VdaRRufyn7tp2HqDsgAp8LcVqET1p86r+UCmuMHB5tFc4aR28a6yifDbiOngUgkX0Ai2koG1lpbgntp67veQmdM=
X-Received: by 2002:aca:ba83:: with SMTP id
	k125-v6mr252904oif.226.1535440248886; 
	Tue, 28 Aug 2018 00:10:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90ed:0:0:0:0:0 with HTTP; Tue, 28 Aug 2018 00:10:48
	-0700 (PDT)
In-Reply-To: <CA+FvCj6uCS7iSwpyOnNx0Q-A7iXfzTg_NtcH98ihmsfLDGkn9Q@mail.gmail.com>
References: <CA+FvCj6uCS7iSwpyOnNx0Q-A7iXfzTg_NtcH98ihmsfLDGkn9Q@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 28 Aug 2018 09:10:48 +0200
Message-ID: <CANNYZj-Ga4t5WW+bSZ+eqXEcUuR_G-5QNfzAta40oEgAf+paqg@mail.gmail.com>
To: Nick Winters <nick@wintersteam.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Troubleshooting sstate cache
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
X-List-Received-Date: Tue, 28 Aug 2018 07:10:47 -0000
Content-Type: text/plain; charset="UTF-8"

2018-08-28 7:53 GMT+02:00 Nick Winters <nick@wintersteam.org>:
> Often when I use an sstate cache from another build, I run into problems
> where builds fail. Usually the failure is a result of not being able to find
> a shared library. If I delete the sstate cache, the build succeeds, although
> it is 8 hours later. I switched to using sstate mirrors and had similar
> problems.

If you provide an example of a specific failure, we might be better
able to help you.

It's fine to use one global sstate cache for absolutely everything.
You can share between builds, target machines and distros.

Alex


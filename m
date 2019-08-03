Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 420177F3E0
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Aug 2019 14:57:45 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id r6so72710004qtt.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Aug 2019 07:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=prY48nu20m6VzKXczaGsZKSMKuaYOTjkImaJ9CZAmik=;
	b=CoxDHQ+ocBKhCFEISvx67iCdWGO9JD2RdXQP2LmkUzvJpQaVycTW8AOxy/sg3tAY7g
	WFgE0oFANL6EarCkWVqlSW25YU/QaGWwzT3Lszn3aYl3FFCYYPPfeBmEm8jNg27Gp9yo
	JnWGbq2yAoJsFcw/PGuwlo53Rmb/7flfr75DIj/9Em9lKU+jI4TRUDWRof4aCl1st5Ml
	WiZxknunqhEUQ+Ier2O6z3SRpcRoNlHgz8Sb2ccjMx+O7opTIXe/Kde+gzH2B1v1TAPh
	/d1+TNCjr+FpCOy5usXWB0U6v7Idcqo3G3iUsOG/gr4mlLW8l8i+nscI6Bwa/r/DaT41
	c99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=prY48nu20m6VzKXczaGsZKSMKuaYOTjkImaJ9CZAmik=;
	b=uW8u0jPsKxZLD2icN9V0XHDsoFHNeD/ERVrJJRxR7cHh+YL0dZB3Ly/jgeRDAK+LFb
	/BJk6TMtaDrLnE5dPnIXIy6ruLEb7MmBN9cMQPejKDKAgms7r/bPqTjEe88agRmMvOnV
	cRvIlRJnWvBkD6+tAl86ajM6PzWBDvTibY+OH/6qiWfP8S/rh4Qlr6Gq66ZwKNg1JBEi
	eIRgkm9gYzlw43TgLqkRan6qnRyrxi7/i7MpyQlYivsLcMRFvJy2hlRfgrNCw5TTrOGT
	DTxycjwUsgVOUdFO4ALk7NKVO9M849iAmTymQ3gTIryfFjJ7GZC/9zcxbxMdHD1ZErPP
	iySw==
X-Gm-Message-State: APjAAAXDhJ6IEvYuGTfK7WRcV+i7s9rbLw/LoC9ENFe69b+0aFy3JqMc
	XRYnbmHpe1leMxF13eXRoz/rP8jYnyxjGiLRonYbo7Pc
X-Google-Smtp-Source: APXvYqwGVw6GgD9KhTsTOtnHEb66qamU5itN8Y5mrj234RMJJTyLrO0iU9k/JUVTLmEQzhKiKvuMpvtSWgmtVViLFww=
X-Received: by 2002:a0c:bd1d:: with SMTP id
	m29mr103800253qvg.181.1564844265658; 
	Sat, 03 Aug 2019 07:57:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190801200354.119252-1-jason.wessel@windriver.com>
	<8934e4e0-aaf6-5eb6-5d1b-355063bee94a@windriver.com>
	<20190801185725.139cfa73@seebsdell>
	<f991e41b-39c6-a088-63aa-07553cae131b@windriver.com>
	<20190802120733.4a24ca3f@seebsdell>
	<20190802124246.27d4beca@seebsdell>
	<CAMKF1sr-gxJBXUn6OtU=0GtTw=CTLWfFLVWjATB-_k-1NYCP1g@mail.gmail.com>
	<20190803092307.486e930d@seebsdell>
In-Reply-To: <20190803092307.486e930d@seebsdell>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 3 Aug 2019 07:57:29 -0700
Message-ID: <CAMKF1so6TnxR13TvFHxRpcEuA-xAd2gSk8bnS7hBXfDW=d7+YQ@mail.gmail.com>
To: Seebs <seebs@seebs.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] pseudo: Upgrade to latest to fix openat() with a directory symlink [NAK]
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
X-List-Received-Date: Sat, 03 Aug 2019 14:57:45 -0000
Content-Type: text/plain; charset="UTF-8"

I see the locale issue atleast 5-7 times a week on world builds so I
will be able to see if that frequency stays same after this fix.

On Sat, Aug 3, 2019 at 7:23 AM Seebs <seebs@seebs.net> wrote:
>
> On Sat, 3 Aug 2019 05:33:46 -0700
> Khem Raj <raj.khem@gmail.com> wrote:
>
> > Will this fix the file ownership issue that we see with Glibc-locale
> > packages from time to time?
>
> I have no idea. Since I haven't got a reliable reproducer for it, I
> can't test it in a sane way.
>
> -s


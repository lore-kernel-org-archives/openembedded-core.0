Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0DB047C77B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 19:43:30 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id w4so12315003qtc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 11:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hFrqR+f0tdTHufcC+1oyCOrXNJ2IYPN9++C7/Q5wwfk=;
	b=N6iu2eN2iotEn0uT+Wv0cVsQ6c5ZvjA0f4tVnEm4HKeMYdG+4Yw+AMsCd4wnzwzG/U
	nacFK249vOOmLEMXVfcYpc5uTJsUCV5EepG667XjvYDJNMOF00K7+E2uTxWkKnwPESTR
	zmgMYlLnir/oaCzhcCAo5pqAXCX1lwacgFUNQnbNWvsgLo4Q19JgA975AEw0HywiIVXH
	Wpsl20GQQeC5bknO5wce6+Ne7CDJziUmYSjTr+grxcGyeR5rDxZGFTEXn7xkDPnV0oOe
	VPxANkmcxNxvzSMU2Kk1n2RPZq6AgzOXy4Gn5DVrDjFEb4XVlxhIicVqfhqzjzSy8rdP
	vnSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hFrqR+f0tdTHufcC+1oyCOrXNJ2IYPN9++C7/Q5wwfk=;
	b=ZSk4GZZBkiW+41wMGaUDHkKysXzVrQ/mD3Ck280YeZj5HDuFUX3F8ixy0Q2ZEZgYI9
	bsifLJVRDLLEpi/oeMFbZzqp9I5ZpZ6vERF9DWVb4JNICAhk+XRfVxYJCtgUDr8SCdEP
	AK1W3VonhCr4XiqxFAmmwfI6+RYVaFQa3pyRb7DXgDUrg6dTfDZLu3OL5nDpJtkcJlpr
	DdG9S32rR5uTab9uOf58sq3mjAj0n+QQanytXkDJuxpSAvL+CqcdBvuLgr2PwERxbUYt
	ZRj8neNnlcZ+xEyZ8XzqzxfkFEcIjh+s6idMgOpQumjZdEaC8Qkcj2ukMPHDx3ZtfuTF
	x3Pw==
X-Gm-Message-State: AHQUAuZHemhr6ZY5qqOyOh70zdjusr807qAYNrSyUEjgV36o0Y9LHG8N
	j2ena3FCEBDORHJO29ae7tuL924qZASB5LDZ98A=
X-Google-Smtp-Source: AHgI3IbGQEuhJB4iIVijgqCN8Ib27SD+G8xkjFAXnBfQ5D0IbBwBC/s57E2f5H8sQJp82YhlnefNyCivXL34RAwd9lQ=
X-Received: by 2002:ac8:67d3:: with SMTP id r19mr8748204qtp.196.1550259811708; 
	Fri, 15 Feb 2019 11:43:31 -0800 (PST)
MIME-Version: 1.0
References: <20190212054754.2801-1-raj.khem@gmail.com>
	<CAJTo0LYDstsDdmO-Y++5nkAuPgk4OFS+bpYTTYKh8edpzW=hkw@mail.gmail.com>
	<CAMKF1srYzGOXxXkHKG04_AB5xcyMKe1KTP6aoYqO3pQJr=jy0A@mail.gmail.com>
	<CAMKF1spu7DXTNqjEV4-oTryBxOnGo0ypcCv9W=A5OdibMcv6tA@mail.gmail.com>
	<5488b4afbc5710c972e1be9f5c9c88d2a9aef648.camel@linuxfoundation.org>
In-Reply-To: <5488b4afbc5710c972e1be9f5c9c88d2a9aef648.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Feb 2019 11:43:05 -0800
Message-ID: <CAMKF1squ2fZ=AztReyzi74qA=wDB11tYC_-wqtNcYRQKWeCVmA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] busybox: Remove PN from rdeps of PN-dev
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
X-List-Received-Date: Fri, 15 Feb 2019 19:43:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 15, 2019 at 8:04 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2019-02-15 at 07:01 -0800, Khem Raj wrote:
> > Richard/Ross
> >
> > Are you able to reproduce the problem and have
> > alternative solution?
>
> Your reproduction steps needed "use ipk", then yes, I could. I've sent
> out a patch which addresses the problem.

Thanks yes ipk was implied with oe-core+bitbake :)
I will test https://patchwork.openembedded.org/patch/158751/
and see if my SDK is good with out busybox hack

>
> Cheers,
>
> Richard
>
>
>


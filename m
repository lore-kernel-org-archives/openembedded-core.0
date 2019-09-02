Return-Path: <alex.kiernan@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 841526C0ED
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Sep 2019 18:56:06 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id s21so30865719ioa.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Sep 2019 11:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vKkle/ArG92zDvV573Eqd+iOEkigN0VuFobdYd8CWf4=;
	b=lSX68TMVZ4l/g3HZfbu/JpnatZ6EYMXDaK4TEjAhY1CjCR9cMCExaHFIjojrkbMbMn
	3afmnybXYdRMC7+41FoY0FZMCkzz8G4PaR5+B/gMylTFvCNlGvH90xZS3cmnlvbV3qBc
	CUiqPA0MTW/l4czycMQJhMwek6vi904tOQWADrAFIHCe5rdfRd7GdjqvS43AFItVyWNr
	JVYOI7TsqgLHBz1mNUMsCkLmIbcEVUeBKmfWuIcKZchmHVQaYHGccFMWom/ddoM6wt9H
	s7yiQzA+eVr6+OoyaKCrZvwqJU7c8mEQvSXSCWq2/19ME3xR3TNxm4LSV0V88Z9X0O1K
	g5XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vKkle/ArG92zDvV573Eqd+iOEkigN0VuFobdYd8CWf4=;
	b=djA5Gml6BoYG7ofrtdbhpNlsuZItxn1B51X3p1UH+LCqELMygR86bw62v9YJ3+EKuy
	hUkTvpVnV0RA1Xa2T6ZkAhguSHgIndk3un7VQX9YZcAQv51P0RypNtg1RYfAevnxlLPi
	GEOMcq6zIILTgQwp+ovSaiRm10+tFWmtuIm9LlqEddPFxpZfFY+U/CrrJz1WFyVFLNg9
	LMwu96UfczRiPh6StqabxRypK+swquBUUcFqkiVNb2lQ5QcWep3fahRxemsSfRYGtVuo
	is3CavFTjhc+xaLCQ/UR3F0s+/T1Mi6LNe8hVkY78dCA3E2VqyLg3zFxd1AHbVFYnoqt
	9mAA==
X-Gm-Message-State: APjAAAWHyVK337HmVJlzOSidTAaa+ZXNB7TuX0dIErb0PafqsxZuHDjN
	lDlrOBfIWxafCHPk17UZWzD/Y9zShHl2Tiife8k=
X-Google-Smtp-Source: APXvYqxALh1ax9jXBf6piy6hR993NwSLDe/fanfnKO+1MF/LKCgHrH1rM8Gb/NlDLnH1uBytAVbMsTLNcNSVw9x9g8A=
X-Received: by 2002:a5e:de0d:: with SMTP id e13mr35745826iok.144.1567450567391;
	Mon, 02 Sep 2019 11:56:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190902100409.129032-1-alex.kiernan@gmail.com>
	<54567476-aa1a-860d-c13c-dd09b044e296@intel.com>
In-Reply-To: <54567476-aa1a-860d-c13c-dd09b044e296@intel.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 2 Sep 2019 19:55:56 +0100
Message-ID: <CAO5Uq5Q2NzNQ2QqY2dnJfCVYaZNdpAjENOJR4m_fMF7Cu1+FRw@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] iputils: Set prefix correctly for usrmerge
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
X-List-Received-Date: Mon, 02 Sep 2019 18:56:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 2, 2019 at 7:45 PM Ross Burton <ross.burton@intel.com> wrote:
>
> On 02/09/2019 11:04, Alex Kiernan wrote:
> > -EXTRA_OEMESON += "--prefix=/"
> > +EXTRA_OEMESON += "--prefix=${prefix}"
>
> Probably good to explicitly point out that this moves all of the
> binaries in the non-usrmerge case.  Did you test that the system still
> works with these moved when usrmerge isn't enabled?
>

I didn't, nor was it my intention to move them :(

I'll redo it with root_prefix, which I think should get us what I intended...

-- 
Alex Kiernan


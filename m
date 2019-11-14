Return-Path: <brgl@bgdev.pl>
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
	[209.85.166.181])
	by mail.openembedded.org (Postfix) with ESMTP id BA381606D0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2019 11:01:03 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id q15so4934567ils.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2019 03:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=PL5QltUfmFrceCB1xNyMwglX9YM44LkIKTHUysTVtxE=;
	b=sYPpRzDSs58k4g9PBlozf3nPd5ykebeukvRzBfPXnlocDE76tL5uuWeJ4Mff0Z1CsB
	iV5nihMAF68HYAP/Xw/44fkhCP4JyvsKpZhb29ZKN4DQc28CJDc3T6dgpPahQgUXTF1c
	OA9FJVwaCibAaEbfyAJyNLyZEJeEMXT1+87GA4nGebSXK44i/PmMVnFBx4cHigs3Wn1Q
	B3ko5CwR4abaVTweDduanAjU6KwzS9KFVBn2dgd9QLkNUEqQwRZPzzVmeyLqgFpXNa82
	wHX+TQV092mw3bN6bcR1e5GgPLxo117GHe2IA1G0lyCMRfGqKv0cxdbbYfNVTFwLBJTn
	ibqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=PL5QltUfmFrceCB1xNyMwglX9YM44LkIKTHUysTVtxE=;
	b=OKP3c4XhYH6SXNYA41d/J35Eie5+Dn37gSj9kgRc47TH9MtcaMmckBN80ID+SreqWr
	aheJrmFhF2Y/+CDM4WvIsUQuleBTBoHNuoT+wvgW5yvZYDmXd5FQrWz1c7wXwq/g9WTp
	BWb8G3Wc5Q3GSO5IiRsrlbsHH2VQHLSB3qKt6hYF0LHthCyRIuF4Lvyih5tNQkNqtuwW
	iVX2imycbHYQlWOPTYZuQBJibeDtaI37mLqu0iOHZSgCZfqgJukg+mQFv6vHgytYNl1t
	kDJ7rNhJ4S4GGldy5lXigAIwJyue1fWBOCSWupJgD6TMKVD1+yRS2KLnjxz1qhRkSvoy
	v1JQ==
X-Gm-Message-State: APjAAAXXBQdMJoyUvNhvsiBsi/yLc1deOuuZSjT1CopugJFsHv2oInBF
	faXxEfu+eLKAqLr4wYUClvvJ2yOtfcaLcoaMwk/tOg==
X-Google-Smtp-Source: APXvYqxMz1YD7++Rtz/OPgeVqHqEV8REOy2XOu6SLf1JdWKHnq/uRXDXPelbKBFJnlJXbsgYi5JlDfvi3F/4JX2bqK0=
X-Received: by 2002:a92:48cf:: with SMTP id j76mr9052109ilg.189.1573729264732; 
	Thu, 14 Nov 2019 03:01:04 -0800 (PST)
MIME-Version: 1.0
References: <CAMRc=MfGPct57NYp9Nzozdjr6Va861-mXkyP335acPoThx+YCw@mail.gmail.com>
	<CAMKF1sqsWbbj7fJ198E0rt1OqyOG+oc4_dTd7n3B09SqSR89Sw@mail.gmail.com>
In-Reply-To: <CAMKF1sqsWbbj7fJ198E0rt1OqyOG+oc4_dTd7n3B09SqSR89Sw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 14 Nov 2019 12:00:53 +0100
Message-ID: <CAMRc=Me3zsuykVA-_34PpjMJdQdvQYYEy90LAeoR_WnGN-cd6Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: pthreads should rdepend on libgcc
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
X-List-Received-Date: Thu, 14 Nov 2019 11:01:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=C5=9Br., 13 lis 2019 o 23:39 Khem Raj <raj.khem@gmail.com> napisa=C5=82(a)=
:
>
> On Wed, Nov 13, 2019 at 12:34 AM Bartosz Golaszewski <brgl@bgdev.pl> wrot=
e:
> >
> > This isn't a patch as I'm not sure how to fix the right way it but it
> > seems to my that every program that calls pthread_exit() indirectly
> > rdepends on libgcc_s.so.1 being installed in the system (at least when
> > using glibc).
> >
> > This is because the implementation of __pthread_exit() in glibc calls
> > pthread_cancel() which leads to pthread_cancel_init() being called in
> > which said shared object is being loaded with dlopen(). When this
> > fails, the program aborts with the following error message:
> >
> >     libgcc_s.so.1 must be installed for pthread_cancel to work
> >     Aborted
> >
> > A quick way of reproducing it is building a core-image-minimal (which
> > by default doesn't contain libgcc) with the core python3 package and
> > running the simple python HTTP server:
> >
> >     python3 -m http.server 8000
> >
> > Fetching any file will result in the above crash of the python process
> > when the thread serving the file exits.
> >
> > I'm not sure if the same issue is present in musl - the implementation
> > of __pthread_exit() there is different.
> >
>
> musl will not have this issue since it does not depend on libgcc
> unwinder implicitly.
>
> > Please advise on how to best approach this.
> >
>
> use musl ;)

I'd love to, but I'm stuck with systemd. :)

Bart

>
> > Thanks in advance,
> > Bartosz Golaszewski
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core


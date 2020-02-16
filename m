Return-Path: <alex.kiernan@gmail.com>
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
	[209.85.166.54])
	by mail.openembedded.org (Postfix) with ESMTP id BE0CE61441
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 11:42:49 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id m25so15402350ioo.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 03:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=W2fGm5uB14Rc3SDt+agQxa+H6M4LOR9qzJvHqJUvfHo=;
	b=t/69soT1aFH/Pe33FDO8+rO7LupOdGu2ObWcS1G02N/kAIVSKkBsuTZcP0AX+chJJV
	R6DtCuKSAk9Mtx9Ds3jZqZH6cVMKEMvy6zs1jq9Av6OcwqD8jrbAvyIj+OpraAF+pfqW
	5qxaKPL1JM31PkNW2WTuoJT6jP17YMNOLg9IU+m5wgxSYTLQtaV9v96Yn6Fmks4LhMIk
	fhq0tY2uFuMTXaFkIsnqOgh7vvGfi9Rt+K1TZc1wsE2Q13QNvaf9au8rdvr6ALBq1+j7
	QcvYwjpIyup1l+0CKJQ1rj+sHgCjn/lJcPpoHXNaribrYYTkqZAm8BJGrje/Q3O/1ypr
	qGHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=W2fGm5uB14Rc3SDt+agQxa+H6M4LOR9qzJvHqJUvfHo=;
	b=WuEPWKfeZIXsl3cfbz2iTngTGRQ1lvQ5uORHKew3z3yuOw0XhHceBu9V565FuRvgEi
	OTnyo/yblqPQAY0x4o5HroU7OO/HcnCuvYSy2sxZSV+Tw5Ld0mgPqYNjipYpBJmyj0OV
	5bJdMEYTQ8bGvYP589thqDzDHDVVTS66IyvQYic6nVxoBeCA7YYQ4GaW2CKQoythcOjg
	DEIgMY4V6CbvNRqFJjXMiWaITiuQJxwXpxhjbPZPOQAqGWwZTyX570TmgWFuVKDgc0wr
	Ffc+3+FIL+CR/NY8uJfh0TknhsyR2Efuswbb9nH6PlGV6LLqF4FUlPd7VaGwdExxpUHg
	d/2w==
X-Gm-Message-State: APjAAAWnCNiuDXr06k9WYGJteKf6uMw4UKvO4VInJcmw5ugUuV9pVzHo
	onkQROBcT3m4Anq+DQUiBWRPJOW5kfJCvoxxZwpZmOdM
X-Google-Smtp-Source: APXvYqwUx1vzzZt5KQ5wB4V0frvo9pgso6pIbhMFJusgfSvqMdPr2oLJ9B+i7K+kQpNtrRcp+YarjWDJKAGm1Hdeq5I=
X-Received: by 2002:a5d:8856:: with SMTP id t22mr8245790ios.217.1581853370720; 
	Sun, 16 Feb 2020 03:42:50 -0800 (PST)
MIME-Version: 1.0
References: <alpine.LFD.2.21.2002160429430.2239483@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.21.2002160429430.2239483@localhost.localdomain>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sun, 16 Feb 2020 11:42:39 +0000
Message-ID: <CAO5Uq5RvaVVT4YrjNyFboaEE30sXHwveMo2PfSfUZ2f90bD0XQ@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: task i was asked about: "Fix java build to not use host java"
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
X-List-Received-Date: Sun, 16 Feb 2020 11:42:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 16, 2020 at 9:37 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>
>   (NOTE: while this was asked in the context of the latest wind river
> linux, i'm guessing it applies to stock OE/YP.)
>
>   regarding a WRL project that i haven't actually seen yet, one of the
> items on a TO DO list reads, "Fix java build to not use host java",
> and i'm trying to clarify what that might mean without yet seeing the
> project.
>
>   as i read that brief item, i'm assuming that this is a java-based
> project wherein some java recipes must be compiled and added to the
> image and, currently, it's the host java compiler that is being used,
> whereas they want a java compiler to be compiled, added to the native
> sysroot, and used for all java compilation.
>
>   i'm aware of bitbake.conf's ASSUME_PROVIDED variable which says
> nothing about java, and i've never worked on a java-flavoured OE
> project before, so i'm curious as to whether the host java would be
> used by default, and how to override that.
>
>   does this make sense? a pointer to some reasonable example of a
> java-infused YP project would probably suffice, and i'm aware of the
> meta-java layer, which i assume will be dragged in. i have no details
> beyond this at the moment, just trying to figure out what that task
> might mean.
>

We run java in our builds, but we're pulling in embedded Zulu rather
than building from scratch, but I doubt that's anything more than a
detail.

We just have a recipe that can build java for both target and native
and have a native bbclassextend in there, with symlinks across to the
java components from /usr/bin. At that point it pretty much just
works. Relevant bits from a recipe consuming it then look like:

inherit java

DEPENDS = "virtual/javac-native"

export JAVA_HOME = "${STAGING_LIBDIR_JVM_NATIVE}/java"

RDEPENDS_${PN} = " \
    java2-runtime \
"

We've certainly tripped over a number of places where the host java
leaks in, which is annoying. The only thing we're really using out of
the inherit java is the paths it defines.

One problem we've found is that building both JNI and java components
at the same time is tricky because most things don't distinguish
between native and target JAVA_HOME.

-- 
Alex Kiernan


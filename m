Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 929477F829
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 22:37:23 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id m125so3293120qkd.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 14:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=g5wWvfrULl/dRYbgtBFR8u18WEbIrTSyltXVS2bvexU=;
	b=exWvKhzIzXLrEFhFhsOT2xQK4XJH/bEAhLt+lF67Er/OmjI0/HDONbVPLo3DXXsy/e
	oOeSOAD+Lj70FVR8+SFPYlmOYAy0VMRgykmooIv7sUwTu7bqAnRUxh76hCd5L7TPZnEs
	qrNsktafS2tHelrdwvDnhOejvD5JPy4r6VYA8akz4bCTL6oDsGKiykDkj5O88rWbVKkM
	ejSyUfg/3ojTdY8WgQwocj+w4oJfqWaFjii5s+HR4Qjbz7x0UYEtB9zWm6bGEt1+2FId
	pw1mcWg8/yaCOb11sk2B/d+stRCtk7gZVtdnaRPPRe3jG+L7oBsvc4lTBMyCNz8J94Xk
	UeGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=g5wWvfrULl/dRYbgtBFR8u18WEbIrTSyltXVS2bvexU=;
	b=Ss5uPgwVVmtFoQGhTsEzrLyfdO6OEEtdTdqLGotMPfuXZ/4Nsb6jaPNYEaqvAUG68G
	o2worrSvRts28K+BtlK+8EAVBrj3NMjHGdhc94J1xQ1E+7cq2ZikBlrw2GLp7Gpdwf+7
	kqFSJ1p3RExd5GE4qXEqShN7ZEq9QiFFWpFenmg4uuQeJuBvBbYvEw8HjeTDh6mcyi5b
	tKQwkNWpORM46IdGbieipL0m3CSK3aWXRoUQKPyXui08/sw3OyiaiaLRoa0WShxB8nz5
	30i3GAAPXEFAw4L11Q8eoysggyjjByiFHaOTUfxK9QvybZLTUfQz8lOdUc5bPe3pV2CQ
	gUAQ==
X-Gm-Message-State: APjAAAVj+DxaWpR8D4womlj8wS35PYhcbsNBJPp+czjXJb4eB9mfFQ6T
	v5enIsDfKl/jvjjF8KzqU0d9Z/81BgHT2w3YdSA=
X-Google-Smtp-Source: APXvYqwC+8iwtM44WibBsDpct66eREe6eMnylQareZTsUi7PPJ5v3fMJPALQRMqQc+RJTwjin5qUxYsalA7ZlR+iGmg=
X-Received: by 2002:a37:6554:: with SMTP id z81mr4992582qkb.9.1573684643922;
	Wed, 13 Nov 2019 14:37:23 -0800 (PST)
MIME-Version: 1.0
References: <CAMRc=MfGPct57NYp9Nzozdjr6Va861-mXkyP335acPoThx+YCw@mail.gmail.com>
	<7378e406-2727-2449-5583-9c3f90e39c67@kernel.crashing.org>
	<17c4c8b5-09da-f8f7-effb-b67c33624840@intel.com>
In-Reply-To: <17c4c8b5-09da-f8f7-effb-b67c33624840@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Nov 2019 14:36:56 -0800
Message-ID: <CAMKF1srtAu02xK-7QWcnrPsgJ8qCWRLnGc2FKnDZCXAYtui9Ww@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
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
X-List-Received-Date: Wed, 13 Nov 2019 22:37:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 13, 2019 at 7:50 AM Ross Burton <ross.burton@intel.com> wrote:
>
> On 13/11/2019 15:04, Mark Hatle wrote:
> >> This is because the implementation of __pthread_exit() in glibc calls
> >> pthread_cancel() which leads to pthread_cancel_init() being called in
> >> which said shared object is being loaded with dlopen(). When this
> >> fails, the program aborts with the following error message:
> >>
> >>      libgcc_s.so.1 must be installed for pthread_cancel to work
> >>      Aborted
> >
> > Fix for this would be to declare a runtime-dependency on libgcc_s.so.1 in the
> > glibc libpthread package.
>
> On my todo list for a long time has been:
>
> 1) a QA test to find binaries that link to pthread_cancel but don't
> depend on libgcc_s
> 2) Automatically finding use of pthread_cancel and adding the RDEPENDS
> automatically.
>
> (2) is definitely the best long term solution, but as Mark says: the now
> fix is to add libgcc to RDEPENDS.  There's plenty of prior art in oe-core:
>
> $ git grep -h RDEPENDS.*libgcc
> RDEPENDS_${PN}-ptest += "make ${@bb.utils.contains('PACKAGECONFIG',
> 'python', 'libgcc python3-core python3-logging python3-shell
> python3-stringold python3-threading python3-unittest ${PN}-python', '', d)}"
> RDEPENDS_${PN} = "libgcc"
> RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip bzip2 libgcc
> tzdata-europe coreutils sed"
> RDEPENDS_${PN}-ptest += "libgcc"
> RDEPENDS_${PN} = "libgcc"
> RDEPENDS_${PN}-ptest += "libgcc"
> RDEPENDS_${PN}-ptest += "libgcc"
>

There are two issues here, one is where dependency is missing which
this solution will address
however, there could be another problem, where libgcc_s is lazily
loaded during pthread_exit and
application is not using root user which many daemons do where they
use less privileged user to run
and it would fail in the exact same manner. I also see few other uses
of libgcc_s.so being dlopened in
nptl unwind code and libbacktrace in glibc. so even if you were to do
one of above you won't solve the
problem. in fact the part this will solve can simply be solved by
adding libgcc_s as rdep for libc6
and then if we still get failures of such kind then we know its the
second problem since we would have
taken care of the first issue with rdep. Its fine if we want to be
surgical, but it might be over-optimization


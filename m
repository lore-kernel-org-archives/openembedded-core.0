Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 324A27935C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 03:14:50 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id z78-v6so6405616qka.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2018 20:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=d7Qaej+wtfO6+Hahlc1xxY1s8Zkvr8vDUq/bJD/BNq4=;
	b=urgP46NltIwRwxXvm4qezlKamKBWEUt/KlBJ1ecXwKKQgON2MCAq8RMLKEnPl8AQt9
	duGHaxS9/uAA5F8o0fgkqWJAolZwGdYEvZNYgb7uIprdQSiISsaXv4CIcgehYQz8PqaU
	9GYXvIpD539EM7kFROpSoIEir9I1fL+i3MpSwrwIaDUNbeS51IubLvvJWbG/XY9VBPBj
	h/WD8rY1qt/wBwu3X4fPOZ4wxhfUIKU9Rs+ksLmYCycVAHen66vVkg4VuyHgHWxdQeMk
	A9nK+bPKP545exiyos2eEXiHD9eh6xPAxgXJqrotYI14WbtarIhL7vwU5Up4Uf9uXeed
	C+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=d7Qaej+wtfO6+Hahlc1xxY1s8Zkvr8vDUq/bJD/BNq4=;
	b=Dh0wnBsTGI2S0dRniT0IhuEeF6N87wfKSaz8ULmEpsFyVs6ncbW+uusSUgBtddfr+I
	yVsjmgN2eqKJnW5AvJ+AaxS6m8Kvig4trXQEaVAuddf8I3TzyJKHgN0JWG9s4bkif1rA
	7YAExaFQ3uF7MCy5YyAFssOf8p8KOMjbKW0wfUyzOPKARAa/iQriOEPryRkhJkxv4XVm
	yQTY68brrOf4jCI9DWSuJUdMT+0qYpoKMLbTqmuklDJ4Qh5YaUm7EWMLbQU9usM7cBdf
	NPY25W58cCeaOHXL6/a7XFvHLf6DfQ+bVCldl0qwjS+C5XpYWUZkHHUKk34JQUkiypcP
	SShg==
X-Gm-Message-State: APzg51D6hOzow8XPfF4Ss3xIZTSXKMVk/geQgqsGU5TqyQBF3J8C6LRI
	vHBb/Y7uslIMxxS+pXnDhk5VFZQMYI/SiERBJMRjbDkC
X-Google-Smtp-Source: ANB0VdY4mNp/sPkXpUC4w1OhMO9pz/UJxgsM5QMDnbRZbUyqK8dCIJXl1lEyWt8sXtEtEBVJ8zrgd1gTUwKrcdYH9hY=
X-Received: by 2002:a37:9904:: with SMTP id b4-v6mr531119qke.102.1536203690827;
	Wed, 05 Sep 2018 20:14:50 -0700 (PDT)
MIME-Version: 1.0
References: <20180830232604.10850-1-otavio@ossystems.com.br>
	<CAMKF1sozB+uN8h3YcEXSnRvuQOWdYYzRC2iOrr54h-5VYnQUMA@mail.gmail.com>
	<CAP9ODKopW2QbA0qvf4kdmq9j3vme_LO4y-43h1Uq5tspErb0Gw@mail.gmail.com>
	<CAMKF1sr8BRcKEgQQYnfROQrrZ=0PocpWW11bFd_9X7RPuNpC5Q@mail.gmail.com>
	<CAP9ODKoLPC-BNnfqjoUzbDM+EPo1jmwGoqyk7=cMD4vord2Kyw@mail.gmail.com>
	<CAMKF1sr9+bzRBVfV5J=ad4v_m1kQ5hLg=qDqX_dyEUWcFeocAQ@mail.gmail.com>
	<CAP9ODKpfrTs+vQQcG=TyTO6nPZHR8U3xHyg4i_xsn17eOKc41A@mail.gmail.com>
	<CAMKF1sq7UQMb7qGtEZhXiB5W09sTxYQdt1ZMq6cEUic6UcCd_g@mail.gmail.com>
	<CAP9ODKom3jT=M_X6wrz5WKRat3yRxtukm5Hrg3FnEtJUiis_vA@mail.gmail.com>
	<CAMKF1sp0rF18CtGd3NZigqtqAnrpot+kgNzd2zWQ1LQezzBVUw@mail.gmail.com>
	<CAP9ODKpWTf6bg8E496Eb2FHd-_P+aFds4g+w+N1N5gF06iZZEA@mail.gmail.com>
In-Reply-To: <CAP9ODKpWTf6bg8E496Eb2FHd-_P+aFds4g+w+N1N5gF06iZZEA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Sep 2018 20:14:24 -0700
Message-ID: <CAMKF1soHC14RDtbnJFdgOWiwkf0vvQUnwquSNnRwfCkgPjOEzA@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake: Update 3.11.4 -> 3.12.1
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
X-List-Received-Date: Thu, 06 Sep 2018 03:14:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 5, 2018 at 6:01 PM Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
>
> On Wed, Sep 5, 2018 at 8:19 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Wed, Sep 5, 2018 at 3:38 PM Otavio Salvador
> > <otavio.salvador@ossystems.com.br> wrote:
> > >
> > > On Wed, Sep 5, 2018 at 12:18 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > On Wed, Sep 5, 2018 at 6:42 AM Otavio Salvador
> > > > <otavio.salvador@ossystems.com.br> wrote:
> > > > >
> > > > >
> > > > >
> > > > > On Tue, Sep 4, 2018 at 8:43 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > > >>
> > > > >> Here is one failiure that is seen in meta-oe with updates cmake
> > > > >>
> > > > >> http://errors.yoctoproject.org/Errors/Details/190510/
> > > > >
> > > > >
> > > > > I am looking at it...
> > > > >
> > > > > Seems not related. I built poco using cmake bump and OE master.
> > > > >
> > > > > Seems related to the musl update on master-next.
> > > > >
> > > >
> > > > here is glibc failure log
> > > > http://errors.yoctoproject.org/Errors/Details/190886/
> > >
> > > I did build against master and master-next and couldn't reproduce it.
> > > I saw you are using 'bec' distribution and I used 'oel' so it might be
> > > changing the end result.
> > >
> >
> > did you try poky ? we now build with security flags turned on. Soon
> > to be propagated to nodistro in oe-core as well.
> >
> > BEC distro policies are same as poky with few additions
> > see
> >
> > distro
> > https://github.com/cbrake/meta-bec/blob/master/conf/distro/bec.conf
> >
> > local.conf
> > https://github.com/cbrake/oe-build/blob/master/conf/local.conf
>
> I did enable the security flags and I cannot reproduce it. I think you
> will need to take a deeper look at it.

I am not sure if its due to ptest which I have enabled here.
Regardless the problem is not related to cmake as it seems

error is this

Error copying directory from
"/mnt/a/oe/build/tmp/work/core2-64-bec-linux-musl/poco/1.9.0-r0/git/Encodings/testsuite/data"
to "/mnt/a/oe/build/tmp/work/core2-64-bec-linux-musl/poco/1.9.0-r0/build/Encodings/testsuite/data".

which is trying to copy a non existing test directory

someone else also ran into same issue and has posted a fix

https://github.com/pocoproject/poco/pull/2437

which I have backported into OE as well.


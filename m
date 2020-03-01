Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
	[209.85.222.173])
	by mail.openembedded.org (Postfix) with ESMTP id DF47261178
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Mar 2020 13:28:15 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id m9so7553200qke.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Mar 2020 05:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=cmo/WaoRhwe2vMsCRmELwBZ4PO6UGXmkt/7cmyEwJn8=;
	b=1SgoBiYeJ4jugRecQmxGV0rUvttCbNIKS0q1AgD0YUptqbq8hlOHgmxMod7AxIV3xt
	QBn0wXw+6vLCj11J1jfQlDOQ3oY7CDeqN3BEk3MLFrdbNbuo0KBsygeqGws9wucbMeDg
	kYKHPdiMk8NrKj8ZwJVIUQQ1g6LawlPNIokNYJvV8M2u986tAwedTOEusu9dvhM0f2sl
	ldHghCRiPJoviwOyMBLrxfERKz7jXJ19SqK7L7H9UxjAeC6H53bgJ1rDXWBCjQma0qEq
	9Z+5utmLxtsji7oGhJl8izekUXHqDw1KtQMMYHU7hfbxNchjH1cXcY1+GMyPuuARM/dh
	HLXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=cmo/WaoRhwe2vMsCRmELwBZ4PO6UGXmkt/7cmyEwJn8=;
	b=BGKGXZrrOPMRpcpk7s7mSIo3K0BP43u+QsD25kVmRt1AXpeNiSPLCPm0DlYQG0hhXq
	wst5XMj2Patc1vj5srzS8ePyV1IUb++Q8CWv/crVA6qvCrQgtSOVA7DannyZkisei0JX
	fXbOtHsAR8kyAfqvokSofDvJTjrSXAMeIlwnXaEHLehpqEvAc3GgXSapbeJqVBeof0Ph
	wQLVvRBGpjwcveVMtWOFGGU8SaiztVdbmklR5EdHxmyyXUn1KTm+jWywaMQ522J8nDxO
	sloutQghIODZm7m4NBuLuC5HbVB5k0a5ujXNCkh1PWHdy0uj3fW7k0hucFWnCSUuV0R1
	VgnA==
X-Gm-Message-State: APjAAAX7DlwnXUZqJfOvG2bw9gw4P4dRWiumqL0djqtTZRKFYjA5xYYq
	rrkWbDRc37NLzh6HfuqiSDJprvtwsQxbDg==
X-Google-Smtp-Source: APXvYqysO8z5jk5xpjFde0H1DZ7NuSq5198wIauYqZSmOx2q86Y5gyktwR79NLctKPNsNcN5wo+Acw==
X-Received: by 2002:a37:a744:: with SMTP id q65mr12283583qke.354.1583069296393;
	Sun, 01 Mar 2020 05:28:16 -0800 (PST)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com.
	[209.85.219.46]) by smtp.gmail.com with ESMTPSA id
	w41sm8480609qtj.49.2020.03.01.05.28.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sun, 01 Mar 2020 05:28:15 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qv1-f46.google.com with SMTP id p3so3107234qvq.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Mar 2020 05:28:15 -0800 (PST)
X-Received: by 2002:ad4:53a8:: with SMTP id j8mr11272925qvv.149.1583069295175; 
	Sun, 01 Mar 2020 05:28:15 -0800 (PST)
MIME-Version: 1.0
References: <alpine.LFD.2.21.2003010633290.73263@localhost.localdomain>
	<alpine.LFD.2.21.2003010645240.73653@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.21.2003010645240.73653@localhost.localdomain>
Date: Sun, 1 Mar 2020 10:28:04 -0300
X-Gmail-Original-Message-ID: <CAP9ODKotoKBorrMhVo0HL+OJ092R2VM-kVr43N8GM5MfORv8Fg@mail.gmail.com>
Message-ID: <CAP9ODKotoKBorrMhVo0HL+OJ092R2VM-kVr43N8GM5MfORv8Fg@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: is there ever a compelling reason for "FILESEXTRAPATHS_append := ..."?
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
X-List-Received-Date: Sun, 01 Mar 2020 13:28:16 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Robert,

The idea behind its use is to put the local layer as a preference for
the lookup for each of SRC_URI references. This is required so we can
override files / patches when using the bbappend.

Another common use is to make multiple recipes to share files, which
are included on SRC_URI as well.

On Sun, Mar 1, 2020 at 8:51 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
> On Sun, 1 Mar 2020, Robert P. J. Day wrote:
>
> >
> >   occasionally, i run across an existing bbappend file which contains
> >
> >   FILESEXTRAPATHS_append := ...
> >
> > and that makes me nervous as i don't see the rationale in *appending*
> > to that variable in a bbappend file -- seems to defeat the purpose of
> > potentially overriding what's in the original .bb recipe.
> >
> >   now, sometimes it's obvious that it's broken as i'm currently
> > looking at an example:
> >
> >   FILESEXTRAPATHS_append := "${THISDIR}/${PN}:"
> >
> > which makes no sense at all with the colon at the end. but other than
> > something so clearly broken, are there situations to append to
> > FILESEXTRAPATHS? that just seems counter-productive, but maybe i'm
> > missing something.
>
>   figured i'd scan for examples of that in some of the many layers i
> have checked out and found the following:
>
> meta-boundary/recipes-qt/qt4/qt4-embedded_%.bbappend:FILESEXTRAPATHS_append
> := "${THISDIR}/files:"
>
> meta-intel/recipes-core/zlib/zlib-intel_1.2.11.1.jtkv6.3.bb:FILESEXTRAPATHS_append
> = ":${COREBASE}/meta/recipes-core/zlib/zlib"
>
> meta-qt5/recipes-qt/qt5/qt5-ptest.inc:FILESEXTRAPATHS_append :=
> ":${THISDIR}/ptest"
>
> meta-virtualization/recipes-networking/openvswitch/openvswitch_git.bb:FILESEXTRAPATHS_append
> := "${THISDIR}/${PN}-git:"
>
>   note that a couple seem clearly(?) wrong (like that last one), but
> i'm open to clarification as to when this is useful. (i think i see
> the application in that meta-intel layer example, although should that
> use "OEROOT" rather than "COREBASE"?)
>
> rday
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750


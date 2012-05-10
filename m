Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SSb7v-0002xd-A0
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 23:42:23 +0200
Received: by eekd49 with SMTP id d49so531937eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2012 14:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=KEcj1Hu6DVxbbJ45Ro+xk6y2YCM4IcwG8OtXVvjWqwc=;
	b=IgG4j/6kQdZCn/7nnWwufuFu5y/XV6rukYQIJp2SW7JW5Eg5PFIDBEpxjUzelT8fnS
	wX2xkPDum7E2KpKnYFUHlbi2sPMWT/cmaDHIxIRDL1CeY4JDzTywScyRztitUivC616h
	HVSs028l05sAMdWpKmcdiVXSUKmIYDjGK5AEB/F+H4Th6ag1Git8StIM0AghLmGCtBK3
	/EiTN/B3MOlMyrXVw4/B0T/5e/AdhqUwxEBpV0fWphGq3y/i1Vb1DV4/EW9evk3Ow5WT
	S0K5deAJFBBX/0jXZ1LHmxKSu0pvbmFgJUIXn7vTwPl/3DbXFcVpdBANUxerVPIGiCwu
	CbxQ==
Received: by 10.14.99.129 with SMTP id x1mr1139473eef.108.1336685549104; Thu,
	10 May 2012 14:32:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Thu, 10 May 2012 14:31:57 -0700 (PDT)
In-Reply-To: <CAK18fxECsUVusXdYuS_gBwcXQaSTVaM2mc0Tpr7wfDikWHB9eQ@mail.gmail.com>
References: <1336683976-11846-1-git-send-email-andrei@gherzan.ro>
	<CAMKF1spf5qF8DYySoT5Q2aSte5-LCVX9Yd8bLd3Jkwqe4m3Gaw@mail.gmail.com>
	<CAK18fxECsUVusXdYuS_gBwcXQaSTVaM2mc0Tpr7wfDikWHB9eQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 May 2012 14:31:57 -0700
Message-ID: <CAMKF1srjgfuoKU+yqf81tbWkUjicaVpSe_ouV+PVRn3fd1tK_g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] fotowall: Add #include ui_wizard.h to ExportWizard.cpp
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 May 2012 21:42:23 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 10, 2012 at 2:26 PM, Andrei Gherzan <andrei@gherzan.ro> wrote:
> And it does. But this is needed for qmake in Makefile generation. Didn't
> find a better fix but this works as expected.

I see. So it seems makefile generator does not grok recursive includes ?
is that documented or a bug in the generator



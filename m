Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SSayW-0002jv-Nq
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 23:32:40 +0200
Received: by eekd49 with SMTP id d49so530264eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2012 14:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=T7XUk/cSzG4CoyLAXkSlweD+vyU77tpupS/JEyICT3U=;
	b=CE7F7IsqQ5i+z7u6IE9HPJxAJU4vtgc6vsHLVY7lcQovOWQzHhp1z2d+MNElgmwQeA
	udc3XKOFZTOkhYcSB5eiUmaggP/giOZU7aHLqoJ33NvQPTBpqDX5+ydCV3kJ8da2RnKs
	8BnT+Ee9rwkkETYoTRrURQVQz0iIaJcsYFoGP+bItAoHiP3zJ/SuZvFHPt7Xe2v2ke0H
	UrUptEmVqflunY2/cXALaoQOyS15lHTGIxeMsXuwVVGpq+50cpGf/8L7wSoAaHDJLZ6G
	PsAwxrPLhimKUSZfeEuMAtDl5cCrXjZp26jap1BxFxsxNli9td5o8mS1qCnapaVzzxDu
	khWA==
Received: by 10.14.47.136 with SMTP id t8mr1230925eeb.84.1336684966399; Thu,
	10 May 2012 14:22:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Thu, 10 May 2012 14:22:16 -0700 (PDT)
In-Reply-To: <1336683976-11846-1-git-send-email-andrei@gherzan.ro>
References: <1336683976-11846-1-git-send-email-andrei@gherzan.ro>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 May 2012 14:22:16 -0700
Message-ID: <CAMKF1spf5qF8DYySoT5Q2aSte5-LCVX9Yd8bLd3Jkwqe4m3Gaw@mail.gmail.com>
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
X-List-Received-Date: Thu, 10 May 2012 21:32:40 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 10, 2012 at 2:06 PM, Andrei Gherzan <andrei@gherzan.ro> wrote:
>
> +App/ExportWizard.cpp depends on wizard.h which depends on ui_wizard. The last one
> +should be already generated before compiling ExportWizard.cpp.
> +

then shouldnt wizard.h  be including ui_wizard.h and not the .cpp file ?



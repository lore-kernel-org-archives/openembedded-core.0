Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SaCxd-0002fd-BU
	for openembedded-core@lists.openembedded.org;
	Thu, 31 May 2012 23:31:13 +0200
Received: by eaal1 with SMTP id l1so318061eaa.6
	for <multiple recipients>; Thu, 31 May 2012 14:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=wsJDJAjkyOUYCvSLj3np+j03fhSR0SLdPetCXQPC7J0=;
	b=ube6YplPJAe1yS0BJC8/FsUMtCggWkKES+fapSqzbnt493ZKeaqLl5hpBWTP0UkrTc
	bE45MmLEooweFD6gn2dAySXyPMreDPLCy976lb9HJ+BJHEGeFduhrJAduKhvBGjdgvnC
	PbTr58KkTBcPGG/6WUFIrJgOlAJ0/gRrPCTZCWbOdegzarobMzTko8K7cAg6gbxzovXu
	4rzsoT1qPxrlhR6BK4XUACNeUhNB/BHZB0Cjtx8JBa7mtaLyqLeby9Wryb3gklQUgIWq
	3g2A5ndHPMPTvQsUKGJ22BsAYS73eLXTQPSPIlvMNQCrnvnVdBYVyIbGDvRV9GKuuLSo
	zmdg==
Received: by 10.14.39.70 with SMTP id c46mr133174eeb.118.1338499253151; Thu,
	31 May 2012 14:20:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.188.11 with HTTP; Thu, 31 May 2012 14:20:22 -0700 (PDT)
In-Reply-To: <20120531161412.561acb04@wrlaptop>
References: <20120531161412.561acb04@wrlaptop>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 31 May 2012 14:20:22 -0700
Message-ID: <CAMKF1sohTucSWxu5tbATPYsMTPALwSMPPvCHJCSr_ugQ3AbXqg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: "openembedded-core@"
	<lists.openembedded.org.openembedded-core@lists.openembedded.org>
Subject: Re: Suggestion: Occasionally take --hash-style=gnu out of the linker
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
X-List-Received-Date: Thu, 31 May 2012 21:31:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 31, 2012 at 2:14 PM, Peter Seebach
<peter.seebach@windriver.com> wrote:
>
> In theory, it's a bug if a package is configured such that it does not
> actually request hash-style=3Dgnu. =C2=A0In practice, though, the yocto
> toolchain is configured so that it's the default.
>
> Maybe there should be a periodic build or two that uses a compiler not
> configured that way, to flush out such packages?

yes we tried that with classic OE for long time. it did not go much further=
 than
we changing the recipes to add it to compiler cmdline and subtle bugs.
Right thing
would be to fix the packages but its a significant task. Besides OE most of
other distros use it as default so I dont think there will be many
fixes upstreamed
for respective packages.



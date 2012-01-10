Received: from mail-qw0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marc.ferland@gmail.com>) id 1Rkj98-00047q-Fj
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 22:22:18 +0100
Received: by qabj40 with SMTP id j40so76336qab.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2012 13:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:in-reply-to:date:message-id:mime-version
	:content-type; bh=TbWqLOyC+ygjfe2Z7flXwPI2Zy2sbMGv+ZSfIrMFR7k=;
	b=v6JWpuZm47AIbbBUEI0OsaJkeVhJQAUQhK4ipS9mrHQ2gbq7jygo/0sc69XbR6VtTH
	I3Pwj0suA2V5dwdi1jpYFkSxQWsRF93GH6VPq1t8omYr8SHlOwSNHoGPHJlXoHq4haUQ
	BqgiJmDebPgqjod1wbKurVxBxuxTOedoGqazU=
Received: by 10.224.186.76 with SMTP id cr12mr27102365qab.25.1326230085937;
	Tue, 10 Jan 2012 13:14:45 -0800 (PST)
Received: from ferlandm@sonatest.com
	(modemcable066.15-37-24.static.videotron.ca. [24.37.15.66])
	by mx.google.com with ESMTPS id el3sm87769286qab.8.2012.01.10.13.14.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Jan 2012 13:14:45 -0800 (PST)
Sender: Marc Ferland <marc.ferland@gmail.com>
Received: by ferlandm@sonatest.com (sSMTP sendmail emulation);
	Tue, 10 Jan 2012 16:14:55 -0500
From: Marc Ferland <ferlandm@sonatest.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: openembedded-core@lists.openembedded.org
In-Reply-To: <CAP9ODKoaK1hZsbhQMBgdGmFw_Mru9s6aOgqrm0MMqgMU0hiNVA@mail.gmail.com>
	(message from Otavio Salvador on Tue, 10 Jan 2012 18:39:49 -0200)
Date: Tue, 10 Jan 2012 16:14:55 -0500
Message-ID: <87vcojmf8w.fsf@sonatest.com>
MIME-Version: 1.0
Subject: Re: [PATCH] Add grep to RDEPENDS to avoid command	failures.
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
X-List-Received-Date: Tue, 10 Jan 2012 21:22:18 -0000
Content-Type: text/plain; charset=us-ascii

Otavio Salvador <otavio@ossystems.com.br> writes:

> [1:multipart/alternative Hide]
> [1/1:text/plain Hide]
> On Tue, Jan 10, 2012 at 18:22, Marc Ferland <ferlandm@sonatest.com> wrote:
>
>> ...
>
> +PR = "r1"
>> +RDEPENDS = "grep"
>>
>
> Busybox ought to provide it; what is missing?

I was having trouble running the pm-suspend command. See:
http://bugzilla.pokylinux.org/show_bug.cgi?id=1887

Basically the '-x' option is missing from busybox's grep.



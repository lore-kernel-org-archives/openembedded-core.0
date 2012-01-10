Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marc.ferland@gmail.com>) id 1RkkuQ-0007DB-3b
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jan 2012 00:15:14 +0100
Received: by qadb17 with SMTP id b17so2070731qad.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2012 15:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:in-reply-to:date:message-id:mime-version
	:content-type; bh=OMSBqlyQNZx30Z8l7jSDS1cGmf5tsKTfFMEf92XAZHc=;
	b=gs0VjxNhcOI6ULiuuJeQd2M5d1ET/LCH2N5KbYUXP4uC7vEyIITUHAfaPacXUlLtRj
	y+vepX+GE0BSj1ggtE9fj4tGVkKSGTb9azloRFU6xhZh8U52uyEPcV2c4CM36vwSt89T
	e2FkgZQfHsJTyNNWU6ha/m34GKSsG7ebKekn4=
Received: by 10.224.220.14 with SMTP id hw14mr27443968qab.42.1326236862522;
	Tue, 10 Jan 2012 15:07:42 -0800 (PST)
Received: from ferlandm@sonatest.com
	(modemcable066.15-37-24.static.videotron.ca. [24.37.15.66])
	by mx.google.com with ESMTPS id co15sm55558635qab.1.2012.01.10.15.07.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Jan 2012 15:07:41 -0800 (PST)
Sender: Marc Ferland <marc.ferland@gmail.com>
Received: by ferlandm@sonatest.com (sSMTP sendmail emulation);
	Tue, 10 Jan 2012 18:07:52 -0500
From: Marc Ferland <ferlandm@sonatest.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: openembedded-core@lists.openembedded.org
In-Reply-To: <CAP9ODKprc01W9sStwMubMziZThj31C5Qn379AHA508rDJW9v9A@mail.gmail.com>
	(message from Otavio Salvador on Tue, 10 Jan 2012 19:25:36 -0200)
Date: Tue, 10 Jan 2012 18:07:52 -0500
Message-ID: <87sjjnma0n.fsf@sonatest.com>
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
X-List-Received-Date: Tue, 10 Jan 2012 23:15:14 -0000
Content-Type: text/plain; charset=us-ascii

Otavio Salvador <otavio@ossystems.com.br> writes:

> [1:multipart/alternative Hide]
> [1/1:text/plain Hide]
> On Tue, Jan 10, 2012 at 19:14, Marc Ferland <ferlandm@sonatest.com> wrote:
>
>> I was having trouble running the pm-suspend command. See:
>> http://bugzilla.pokylinux.org/show_bug.cgi?id=1887
>>
>> Basically the '-x' option is missing from busybox's grep.
>
>
> Can't pm-suspend be patched to avoid using the -x option? Maybe making the
> regexp more strict, for example?

Looks like it uses grep to ignore some parameters that are specified in
a separate file. A combination of 'sort' and 'uniq' would probably work,
but we would loose the order of the parameters.

Any idea?
Marc



Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SUOyw-0000CN-H9
	for openembedded-core@lists.openembedded.org;
	Tue, 15 May 2012 23:08:34 +0200
Received: by eaal1 with SMTP id l1so5582eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2012 13:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=58G34mXJZtm0L+MZHbpw9kLFcuMmC3JnTjJ9SOgaM3U=;
	b=k3PokTl/eaLB97EgwbVfYHnEGOEzP8PPusA0FzCz/63IBXrrgQRVXnjLQCCYgytFyl
	jKyKpOkdUiuTcc0ptb42HWXRC3XkDcZwBcuHx9xmgM/Sm5gzfoVd/6ldKVfHOmE5UdtK
	GPTVY+CJlIUtPGOEdPmwMhfzJHwihbIUFAdaGsdpyRn3eXT8Xh62deIvMEi5WyGkrH2Z
	y7K1gBpff7H70ZbU5dDQ+yHQelIKm7R6Z/8QXjQfjyPMmW0v949dFjrZTADnNTSRo1Th
	NDIS/JsVYPTo2rQHWTORvigga3KZPDjjkzOdhvmFZBwawY98PDbrWtupwGou2ilUQYIE
	V/Uw==
Received: by 10.213.20.200 with SMTP id g8mr853545ebb.103.1337115514271; Tue,
	15 May 2012 13:58:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Tue, 15 May 2012 13:58:04 -0700 (PDT)
In-Reply-To: <20120515195914.GO29324@mx.loc>
References: <1336065154-8513-1-git-send-email-rep.dot.nop@gmail.com>
	<1336065154-8513-2-git-send-email-rep.dot.nop@gmail.com>
	<4FA859E5.4080609@linux.intel.com> <20120515195914.GO29324@mx.loc>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 15 May 2012 13:58:04 -0700
Message-ID: <CAMKF1srqMwmv5aT+mm1zs3q8JoWVocJt5XEwWEnx5TVd=ngQaA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] runqemu: use modern, single-char name of test(1)
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
X-List-Received-Date: Tue, 15 May 2012 21:08:34 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 15, 2012 at 12:59 PM, Bernhard Reutner-Fischer
<rep.dot.nop@gmail.com> wrote:
>
> Any sane way out of that mess?

there is a patch to fix it differently on ml.



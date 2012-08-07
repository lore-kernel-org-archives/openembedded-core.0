Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SyqD9-0008Uu-1K
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 22:17:03 +0200
Received: by eaad12 with SMTP id d12so2370eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Aug 2012 13:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=ED4a3ZX2sP9CgqrYXR9FkDPDAm+SqdNbeoXsW8FqHPk=;
	b=aNZ9QCBq3foXpw9XlUvFjZxeH60NK7/8TLPRHs5QDp7jdCMU+pH7lwZAtG41Dhs/fX
	S7iQ/zVQvAY8jjMQGI6JVhMFszqH51mBIlpJnIMQA3p1CDP+g2OC3hAvTlh16GKwjTQO
	uKvS1aQdgChvtsjSW25lMNfSy2Xv7lrxG4BfjqeCWAxvtd2KILKNjEC4ZVrnkmR2uPU4
	ysDMlIwRYcZFUIUjj1k6YO6BzHgWgM8lmTfiDwiT6GqENi71t9LSVKWUZGpy8Gai7/xC
	rxRzoYGMRrWJh5ScR2o8URybqvOX7fuXJ5/eoVxBtjZ1gNcUvnk1hA3dmyd2uPbY4eMr
	8Myg==
Received: by 10.14.207.9 with SMTP id m9mr19164151eeo.5.1344369916835; Tue, 07
	Aug 2012 13:05:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.97.141 with HTTP; Tue, 7 Aug 2012 13:04:46 -0700 (PDT)
In-Reply-To: <501FED7B.6050309@linux.intel.com>
References: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
	<1344196136-7643-17-git-send-email-javier@dowhile0.org>
	<501FED7B.6050309@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Aug 2012 13:04:46 -0700
Message-ID: <CAMKF1sq39z0Tq2u9AuEsTx5USfAgzHtXwXggJyeukynOZu4ubQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 16/28] kernel.bbclass: use ${base_libdir} and ${sysconfdir} instead of /lib and /etc
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
X-List-Received-Date: Tue, 07 Aug 2012 20:17:03 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 6, 2012 at 9:14 AM, Darren Hart <dvhart@linux.intel.com> wrote:
> if not, these will fail.

and it does.



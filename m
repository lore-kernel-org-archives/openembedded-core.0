Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T4xMZ-0000kK-Qr
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 19:08:03 +0200
Received: by eaad12 with SMTP id d12so513240eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2012 09:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=A2Yh3aXAJykE8s25Gv41CuVwC8pQ7aI+6W+bo6RBR1c=;
	b=awKYkCtbiLidhwYLu3OlbVvywPKQdrnmz4g7HgjJntOXx7F5ehSw9nS1ABMrX8E8pA
	FQ+StgMCONd2tZsmSvZm6S//sEpfEit4Jd8sLkcV4EcxduvVpF51vXLlOC8tbilj4Si5
	ngaHnZ03sbSiVJ5qDJ/n6agz7xqrwPxipvLGa93iEzcmAErG+yEJQ3NcBe2xT+wmetwn
	WUdfyHmtFx4xqsUY7oni8jjB8sCebPiQPCdCZN5FLL3h9v7o5asl6J+QFK+FJ1B3kdvl
	Bnf9c6T3tsDCF4nHr/8jsl8OdR+Yrv916dycuqxrAqaFCQURo8Cy9leYGwUZVddR1Kha
	m1BA==
Received: by 10.14.218.134 with SMTP id k6mr8415959eep.14.1345827356341; Fri,
	24 Aug 2012 09:55:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Fri, 24 Aug 2012 09:55:25 -0700 (PDT)
In-Reply-To: <50370A1F.40401@linux.intel.com>
References: <1345781608-2198-1-git-send-email-raj.khem@gmail.com>
	<50370A1F.40401@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Aug 2012 09:55:25 -0700
Message-ID: <CAMKF1srHBKHSLHpDw6oC5CEKCusXa3AbFDRUHRon_s4D15c9EA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] iputils: Fix postinst to run on cross rootfs generation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Aug 2012 17:08:03 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 23, 2012 at 9:59 PM, Saul Wold <sgw@linux.intel.com> wrote:
>>
> Richard pointed out that with Pseudo the pkg_postinsts are un-needed, so I
> offered a different patch to that effect.

yes I see

http://git.openembedded.org/openembedded-core/commit/?id=a2bc81032c85548f7c72dc76e6020ab4df9af6de

how does it work on device installs isnt clear to me though

with existing patch atleast I understood that with Online Package
management the postinst would run



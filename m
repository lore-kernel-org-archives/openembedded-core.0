Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SZZFU-0007nv-UN
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 05:07:00 +0200
Received: by eekd49 with SMTP id d49so1586612eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2012 19:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=j4py5yR4ecA8awCJcrnk/1HCNa3N2ku0Z0/HJyM8pIY=;
	b=hWFKBS4s+Z4quJ+CE73Cl+276FgV+LIfvRf0ZOmpaxEWSNdDizH7CNlhed88h23H0W
	F239RFJwUY5pPFJRbtkigB2sPWq/wRra1UIiqYPgDX1SQiXuyLUtwOdcHmgsjVD6OY6a
	pz1rjmI78YaOUwotzfy+weW1CqZzOrp4Bh2R3GEuPCpS0HDYzxbaeG+LAw8wsRET2g/J
	+KHkcXi1fAhZTjbfRTWMfbz+BZ8vnM4C1ZtdiLzmiEdyJGXdsYqQX6AV6RbdWwgpGvxK
	DLxSu4UNoULz33PuJjhFkz+d0KS6bRv+u5Rpa+HJz3ihR2R04wcYPv58/jMxEwr3F1nS
	Xi/g==
Received: by 10.14.39.70 with SMTP id c46mr5724214eeb.118.1338346602788; Tue,
	29 May 2012 19:56:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.188.11 with HTTP; Tue, 29 May 2012 19:56:12 -0700 (PDT)
In-Reply-To: <2A530553-23DF-4CB1-A957-0E2C3D468BDA@gmail.com>
References: <E071AE73-05A7-4D16-9442-952E65ECA96C@gmail.com>
	<4FC51727.6020205@windriver.com>
	<2A530553-23DF-4CB1-A957-0E2C3D468BDA@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 May 2012 19:56:12 -0700
Message-ID: <CAMKF1sq_G6k_o+o=OZrhuz2iNq6EEhTYT67dA1cssU3LFS5cYQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: meta-xilinx: ERROR: Failure expanding variable TUNE_PKGARCH ppc440
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
X-List-Received-Date: Wed, 30 May 2012 03:07:01 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 29, 2012 at 12:46 PM, Elvis Dowson <elvis.dowson@gmail.com> wrote:
> PACKAGE_EXTRA_ARCHS_tune-ppc440 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc}
> ppc440"

may be this should be be

 PACKAGE_EXTRA_ARCHS_tune-ppc440 =
"${PACKAGE_EXTRA_ARCHS_tune-powerpc-nf} ppc440"

other pieces look good

-Khem



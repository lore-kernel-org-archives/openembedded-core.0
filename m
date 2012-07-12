Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SpPtJ-0006SP-N3
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 22:21:37 +0200
Received: by wibhq4 with SMTP id hq4so5897486wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2012 13:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=mZt/FjUqQi60bxbOc5IIcvD7Iqs464LFVP7fD8HLrLg=;
	b=MqU/a9Wi54JW8gsww/n2zNxmqYJ5XmcWAK9S0dhNvy8PhhSpSMvTiUcWdgomX4Tzvi
	qMr/kn6eSmRHLWd598cOyhpOgWshmgokeovdFBgoyrbD1L+gPqjL9SXmrT6LqC1ls+UQ
	C8V/TkkFb2oNTlM1eyE7uIEc1SMMZ7Nx4d9UYp3a7Vn4AXStqzMvcMdBbUM6BmkSPBV6
	ORP4igMEnUCEhoy95NqAf6+LTPU5a4TfhnZwKgv2k3uNTfBiwiEywLWUfhn46OQxF++I
	yvjiz+9YmjJS+/jfQ1X+o35JvQ0IYtubwZwt9MaTLjQfRr4BTyC+sJ2lHhLw6tf3ky2+
	+QHw==
Received: by 10.180.91.1 with SMTP id ca1mr31396170wib.8.1342123824400; Thu,
	12 Jul 2012 13:10:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.30.34 with HTTP; Thu, 12 Jul 2012 13:09:54 -0700 (PDT)
In-Reply-To: <4FFF25EC.70002@linux.intel.com>
References: <1342073846-23047-1-git-send-email-b28495@freescale.com>
	<4FFF25EC.70002@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 Jul 2012 13:09:54 -0700
Message-ID: <CAMKF1srHUL-08G5YbXL_erW2CNc2n+Ly85mG0SRtC9d2vUXrAg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: b29882@freescale.com
Subject: Re: [PATCH] lsof: define linux C library type when using eglibc
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
X-List-Received-Date: Thu, 12 Jul 2012 20:21:37 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 12, 2012 at 12:30 PM, Saul Wold <sgw@linux.intel.com> wrote:
>
> why not set the EGLIBCVERSION directly on the second line, what's the
> purpose of the /\./?  It renders the version empty in my tests.

it has to get rid of (.) e.g. for 2.15 it should be 215 and 2.16 it
should become 216



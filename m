Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SPzax-0002Hi-C8
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 19:13:35 +0200
Received: by lbol5 with SMTP id l5so1251015lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 May 2012 10:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=eweOZYYZRodfVArAZ45L2CeRkblTJUOHnXkbDqbO8HM=;
	b=RRTuv1KpfPS04AVS7GxZi4Yuu7+YfExxIyeDN1qW9jhwKY91t3U5VTHG3Gev7NRf9U
	uwZuev3EoUEMcQUJ4vNI/Ug+APv3ehCPKzwwC+qa5ligmgs1LmVgbuUXYwxD7onCo4jh
	0TTY+3QjCyQQ4F9MEnw5z8Ydk3nkUJtXlsj9teg1EcaKXwBnGhoYgSekJWdspNuOq4be
	ve+S7E7hwQdMt4IvbHTcwscdDcvaIFld2MNj4GCGxFj4NqOzro2DjprRjegU6f6MIsec
	R6YFDZhyioVV3t9d85cooragRqpK9yyRcEdZ4mzxVpV+T4T04kF8bcSeMaQvTgY4g7al
	jATA==
Received: by 10.152.145.228 with SMTP id sx4mr2703435lab.45.1336064629690;
	Thu, 03 May 2012 10:03:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Thu, 3 May 2012 10:03:15 -0700 (PDT)
In-Reply-To: <CABcZANm5muqfeq6hDnA-qUsMX+hof=BvdXA6THAnBvLCjUK5zA@mail.gmail.com>
References: <e6ccd54276855728be4e18f3fab28136736963a1.1336015963.git.raj.khem@gmail.com>
	<fb85f4acd897466f053198dd9606143b90c14c66.1336015963.git.raj.khem@gmail.com>
	<1336055718.30113.125.camel@ted>
	<CAMKF1sqiSO9kz3-0fKV+XDpB8+v2+pph_rZgRb6xof3OSHjTWg@mail.gmail.com>
	<CABcZANm5muqfeq6hDnA-qUsMX+hof=BvdXA6THAnBvLCjUK5zA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 May 2012 10:03:15 -0700
Message-ID: <CAMKF1sq_bMMFiGSJBBbnV0zckoAmkgnsj5jHeBw0M+jWbFYu4Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] qemux86-64, qemux86: Override XSERVER variable
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
X-List-Received-Date: Thu, 03 May 2012 17:13:35 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 3, 2012 at 9:47 AM, Chris Larson <clarson@kergoth.com> wrote:
> ??= may be of use here (though I haven't looked at the files in
> particular, it seems appropriate)

I tried that and it started to build kdrive for qemuarm



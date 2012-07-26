Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SuTPp-0007cI-Pn
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 21:08:05 +0200
Received: by lbol5 with SMTP id l5so1502631lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 11:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=rpTCM/jIjdx2qGNQ7EZtbd3U8BoLeAqdfZBttSygKXY=;
	b=KW3gFaNL3tscszBda5UpCdA9tq/ETrz0NCzTr6udlcOuY2ST6h0+JBGLaGwSyal6rw
	j0RDr466aWyVVxHlzvme9a8ed+8t02cSEJIr3iYVxZyaJq5Jpu9abszA3I/UlA2li40/
	j63UM+9dT37ZK0o8l30FT/8PZiKODGScQZs7/EIvOzHXGkQgKP0j/R9gWRo3tt+d5xs6
	4KjT9EyVBGv0Pb3YNAH7VIvh0jP7hsI4+ceoEkp+Tn05ffaLPTZzUbgvHCU+HkFbjpT2
	IZNstAK1yNLClJARmWEjJp4E1SqN5iyRGtx9kLvCaVYdvgr+miX6lQ9VqRn/dfrxkIij
	faDg==
Received: by 10.112.100.234 with SMTP id fb10mr208658lbb.12.1343328994753;
	Thu, 26 Jul 2012 11:56:34 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.64.180 with HTTP; Thu, 26 Jul 2012 11:56:14 -0700 (PDT)
In-Reply-To: <007BD92917A2324FA403BCF9A464CF841FF7D6FA@ALA-MBB.corp.ad.wrs.com>
References: <007BD92917A2324FA403BCF9A464CF841FF7D6FA@ALA-MBB.corp.ad.wrs.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 26 Jul 2012 11:56:14 -0700
X-Google-Sender-Auth: xQGB-8Pu2yJ29pAT17M9tL5qoqA
Message-ID: <CABcZANnGYCAjAtBvkFp2MAinJE2Rr4vokxnCLAGyCTuoh50TPw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: EXCLUDE_FROM_WORLD
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
X-List-Received-Date: Thu, 26 Jul 2012 19:08:05 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 26, 2012 at 11:45 AM, Slater, Joseph
<joe.slater@windriver.com> wrote:
> Could somebody clarify excluding things from world?  I see
> EXCLUDE_FROM_WORLD = "1" in
>
> many places, including libx11.inc, and I'm sure there's plenty of libx11
> stuff in world.
>
> I also see package specific exclusions in world-broken.inc.
>
> If one wants to exclude items for a particular bsp, would it be best to put
> exclusions
>
> in a conf file for the bsp, or to put exclusions in another conf file in the
> form of

"exclude items for a particular bsp" makes it sound like you're
confused about what EXCLUDE_FROM_WORLD does. The only thing it affects
is when you run 'bitbake world' to build every recipe/provide that
exists.
-- 
Christopher Larson



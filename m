Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TFqJ3-0003Ux-IQ
	for openembedded-core@lists.openembedded.org;
	Sun, 23 Sep 2012 19:49:25 +0200
Received: by eaad12 with SMTP id d12so1324179eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Sep 2012 10:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=rvVglT5eUJM+qJS2tq3vQXFcc3NGT9Iu8i4EWBgMB1k=;
	b=CtVv6KxJhqdPkMwIdXJxhcC4crzTPcchN1gIk3L8gfu8T4qpaD1p5+tsPXdgFxg5OZ
	o3VcvBxNdwdBmm1mavp/9vi5hxNRMbFT362hRAUrGHVR0KGGT154JMXx4+2PvuBBD2+O
	fB+qSW3TLdbYEz9PI64PlGz+FAmJuuTcrwFBjckGwZrn2VqOv4Dn+zeWv+rsf6R9RvGK
	8km92He9ugGLLAJH+yJR8YOnaiBoL2ibVVO7iJGyoIw0uYkZz+uNkxKFb+VBoGNQXdCg
	Gx1F5taURP4cmZ4MviaZ3a0JwiJ6yHlFbwdGwXoE0dEUiSkRrJSjpw6EuK9lNPsXhaeE
	4n4w==
Received: by 10.14.202.131 with SMTP id d3mr12329956eeo.32.1348421799050; Sun,
	23 Sep 2012 10:36:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.173.69 with HTTP; Sun, 23 Sep 2012 10:36:08 -0700 (PDT)
In-Reply-To: <1348233776.10108.75.camel@ted>
References: <1347964372.13596.110.camel@ted>
	<lya9wkr2qj.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1348220197.10108.34.camel@ted> <1348233776.10108.75.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 23 Sep 2012 10:36:08 -0700
Message-ID: <CAMKF1soGo7Xk0PfjGVwWDFFiBSUDvXRxMNgvfbrDCqxerfvGDg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Richard Purdie
	<public-richard.purdie-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@plane.gmane.org>,
	Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bitbake.conf/gcc: Add clean masks for stamp files
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
X-List-Received-Date: Sun, 23 Sep 2012 17:49:25 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 21, 2012 at 6:22 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> I've given this some more thought and there is an easier way out if we
> assume PV starts with something numeric

is this assumption true always I wonder



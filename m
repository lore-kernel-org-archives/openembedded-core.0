Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SSchD-0004xI-N1
	for openembedded-core@lists.openembedded.org;
	Fri, 11 May 2012 01:22:56 +0200
Received: by eaal1 with SMTP id l1so714628eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2012 16:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=KDjkD+3jIY0CglUP7z0PXyQW63+QdHfZIVC9GRBJPds=;
	b=FfWxp+YXyysWHoIYG7a7Ls5060WXE4FlSIzkukB0Y15lyGszuR5bd2M4VvS+v/zeB2
	AveJYdO9Hirc4pwUDP8TtbihgFy28NXY5OvYR4OJJUtXtEZgx9CVT0baqee7cdbfqMx+
	1XchuI07QwPKi8kqxAzd18UJHOJm8dWac9vm6bE4PZbklxvd35yOESg37Pk6yWGc4J5V
	aoUnVV0nkxM73xoKc2JOa6iwKo9mrFWm5d9j2OujJaTSgfaYJPzQk/fYNUJafHyCT6sx
	8hrwiMhucAmqI1qNAqvVgliEsvCbcu2XCataS00UV4Rmap7vjCVAF/D6H0JS99PC9rNj
	tVzA==
Received: by 10.213.121.130 with SMTP id h2mr1839677ebr.122.1336691581144;
	Thu, 10 May 2012 16:13:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Thu, 10 May 2012 16:12:30 -0700 (PDT)
In-Reply-To: <4FAC3F2F.9000006@windriver.com>
References: <4FAC3F2F.9000006@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 May 2012 16:12:30 -0700
Message-ID: <CAMKF1sq_g2xz6GKdh3BGaD5Cuq_BhdEUVPLVuoF5tVdC=jUCCA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: setscene and perl -- pathological case
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
X-List-Received-Date: Thu, 10 May 2012 23:22:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 10, 2012 at 3:20 PM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
>
> This is a very significant performance improvement. =C2=A0I'm not sure if=
 it's
> possible to speed this up even more, but it would be nice if we could get
> things under a minute.

good job. in theory you could pythonise it even further using re module



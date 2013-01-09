Received: from mail-la0-f54.google.com ([209.85.215.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bjorn.forsman@gmail.com>) id 1Tt0pu-0004nm-LA
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 19:57:21 +0100
Received: by mail-la0-f54.google.com with SMTP id fp12so2237934lab.27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2013 10:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=4upSpTY6Sk9zeG2Mb9yNN5drHVxMMO3Ip7SlOCUmrQ4=;
	b=deq3C9NnJPGo/0/iTljp+Kko5wsZLeQpiCWasMhMbyCZX7x+IvjILEcqlMJP7x6cHU
	4MWDZC9iPYmEpLFBbPfNQutcrZ8Bwqi1lZUMNY5rn+IH3dmlBtlL2OsVxZHrnQjZXEIE
	FZZTy55WShnX5x0hE8dFzywi/mSiKj6TY/mnY49XXdJG2Kdshf8/36ftGVRtDkCnNPe9
	fhaJs4YVLStQ66lk+KXt6JZF5U6iePTmPC2pdF584neKWgGviqVtzf0DP1ZScHtKBTIS
	Z+aDbLtyAwjtcu1JqiQP6R9HEOEpZRjqSxSQd1Xubl9U+v+W0zGcn6s2HvwxWlPpY6NU
	hXbA==
MIME-Version: 1.0
Received: by 10.112.10.71 with SMTP id g7mr28245502lbb.70.1357756922362; Wed,
	09 Jan 2013 10:42:02 -0800 (PST)
Received: by 10.112.133.195 with HTTP; Wed, 9 Jan 2013 10:42:02 -0800 (PST)
In-Reply-To: <alpine.DEB.2.02.1301090752510.25391@oneiric>
References: <alpine.DEB.2.02.1301090752510.25391@oneiric>
Date: Wed, 9 Jan 2013 19:42:02 +0100
Message-ID: <CAEYzJUHQ8c4NDErbcjNyRLKg3NfENUrFo6JO1xdL71dZsXyzrA@mail.gmail.com>
From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: for a quad-core machine, shouldn't parallelism be set to 8?
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
X-List-Received-Date: Wed, 09 Jan 2013 18:57:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 9 January 2013 13:55, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>   just noticed this in local.conf.sample:
>
> # For a quad-core machine, BB_NUMBER_THREADS =3D "4", PARALLEL_MAKE =3D "=
-j 4" would
> # be appropriate for example.
>
>   i thought the general rule was that parallelism should be *twice*
> the number of cores.  that's certainly what's suggested in the yocto
> QS guide:

Some time ago I wrote a script to build the linux kernel 3 times at
each -jN level from 1 to 50. Then I averaged the build time on each
-jN level. I got the fastest build with -jNCPUS. Going above NCPUS
just added overhead, although very little. The overhead seemed to
build up quite linearly from above -jNCPUS. Because the overhead is so
little, having -jNCPUS*2 may not be noticeably slower than -jNCPUS.

I ran the same benchmark another machine and it showed the same trend
curve. Note that NCPUS must include the hyperthread cores.

Best regards,
Bj=C3=B8rn Forsman



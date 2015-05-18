Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id A8CFC65C9C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 13:12:53 +0000 (UTC)
Received: by pdfh10 with SMTP id h10so149300455pdf.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 06:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=C9ECMtTyvVIVYq2zFevmhHpbpElMsZRrFN6Jju8CFrI=;
	b=Ad/rant9a6jrF50geF0YnpSu2PUh8FJDVHrcvpr4S5Lb7qLR+7bORb8FDSiomDWPCo
	cSPnR47SqGFSO9Z9BCPyWRICRtYhcQuTkclz0YBvu1ZUbbMqPVQr7oWRP3yl0NJY1AGk
	uIbi9tyLZWTGl+utUoW5f4dk8ogV7TGLHTN88KfBsy2aDFKCbP8Szlu2GdQp80WjZMYy
	7WZydPhsIn5gf/Z6C7WObGT/aJyFdH9CU6TE1vXtkUCN0bF8DUrrwoc6Ed0mmaw6YCSh
	nc64/awFSD/t3p7SOnL5jMVwjDb2Lw8kCD9RBHhYIjPjqwB2J2I73kxwYMv2LoWProrN
	JMBw==
MIME-Version: 1.0
X-Received: by 10.66.101.9 with SMTP id fc9mr43410974pab.37.1431954774571;
	Mon, 18 May 2015 06:12:54 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.70.34.109 with HTTP; Mon, 18 May 2015 06:12:54 -0700 (PDT)
In-Reply-To: <CALbNGRQPU2ToHpwcD6GA+TOz4zS2sJV8dXgbZsufn=9Pg-Pn3Q@mail.gmail.com>
References: <CALbNGRRq94M86hm=0y8ZR7+5RXDMCJkXPxGREzAOjNQLerNkPw@mail.gmail.com>
	<20150518080138.GD9407@jama>
	<CALbNGRReeZHBXDo2C4tRTHfdCwSfS5QxpKdGWpsZJbgAGGCYdw@mail.gmail.com>
	<CAP9ODKqpnGVrBNh9PekyZJJBzRnjs9mfELM3afHTmT=0UDEegw@mail.gmail.com>
	<CALbNGRSnxG0ZmFH2sAFL0B3uEy3mi97t30fSnn2JCSyFLr9Pdg@mail.gmail.com>
	<CAP9ODKp1-e6oiv6oKUJ5aTPjYMBJL9YtF+16Gt=cooC+4LEdYw@mail.gmail.com>
	<CALbNGRQPU2ToHpwcD6GA+TOz4zS2sJV8dXgbZsufn=9Pg-Pn3Q@mail.gmail.com>
Date: Mon, 18 May 2015 10:12:54 -0300
X-Google-Sender-Auth: 9a02twTALnt7QR3Dj6fFS0SfRts
Message-ID: <CAP9ODKo3MhRR_2OW4Xgg6GMkdV-ykD3AvrRRQU9n0pF1xqh4rQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: "meta-freescale@yoctoproject.org" <meta-freescale@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: trouble related to oe-core update
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 May 2015 13:12:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2015 at 10:08 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Mon, May 18, 2015 at 2:50 PM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
...
> overestimate please. Still what about angstrom + imx6qsabresd?

No clue. I personally don't use Angstrom and I don't know what the
distro does. You can instrument the class code to see if you find
something useful and I can assist in how to address the issue. I just
don't have enough time to debug this myself.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


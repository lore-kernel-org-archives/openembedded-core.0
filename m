Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders.darander@gmail.com>) id 1QZ6OX-0003QS-DZ
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 21:13:53 +0200
Received: by fxm19 with SMTP id 19so182815fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 12:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=/IDBJT/31Ml8zKwrBZ7CDGZGpvrNMHtAtQFtDfx1oog=;
	b=hDP8Jv+ktenORjXSveD4gi6YCM2UhE3SVgZ8XFBjWm7i6iwHUO2Gr9oqxd6SG5n+BI
	LBJzdcHy5pOZPQxB3cjooXNSFgY3tyNBuEfBXQXSEG4lo8DcmoUaeQHVxLSHaQ3b3IZA
	GQ59xTe4j6uPh5qKZHqpCjhGluLbNOYn7MZao=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=fisdwfoS6EI0dxZp4oy5sQ/b45S4JVtCV+4y1Jx8UW+HXH6laTIOvUx78FG7qXFV4A
	6oOOd7CLfZJ9L7CosEC4NzRYAYLzmz2Z40qO4I36IxI9eNN/GBHO1ln7wkZ86mqdbjTx
	iL0JpT/D2cwVtoshTJ1Nvq964gZ8+hPG41ToQ=
MIME-Version: 1.0
Received: by 10.223.17.140 with SMTP id s12mr459516faa.49.1308683420152; Tue,
	21 Jun 2011 12:10:20 -0700 (PDT)
Received: by 10.223.114.1 with HTTP; Tue, 21 Jun 2011 12:10:20 -0700 (PDT)
In-Reply-To: <1308681938.3083.11.camel@lenovo.internal.reciva.com>
References: <cover.1308680000.git.anders@chargestorm.se>
	<4e9efffb9118e29178d087577c0cebb360872ebe.1308680000.git.anders@chargestorm.se>
	<1308681938.3083.11.camel@lenovo.internal.reciva.com>
Date: Tue, 21 Jun 2011 21:10:20 +0200
Message-ID: <BANLkTinkNcN8RBcZapj5xF=q_p4O++trgg@mail.gmail.com>
From: Anders Darander <anders.darander@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 3/5] linux-kernel-base: add support for Linux 3.x
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
X-List-Received-Date: Tue, 21 Jun 2011 19:13:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 21, 2011 at 20:45, Phil Blundell <pb@pbcl.net> wrote:
> On Tue, 2011-06-21 at 20:18 +0200, Anders Darander wrote:
>> Return 2.X as major version for kernels 2.X, and return
>> X for kernels X.Y (X>=3D3).
>
> I'm not quite sure I understand what this particular logic is useful
> for. =A0If we're removing 2.4 support (which I'm fairly relaxed about)
> then it seems as though this whole "kernel_majorversion" thing can and
> should just go away.

If we should remove the kernel_majorversion, we'll have to double check tha=
t
this isn't used somewhere else. If it isn't, I'm all in favor of removing i=
t.

> Or, alternatively, perhaps it should be mapped into a more abstract kind
> of "kernel epoch" thing which treats 2.6 and 3.0 as basically the same.

If we keep the kernel_majorversion, we'll need to have something
similar to this,
as the major version up to 2.6 was determined by X.Y. From 3.0, only the fi=
rst
digit represents the major number; while the second digit (0 in 3.0)
is equal to
x in 2.6.x. Thus, the function to determine the major version has to
return either
2.6 or 3.

Regards,
Anders



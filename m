Received: from mail-oa0-f49.google.com ([209.85.219.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1TvRiK-0007fu-FO
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 13:03:29 +0100
Received: by mail-oa0-f49.google.com with SMTP id l10so1302795oag.36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2013 03:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to
	:content-type; bh=ECS2WfcXHEKX19itKQ9MnUd5AHWuRNuqnKRDPkkJWVw=;
	b=oXxlAItOiCeTe9YeM5lvFYe9rmpmgfPBHteT4+s7nVioqwmZ3eB7ZzzTu1xcDyIuja
	Sx+uaWfFnl0qJzLE+VmKqQJJWsHniGNCRdcy7wHhpQYgenC8e49TB/J7NCEWKATeV4KR
	1VJr43I0py5u0sLtNC3dOr5SodMwjoiu+pzIdS5VB+ovLJ1tOKB78c4gGLSj6u8qRJwp
	hJMj7CNW42QvqCokxdvYx7mQKhiIA7HGEmM4oy6Kup+Fkq/Gs1Qebtd7aylyq1AsjfKr
	fRUUINKCHAqRJCztdBLTvB53BkclxlGVYXFi6pPJ3DqK2+XN7iT9YRjp5FnQJ7rJjU4/
	6EmQ==
MIME-Version: 1.0
X-Received: by 10.182.194.70 with SMTP id hu6mr617448obc.4.1358336886410; Wed,
	16 Jan 2013 03:48:06 -0800 (PST)
Received: by 10.182.95.203 with HTTP; Wed, 16 Jan 2013 03:48:06 -0800 (PST)
Date: Wed, 16 Jan 2013 12:48:06 +0100
Message-ID: <CAOHjBZt5tRt_dY-8wg8prxa9XA_0D-awqeYMXTkqiYQmOu7h0w@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: question about external-sourcery build
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
X-List-Received-Date: Wed, 16 Jan 2013 12:03:30 -0000
Content-Type: multipart/alternative; boundary=f46d04447ecf998e7e04d3667351

--f46d04447ecf998e7e04d3667351
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

just a question that could be silly but I'm not aware of.
I'm trying to use the external-sourcery toolchain but at build time I can
see there are warnings
about multiple packages (in my case eglibc) that provide virtual/libc and
others.
This can be obvious given that also eglibc provides those flavours, but I'm
wondering how this can be
avoided (maybe using PREFERRED* in .conf?).

Please can you help me?
Cheers,
Giuseppe

--f46d04447ecf998e7e04d3667351
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hi All,</div><div>=A0</div><div>just a question that could be silly bu=
t I&#39;m not aware of.</div><div>I&#39;m trying to use the=A0external-sour=
cery toolchain but at build time I can see there are warnings</div><div>abo=
ut multiple packages (in my case eglibc) that provide virtual/libc and othe=
rs.</div>
<div>This can be obvious given that also eglibc provides those flavours, bu=
t I&#39;m wondering how this can be</div><div>avoided (maybe using PREFERRE=
D* in .conf?).</div><div>=A0</div><div>Please can you help me?</div><div>
Cheers,</div><div>Giuseppe</div><div>=A0</div><div>=A0</div>

--f46d04447ecf998e7e04d3667351--

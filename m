Received: from mail-pa0-f42.google.com ([209.85.220.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1TsyVM-0006jD-Kt
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 17:28:03 +0100
Received: by mail-pa0-f42.google.com with SMTP id rl6so1126003pac.15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2013 08:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=l0EJX8nRdcNuBJnnh3QRcO+ePMk5dORp2kolg18NXmk=;
	b=ImgCZfo5xSiEicG7J0kmGluJC/eAdSxHVDTplGmnoEdQt8VwGIwQARyTs2pF8GnRNF
	rvCF2GCa+JsD7jtiG4jANmAv/013ZqSVJTc6+SrZd9s2H34jsXEfZZqTjttl9T8YEZGs
	Io/N9UDqEjNPffditveKL5q985oGlOCPOekAaNmorx5iCAA5KXmS5aVmedRMeB55SedC
	BNcxdAWQ/6SfRXGUUcbjuhlNIVT4QOUtsKT4p6ZyRBsJN4pGCM5OMcJQXO0eBHLn8FG7
	VCtkaQGPTFEZXsjgotmsJ052OnDYcYGrsQUw2a5QbwX2ke4vPolKgX8Hf2XYHXFZyoKG
	YwbQ==
MIME-Version: 1.0
Received: by 10.66.88.99 with SMTP id bf3mr191000975pab.62.1357747959622; Wed,
	09 Jan 2013 08:12:39 -0800 (PST)
Received: by 10.68.230.196 with HTTP; Wed, 9 Jan 2013 08:12:39 -0800 (PST)
Date: Wed, 9 Jan 2013 17:12:39 +0100
Message-ID: <CACW_hTbcpzGuQw3HfNc1bL+a7L6oGcJWfhE5=YKyXR6fwQeVfg@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: split mtd-utils
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
X-List-Received-Date: Wed, 09 Jan 2013 16:28:06 -0000
Content-Type: multipart/alternative; boundary=f46d042f9798d3ed9404d2dd5429

--f46d042f9798d3ed9404d2dd5429
Content-Type: text/plain; charset=ISO-8859-1

Dear all,

As I am involved in embedded systems where flash is somewhat sparse I'm
always eager to save a few bytes where possible.

Today I noticed that mtd-utils (1.5.0 from danny) generates for my
architecture (powerpc) roughly 780k of binaries in usr/sbin. 423k of it is
due to ubifs related files.

Would it be desired to put this in a separate package?
e.g. mtd-utils-ubi and mtd-utils-nonubi with mtd-utils itself being empty
but rdepend on those two?
that way mtd-utils will still give all packages but those only wanting the
non ubi stuff can limit themselves to that.

If desired I can give this a stab.

Best regards, Frans.

--f46d042f9798d3ed9404d2dd5429
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div>Dear all,<br><br></div>As I am in=
volved in embedded systems where flash is somewhat sparse I&#39;m always ea=
ger to save a few bytes where possible.<br><br></div>Today I noticed that m=
td-utils (1.5.0 from danny) generates for my architecture (powerpc) roughly=
 780k of binaries in usr/sbin. 423k of it is due to ubifs related files.<br=
>
<br></div>Would it be desired to put this in a separate package?<br></div>e=
.g. mtd-utils-ubi and mtd-utils-nonubi with mtd-utils itself being empty bu=
t rdepend on those two?<br>that way mtd-utils will still give all packages =
but those only wanting the non ubi stuff can limit themselves to that.<br>
<br></div><div>If desired I can give this a stab.<br></div><div><br></div>B=
est regards, Frans.<br></div>

--f46d042f9798d3ed9404d2dd5429--

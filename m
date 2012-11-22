Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TbVqr-0003ZI-3m
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Nov 2012 13:25:53 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so3968850pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2012 04:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=MGoq1fu5DbCZPp6iENlsrC10j6B5x2OZiqe2VLmAEbM=;
	b=Y5Efn3tjVXN1NJNufieFEfTsnt4XuUL+huzJYrwOCwt7+NfUcjL4jUh94hhq42GCfK
	7aCF3DIScqkI2BVSEEz84IafDXE9r4Cj4N0WJiskhm5UyIqNmc8j+Ilame/V0zRBYlLh
	R9Ov2OHeRuV19f3Et26Ri/uH4AIe8H0SViy0a3ROovXC34Z1tPfSqMxokuD5ZzWr/tJx
	CFDSMW8c4C+dn3Ss6Zh+/ajijEH3FEzkatHv7xJ0fM2WiHaYPUfRjPNDwJAA1VxmLQTX
	bvAQfsm7pJzE+BsRPJvG718r3/QC/SGmkDcHWJW5Eo8HPRkBek53n0tnJMweMD4qg2u+
	d57g==
MIME-Version: 1.0
Received: by 10.68.132.196 with SMTP id ow4mr4444494pbb.49.1353586306038; Thu,
	22 Nov 2012 04:11:46 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Thu, 22 Nov 2012 04:11:45 -0800 (PST)
In-Reply-To: <20121122120442.GB11155@sestofb10.enea.se>
References: <1353511391-60570-1-git-send-email-bjst@enea.com>
	<20121122120442.GB11155@sestofb10.enea.se>
Date: Thu, 22 Nov 2012 10:11:45 -0200
X-Google-Sender-Auth: wwPBzXFEFnFNJY47IRQD7XtQz9Q
Message-ID: <CAP9ODKrMYinP351hyVNbkW9jZqVj7UNy1GkokXtG-V0rsqAZ4g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?ISO-8859-1?Q?Bj=F6rn_Stenberg?= <bjst@enea.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] RFC: ptest for danny
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
X-List-Received-Date: Thu, 22 Nov 2012 12:25:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 22, 2012 at 10:04 AM, Bj=F6rn Stenberg <bjst@enea.com> wrote:
> I have a few specific issues I would like help and/or feedback on:
>
> - The -ptest .ipk packages get installed with "Status: install user unpac=
ked" rather than "install user installed", causing them to be processed by =
postinst. What do I have to do to take them from "unpacked" to "installed"?

Your package postinst needs to be able to be run offline.

> - I have to add a lot of paths to the FILES-dbg to avoid QA warnings. It =
feels a bit kludgy, is there a cleaner way to handle this?

You might want to cook a python snip to automate it.

> - What should we do with packages that don't have an upstream test suite?=
 My first thought was to just ignore them, but one could also argue that a =
"SKIP: no package test" message would be more informative than no message a=
t all, since it separate the package from yet-to-be-processed ones. Opinion=
s?

I agree an informative message would be good to have; maybe it could
be print only when have a verbose or debug option?

> - We have modified our buildbot to parse and collect the ptest output. Wh=
ere would be a suitable place to discuss these modifications?

No clue here heheh

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br



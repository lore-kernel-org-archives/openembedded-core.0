Received: from mail-ob0-f177.google.com ([209.85.214.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UCA4g-0001Oo-SB
	for openembedded-core@lists.openembedded.org;
	Sun, 03 Mar 2013 15:39:41 +0100
Received: by mail-ob0-f177.google.com with SMTP id eh20so1402484obb.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Mar 2013 06:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:date:x-google-sender-auth:message-id
	:subject:from:to:content-type;
	bh=F5nEchtL+6GuuYduxkUnoiyoEShoEMU218l7Dht3LkE=;
	b=zFi/RjxhdxKKCnRBsWT2NvQSZtJ7dUnWQqwsOs9KhHEX6CxSsgwQmtsPQYT/lneaaw
	VgmZMuGfIAMzm7viIFpwDqmXbYDxLpQgRwmXXOplfOMEZMDpDOhp3p5XYCLR3yAEyExG
	2kyEGJUcXV2Za6pAFkVBmsjsuUMeAvJUPAesQDEytvU0D4GQE/0a8ZR+B88pJ0Z1LXJz
	ITxbRHAQUSjVGM7IgzQptHz5saiGSIuUqbhZydt87gYNVYPQhhfAgS7fMTTw0FTwFPpZ
	Nx4rrziVj5UXF32qNW68FOZOkwDbA3jp9T1Cax5AcjPF862PEjUJ8Ss5qdNfT3Df2Cvi
	g+dQ==
MIME-Version: 1.0
X-Received: by 10.182.231.39 with SMTP id td7mr13549566obc.86.1362320591783;
	Sun, 03 Mar 2013 06:23:11 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Sun, 3 Mar 2013 06:23:11 -0800 (PST)
Date: Sun, 3 Mar 2013 11:23:11 -0300
X-Google-Sender-Auth: oZvtm0kzaQNaPFeY7wZg-h0OeT0
Message-ID: <CAP9ODKqNAfLQ8ZTW5i8gHsmMGxz17y1K8tAEHm8u+XOU5ZQMng@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [for-danny] Proposed changes for backporting
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
X-List-Received-Date: Sun, 03 Mar 2013 14:39:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Eric,

A new set of changes for evaluation for backport (in order):

* 3b214e2 samba: Split libnss-winbind package

* 1b6add9 mg: add recipe for version 20110905

* e8874ce evince: disable help build

Thanks in advance,

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br



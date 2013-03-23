Received: from mail-ob0-f171.google.com ([209.85.214.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UJWxE-0004r7-Ue
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Mar 2013 23:30:28 +0100
Received: by mail-ob0-f171.google.com with SMTP id x4so4960445obh.30
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Mar 2013 15:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=agB5ana5pg8mns+ElYzewme7QPvpFW3GOSsuwXEcrkA=;
	b=yhZrxvapU93ltG0Dnw5HwnhMB/EZm3yvxFQtU9eb9a28u43ILSfaac9huUWu2FD1kq
	v2/dJMmUvgatlpMVZ0GC1E7EJmJ4yCbZ8HSGoqaQlBmLykOUjmdi4HlGffJDBmTwFH6j
	SABVZFCFlsnZjb8PSRcihb35+tNx05DClVRPjIqSZqnEj5vgxB6LCHLo0II7D6+nw4UC
	OuGA0bbDK14Nzw7IV5aRFEMQ8HpgFeFOuS30IMLMGU0Y/ecejS2bieQY1ikV8eExYHJ5
	PC9BL4bcJFK5MA1K3d2a50hSU/DCOUZZAReV2kobTTHJzpn14O6QEQRyStCAe/hAMxUZ
	ZMTg==
MIME-Version: 1.0
X-Received: by 10.60.8.197 with SMTP id t5mr6474282oea.4.1364076808221; Sat,
	23 Mar 2013 15:13:28 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Sat, 23 Mar 2013 15:13:28 -0700 (PDT)
In-Reply-To: <CAMKF1spFFareQ_KOAgvmfi8qKf9Gp2kiBUuZE67siyz2u2RVyw@mail.gmail.com>
References: <1364070660-13157-1-git-send-email-otavio@ossystems.com.br>
	<1364070660-13157-2-git-send-email-otavio@ossystems.com.br>
	<CAMKF1spFFareQ_KOAgvmfi8qKf9Gp2kiBUuZE67siyz2u2RVyw@mail.gmail.com>
Date: Sat, 23 Mar 2013 19:13:28 -0300
X-Google-Sender-Auth: QCJJy88ixp14tNQyISiHQSqmgTc
Message-ID: <CAP9ODKpWnD8AOb9N-4HSaWEj3970NxJxVy30gauZwge62r4-2g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] linux-firmware: Do not deploy license files in packages
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
X-List-Received-Date: Sat, 23 Mar 2013 22:30:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Mar 23, 2013 at 6:23 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Should they be packaged elsewhere

It may come in the package license but this not at my control and I
think it is being done already. Not in binaries for rootfs.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br



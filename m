Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RBBzR-0005LP-4N
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Oct 2011 22:53:25 +0200
Received: by bke11 with SMTP id 11so1156244bke.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Oct 2011 13:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Td4PUbw4tIEG7WKNMMpp1PySJ45gkdlym0mLmVt6cC8=;
	b=wizVsjmgdYzC1Zv1bEEc7VlRvY6H2LlBJHQwajhalLIt6Z8vr3EwyG5twEtBTtHwJ9
	sFm+gD/ppDrvsYMs09ghc9k5K3DqPcUqs23fM0uPoMzgvzNwC7cnbWb9MQX29gB92apJ
	M8st1AR7nysNuP4nIVFnV+VYiQjrwU0bTXmnk=
MIME-Version: 1.0
Received: by 10.204.128.203 with SMTP id l11mr1071341bks.270.1317761270819;
	Tue, 04 Oct 2011 13:47:50 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.35.198 with HTTP; Tue, 4 Oct 2011 13:47:50 -0700 (PDT)
In-Reply-To: <CAP9ODKqPytjP_RCU_DQMewMp2TV9p86qVk8YT=eBC_jwNPaWYw@mail.gmail.com>
References: <CAP9ODKqPytjP_RCU_DQMewMp2TV9p86qVk8YT=eBC_jwNPaWYw@mail.gmail.com>
Date: Tue, 4 Oct 2011 17:47:50 -0300
X-Google-Sender-Auth: OmhxgpDm-Ab7QBXxv2g7FjavVLM
Message-ID: <CAP9ODKqJh54j2akHEaPUfKn2LSojK6p3D0gv-A=aS3pOOqgG0A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Nitin A Kamble <nitin.a.kamble@intel.com>
Subject: Re: gdb-cross-canadian fails to build
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
X-List-Received-Date: Tue, 04 Oct 2011 20:53:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 4, 2011 at 17:40, Otavio Salvador <otavio@ossystems.com.br> wro=
te:
...
> Log data follows:
> | NOTE: Applying patch 'no-werror.patch'
> (openembedded-core/meta/recipes-devtools/gdb/gdb/no-werror.patch)
...
> /home/otavio/hacking/ossystems/embedded-linux/openembedded-core/meta/reci=
pes-devtools/gdb/gdb-cross-canadian_7.3.1.bb:
...

It seems to have been broken by: 9002f664383d71682767546524e1299137b6fe4f

Nitin, can you take a look?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br



Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 88244607B3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 11:11:56 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	uAMBBsnT015189
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 12:11:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1479813114;
	bh=nY5XzycO52DXiBJmeknJH85iY/X3KipB8XJtNt3oydg=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Sender;
	b=JG2UqOsXVLP3VnptBQ/Qh6R+YOtlwIrjIk2/bIhgKxLDnzhwva0+apuudwufDzdnH
	nLSKV93HRQlOV8Uskl528RrDP9IUUp6gEsVW5ivShobq1ZxtwxyTgY/mIYRvrQFJIJ
	pGl7xz8J03UWzAwK86l0gqzUGj6YoNnE/KX7WPe4=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	uAMBBl46017259 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Tue, 22 Nov 2016 12:11:47 +0100
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 4CE08BCC02B;
	Tue, 22 Nov 2016 12:11:46 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	uAMBBkad017256
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 22 Nov 2016 12:11:46 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.86_2) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1c98zJ-0007j3-TJ; Tue, 22 Nov 2016 12:11:45 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Christopher Larson <clarson@kergoth.com>
References: <1479296396-724-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<CABcZANmqH9gEhO67-9_0fEinU6FhMxRsgaC0hcVrkxd9_cH1HA@mail.gmail.com>
Date: Tue, 22 Nov 2016 12:11:45 +0100
In-Reply-To: <CABcZANmqH9gEhO67-9_0fEinU6FhMxRsgaC0hcVrkxd9_cH1HA@mail.gmail.com>
	(Christopher Larson's message of "Mon, 21 Nov 2016 20:22:32 -0700")
Message-ID: <ly4m2zojke.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Spam-Score: -2.8
X-Spam-Level: --
X-Spam-Tests: AWL,BAYES_00,DKIM_ADSP_ALL,RP_MATCHES_RCVD,SPF_NEUTRAL
X-Scanned-By: MIMEDefang 2.78
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sanity: removed broken compiler check
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
X-List-Received-Date: Tue, 22 Nov 2016 11:11:59 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Christopher Larson <clarson@kergoth.com> writes:

>> |    Please install the following missing utilities: C Compiler (ccache =
gcc ),C++ Compiler (ccache g++ )
>>
>> Remove this check for now.
>> [...]
>> +++ b/meta/classes/sanity.bbclass
>> [...]
>> -    if not check_app_exists('${BUILD_CC}', d):
>> -        missing =3D missing + "C Compiler (%s)," % d.getVar("BUILD_CC",=
 True)
>> -
>> -    if not check_app_exists('${BUILD_CXX}', d):
>> -        missing =3D missing + "C++ Compiler (%s)," % d.getVar("BUILD_CX=
X", True)
>> -
>>
>
> Is there a reason check_app_exists() wasn=E2=80=99t fixed to handle symli=
nks
> instead?

This will not help. 'check_app_exist()' checks for the existence of a
file (e.g. like 'test -x "${BUILD_CC}"' with iterating $PATH).  But
'ccache gcc' is not a single file but a chain of files.

A more reliable method would be to call the program with '--version' or
so and check the exit code.

But gcc and g++ are elementary tools which are existing very likely on
every developers machine and which will not introduce silent and difficulty
to detect breakage.  So I removed the check for now instead to implement
the method above.


Enrico


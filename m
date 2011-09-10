Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R2KUN-00020Y-VP
	for openembedded-core@lists.openembedded.org;
	Sat, 10 Sep 2011 12:08:44 +0200
Received: by bke11 with SMTP id 11so1024390bke.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Sep 2011 03:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=cWqTfKBznI7DDT7G0wWkP7ZenKzsvC4B13m5CYntwYs=;
	b=D27bXcAFYchU9XFQlD4WnWhow7LkjUWqnSNctovt59tvH70QWL6rnj0dIBz2lyLe13
	gofBtSD2Gb+qZEOm93yK5q37gbPGGtRDIBF3DAvEg3gg4GcG0UQ0B54B8CItY/Rz68U/
	wgfj8YowqMCTbo1ulZK4iK8O/uvBRXMH2uwcg=
MIME-Version: 1.0
Received: by 10.204.146.155 with SMTP id h27mr1789106bkv.353.1315649018461;
	Sat, 10 Sep 2011 03:03:38 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.65.194 with HTTP; Sat, 10 Sep 2011 03:03:38 -0700 (PDT)
In-Reply-To: <4E6B3502.6020702@eukrea.com>
References: <1315646701-28916-1-git-send-email-eric@eukrea.com>
	<CAP9ODKoUZfRLHDv7p=wJAczZ_nh-7LeETabwzM8X_Hp_EyqN7g@mail.gmail.com>
	<4E6B3502.6020702@eukrea.com>
Date: Sat, 10 Sep 2011 07:03:38 -0300
X-Google-Sender-Auth: YMhzHFQLKoxstZ8T3aIFDcpvh5Q
Message-ID: <CAP9ODKoAZqdGAFJnyjdLKVCFUd5+wjndcWBPnH=DCrF7S19HRg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qt4: fix generated sdk
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
X-List-Received-Date: Sat, 10 Sep 2011 10:08:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 10, 2011 at 06:59, Eric B=E9nard <eric@eukrea.com> wrote:
> Hi Otavio,
>
> Le 10/09/2011 11:56, Otavio Salvador a =E9crit :
...
>> In this case we most probably can drop the qt.conf file from the SDK
>> directory, don't we?
>>
> no qt.conf gets installed in the sdk.

But as qmake is generated for the sdk it has the proper patches and
thus qmake -query will report the right paths AFAIK making qt.conf a
duplication of this information. Am I missing something?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br



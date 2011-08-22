Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QvZhP-0006Rw-KX
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Aug 2011 20:58:15 +0200
Received: by bkbzu17 with SMTP id zu17so4186148bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2011 11:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=19cO6UPgAgwkOGEy8WejxJ1bOVyzjKE+Xkc1FVrLOGk=;
	b=MOvrDp/h0f0Ygpa0h5iU764wfzZsxPh1BGDtHqlDqR8y4BbhDRTgS2SJ6W2Ktansh/
	uVh0xcwUjepeshR0yXVt9QnA+QDEQE5oZ9KRHwFyprKXCPDd4uc1Vq6nWSVc5xZ6Aafb
	NXIv7dDSm8VXltBtO0E00KLpy3tGB9XJebzpg=
MIME-Version: 1.0
Received: by 10.204.133.12 with SMTP id d12mr1045344bkt.227.1314039209859;
	Mon, 22 Aug 2011 11:53:29 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.15.66 with HTTP; Mon, 22 Aug 2011 11:53:29 -0700 (PDT)
In-Reply-To: <4E529FFE.9030402@linux.intel.com>
References: <cover.1313816148.git.otavio@ossystems.com.br>
	<7dc65a7b7090c2504783307152ec3ab6e5376e53.1313816148.git.otavio@ossystems.com.br>
	<4E529FFE.9030402@linux.intel.com>
Date: Mon, 22 Aug 2011 15:53:29 -0300
X-Google-Sender-Auth: 6almEHuYq895KSoiosqIsD2sHfM
Message-ID: <CAP9ODKoXOFhN-otsPTz4F0+vNpCCV-FhrGSLpApky3ZVgxyW-A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/8] kernel.bbclass: blacklist perf-dbg
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
X-List-Received-Date: Mon, 22 Aug 2011 18:58:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 22, 2011 at 15:29, Saul Wold <sgw@linux.intel.com> wrote:
> A possible better question is why perf-dbg is getting generated and what'=
s
> in it?

I am sorry but I don't know the answer for it.

> BTW, as noted elsewhere, it would be good to add additional comments as t=
o
> why you are doing some of the changes.

Reducing the delta between meta-oe and oe-core classes; that's why I
did this change.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br



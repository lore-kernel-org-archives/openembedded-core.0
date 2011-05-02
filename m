Received: from mail-bw0-f51.google.com ([209.85.214.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QH1ca-0000NN-D9
	for openembedded-core@lists.openembedded.org;
	Tue, 03 May 2011 00:29:40 +0200
Received: by bwz10 with SMTP id 10so4972921bwz.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 May 2011 15:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ClmyzkXbXBMqbBsoeVE2zu3Y9naQ61lbVNEIzvbTdj4=;
	b=DbZ0djNaqPShzU8NKxea4O3zZlbF2y58Be2snsXnwd2+9YKPHD76SopSySShRSjv5i
	OITUm4O9HbZkGkQBQVkm86iy6gQL13hU/iDoH1iQhPEtB8VTtTR7GPM5u6uyH9Hyzyux
	7m+A8hkQY7+FuHZTfjjJK+ODUrVAtbZCteBiI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=EH+5+SZYqqJ8WKQy3jOzHdNz7P+LqyjtChh1D3986IJD43kd5kLUTfJ5qUBfY8VqhT
	epoVA4BpcZcT0SdOrmO/x34rdDAdoiMn+x+2p66zXhYG2jJgbY14zQHvu5B/JQjUDd5j
	rLcxDOjF1C3bJv93andwGsamp0/efujpRBZQk=
MIME-Version: 1.0
Received: by 10.204.154.219 with SMTP id p27mr123bkw.110.1304375178546; Mon,
	02 May 2011 15:26:18 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.70.138 with HTTP; Mon, 2 May 2011 15:26:18 -0700 (PDT)
In-Reply-To: <BANLkTi=13pPhOA5EP3+GpfWsoSqsrRpniw@mail.gmail.com>
References: <1304363356-27535-1-git-send-email-otavio@ossystems.com.br>
	<1304363356-27535-4-git-send-email-otavio@ossystems.com.br>
	<BANLkTi=13pPhOA5EP3+GpfWsoSqsrRpniw@mail.gmail.com>
Date: Mon, 2 May 2011 19:26:18 -0300
X-Google-Sender-Auth: h_L92Y36lzwVhMCWpG312lQwP0M
Message-ID: <BANLkTinZYJ1TEJ9NuwU_OdHPWFHqpS5_7g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] busybox: add support to mdev
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
X-List-Received-Date: Mon, 02 May 2011 22:29:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, May 2, 2011 at 19:21, Khem Raj <raj.khem@gmail.com> wrote:
> Did you test this patch on a config where mdev support is disabled ?
> that will be interesting to know

Yes I did. It seems to work fine for me. Do you see any problem with that?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br



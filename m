Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RDLno-00018T-BF
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Oct 2011 21:46:20 +0200
Received: by bke11 with SMTP id 11so8918782bke.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 12:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=+cDhdXwrT0EnUnWajM7owXI+sQifdwJw5ifByYuRuoU=;
	b=wA9lLqWQf+wjLRccyeNL5pUIPAPhJKVi4CFlm91jaPGiBA4XrQZNwCZ4+p26zACHez
	9VP/SJv32Bp2xUAZKjk5n3EjVxUUz/sLc678g0X4SNyaYVboEG18S4rYhDQ6fRwlfN4K
	G1g3oDiYvxZ03W39pf9VE7RCcurRNPT9sZ4Ss=
MIME-Version: 1.0
Received: by 10.204.155.90 with SMTP id r26mr7234419bkw.7.1318275638452; Mon,
	10 Oct 2011 12:40:38 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.138.72 with HTTP; Mon, 10 Oct 2011 12:40:38 -0700 (PDT)
In-Reply-To: <678AE8F3-DBF3-4315-83A5-AA2CA040C5D8@dominion.thruhere.net>
References: <678AE8F3-DBF3-4315-83A5-AA2CA040C5D8@dominion.thruhere.net>
Date: Mon, 10 Oct 2011 16:40:38 -0300
X-Google-Sender-Auth: s3UQd-wJVNyIh5UpEoQKwszK5Js
Message-ID: <CAP9ODKq+9Bhu9A8jZhYH-uBVSWcncsNQvAxyNxLnG133J237iA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Multiple git repos in SRC_URI and/or git submodules support
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
X-List-Received-Date: Mon, 10 Oct 2011 19:46:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 10, 2011 at 15:19, Koen Kooi <koen@dominion.thruhere.net> wrote=
:
...
> I'm not going to do 1), 3) is unlikely, so I want to ask if 2) is already=
 supported. I've seen various patches that add an 'unpackdir' or similar, b=
ut I can't find any docs on it. Can someone enlighten me on the current sta=
tus of that?
...

Yes, this works. I have added support to SRCREV_FORMAT into gitpkgv too ;-)

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br



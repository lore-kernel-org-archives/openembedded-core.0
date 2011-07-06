Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QeIP0-0004oD-0I
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jul 2011 05:03:50 +0200
Received: by wwi18 with SMTP id 18so5507525wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jul 2011 20:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=UJhy2RejLDlaFF8I9Sl8FwipSeYz34XGqhjizYSU4vM=;
	b=HRXpG/mhLElUIvyHbbL0BXHjNBytvy6mkJOJdr4bwejM4it70U0hRB2YY53n6Bxiem
	VP6U2c5SQfACr1bxbbMDb+RV9ueN7qG08/TAcP2p/TRgtcbgpBUqdOj7QogBLoLbYu86
	BCq1ahdP/tLnBlJV//TxSeZBv1hLDYZOFieKY=
MIME-Version: 1.0
Received: by 10.216.229.200 with SMTP id h50mr6965993weq.13.1309921198471;
	Tue, 05 Jul 2011 19:59:58 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.216.25.129 with HTTP; Tue, 5 Jul 2011 19:59:58 -0700 (PDT)
In-Reply-To: <cover.1309906154.git.richard.purdie@linuxfoundation.org>
References: <cover.1309906154.git.richard.purdie@linuxfoundation.org>
Date: Tue, 5 Jul 2011 23:59:58 -0300
X-Google-Sender-Auth: Mjl4SXcrlANI0yv1NEvzZOykKk0
Message-ID: <CAP9ODKrdgM9re6WDXWOCCt+g2Jfm7YRewFw4GibTUJBFrOUmVA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/17] Various QA/unpackaged files cleanups
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
X-List-Received-Date: Wed, 06 Jul 2011 03:03:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 5, 2011 at 19:51, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> This patch series is for a number of QA/unpackaged files cleanups.

I noticed you have added .la files in some packages. This seems wrong
and useless. In fact I am making a local patchset to drop them all and
I have most build working (fixing last things before posting for
review).

It seems very wrong to depend on .la files for linking and pkg-config
seems to be the most right solution when possible.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br



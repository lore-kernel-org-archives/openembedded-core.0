Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QJUeA-0004Vp-Rp
	for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2011 19:53:30 +0200
Received: by wwb17 with SMTP id 17so4962254wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 May 2011 10:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=/QoA02QgWPUceXB8vE6O0Qcc2nigyxqrIIJdqrIIXQk=;
	b=ArhpXB64PksQBCoKxYs9IRbrXGwz4Z99DsjSEhmo6HfOZsSSv2zeRi6lxj9n9JMRJi
	HdSN02O+ZbLSg+Ubnpm63Pay/603HyK3lBGStQgHU+Wrv42AEik7nI5ojMcUHhkfSdfS
	qnLr7WJQqoJNZIqdNRZYIQx6P9QIgTr3shD+4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=WodAFg+HizvBo8W+SYBMa6/AZ1UkexHXcHK2rmTfcRc0+r7rAMMJMS5MZlKyhQwv87
	upY6zSY7wzn3OUASz4x0xdr0mVmWRvpHfi482Ff9oC1PGljFWUhSQ+t/88hp6LnuZTms
	sfrawVmYYsFdQGl1wQdla4C7G6I/em7krYXnQ=
MIME-Version: 1.0
Received: by 10.216.230.31 with SMTP id i31mr111609weq.7.1304963445735; Mon,
	09 May 2011 10:50:45 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.216.93.195 with HTTP; Mon, 9 May 2011 10:50:45 -0700 (PDT)
In-Reply-To: <4DC81A6B.3040708@linux.intel.com>
References: <BANLkTinK3Cqk=JxH-TH=xM395JUXN5rfTg@mail.gmail.com>
	<4DC81A6B.3040708@linux.intel.com>
Date: Mon, 9 May 2011 14:50:45 -0300
X-Google-Sender-Auth: DzYh5CXskeSlK4KFvrVy7Zpr_ck
Message-ID: <BANLkTimeLywHxLZsSu-0w1qHpt9-gSX9jg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: fuse update
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
X-List-Received-Date: Mon, 09 May 2011 17:53:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, May 9, 2011 at 13:46, Saul Wold <sgw@linux.intel.com> wrote:
> It would make sense for you to move it to meta-oe at this time, if we fin=
d
> more recipes require it our other layers are needed it, then we can consi=
der
> it for oe-core.

OK; I will queue a changeset removing it from OE-core. It makes no
sense to have it there being not used.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br



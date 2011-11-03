Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RLm3Z-0006fc-7n
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Nov 2011 02:25:25 +0100
Received: by bkbzv3 with SMTP id zv3so704480bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2011 18:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=70MNMgpjRqI8Idtd4sfm0eBQLj77zy9Z7alvYSqB2tw=;
	b=VpS8ARN0ELU7laIXuZs+h+93na0CiWStWpLe8TWrBwrX8CRW8FhSOLEw/O/XeOXgHi
	6SACcmQovJqFEjXcAyr0iBMziMt8VKmG+AFchuDe2ykIdRLMOmZZoF8eOo3VvS7TRtjk
	SLO2NW1KQCV5xLTIQoGZZm8nv9rtzXmTsh5Og=
MIME-Version: 1.0
Received: by 10.204.15.209 with SMTP id l17mr6055145bka.39.1320283157492; Wed,
	02 Nov 2011 18:19:17 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.48.208 with HTTP; Wed, 2 Nov 2011 18:19:17 -0700 (PDT)
In-Reply-To: <1320281261.1504.10.camel@localhost.localdomain>
References: <1319780499.10032.46.camel@localhost.localdomain>
	<CAGiJk9eo4FvhLZ6o9qdb75YyuZ5om19GYRLR6gDFEN_r0VWeuw@mail.gmail.com>
	<1319785517.10032.48.camel@localhost.localdomain>
	<CAAQYJAtJsSRSN5jLzK65iKUJPorc8h+RjqcnQBw2pyK34+ejjQ@mail.gmail.com>
	<4EAABF76.7080703@windriver.com>
	<1320021891.10032.56.camel@localhost.localdomain>
	<CAAQYJAt2ghQNxzw9EnpfChW0QrwepQLbSFcYD4AP+E32n4Wc5g@mail.gmail.com>
	<4EB196D0.5010005@windriver.com>
	<1320281261.1504.10.camel@localhost.localdomain>
Date: Wed, 2 Nov 2011 23:19:17 -0200
X-Google-Sender-Auth: zX3muoyYEq_MNY7xqpDjT9xSXsU
Message-ID: <CAP9ODKooneOYO_b8Teg=VhukHQW27acQePiO5abKX_RV3TupEw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: niqingliang@insigma.com.cn, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: how to set time zone
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
X-List-Received-Date: Thu, 03 Nov 2011 01:25:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 2, 2011 at 22:47, Ni Qingliang <niqingliang@insigma.com.cn> wro=
te:
> maybe we can do the link in system booting, use the variable "TZ" to
> create the symlink /etc/localtime, just like archlinux.
> e.g. providing one script in /etc/rcS.d/ to create the symlink.

This ought to be done by image IMO; so a kind of post rootfs
generation hook might be use allowing it to be set per-image.

I personally have this exactly use-case here at work.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br



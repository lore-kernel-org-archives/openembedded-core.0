Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QMhBK-0001dL-Vg
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 15:52:59 +0200
Received: by bwz5 with SMTP id 5so1623659bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 06:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=MXVGExrYngKx0rMq9cpcIo/8pfIRSrVa6SmWvk5qciw=;
	b=IgpuXQVspXJFgt1rtXsdrwVBuy2ukoP2zRwZH7Dj7aQ80aEkIk16O+A5p5ChJq0wcG
	8qR6mF7xRbAPI6+Eii554eYK8/9jlIdry+CnKnNBtMcWIFFaKFXVOvxP2n9LR2OwtlBl
	X7l1znk+hzgmGKJBXU+MGR86d7yj7FudsQs1c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=WzgDFzmdKmH8kmr8ATDdP583dZG3NWPr5TPEI/zoZlDI8tob+dSonREX64Vei/khbq
	rSK43489p67xYvJKxdznGY6Axn7uYwTIIcRviK9c1TdzqmVBabSN5RUUXAA8Nu5AWicN
	sOuTvmoSEikVWu9SdVzSOUJ7sDUpppmm+Eum8=
MIME-Version: 1.0
Received: by 10.204.138.205 with SMTP id b13mr2009369bku.27.1305726603677;
	Wed, 18 May 2011 06:50:03 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.79.70 with HTTP; Wed, 18 May 2011 06:50:03 -0700 (PDT)
In-Reply-To: <1305725413.3424.316.camel@rex>
References: <cover.1305702436.git.sgw@linux.intel.com>
	<1305725413.3424.316.camel@rex>
Date: Wed, 18 May 2011 10:50:03 -0300
X-Google-Sender-Auth: WR1Ljh-HUYua4TpreXOWx0JgjpI
Message-ID: <BANLkTimZ4JWUnxC54mHKWiqWozmaodxsGA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/15] 18-May-2011 Consolidated Pull
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
X-List-Received-Date: Wed, 18 May 2011 13:52:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, May 18, 2011 at 10:30, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2011-05-18 at 01:17 -0700, Saul Wold wrote:
>> This requests includes the removal of clutter, yaffs and older
>> gcc version, along with the GCC 4.6 Update for x86 and arm.
>>
>> There is the start of the meta-skeleton layer, which I believe
>> we want to be part of oe-core for solid examples to developers.
>>
>> As of this writing there is a problem with perl which I think a
>> change to the utils.bbclass might fix (adding readlink -fn $0), but
>> I am still testing this.
>
> I merged this with the exception of the change to gcc 4.6 by default.
> I'm a little hesitant to make that switch until a few more people have
> tried using it (e.g. I noticed Bruce was having problems yesterday).

His problems where fixed dropping sstate-cache.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br



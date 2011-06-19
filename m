Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QY5cn-0005aw-Vr
	for openembedded-core@lists.openembedded.org;
	Sun, 19 Jun 2011 02:12:26 +0200
Received: by bwz5 with SMTP id 5so727384bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jun 2011 17:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=e6LxSAMsaGysOjCy9WuEAaZQq2oX5ZlIP8AsINjPIbE=;
	b=c02G+DICP66JH4rP4gjlSmBL3pQWnPhDRdOe3UpKgOLfQIJxkUtxBsKPmhgji9NZyz
	A510G1OGAfA1rPWsPOfQfOhMpS6UUQIH5QbgGoHoz2z3dsYRKLGc8mLSIqHyPQ541DhI
	3WD0Kw1wXCZevtcO57ZR/Y9BLIZt6OBjCPDVw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=F5yQ7S1Ll5jeiBkeX6NhnLztDQyiHpyV3xCb4Qp4PxJpltsKAXvco+Yz4Ta3S8h4pD
	wfoSgr54qqStPiGYGK34x3Y0YHtE92KBXFiQbPJvQA3rhSE4Tul57n0PQJ/nZQenYe0+
	qJl+/aFOYwhtxXKWGw6Mac99i2W63x/a+59jY=
MIME-Version: 1.0
Received: by 10.204.38.136 with SMTP id b8mr1596927bke.146.1308442135420; Sat,
	18 Jun 2011 17:08:55 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.120.74 with HTTP; Sat, 18 Jun 2011 17:08:55 -0700 (PDT)
In-Reply-To: <4DFD379B.8010701@mentor.com>
References: <BANLkTin20ZXvBnT9phab1KZcZ1iCkO8RaQ@mail.gmail.com>
	<4DFD379B.8010701@mentor.com>
Date: Sun, 19 Jun 2011 00:08:55 +0000
X-Google-Sender-Auth: RxS0WAoFwWkQyRVoyV_5-wWJcjU
Message-ID: <BANLkTimkH5e4ViO7aNP9typLSBvBKrSNxw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: BUG: intltool depends on libxml-parser-perl to be installed on host
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
X-List-Received-Date: Sun, 19 Jun 2011 00:12:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 18, 2011 at 23:41, Tom Rini <tom_rini@mentor.com> wrote:
> On 06/18/2011 01:18 PM, Otavio Salvador wrote:
>> Hello,
>>
>> It seems that intltool depends on libxml-parser-perl being installed
>> into host system to it to build.
>
> Do the DEPENDS look right? =A0Maybe this needs the class for bringing in
> perl-native...

It seems to do so.

Are you able to reproduce it?

It would be a matter of uninstall the libxml-parser-perl from your
host, use cleansstate in intltool and try

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br



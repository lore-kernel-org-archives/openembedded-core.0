Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QRsFR-0008Mj-7c
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 22:42:37 +0200
Received: by bwz5 with SMTP id 5so464733bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jun 2011 13:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=i6dX7g6wmTh8JQnQhay/GLbOT8QdWjZlWfSbc66OX4I=;
	b=NwxP6sMXPugr6l/gMSx91FDih9YL2zCLcRTfBhkUHtOJ8CTJyn7VkKBaqFIqOV4G60
	JfQxb4r+rb9702CDGR43J1y/CA/FwGALbwWUDbTVo+UkHECp1auykuWRUddYW8Jx0Al3
	zYbq4Tz2B+R5ib57h7HdZSAcPfLM1+7oQVQOo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=iAuGA8Nv9TNEayfi6E2LuDGOV6v+bh0uJ56jd0qW/hk6sVBLgxkY7M23A9CcGAR16R
	g55+IrOoeiWWuw6NQd/ZT48u+dLs136sXf9yeiiEmOFrWx6rX43rnwKMZplndeZM7FvK
	DAjH9b9dPcwzoiGbLE8cdcp0zHAr+B4T98sAA=
MIME-Version: 1.0
Received: by 10.204.7.211 with SMTP id e19mr66498bke.139.1306960763523; Wed,
	01 Jun 2011 13:39:23 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.78.203 with HTTP; Wed, 1 Jun 2011 13:39:23 -0700 (PDT)
In-Reply-To: <1306960406.3119.6.camel@lenovo.internal.reciva.com>
References: <cover.1306958862.git.otavio@ossystems.com.br>
	<ddcfd950f58f85e00b0ea094534f27ccf1315152.1306958862.git.otavio@ossystems.com.br>
	<1306960406.3119.6.camel@lenovo.internal.reciva.com>
Date: Wed, 1 Jun 2011 20:39:23 +0000
X-Google-Sender-Auth: iE-lGia5mXf6LmlhtRjuNcFO4IU
Message-ID: <BANLkTinyA0PAq3bQRTi2zCrWKKOVypytqg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] gnutls: link against 'dl' library
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
X-List-Received-Date: Wed, 01 Jun 2011 20:42:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 1, 2011 at 20:33, Phil Blundell <pb@pbcl.net> wrote:
> On Wed, 2011-06-01 at 20:09 +0000, Otavio Salvador wrote:
>> +export LDFLAGS +=3D "-ldl"
>
> The configure script ought to be figuring this out for itself. =A0Do you
> know why that isn't working?

No I don't.

Are you able to reproduce it?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br



Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QOUx4-0000Pg-BA
	for openembedded-core@lists.openembedded.org;
	Mon, 23 May 2011 15:13:42 +0200
Received: by bwz5 with SMTP id 5so5314490bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2011 06:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=q1nBLkal7doSozXOKalozi1dNKtaWxC5kyTUm4cyyxs=;
	b=IKKh7DCPlQFhPksWsn1bJ/Mwdzsh3hgmp0AjADYUQQaWw0JAQLODBC6kOUHtKjotaY
	r3Kw3OjURh1+H7nnVbcDAdjeo9m1k1jPhJWoIxGpGPvm0im5454X+hx0V2yM+ciVuGFp
	2tr+dz/Q4FQZ3KmrIncvWqD9LqCEoNNobWL2c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=Qja5XEhNW9n9gJ271HR4BQcitrfA7M9P+h/oSNG1ATkO+8pZuYaG7pXumeuxMqB2Bh
	MJwPq/dn7VMBL03OJZN+U/tyAI1fj6q6n0gLZvEYnDv6hReRs+W+x/frAviQqyI/wzCG
	NEIIiGKJjbQCXV0zZZ6M40N269I0Gkm76cyqg=
MIME-Version: 1.0
Received: by 10.205.81.193 with SMTP id zz1mr2158415bkb.3.1306156241924; Mon,
	23 May 2011 06:10:41 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.78.203 with HTTP; Mon, 23 May 2011 06:10:41 -0700 (PDT)
In-Reply-To: <1306156002.2525.79.camel@phil-desktop>
References: <cover.1306152724.git.otavio@ossystems.com.br>
	<596fd53943dd383f89abb767d7a3b624e6b20b92.1306152724.git.otavio@ossystems.com.br>
	<1306156002.2525.79.camel@phil-desktop>
Date: Mon, 23 May 2011 13:10:41 +0000
X-Google-Sender-Auth: 7xL8LFK8w6CWCjiBpckb7i8si20
Message-ID: <BANLkTim7rTzXxBtqdaC_Lw24T+hRsDrudA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] busybox: enable mdev by default
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
X-List-Received-Date: Mon, 23 May 2011 13:13:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, May 23, 2011 at 13:06, Phil Blundell <pb@pbcl.net> wrote:
> On Mon, 2011-05-23 at 12:13 +0000, Otavio Salvador wrote:
>> =A0CONFIG_LOSETUP=3Dy
>> =A0# CONFIG_LSPCI is not set
>> =A0# CONFIG_LSUSB is not set
>> -# CONFIG_MDEV is not set
>> +CONFIG_MDEV=3Dy
>> =A0# CONFIG_FEATURE_MDEV_CONF is not set
>> =A0# CONFIG_FEATURE_MDEV_RENAME is not set
>> =A0# CONFIG_FEATURE_MDEV_RENAME_REGEXP is not set
>
> This sort of thing, as we've seen previously in classic oe, doesn't
> really scale very well since everyone's requirements for busybox are
> subtly different. =A0Others will doubtless disagree but, personally, I
> think it would be best for you to just maintain a busybox.conf in your
> own distro layer which sets it up the way that you want.

Yes.

>> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/b=
usybox/busybox.inc
>> index 341c5c4..de711d2 100644
>> --- a/meta/recipes-core/busybox/busybox.inc
>> +++ b/meta/recipes-core/busybox/busybox.inc
>> @@ -29,7 +29,6 @@ INITSCRIPT_PARAMS_${PN}-mdev =3D "start 06 S ."
>> =A0INITSCRIPT_NAME_${PN}-udhcpd =3D "busybox-udhcpd"
>> =A0INITSCRIPT_NAME_${PN}-udhcpc =3D "busybox-udhcpc"
>> =A0CONFFILES_${PN}-syslog =3D "${sysconfdir}/syslog.conf.${PN}"
>> -CONFFILES_${PN}-mdev =3D "${sysconfdir}/mdev.conf"
>
> Agreed, it seems silly to declare the file as a CONFFILE if we aren't
> shipping it in the first place.

The idea is to not require it to be declared and do the right thing by defa=
ult.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br



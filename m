Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QRsGv-0008Ox-L9
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 22:44:09 +0200
Received: by bwz5 with SMTP id 5so466198bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jun 2011 13:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=uItxBxUeOD+DAt+N4npqj5nJzvTILV+ltnn3fN22JKU=;
	b=Z/FxsRqPDQqERRjcOV0wIEtnL05O78QIWRGpkzMNI1yrBIA9C5NPUDKg4g81kbC+gC
	3Prq0fd1eCtNiNUnUybm/wbYW9441nOL1NfQFeSKyTcwDhGpPa41b/bBlN1nxELkKctr
	yzmGVp4F2BRX4DkE4/BX2eRNfCjogEBewerS4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=LRk+AK3/wFrJk1bdDXdsW8yDqZpkZwtWcNSecpIpcdxLVkT3VYsKZjhLK8VOiXfd+N
	3LpWRzwSAw39laWd1T0rU94JcKZx331DqZRBiL9HlglTNEEB1uAWzjZN/uBGCoS00rCT
	Wzv0FJFi4irJdIlx0O5151wNm9pjUjGm00V3k=
MIME-Version: 1.0
Received: by 10.204.37.76 with SMTP id w12mr6390773bkd.112.1306960858940; Wed,
	01 Jun 2011 13:40:58 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.78.203 with HTTP; Wed, 1 Jun 2011 13:40:58 -0700 (PDT)
In-Reply-To: <1306960665.3119.11.camel@lenovo.internal.reciva.com>
References: <cover.1306958862.git.otavio@ossystems.com.br>
	<e96c2e88aaf1cd22faac3b7ae61ccf34adfe92ba.1306958862.git.otavio@ossystems.com.br>
	<1306960665.3119.11.camel@lenovo.internal.reciva.com>
Date: Wed, 1 Jun 2011 20:40:58 +0000
X-Google-Sender-Auth: V8ppHNBXroLrbFKxBJcKaWlKN0U
Message-ID: <BANLkTi=q-bMwYtjTAqAXeaB4QQ_n85y8Rw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] busybox: enable mdev by default
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
X-List-Received-Date: Wed, 01 Jun 2011 20:44:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 1, 2011 at 20:37, Phil Blundell <pb@pbcl.net> wrote:
> On Wed, 2011-06-01 at 20:09 +0000, Otavio Salvador wrote:
>> -# CONFIG_MDEV is not set
>> +CONFIG_MDEV=3Dy
>
> Per previous discussion, I am still uneasy about this change. =A0I think
> we really need some sort of coherent policy for what exactly the default
> busybox configuration in oe-core is meant to be doing, and then (if
> necessary) a set of patches to make it match the policy. =A0Just flipping
> random features on and off does not seem like a good way to proceed.

OE-core has support to mdev as device handling mechanism as such this
ought to be enabled by default IMO.

Personally it doesn't matter since I have already overriden it in my
internal layer.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br



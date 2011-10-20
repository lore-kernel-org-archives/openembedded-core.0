Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RGwKr-0007Ct-Jh
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 19:23:18 +0200
Received: by bkat8 with SMTP id t8so4002054bka.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 10:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=lVS+/c2f08DIaJmcxT6o1IbEjb5VSCXKbQv//FgalCM=;
	b=T/riPceRiQ7ia1QHnEZEVO/dCswrs68kinzKJnCaZkIswo/gkLAx9hRMit+r1k2oLg
	tEJguffynQo7qfMe8vSQY8dQflnhQEYi02NBUZ1qiTDEmRBWPoJAnqDBLUJaB18fikEi
	gQwsJkev1CnDJZKfKfZRFDXXZNVGQIhJCzXRI=
MIME-Version: 1.0
Received: by 10.204.7.138 with SMTP id d10mr8624678bkd.31.1319131041635; Thu,
	20 Oct 2011 10:17:21 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.205.114.204 with HTTP; Thu, 20 Oct 2011 10:17:21 -0700 (PDT)
In-Reply-To: <4EA0485F.3080307@windriver.com>
References: <CAP9ODKp+c9sXx6A7Bw9VnRXOKgNP_3q2uJmJEpvBwWT=dgXdBQ@mail.gmail.com>
	<4EA0485F.3080307@windriver.com>
Date: Thu, 20 Oct 2011 15:17:21 -0200
X-Google-Sender-Auth: oIrKDrsTBRTCw-gVWzWsyI83zuw
Message-ID: <CAP9ODKr1gZnmV_gdgJ4_5mPYpZf+SkCZ2-SD4aWr8nFGf6zC_Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: useradd class not working
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
X-List-Received-Date: Thu, 20 Oct 2011 17:23:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2011 at 14:12, Mark Hatle <mark.hatle@windriver.com> wrote:
...
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta-skeleton/recipes=
-skeleton/useradd/useradd-example.bb
>
> That is the recipe that was used when testing this feature. =A0If it no l=
onger
> works properly then something has recently broken in the groupadd functio=
nality.

Yes and I used it and openssh as base to my package but it seem to do nothi=
ng.

I tried to debug it and changed rootfs_ipk class to use "sh -x" when
running the preinst scripts of the packages and all seems fine however
it keeps not adding the group into rootfs/etc/group

I do appreciate help here since I am lost right now.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br



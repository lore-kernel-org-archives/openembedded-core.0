Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R3twg-00083N-L7
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 20:12:27 +0200
Received: by bke11 with SMTP id 11so1720387bke.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2011 11:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=/OTJP5M+5ea0jIbSWmMd44uiMg+vevYOT3aykEG/RDI=;
	b=OoJNx71mptkpC9TE4QA2NnSZfAWoNn6IzGrO/nHmdFNSzXSUZp0jqo7xYitqOoV9Kl
	iiSeuUdrmJk1zHHHB/A+S7Dugkg3CRLIu/wclwpD50DZzT8CpNFGYcUCpWu59AsgPW58
	dxb5m67Yvvt40tNUa2kX4Hd7ygJVmJm8tYFrY=
MIME-Version: 1.0
Received: by 10.204.139.71 with SMTP id d7mr96357bku.41.1316023635745; Wed, 14
	Sep 2011 11:07:15 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.65.194 with HTTP; Wed, 14 Sep 2011 11:07:15 -0700 (PDT)
In-Reply-To: <1316023313.26879.2569.camel@elmorro>
References: <1316023313.26879.2569.camel@elmorro>
Date: Wed, 14 Sep 2011 15:07:15 -0300
X-Google-Sender-Auth: YPExR8pdJwip6qNcjCyqfW0K1Hg
Message-ID: <CAP9ODKpQFPVWQQh2qwdjV-SAKRMXwc7qsZ9WZRY+YCeqLBv97Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Tom Zanussi <tom.zanussi@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] grub2: new recipe
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
X-List-Received-Date: Wed, 14 Sep 2011 18:12:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 14, 2011 at 15:01, Tom Zanussi <tom.zanussi@intel.com> wrote:
> +++ b/meta/recipes-bsp/grub/grub-1.99/grub-install.in.patch
> @@ -0,0 +1,15 @@
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Index: grub-1.99/util/grub-install.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

I am sorry by be boring but this doesn't explain *why* the patch is
need. I see you change grep to not use -x option but why this is
required?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br



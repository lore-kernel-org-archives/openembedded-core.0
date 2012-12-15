Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TjuN3-0007T3-Ox
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Dec 2012 17:13:51 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so2721176pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Dec 2012 07:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=ri4vMGmCq15HWNDVV3us7rRuf/ydogRDfRWSxJv6/NQ=;
	b=kXDNZfK0Chk+1JqF/Z1ZSpJj/Rw2PM87u4RrYUo0FwqP3mym5NZU5vlxOGJjGL9SCW
	bO+mcpFgLPVLqHRKQ5xgQv1RrXwojcxMUwZpdSsfr+l1DtqmekR3Lh5jorBaFv2Nj3RO
	P/EM2GSh35D5/4pfF+5BbZf1LVEwz4ok2kvuQqc0GrLob5gr0TLbQetZ4Zl3rUSJ0Aly
	h+bQLGuJrQ69e+l29oSsllPOITeKjCKBXXrok2ML2kL3P0/fvnT56lW2eEPmuXB28n40
	EAjT2loPKEM00bvRB8i4XgBWyI/QqBeI7hDz3TG3bDqgz6yyZAtDcQY3l0J+U3amDmsW
	phMA==
MIME-Version: 1.0
Received: by 10.68.189.8 with SMTP id ge8mr26679362pbc.24.1355587151063; Sat,
	15 Dec 2012 07:59:11 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.51.193 with HTTP; Sat, 15 Dec 2012 07:59:11 -0800 (PST)
In-Reply-To: <20121215003045.3891e66a@eb-e6520>
References: <20121215003045.3891e66a@eb-e6520>
Date: Sat, 15 Dec 2012 13:59:11 -0200
X-Google-Sender-Auth: UWShT999iS9h6kFlS0uTYjOjihY
Message-ID: <CAP9ODKocUdSZOc_B9m9iLT-WPTHP94e2ckzUZOyosXgetnvy5w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Acceptance criteria of barebox bootloader in OE-Core
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 15 Dec 2012 16:13:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 14, 2012 at 9:30 PM, Eric B=E9nard <eric@eukrea.com> wrote:
> Hi,
>
> I have some recipes building barebox bootloader http://barebox.org/
> which I'm using in custom BSP and in meta-fsl-arm :
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-fsl-arm/tree/recipes-bsp/b=
arebox
>
> This recipe needs a little bit of polish but before doing that I wanted
> to know if it could be integrated in oe-core like is actually u-boot ?
> http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-bsp/u-bo=
ot
>
> If yes, I'll provide a patch with a working barebox for at least
> qemuarm.
>
> This would allow BSP to share at least the barebox.inc of oe-core/Yocto.

I support the addition of barebox as this is a nice and popular
bootloader; I see no problem in supporting one more alternative and
this reduces the duplication and overlapping work.



--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br



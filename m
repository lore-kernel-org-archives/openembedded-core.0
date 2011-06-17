Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QXcne-0004NW-TE
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Jun 2011 19:25:42 +0200
Received: by bwz5 with SMTP id 5so39403bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2011 10:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=FF9VNfTCdnEBCDkmwkY1OG6Z0p41baGHjal9nV9ahm8=;
	b=U4ODqNuzmb0NeHXh7aeFg6qHttw35U8x3KPIbHbXlr9r/YrcWB6OyssEmlpmgLVWFg
	1eVcpdai+S3OCm/+0rYMuRnoH4IihoNSgnYK4vpPqcjVIsqGHrJraEml4Q3tkY4QF5+I
	ThYpvUVpH9ewSSAuO6C46qIL7IVcqtKysdziU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=jorZHdCh6URjpZEz6M/xdi/g0G1pWBHQH/U6BlhfEFeKl7THkhZ/rZiJzZUnsbFDVM
	fsvyzE6+oNqeKIaVwvWced/ddROsa4Sj1XjftcH88pfc6LPe4d+F/P4fXzv+sfUtdw2W
	xLxkviw5TQqh/u7m131mmOarKyqZE0/8MU0iY=
MIME-Version: 1.0
Received: by 10.204.65.19 with SMTP id g19mr1860915bki.49.1308331332545; Fri,
	17 Jun 2011 10:22:12 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.116.82 with HTTP; Fri, 17 Jun 2011 10:22:12 -0700 (PDT)
In-Reply-To: <4DFB8CAE.8030100@intel.com>
References: <cover.1308249837.git.scott.a.garman@intel.com>
	<3a0dd72238fb6dbdbfc9ff1f0230f310fde0fff9.1308249837.git.scott.a.garman@intel.com>
	<4DFA97A1.9090909@gmail.com> <4DFB820B.9070303@intel.com>
	<BANLkTi=_Moowev-2U0tmYiuNwAt2BD9WXA@mail.gmail.com>
	<4DFB8CAE.8030100@intel.com>
Date: Fri, 17 Jun 2011 17:22:12 +0000
X-Google-Sender-Auth: 2tuhbCZ0OozgvVzrv8uVYpabci4
Message-ID: <BANLkTin19xUSV4Rg7u16e3C_s9xkKieasQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] base-passwd: disable problematic login.defs options
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
X-List-Received-Date: Fri, 17 Jun 2011 17:25:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 17, 2011 at 17:19, Scott Garman <scott.a.garman@intel.com> wrot=
e:
> Sorry, I forgot to mention that shadow-utils-native is what is used to
> modify the passwd/group files in the target sysroot. It seems that having=
 a
> -native recipe install files into a target sysroot would be worse than
> including an optional file with base-passwd that may or may not be used i=
n
> target systems.

Why not make an shadow-target package with this?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br



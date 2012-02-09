Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RvNnn-0005GI-NN
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Feb 2012 07:48:19 +0100
Received: by lahc1 with SMTP id c1so1244521lah.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Feb 2012 22:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=558owKoVIzztccU9gIXZw2UkS4QXDfcvtXpo9nWsQW4=;
	b=dQ245IXQVdRw60JDwYOPk/2HNJCX6fGY+AhpyN5xhivewNdsGPlDcwAg7HGKbSNmLO
	2/rAeNxg0iiB2WRHznYNcnJO20tN9UwJ2scMeY63zOkmXo1eDN8wQbmSL95Y2wYe/jsh
	5rVnxAd1sW5i6so7UzWJcAIBS7ZXDfgDoZ6IM=
Received: by 10.152.114.169 with SMTP id jh9mr329087lab.20.1328769615332; Wed,
	08 Feb 2012 22:40:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Wed, 8 Feb 2012 22:39:45 -0800 (PST)
In-Reply-To: <857BE142E5399E46B20FD45B9DB8A7BC0FCE533D@SHSMSX102.ccr.corp.intel.com>
References: <857BE142E5399E46B20FD45B9DB8A7BC0FCE533D@SHSMSX102.ccr.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Feb 2012 22:39:45 -0800
Message-ID: <CAMKF1sommodVJEu-Df55wf0rsduaNmSjb82VZN_GVf_q1JpQgA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: do_patch signature confliction for gcc family recipes
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
X-List-Received-Date: Thu, 09 Feb 2012 06:48:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 8, 2012 at 10:22 PM, Lu, Lianhao <lianhao.lu@intel.com> wrote:
> I'm wondering if it is a correct way to fix this issue by excluding the P=
N from do_patch dependency:
> diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devt=
ools/gc
> index e89a7c0..57668f9 100644
> --- a/meta/recipes-devtools/gcc/gcc-common.inc
> +++ b/meta/recipes-devtools/gcc/gcc-common.inc
> @@ -109,3 +109,4 @@ do_headerfix[vardepvalue] =3D "PATH"
> =C2=A0# We need to ensure that for the shared work directory, the do_patc=
h singatures
> =C2=A0# The real WORKDIR location isn't a dependency for the shared workd=
ir.
> =C2=A0src_patches[vardepsexclude] =3D "WORKDIR"
> +should_apply[vardepsexclude] =3D "PN"

I think its ok. gcc  does not use SRCREV at all and not SRCREV_PN so
excluding it is ok



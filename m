Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Px1dX-0007mq-8L
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Mar 2011 19:27:59 +0100
Received: by fxm8 with SMTP id 8so5421412fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Mar 2011 10:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=d3/SDrdQYgm9ojoY8CsTBspjUkUhCJV2wYiUFPy1320=;
	b=ngvBsgogVwnbjHtkqD1x13359ZJktlmFkGVkP5dOWAaobc0xKBlOnzDIJST9C6cptu
	ghYdutdjIl7Tt8F+BtcwR8NASbJdOFkk/YLr4xoQz0H5VFJe4OC0gcmb3DR3W2HupzkK
	lTDhb9mmhC+ETbZpLEZK08L7teNFm7iP94KUY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=aAVtJYKhul//yh/q8flJq2MeEhWVIzt+rJuLenwzymIr6vI2PpAO5fkOd9gmwjxnBd
	ytPsm9y38BH1Miey2ru/Nh10L92Jvg1AnO5ydRcbk3BApeLARgb6skeZLaII6wlnQz+K
	WcfyR6BZmCAiha7BrEMB7zdh4anS9uHQI4Ro4=
Received: by 10.223.143.86 with SMTP id t22mr945063fau.74.1299608785105; Tue,
	08 Mar 2011 10:26:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Tue, 8 Mar 2011 10:25:55 -0800 (PST)
In-Reply-To: <21f294d9600a369fff5eafb0c7358694d9ff0221.1299544029.git.sgw@linux.intel.com>
References: <cover.1299544029.git.sgw@linux.intel.com>
	<21f294d9600a369fff5eafb0c7358694d9ff0221.1299544029.git.sgw@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Mar 2011 10:25:55 -0800
Message-ID: <AANLkTims9zAC2Vpi1QDZNb0GoCercnGi-wb+1fSqfPMd@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>, Liping Ke <liping.ke@intel.com>,
	Dongxiao Xu <dongxiao.xu@intel.com>,
	Jingdong Lu <jingdong.lu@windriver.com>, poky@yoctoproject.org
Subject: Re: [PATCH 2/8] attr: Added ncurses to depends
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
X-List-Received-Date: Tue, 08 Mar 2011 18:27:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 7, 2011 at 4:29 PM, Saul Wold <sgw@linux.intel.com> wrote:
> From: Saul Wold <sgw@linux.intel.com>
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> =C2=A0meta/recipes-support/attr/attr.inc | =C2=A0 =C2=A02 ++
> =C2=A01 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-support/attr/attr.inc b/meta/recipes-support/at=
tr/attr.inc
> index e9467d7..c110340 100644
> --- a/meta/recipes-support/attr/attr.inc
> +++ b/meta/recipes-support/attr/attr.inc
> @@ -2,6 +2,8 @@ DESCRIPTION =3D "utilities for manipulating filesystem ex=
tended attributes"
> =C2=A0HOMEPAGE =3D "http://savannah.nongnu.org/projects/attr/"
> =C2=A0SECTION =3D "libs"
>
> +DEPENDS =3D "ncurses"
> +

why does it need ncurses dependency ?


> =C2=A0LICENSE =3D "LGPLv2.1+ & GPLv2+"
> =C2=A0LICENSE_${PN} =3D "GPLv2+"
> =C2=A0LICENSE_lib${PN} =3D "LGPLv2.1+"
> --
> 1.7.1.1
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



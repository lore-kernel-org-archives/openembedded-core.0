Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QHR2Z-0003of-HI
	for openembedded-core@lists.openembedded.org;
	Wed, 04 May 2011 03:38:12 +0200
Received: by pvc30 with SMTP id 30so305149pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 May 2011 18:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:references:in-reply-to:mime-version
	:content-transfer-encoding:content-type:message-id:cc:x-mailer:from
	:subject:date:to;
	bh=DI6Axwib336i3/pY3WJ0rVwcADVkjIyPCChloLIx87w=;
	b=h7U3tthpKmFZFMcqi5CjlxyjwS1N6cJO+7oh8q+1St5mC3vOZGPQD5RA+GetKsuWLL
	VJYHB3HxQHIbSJq3vfCVNaKepB42vd4GcCifGMgVWPbUtbzNSnrDbwsNc9P9fwDgiDt4
	hUZ0rAVS+ofjc1xEHBTTR9hjKGJxSFkxsMqmk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to;
	b=f8W7Gra0auUQwVW82Ks58LbzzICnRk5Gsone/tzlpgR1+JUpwfwWCRB+O6a1OL2V5S
	ASu3KwykUwx5ApDslWP/zBRscGFodFcjheiXK7FbLB7OQLkZRZmPnzCsoKcaIL9NBjb6
	Bl8uTsp4zMHp1pHuXwaITfKgDQOvVITVKgsC0=
Received: by 10.68.56.104 with SMTP id z8mr765367pbp.81.1304472484255;
	Tue, 03 May 2011 18:28:04 -0700 (PDT)
Received: from [192.168.1.81] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id t6sm389899pbc.21.2011.05.03.18.28.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 03 May 2011 18:28:02 -0700 (PDT)
References: <cover.1304465724.git.sgw@linux.intel.com>
	<e573adeeb0272294c005c4ae5c03346dd9c938d3.1304465724.git.sgw@linux.intel.com>
In-Reply-To: <e573adeeb0272294c005c4ae5c03346dd9c938d3.1304465724.git.sgw@linux.intel.com>
Mime-Version: 1.0 (iPad Mail 8H7)
Message-Id: <82674A6C-C8D1-4E5F-85CA-C4F4CF3EA4CD@gmail.com>
X-Mailer: iPad Mail (8H7)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 May 2011 18:28:00 -0700
To: Saul Wold <sgw@linux.intel.com>
Cc: Xiaofeng Yan <xiaofeng.yan@windriver.com>, Ilya Yanok <yanok@emcraft.com>,
	Darren Hart <dvhart@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Kang Kai <kai.kang@windriver.com>, Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 32/33] perl: fix Configure-multilib.patch
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
X-List-Received-Date: Wed, 04 May 2011 01:38:12 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



On May 3, 2011, at 4:45 PM, Saul Wold <sgw@linux.intel.com> wrote:

> From: Saul Wold <sgw@linux.intel.com>
>=20
> Thanks to Gary Thomas for his input on fixing this for Ubuntu 11.04

Looks good=20


>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> .../perl/perl-5.12.3/Configure-multilib.patch      |    2 +-
> 1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/perl/perl-5.12.3/Configure-multilib.pat=
ch b/meta/recipes-devtools/perl/perl-5.12.3/Configure-multilib.patch
> index ef2be3d..9625b0b 100644
> --- a/meta/recipes-devtools/perl/perl-5.12.3/Configure-multilib.patch
> +++ b/meta/recipes-devtools/perl/perl-5.12.3/Configure-multilib.patch
> @@ -11,7 +11,7 @@ Index: perl-5.12.3/Configure
> -glibpth=3D"/lib /usr/lib $xlibpth"
> +glibpth=3D"/lib /usr/lib /lib64 /usr/lib64 $xlibpth"
>  glibpth=3D"$glibpth /usr/ccs/lib /usr/ucblib /usr/local/lib"
> -+test -f /usr/lib/`uname -m`-linux-gnu/libc.so && glibpth=3D"/usr/lib/`un=
ame -m`-linux-gnu $glibpth"
> ++test -f /usr/lib/*-linux-gnu/libc.so && glibpth=3D"/usr/lib/*-linux-gnu $=
glibpth"
>  test -f /usr/shlib/libc.so && glibpth=3D"/usr/shlib $glibpth"
>  test -f /shlib/libc.so     && glibpth=3D"/shlib $glibpth"
>  test -d /usr/lib64         && glibpth=3D"$glibpth /lib64 /usr/lib64 /usr/=
local/lib64"
> --=20
> 1.7.4.1
>=20



Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T5BF8-0003wg-1T
	for openembedded-core@lists.openembedded.org;
	Sat, 25 Aug 2012 09:57:18 +0200
Received: by eekb57 with SMTP id b57so772197eek.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Aug 2012 00:45:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=yO4+PWhrAL0duXh+NBAgqZIqMS4yYkYttoxRWnd/QO4=;
	b=fA3fXOZnsLiv8GZnEnvezlkDakWMqGh1r32P8aVSmfoRK4P8AJFmzMPz9RURU3ZiWp
	PXJJf+rhaPkdmAfIVHxIh//BxA0umHO0fo3laDMjA60QwpWwuX2BurHApCVYtD3iuE8s
	PAxknHGGJGwo29zKeESu/XZN78827wti4qieFoZ8xJufMY9hI3jw4OqmdbLJPZsrGCmS
	UDtZ7bWq/FL9HbVDZca340fhvKrBGormYo2TgJkVOYenBsaxLB/KwCD6GU6z+5msNdSn
	9lW8Vx1mxH9N0HLrZRK+kHuzoINkVwVBPQWAxjtjVPfkfaWiD6iCACV64+qEDxyUwiCD
	xsVA==
Received: by 10.14.209.129 with SMTP id s1mr10485404eeo.24.1345880709414;
	Sat, 25 Aug 2012 00:45:09 -0700 (PDT)
Received: from ?IPv6:2001:610:612::f924:b6f0:b355:18e1?
	([2001:610:612:0:f924:b6f0:b355:18e1])
	by mx.google.com with ESMTPS id a7sm35599448eep.14.2012.08.25.00.45.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 25 Aug 2012 00:45:08 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <65d8351bbcb9fb6012c296222795f3c938dc5624.1345867875.git.tom.zanussi@intel.com>
Date: Sat, 25 Aug 2012 09:45:07 +0200
Message-Id: <3BDCB1BC-7393-4B42-BE04-3BE9A8C90123@dominion.thruhere.net>
References: <cover.1345867875.git.tom.zanussi@intel.com>
	<65d8351bbcb9fb6012c296222795f3c938dc5624.1345867875.git.tom.zanussi@intel.com>
To: tom.zanussi@intel.com
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQkoJaf52gqfiJTlx2rS8m/uRQ7C+Ox5ic5vqAmS8oP6ODIzYXBK7DgrMlqE5H5+2KDtoUGC
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] ia32-base.inc: new include file
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
X-List-Received-Date: Sat, 25 Aug 2012 07:57:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 25 aug. 2012, om 06:34 heeft tom.zanussi@intel.com het volgende =
geschreven:

> From: Tom Zanussi <tom.zanussi@intel.com>
>=20
> This is the ia32-base.inc moved over from meta-intel.  See meta-intel
> for the complete history of contributions to this file.
>=20
> Here's the initial commit text that explains the purpose of this file:
>=20
>  The meta-intel BSPs currently have a number of machine settings =
common
>  to all - factor these out into a common include file.
>=20
>  Also add several new intel-specific XSERVER variables for building
>  XSERVER variables in BSPs.
>=20
> Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
> ---
> meta/conf/machine/include/ia32-base.inc | 58 =
+++++++++++++++++++++++++++++++++
>=20
> +# glibc-related variables
> +#
> +GLIBC_ADDONS ?=3D "nptl"

That's a distro setting=



Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SPqqP-0002tJ-Va
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 09:52:58 +0200
Received: by wibhm17 with SMTP id hm17so83788wib.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 May 2012 00:43:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=tK1UJaCBQJwpexIR51F419UlGWX/HCbo6rH2V293XqM=;
	b=O896nMC1u1HWIlSq4zSxgFUsPdniyRcRWR9fxvsMLs8zTYquxB28v455SNRgE/nmlF
	si3B39Nzwl0Pu59gG3gQYFeHNkvsdto0YpYGp70NtWeL67JQ7wS4fLn22vL3zIgtlYbZ
	SZ5NEtTBHxdar+t6/SMT2oOI8nk/ErmjkDcXyZabnLfiOscLiQ3CFHlLZhDUpwBBJOXp
	lwhOLe9sKPq/7selWOfk5N95zyOexmXndiDsNeaPF6y3WZfISAjn3R0RnSEiNek6ebvc
	kUV3VWNYgJsE5Dlu1cd/jFIH1240cF7YnxoezBcPYvFYFaAnWLgHKnppLu+nAkDDv8vx
	DmhQ==
Received: by 10.216.143.74 with SMTP id k52mr770064wej.50.1336030992460;
	Thu, 03 May 2012 00:43:12 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ff2sm883380wib.9.2012.05.03.00.43.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 May 2012 00:43:11 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAMKF1soELbeTS=ZnH3bhUbJkcaUz_sdkhRcykntqc=2jNBcUrg@mail.gmail.com>
Date: Thu, 3 May 2012 09:43:11 +0200
Message-Id: <9295EE6F-5FFA-4FB4-B266-D8F45AAB2351@dominion.thruhere.net>
References: <1335968616-2436-1-git-send-email-jason.wessel@windriver.com>
	<CAMKF1soELbeTS=ZnH3bhUbJkcaUz_sdkhRcykntqc=2jNBcUrg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnjJBYGP63XwWPpaFEecMn5KhfDBFN57nyjE4hJAqhoy4Y+QjXaJ6lqnzjdARwbpfRLOq5G
Subject: Re: [PATCH] qemu-native: depend on unfs-server-native
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
X-List-Received-Date: Thu, 03 May 2012 07:52:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 mei 2012, om 09:32 heeft Khem Raj het volgende geschreven:

> On Wed, May 2, 2012 at 7:23 AM, Jason Wessel =
<jason.wessel@windriver.com> wrote:
>> The user mode NFS server does not get built by default when you are
>> using a purely command line driven development environment without =
SDK
>> tools.  In order to accommodate simple test configurations and have
>> all the tools built for the minimal validation with qemu-native,
>> simply add the dependency to unfs-server-native.
>>=20
>> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
>> ---
>>  meta/conf/machine/include/qemu.inc |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>=20
>> diff --git a/meta/conf/machine/include/qemu.inc =
b/meta/conf/machine/include/qemu.inc
>> index 421a149..742b629 100644
>> --- a/meta/conf/machine/include/qemu.inc
>> +++ b/meta/conf/machine/include/qemu.inc
>> @@ -14,4 +14,4 @@ RDEPENDS_kernel-base =3D ""
>>  # Use a common kernel recipe for all QEMU machines
>>  PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
>>=20
>> -EXTRA_IMAGEDEPENDS +=3D "qemu-native qemu-helper-native"
>> +EXTRA_IMAGEDEPENDS +=3D "qemu-native qemu-helper-native =
unfs-server-native"
>> --
>=20
> how about replacing  EXTRA_IMAGEDEPENDS with
> MACHINE_ESSENTIAL_EXTRA_RDEPENDS here ?

RDEPENDS end up in the image, IMAGEDEPENDS are needed to build the =
image. Do I need qemu-native, helper-native and unfs to build the image? =
No I don't. Would I need it if I decide to run the runqemu scripts, yes. =
Do these extra dependencies cause pain? Yes, since it requires =
installing tons of extra things on a headless buildserver (mesa, sdl) to =
just build an image.

If I wanted to be an ass I would suggest moving qemu-native, =
qemu-helper-native and unfs-server-native to the HOB, but I won't do =
that.

So I'll stick with my original suggestion: move those dependencies to =
the images you want to run on nfs for qemu, don't pollute the global =
EXTRA_IMAGEDEPENDS with it.=



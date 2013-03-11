Received: from mail-pb0-f41.google.com ([209.85.160.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UFBnX-0003kN-R9
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 00:06:29 +0100
Received: by mail-pb0-f41.google.com with SMTP id um15so4294165pbc.14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 15:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=iAUfQKxUbsrOaCFRzRpc8kdjWY/iNw73VnjPXvEnGyA=;
	b=D7rGC2mHPbonRxA4FRGVcMO2J9jZwvsvRZ9ZSw/A8IIOnajbeB7Meik5bsp8/rWgNR
	yOqiBAbNAkDMzzekSWH+M0CCYcVfyOI/PF5X6psE8+IF5Nw4TnJDAgyTaR7Twsw9BPWC
	kZbxmK20bZvlSlEldeJ8QhJWk3g576TwdaBy0vD1ZtKz0i5rZ3fdE+1K42k5fJOTmQ4W
	olYMfiLEHP+kQe0swUjh/DZCwmt30tjjm/PtMxe/HJAA8O7N4XorX9OPogPHkmBRH+eP
	bqDrCzMtITlqNERSwgmsaGDB8231e1ppNqueSGxLtPyCNBu3o+Jmcorzchk9zzfZYSL8
	BOsQ==
X-Received: by 10.68.75.109 with SMTP id b13mr24666250pbw.25.1363042183025;
	Mon, 11 Mar 2013 15:49:43 -0700 (PDT)
Received: from [172.23.7.5] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id ab1sm22170361pbd.37.2013.03.11.15.49.41
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Mar 2013 15:49:42 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAP9ODKr_3VVmw5vGm8EnnmOKEu8z2uzp97iBjh7315DduPegoQ@mail.gmail.com>
Date: Mon, 11 Mar 2013 15:49:39 -0700
Message-Id: <ACE79805-5D74-40F1-8443-1410AC215E88@gmail.com>
References: <cover.1363031776.git.ross.burton@intel.com>
	<CAJTo0LY7vOy4_A3YJ2-jGMfLr32o7XKY-BGp9xuiB_wnVhb6Ag@mail.gmail.com>
	<CAP9ODKr_3VVmw5vGm8EnnmOKEu8z2uzp97iBjh7315DduPegoQ@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Mailer: Apple Mail (2.1499)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 0/9] hybrid systemd/sysvinit
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
X-List-Received-Date: Mon, 11 Mar 2013 23:06:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Mar 11, 2013, at 2:47 PM, Otavio Salvador <otavio@ossystems.com.br> =
wrote:

> On Mon, Mar 11, 2013 at 6:37 PM, Burton, Ross <ross.burton@intel.com> =
wrote:
>> On 11 March 2013 13:07, Ross Burton <ross.burton@intel.com> wrote:
>>> This series allows you to have both sysvinit and systemd in =
DISTRO_FEATURES.
>>> Packages will be built with both init scripts, and some daemons will =
be linking
>>> to libsystemd-daemon so that will be pulled in to sysvinit images.
>>=20
>> Regarding the upgrade path, Richard/Paul/myself discussed this over
>> lunch and proposed that oe-core could gain an include file for distro
>> configuration that basically injects the backward compatibility
>> dependencies.  So for meta-systemd, it would inject
>> replaces/provides/conflicts for each of the packages in meta-systemd.
>> This would isolate the dependencies into a single location, and be
>> opt-in for distros that previously shipped meta-systemd.  Hopefully
>> the implementation of this is obvious, and patches to implement this
>> are welcome.
>=20
> I personally prefer to still use meta-oe systemd class and keep the
> possibility to product images with choosen init system. I think Martin
> will also prefer it.

using different init manager is a separate problem than what Ross tried =
to address here isn't it ?
I personally don't have a use case where I would upgrade live from 1.3 =
to 1.4 so
for me I could easily accept a different solution for 1.4

>=20
> --=20
> Otavio Salvador                             O.S. Systems
> E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
> Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




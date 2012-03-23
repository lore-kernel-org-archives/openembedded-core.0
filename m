Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SB8KV-0000v1-8f
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 18:31:11 +0100
Received: by wibhj13 with SMTP id hj13so2035071wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 10:22:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=mpwdpTM3JKOZmHsxSsrJXCjVLWdrknVbUCaLM0CmAzE=;
	b=Qc3V2YFUVmRZUKvtW/PJrvI86SpwOnRsC97y29rPMz2eHfjYwjoNbjTwj6DAuvB6HR
	4Xm5Ugj+RRwXWh5rt/xDYdu4m7hbQUeVHgrkplID/Jj8U9sopNPFQlMr8oVCwJ3tFJ+d
	4273r+lx1dcn+wXkgStwgG5RsG1SxX+Xdrm8x5Eil48nvQIKk4etkxfmIFPprBWAA9yA
	CK4fTkCFrHvyJ57OUO+JTlLHU8PO3bEtwbmsVfE+qWCQkCrPaM5coyElQkp7SqLPgunx
	igPjwy4ax8Sk5oaUDgE2foTTePGExireT/4xOVQvhum4uKvHZzwK2ApbVt0sOjXyEEMV
	n+Dg==
Received: by 10.216.139.204 with SMTP id c54mr7321757wej.103.1332523334867;
	Fri, 23 Mar 2012 10:22:14 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ex2sm25360942wib.8.2012.03.23.10.22.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 10:22:14 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1332522200.git.bruce.ashfield@windriver.com>
Date: Fri, 23 Mar 2012 18:22:10 +0100
Message-Id: <C7DE296F-975E-4CCE-91BD-5C562C50CC8D@dominion.thruhere.net>
References: <cover.1332522200.git.bruce.ashfield@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQna0wL5bCX096kZlx3GlzwTV5Hn4rfMRMzvYw2XbjFQELk7DfMezxv/Dtag5msArb/eBtQd
Cc: saul.wold@intel.com
Subject: Re: [PATCH 0/3] linux-libc-headers: 3.2 and linux-libc-headers-yocto movement
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
X-List-Received-Date: Fri, 23 Mar 2012 17:31:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 23 mrt. 2012, om 18:07 heeft Bruce Ashfield het volgende geschreven:

> Richard/Saul,
>=20
> As discussed on the mailing list here is a libc-headers series. I've =
kept it in
> three parts so you can pick what you want (except for the minor detail =
of=20
> needing to split patch 1/1 to keep 3.1 around if you don't want 2/3).
>=20
> I've built and booted this on all the emulated targets, and have some =
other
> builds running against larger numbers of packages as well.
>=20
> Cheers,
>=20
> Bruce
>=20
> The following changes since commit =
bb1d7fad7ff8515939f2b5f0b540b9b09604be3c:
>  Richard Purdie (1):
>        Revert "bitbake.conf/sstate.bbclass: Change PATH when =
installing sstate files to avoid issues"
>=20
> are available in the git repository at:
>=20
>  git://git.pokylinux.org/poky-contrib zedd/libc-headers-oe
>  =
http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dzedd/libc-headers-=
oe
>=20
> Bruce Ashfield (3):
>  linux-libc-headers: add 3.2 headers and remove 3.1
>  linux-libc-headers: set default LINUXLIBCVERSION to 3.2
>  linux-libc-headers-yocto: remove from oe-core

Would it make more sense to move to 3.3 or is that too risky at this =
point? I'm fine with the patchset either way, though.

regards,

Koen=



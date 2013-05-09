Received: from mail-pd0-f181.google.com ([209.85.192.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UaUBM-0006xD-9I
	for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 18:59:06 +0200
Received: by mail-pd0-f181.google.com with SMTP id p11so2123080pdj.26
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 May 2013 09:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=Z9Xl5WJrxeTl/Ie2PFrITa4B7GoE1JSxB/1RLciwIBM=;
	b=GYLVD08kP6hgjfYe8Vqn+bK9P9J1DtFqX6I3Wnt5xCX/Osqjn1Vcpq/k2u/fs4vK5P
	Gb+kRz2HUiq3TVVkIraaq5rUMrc66cHUfXOxktokxlJZLXQ0UwkeurP6CpZQsCfGATmW
	HhajPtl+8zWPWJA8n0IQwsyh2V2WwDyG/NgXSquY48qpqJkz8XVgVYMAjCKFd0swfax3
	JdheOSIQd3u760I7J3dQ/7z/jNKQD56NMdJ7sKDM63BpgjQVLTi/aeu5/483wscl4haR
	sTxkriUbGnpv6zggf4c684yW4jjZwV6I0pvdOagNZqm2OrWJYaWRcg7nUOssd6drko1j
	qusQ==
X-Received: by 10.68.103.131 with SMTP id fw3mr13067131pbb.112.1368117659626; 
	Thu, 09 May 2013 09:40:59 -0700 (PDT)
Received: from stafford-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id ov2sm3640247pbc.34.2013.05.09.09.40.57
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 09 May 2013 09:40:58 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <518BC905.3090508@windriver.com>
Date: Thu, 9 May 2013 09:40:56 -0700
Message-Id: <124C3FE5-E47E-41D2-A277-B4D52AB18BE1@gmail.com>
References: <1368104132-30116-1-git-send-email-bogdan.a.marinescu@intel.com>
	<A023E370-E7BD-47E2-B779-335B4ADE7819@gmail.com>
	<518BC02E.8010909@windriver.com>
	<1368114004.14512.417.camel@phil-desktop.brightsign>
	<518BC905.3090508@windriver.com>
To: Mark Hatle <mark.hatle@windriver.com>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc: include libgcc when libpthread is enabled
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
X-List-Received-Date: Thu, 09 May 2013 16:59:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On May 9, 2013, at 9:04 AM, Mark Hatle <mark.hatle@windriver.com> wrote:

> On 5/9/13 10:40 AM, Phil Blundell wrote:
>> On Thu, 2013-05-09 at 10:26 -0500, Mark Hatle wrote:
>>> This would be my suggestion.  I'd also want to make sure there is a
>>> libpthread-dev (which for some reason I think there already is) =
because the
>>> links in there are required for on-target thread debugging...
>>=20
>> Really?  If those links are needed for thread debugging then it =
sounds
>> like they should be in libthread-db, not in any -dev package.
>=20
> I'm pretty sure I'm misremembering the issue.  It's the libthread-db =
that needs the link for debugging.  Last time I was playing with this =
was pre-Denzil and it didn't quite work right.  (gdb on the target =
debugging threads would say "hey I need the ....so to debug".)
>=20

No its not needed for debugging rather for unwinding and cancellations =
to work.=20

> If nobody has seen that recently, then ignore that.. it's been =
resolved.
>=20
> --Mark
>=20
>> p.
>>=20
>>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




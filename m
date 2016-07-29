Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5F501607A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 18:36:05 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id cf3so5576178pad.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 11:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=bBz4eDlhPBfWe4hYPVzC8aTqYa3ufeTVp2OI9wKt8JI=;
	b=grTd8871UgwsgUPNaObsp9tL497xo3V2rFxLxxi5XdgEvr/fO5GamTFMp82koxSJca
	EMTJZ12WCKn4Ofi5EHNJH4Wq8aZhahFZ7RZYIcRTCxpOhHlqNIdhtLCW02dVzv6OSDvi
	5cqzX+vrcVcS9KOaWQ0yFYq7P7B6oD4F3VGzdt/lenP2INNuotXd7DDNkckQZWWR/j+2
	bV70HRFetya85h+p1FifkR88mX2Py3uLIlaEtGGmyOQGGkI2rjmmklfpVsGdTDtkbfOn
	DfsQx0vMohQC12zWaguIUYCSGn7rYeUDa/A2gaxUJksTwqtn6+ZxLKMS0diG88MkyDlC
	eJaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=bBz4eDlhPBfWe4hYPVzC8aTqYa3ufeTVp2OI9wKt8JI=;
	b=hjrzSbjyWR7w4k2tW8+lFolKb/xkS7ca0Fl4al6kZiuUZe2n5ff/qdwhmNmSauHc50
	SVCxYR+igiEOrXr8wTdRo1UnOKnjykoGBQ2lSs7D99790O9j5KU1e9i0utviPctCuBs3
	HLgaRFum7aoTEeXeHHflP5dMrpnTRqydcNhd0OotFdA42Jlu2kzvZdeHYeq8DnTPqqcZ
	gwGCh0pcnNPAAA+BZSC3mzuRTBFDoiBBxDRMQ69MO3kWh2z3gWPG0l+j72CYcnWD03qk
	9eusEuEhlHa7wa4r9Yvaoio9WAeY04QZYSAQRzYFYwMhlNTmkzYESpJCpExv6MYMHZ/k
	rTxw==
X-Gm-Message-State: AEkooutLWmCyUVBYEIpeqr9Tx4C1nkMBqcbjbX/nxOqol/QxWlkk3cq75ZdebMDSOtqphg==
X-Received: by 10.66.138.74 with SMTP id qo10mr71141697pab.135.1469817366079; 
	Fri, 29 Jul 2016 11:36:06 -0700 (PDT)
Received: from ?IPv6:2601:647:4c00:3edf:99bc:2711:d44c:7b33?
	([2601:647:4c00:3edf:99bc:2711:d44c:7b33])
	by smtp.gmail.com with ESMTPSA id
	n80sm26748658pfi.19.2016.07.29.11.36.04
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jul 2016 11:36:04 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <2021B186DC632746BD5A3CE32F12BD28011FCD60BC@EU-MBX-03.mgc.mentorg.com>
Date: Fri, 29 Jul 2016 11:35:59 -0700
Message-Id: <8810C6FB-7CB4-4648-B8B5-A9199C3468CB@gmail.com>
References: <1469695788-12904-1-git-send-email-awais_belal@mentor.com>
	<94382486-A163-4AD9-88CD-D79109B796E9@gmail.com>
	<2021B186DC632746BD5A3CE32F12BD28011FCD60BC@EU-MBX-03.mgc.mentorg.com>
To: "Belal, Awais" <Awais_Belal@mentor.com>
X-Mailer: Apple Mail (2.3124)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] init-install*: /etc/mtab make a link rather than a copy
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Jul 2016 18:36:07 -0000
X-Groupsio-MsgNum: 85134
Content-Type: multipart/signed;
	boundary="Apple-Mail=_BF6ABEBD-624A-4D41-94E8-95A3DF294E13";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_BF6ABEBD-624A-4D41-94E8-95A3DF294E13
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jul 29, 2016, at 3:17 AM, Belal, Awais <Awais_Belal@mentor.com> =
wrote:
>=20
>>> On Jul 28, 2016, at 1:49 AM, Awais Belal <awais_belal@mentor.com> =
wrote:
>>>=20
>>> Using a copy would only make management of devices erroneous
>>> and makes the system unstable in some scenarios as tools will
>>> have to manipulate both files separately. A link ensures that
>>> both files /proc/mounts and /etc/mtab will have the same
>>> information at all times and this is how it is handled
>>> on newer systems where there is such a need. Same is
>>> suggested by busybox.
>>>=20
>>> Signed-off-by: Awais Belal <awais_belal@mentor.com>
>>> ---
>>> meta/recipes-core/initrdscripts/files/init-install-efi.sh | 2 +-
>>> meta/recipes-core/initrdscripts/files/init-install.sh     | 2 +-
>>> 2 files changed, 2 insertions(+), 2 deletions(-)
>>>=20
>>> diff --git =
a/meta/recipes-core/initrdscripts/files/init-install-efi.sh =
b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
>>> index f564f4e..53f6508 100644
>>> --- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
>>> +++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
>>> @@ -123,7 +123,7 @@ mkdir -p /tmp
>>>=20
>>> # Create /etc/mtab if not present
>>> if [ ! -e /etc/mtab ]; then
>>> -    cat /proc/mounts > /etc/mtab
>>> +    ln -sf /etc/mtab /proc/mounts
>>> fi
>=20
>> I think this does not consider the case where procfs may be disabled =
in kernel. Is there such a possibility ?
>=20
> Well in such a case at least mtab should be available so the link =
won't be created.

we are checking for /etc/mtab and not /proc/mtab so no.
Secondly, it seems the symlink needs to be reversed.

>=20
>>>=20
>>> disk_size=3D$(parted ${device} unit mb print | grep '^Disk .*: .*MB' =
| cut -d" " -f 3 | sed -e "s/MB//")
>>> diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh =
b/meta/recipes-core/initrdscripts/files/init-install.sh
>>> index 72ce92b..21ae0a6 100644
>>> --- a/meta/recipes-core/initrdscripts/files/init-install.sh
>>> +++ b/meta/recipes-core/initrdscripts/files/init-install.sh
>>> @@ -119,7 +119,7 @@ fi
>>>=20
>>> mkdir -p /tmp
>>> if [ ! -L /etc/mtab ]; then
>>> -    cat /proc/mounts > /etc/mtab
>>> +    ln -sf /etc/mtab /proc/mounts
>>> fi
>>>=20
>>> disk_size=3D$(parted ${device} unit mb print | grep '^Disk .*: .*MB' =
| cut -d" " -f 3 | sed -e "s/MB//")
>>> --
>>> 1.9.1
>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
> BR,
> Awais


--Apple-Mail=_BF6ABEBD-624A-4D41-94E8-95A3DF294E13
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlebohMACgkQuwUzVZGdMxTzOwCggpIW0lJhas2lgOV/Ei79+zMA
AwkAoJOe2Xtb33B5Wr05mvHjhNoY5a7f
=hh1c
-----END PGP SIGNATURE-----

--Apple-Mail=_BF6ABEBD-624A-4D41-94E8-95A3DF294E13--

Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S2Qbr-0008Lt-U4
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 18:13:07 +0100
Received: by wera1 with SMTP id a1so1532115wer.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2012 09:04:40 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.80.35 as permitted sender)
	client-ip=10.180.80.35; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.80.35 as permitted
	sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.80.35])
	by 10.180.80.35 with SMTP id o3mr41083984wix.5.1330448680464 (num_hops
	= 1); Tue, 28 Feb 2012 09:04:40 -0800 (PST)
Received: by 10.180.80.35 with SMTP id o3mr32557502wix.5.1330448680373;
	Tue, 28 Feb 2012 09:04:40 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id s2sm73321534wix.3.2012.02.28.09.04.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Feb 2012 09:04:39 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F4D055B.9000209@linux.intel.com>
Date: Tue, 28 Feb 2012 18:04:41 +0100
Message-Id: <0C09C014-6B5F-458D-8C38-36B9436C11F1@dominion.thruhere.net>
References: <1330444215-14321-1-git-send-email-koen@dominion.thruhere.net>
	<4F4D055B.9000209@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnz2Weye88+ZOOTNNCuohI/33uOTZAe8ZuwiNZfbHteqxhZDxMsoVKIHtMFMPmnZvxy+4ql
Subject: Re: [PATCH] bootimg bbclass: quoting fixes
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
X-List-Received-Date: Tue, 28 Feb 2012 17:13:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 28 feb. 2012, om 17:48 heeft Saul Wold het volgende geschreven:

> On 02/28/2012 07:50 AM, Koen Kooi wrote:
>> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
>> ---
>>  meta/classes/bootimg.bbclass |    4 ++--
>>  1 files changed, 2 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/meta/classes/bootimg.bbclass =
b/meta/classes/bootimg.bbclass
>> index 1d1a3d0..c4a4c2a 100644
>> --- a/meta/classes/bootimg.bbclass
>> +++ b/meta/classes/bootimg.bbclass
>> @@ -35,8 +35,8 @@ ISODIR =3D "${S}/iso"
>>  BOOTIMG_VOLUME_ID   ?=3D "boot"
>>  BOOTIMG_EXTRA_SPACE ?=3D "512"
>>=20
>> -EFI =3D ${@base_contains("MACHINE_FEATURES", "efi", "1", "0", d)}
>> -EFI_CLASS =3D ${@base_contains("MACHINE_FEATURES", "efi", =
"grub-efi", "dummy", d)}
>> +EFI =3D '${@base_contains("MACHINE_FEATURES", "efi", "1", "0", d)}'
>> +EFI_CLASS =3D '${@base_contains("MACHINE_FEATURES", "efi", =
"grub-efi", "dummy", d)}'
>>=20
>>  # Include legacy boot if MACHINE_FEATURES includes "pcbios" or if it =
does not
>>  # contain "efi". This way legacy is supported by default if neither =
is
> This actually needs more changes, see my patch.

Indeed, I resorted to using 'rm' for fix quoting issues :)=



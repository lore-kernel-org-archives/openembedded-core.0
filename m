Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 084086E268
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 07:48:03 +0000 (UTC)
Received: by widdi4 with SMTP id di4so47274121wid.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 00:48:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=8J/IWvbYx+eqir0gud+Cd0Nx+M1e+XNhAK/Hn4DLiRs=;
	b=H1bDemFsv9BrW2RLV6ksS32kk+6Pk8cccixlmBALLaFbf+/5iQZiVATaJovZlmTZD6
	TDdSrwq+egnJXQFyK508uRVo9A2nwehOsZq3MVfJDjnineuDFGvdwMEqJOMRXqqsO8Mk
	2mkkYr7EfDzhEXc9rFXRLZtccAt95o/OUKN1iMTLKXAJ75AIF5D1cMfB1+c9QKkHDLbb
	1Vdrijp7wjlZTSabesJux3ccmH6vL/bEKhwYa1qROIDynH8ZDO2A4029McHELuqiYm4s
	QWv47dOaA8+2TaztgHaX8h5q3S/K7i9K+Fr5mXhkMScIRpSV1F1MSSpGs6mpjq/sxaV+
	7Tvg==
X-Gm-Message-State: ALoCoQkRPVk/grw751C+VEJOsrjbaMVtlNu7+z9JW3jcsC35EdWrXQA7Xnh20Is/b4j+7sZwVWzg
X-Received: by 10.194.60.135 with SMTP id h7mr47596303wjr.82.1429688884656;
	Wed, 22 Apr 2015 00:48:04 -0700 (PDT)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id
	dx11sm6065037wjb.23.2015.04.22.00.48.02
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 22 Apr 2015 00:48:03 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
From: Koen Kooi <koen.kooi@linaro.org>
In-Reply-To: <F274ED94-A38E-42DD-9226-3A3565A11ACD@linaro.org>
Date: Wed, 22 Apr 2015 09:48:02 +0200
Message-Id: <496DCECA-5016-449B-9510-CBC34817B00B@linaro.org>
References: <1271ca6bd1854156a5b6efcf8a925e0c@BL2FFO11FD020.protection.gbl>
	<F274ED94-A38E-42DD-9226-3A3565A11ACD@linaro.org>
To: Nathan Rossi <nathan.rossi@xilinx.com>
X-Mailer: Apple Mail (2.2098)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "kernel-arch.bbclass: add arm64 support to U-Boot architecture map"
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
X-List-Received-Date: Wed, 22 Apr 2015 07:48:05 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> Op 22 apr. 2015, om 09:18 heeft Koen Kooi <koen.kooi@linaro.org> het =
volgende geschreven:
>=20
>=20
>> Op 19 feb. 2015, om 04:34 heeft Nathan Rossi =
<nathan.rossi@xilinx.com> het volgende geschreven:
>>=20
>> This reverts commit 0b891265716c414ade29d587fc1a3c4ea7beadbe.
>>=20
>> U-Boot does support AArch64, this however was only added to newer
>> versions of U-Boot and at the time of this original commit the U-Boot =
in
>> OE-Core did not support the 'arm64' architecture. OE-Core now has a
>> newer version of U-Boot for the mkimage recipe and thus supports the
>> 'arm64' architecture.
>>=20
>> Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
>> ---
>> meta/classes/kernel-arch.bbclass | 1 -
>> 1 file changed, 1 deletion(-)
>>=20
>> diff --git a/meta/classes/kernel-arch.bbclass =
b/meta/classes/kernel-arch.bbclass
>> index bbcfa15..6a6ad91 100644
>> --- a/meta/classes/kernel-arch.bbclass
>> +++ b/meta/classes/kernel-arch.bbclass
>> @@ -40,7 +40,6 @@ def map_uboot_arch(a, d):
>>=20
>>    if   re.match('p(pc|owerpc)(|64)', a): return 'ppc'
>>    elif re.match('i.86$', a): return 'x86'
>> -    elif re.match('arm64$', a): return 'arm'
>>    return a
>=20
> I just debugged a boot failure to this revert. The machine in question =
is using u-boot 2013.04 + vendor patches and can=E2=80=99t be replaced =
at this time.  I get that OE doesn=E2=80=99t care about vendor trees =
using obsolete versions, but this case is extra annoying because a few =
lines later this bbclass does:
>=20
>     export UBOOT_ARCH =3D "${@map_uboot_arch(d.getVar('ARCH', True), =
d)}"
>=20
> instead of:
>=20
>     export UBOOT_ARCH ?=3D "${@map_uboot_arch(d.getVar('ARCH', True), =
d)}"
>=20
> So now I=E2=80=99m forced to overlay kernel-arch.bbclass with the =
revert reverted and hope I don=E2=80=99t get any machines with a recent =
u-boot. Having said all that, modern uboots should default to zImage for =
arm32 and Image for aarch64 and have CONFIG_SUPPORT_RAW_INITRD enabled =
so mkimage isn;t needed anymore.
>=20
> So, opinions on weakly assigning UBOOT_ARCH?

Nathan corrected my thinko:

09:25 < nrossi> just curious around the UBOOT_ARCH, does overriding it =
work? as in  UBOOT_ARCH_<machine> =3D "foo"
09:26  * koen tries
09:38 < nrossi> koen: i think changing it to a ?=3D for the future is =
probably worth it. But i imagine getting that change backported would be =
a pain
09:40 < koen> UBOOT_ARCH_aarch64 =3D "arm" in local.conf also seems to =
work
09:41 < koen> I never realized that would take precedence over python =
methods
09:41 < nrossi> well its not the python method that is setting it
09:42 < koen> ah, right
09:42 < koen> it's set using a method, not by the method

So I don=E2=80=99t need the class overlay anymore!=


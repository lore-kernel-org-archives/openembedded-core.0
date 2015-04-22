Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1B3A860167
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 07:26:03 +0000 (UTC)
Received: by lbbzk7 with SMTP id zk7so173260815lbb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 00:26:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=gJ1GHlfYujzyrsvj9M7b6zPy4DrfGhWM0QK3P6hv8zg=;
	b=cgTcxHfkpnYsyWURx8SR3OGeFUBl/HhfTBmLOnqjiQzBEBsmRwYrS0q0kWMV7rh4h4
	lFed6Y69woob1dLUXGLdwlWIqDht/wztYJPhp9edlFsZ2+bCDukC/pj2lA2qNCemlvjo
	COsKW48aSNSIaGmsY1dAbKrHpAIZPjkrnRBn88I0DIiRGIkl3HkZXm4osVH1qD1XV9zb
	rXrbxDAprdgQ+YYMxOwrZv57QHxNd3YPuGP183xaiCrOquyp0n+FIxD7gIil6veCeUOj
	hrRJXBLMqNLSV/qmcK/9FbotU+vLl0Xuzb8dAouSF0LUv36+jJA+RfHdKv6Nwn0VlZ3+
	bnQg==
X-Gm-Message-State: ALoCoQmc11aW6x7VEIrH3awyb+504GN1UZ/P37cxc+2oG/B1onJsOjcP6CjPVJBDLAMzuWEC0RnW
MIME-Version: 1.0
X-Received: by 10.152.25.167 with SMTP id d7mr12987377lag.108.1429687563727;
	Wed, 22 Apr 2015 00:26:03 -0700 (PDT)
Received: by 10.112.99.203 with HTTP; Wed, 22 Apr 2015 00:26:03 -0700 (PDT)
In-Reply-To: <F274ED94-A38E-42DD-9226-3A3565A11ACD@linaro.org>
References: <1271ca6bd1854156a5b6efcf8a925e0c@BL2FFO11FD020.protection.gbl>
	<F274ED94-A38E-42DD-9226-3A3565A11ACD@linaro.org>
Date: Wed, 22 Apr 2015 10:26:03 +0300
Message-ID: <CAGNsrLCxQfkob37evhSGpbGZ2PoqBX3BCXVV=88+WJ_=hALbEA@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
To: Koen Kooi <koen.kooi@linaro.org>
Cc: Nathan Rossi <nathan.rossi@xilinx.com>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 22 Apr 2015 07:26:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 22 April 2015 at 10:18, Koen Kooi <koen.kooi@linaro.org> wrote:
>
>> Op 19 feb. 2015, om 04:34 heeft Nathan Rossi <nathan.rossi@xilinx.com> h=
et volgende geschreven:
>>
>> This reverts commit 0b891265716c414ade29d587fc1a3c4ea7beadbe.
>>
>> U-Boot does support AArch64, this however was only added to newer
>> versions of U-Boot and at the time of this original commit the U-Boot in
>> OE-Core did not support the 'arm64' architecture. OE-Core now has a
>> newer version of U-Boot for the mkimage recipe and thus supports the
>> 'arm64' architecture.
>>
>> Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
>> ---
>> meta/classes/kernel-arch.bbclass | 1 -
>> 1 file changed, 1 deletion(-)
>>
>> diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch=
.bbclass
>> index bbcfa15..6a6ad91 100644
>> --- a/meta/classes/kernel-arch.bbclass
>> +++ b/meta/classes/kernel-arch.bbclass
>> @@ -40,7 +40,6 @@ def map_uboot_arch(a, d):
>>
>>     if   re.match('p(pc|owerpc)(|64)', a): return 'ppc'
>>     elif re.match('i.86$', a): return 'x86'
>> -    elif re.match('arm64$', a): return 'arm'
>>     return a
>
> I just debugged a boot failure to this revert. The machine in question is=
 using u-boot 2013.04 + vendor patches and can=E2=80=99t be replaced at thi=
s time.

fwiw, it's real world. APM Mustang boards are shipped with a firmware
using U-Boot 2013.04 and there's no way to upgrade to newer versions
of U-Boot.

>  I get that OE doesn=E2=80=99t care about vendor trees using obsolete ver=
sions, but this case is extra annoying because a few lines later this bbcla=
ss does:
>
>      export UBOOT_ARCH =3D "${@map_uboot_arch(d.getVar('ARCH', True), d)}=
"
>
> instead of:
>
>      export UBOOT_ARCH ?=3D "${@map_uboot_arch(d.getVar('ARCH', True), d)=
}"
>
> So now I=E2=80=99m forced to overlay kernel-arch.bbclass with the revert =
reverted and hope I don=E2=80=99t get any machines with a recent u-boot. Ha=
ving said all that, modern uboots should default to zImage for arm32 and Im=
age for aarch64 and have CONFIG_SUPPORT_RAW_INITRD enabled so mkimage isn;t=
 needed anymore.
>
> So, opinions on weakly assigning UBOOT_ARCH?

It's worth looking at U-Boot and check what it does differently to
warrant arm64 parameter? Maybe arm is a saner default.


Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TFyRe-0004VJ-5q
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 04:30:50 +0200
Received: by eeit10 with SMTP id t10so955285eei.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Sep 2012 19:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=z1jp6AIeHfLNZdoaxw/48ZQcmydb/7eEFB+AaW27UF4=;
	b=ilMj5Rm2Cc2Ot7yUQbQm0pEJ2rsSaz8x3WCWXVRzGmXcgaRf2QWi1QfQ4XFMJovgk4
	CDspFxdkCNOeLycvMelpGw0MDDCJGKE3Hp5gXWfSS5rTUgb1vObhBTC0Dm+cXHE8ydMR
	JEp+fVSMcnDjnVUAVGrug6vdbtH3T6bia+vR703JDpTOjsE/z6QIHxMYs+vxMFcXA8vZ
	CmAoh9B0pgEX/Cj/k0rdACQiFg/VAo4x6Lw/7cyPen2zBU/4AsUuFhmAooKoFnQmdCNJ
	i1wnyODOWSI+oVRbgVspXsFegJRxDn48rfZ5EEhqX0mTIacPgfJ4UN50VjWsrRdxlXP3
	M4hQ==
Received: by 10.14.173.131 with SMTP id v3mr12960799eel.15.1348453083175; Sun,
	23 Sep 2012 19:18:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.173.69 with HTTP; Sun, 23 Sep 2012 19:17:32 -0700 (PDT)
In-Reply-To: <505C8503.2040907@communistcode.co.uk>
References: <505C7402.4060604@communistcode.co.uk> <505C7F3A.7020400@intel.com>
	<505C8503.2040907@communistcode.co.uk>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 23 Sep 2012 19:17:32 -0700
Message-ID: <CAMKF1spWUv8SFWnQ-_hKqw_+0NEK_Yq4-dhfyAnr-eTyMRemyg@mail.gmail.com>
To: ml@communistcode.co.uk
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: ld problems with relocated toolchain
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
X-List-Received-Date: Mon, 24 Sep 2012 02:30:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 21, 2012 at 8:17 AM, Jack Mitchell <ml@communistcode.co.uk> wro=
te:
> On 21/09/12 15:52, Laurentiu Palcu wrote:
>>
>>
>> On 09/21/2012 05:04 PM, Jack Mitchell wrote:
>>>
>>> I am currently having issues building my application with the latest
>>> toolchain.
>>>
>>> I have used the new capabilities of it being relocatable to place it
>>> somewhere sensible and I think this may be what is breaking it. My old
>>> toolchain in /opt still works perfectly.
>>>
>>> The error I receive is:
>>>
>>>
>>> /home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-linux/usr/=
bin/armv7a-vfp-neon-poky-linux-gnueabi/../../libexec/armv7a-vfp-neon-poky-l=
inux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
>>> cannot find crtbegin.o: No such file or directory
>>> collect2: error: ld returned 1 exit status
>>> make: *** [R0005] Error 1
>>
>> Did this error appear after the latest SDK fixes that were merged today?
>> Can you activate compiler verbose mode so we can see the arguments
>> passed to the linker? Does it work if you install in the default
>> location? Or better, can you tell the exact steps you followed to get
>> this issue?
>
>
> Exact steps:
>
> bitbake meta-toolchain
> run toolchain setup script
> tell application to use new toolchain and sysroot
> compile
>
> This was appearing before the patches that were merged today.
>
> Works fine when installed in default location.
>
> Some more verbose output:
>
> /home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-linux/usr/bi=
n/armv7a-vfp-neon-poky-linux-gnueabi/../../libexec/armv7a-vfp-neon-poky-lin=
ux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/as
> -v -I
> /home/jack/Projects/R0005-SDK-210912/sysroots/armv7a-vfp-neon-poky-linux-=
gnueabi/usr/include
> -mcpu=3Dcortex-a8 -mfloat-abi=3Dsoftfp -mfpu=3Dneon -meabi=3D5 -o src/sys=
temConfig.o
> /tmp/ccr24jiu.s
> GNU assembler version 2.22 (arm-poky-linux-gnueabi) using BFD version (GN=
U
> Binutils) 2.22
> COMPILER_PATH=3D/home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-poky=
sdk-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi/../../libexec/armv7a-v=
fp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/:/home/jack/Pro=
jects/R0005-SDK-210912/sysroots/x86_64-pokysdk-linux/usr/bin/armv7a-vfp-neo=
n-poky-linux-gnueabi/../../libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/
> LIBRARY_PATH=3D/home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokys=
dk-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi/../../lib/armv7a-vfp-ne=
on-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/:/home/jack/Projects=
/R0005-SDK-210912/sysroots/x86_64-pokysdk-linux/usr/bin/armv7a-vfp-neon-pok=
y-linux-gnueabi/../../lib/armv7a-vfp-neon-poky-linux-gnueabi/gcc/
> COLLECT_GCC_OPTIONS=3D'-I'
> '/home/jack/Projects/R0005-SDK-210912/sysroots/armv7a-vfp-neon-poky-linux=
-gnueabi/usr/include'
> '-O0' '-mfpu=3Dneon' '-mfloat-abi=3Dsoftfp' '-mcpu=3Dcortex-a8' '-g3' '-W=
all'
> '-Wextra' '-c' '-fmessage-length=3D0' '-v' '-MMD' '-MP' '-MF'
> 'src/systemConfig.d' '-MT' 'src/systemConfig.d' '-o' 'src/systemConfig.o'
> '-mtls-dialect=3Dgnu'
> /home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-linux/usr/bi=
n/armv7a-vfp-neon-poky-linux-gnueabi/../../libexec/armv7a-vfp-neon-poky-lin=
ux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
> cannot find crt1.o: No such file or directory
> /home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-linux/usr/bi=
n/armv7a-vfp-neon-poky-linux-gnueabi/../../libexec/armv7a-vfp-neon-poky-lin=
ux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
> cannot find crti.o: No such file or directory
>
> /home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-linux/usr/bi=
n/armv7a-vfp-neon-poky-linux-gnueabi/../../libexec/armv7a-vfp-neon-poky-lin=
ux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
> cannot find crtbegin.o: No such file or directory
> /lib/libpthread.so.0: file not recognized: File format not recognized


What does linker command looks like, its not in the above log you posted.


>
> collect2: error: ld returned 1 exit status
> make: *** [R0005] Error 1
>
>>
>> Thanks,
>> Laurentiu
>>>
>>> However, crtbeign.o is at the path:
>>>
>>>      [jack@archHP armv7a-vfp-neon-poky-linux-gnueabi]$ pwd
>>>
>>> /home/jack/Projects/R0005-SDK-210912/sysroots/armv7a-vfp-neon-poky-linu=
x-gnueabi
>>>      [jack@archHP armv7a-vfp-neon-poky-linux-gnueabi]$ find . -name
>>>      crtbegin.o
>>>      ./usr/lib/arm-poky-linux-gnueabi/4.7.2/crtbegin.o
>>>      [jack@archHP armv7a-vfp-neon-poky-linux-gnueabi]$ ls usr/lib
>>>      lib/     libexec/
>>>      [jack@archHP armv7a-vfp-neon-poky-linux-gnueabi]$ ls usr/libexec/
>>>      pt_chown
>>>      [jack@archHP armv7a-vfp-neon-poky-linux-gnueabi]$
>>>
>>>
>>> Does anyone have an idea what is the issue here? Why can't it find the
>>> object file?
>>>
>
> --
>
>   Jack Mitchell (jack@embed.me.uk)
>   Embedded Systems Engineer
>   http://www.embed.me.uk
>
> --
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



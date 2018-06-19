Return-Path: <ross.burton@intel.com>
Received: from mail-ot0-f195.google.com (mail-ot0-f195.google.com
	[74.125.82.195])
	by mail.openembedded.org (Postfix) with ESMTP id BA0147603F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 23:13:28 +0000 (UTC)
Received: by mail-ot0-f195.google.com with SMTP id r18-v6so1654591otk.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 16:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zRpd9FRGpi48E5xsX5gdFbxGAzTLa2UOx1PC0xewlJw=;
	b=bnmxQQdYW46JnjaDnTg3Ukdrv4GuU2yL2BmAfQkUO8y1vkHz54tyRDFb/c3NMmaRP2
	qSl2ArQAyCBLSPvY2rms7/uP4JxSd+/gtpQgUPQixSeV/YQotFm8agiqgWLu4fW5vkzf
	2Mz2m4wlZlFkVN5NfBr/cM2AVcLDBvDUVb/W6exBb1GRH7G/TzQ1YbvjgHg7k1k8bXGs
	LgZ9Bs2C692fMFSdo02VDZIKF2tbXx4sNeFYWbAIVfGx/6lLcNOwSG0+TuX+yamqkadz
	0JUNJlZZL60Z0KyL4YDNWGUzeCa5cR/jBuZYPGN0wNEYkOMtILJC+yBtsrNhoPzdZGac
	F2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zRpd9FRGpi48E5xsX5gdFbxGAzTLa2UOx1PC0xewlJw=;
	b=o3kvxBNjKoJKTfyI08IPBgPjBNJOm1g4+GKEt0DnTcC00kfHQDrtdvcydWT07gd6/V
	1UhhsDILN7UHk1NHLoaWTk+BVDf5OjgWH9YZe3xVSAInUdp+fKoDnBVgSdo8iRNM262W
	jx7vDYlSY4mT/JqMVhzGajKydB+pbRbEcFmJwfV5vUnAVu62KLkNASk7ZfUOTP9Rlgsm
	JG0+1Xe7mGMykzUcsTIxUvMBal+/TnpR3b/w1ImVEwBSadjExsc9XrqKKz9ousuxOaSJ
	luGuIHBLFHV5fuOTl+hqGtak8KPP+uBZrbA3vwFZT8ICngpHJ/WNC12rfaTy6D/Ne3qL
	dNmA==
X-Gm-Message-State: APt69E2uSHVuWsdwASyg1CeDUMWLTe9SG4vWvXxUA8KyxHoDYIAbFvYM
	oAcE08h/uA0iJLk3DsFjB23d6cJM5sczkzrKBnFG+g==
X-Google-Smtp-Source: ADUXVKJTIcI/O2mVxr9EHiEsdxDkJNY2AGMucjmbcSDbOOqdLNX+qVg16kDi7F6akzSQ+uGfN38zLsCDUbfbvB7KsmM=
X-Received: by 2002:a9d:627:: with SMTP id
	36-v6mr10797254otn.168.1529450009695; 
	Tue, 19 Jun 2018 16:13:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP; Tue, 19 Jun 2018 16:13:09
	-0700 (PDT)
In-Reply-To: <CAJTo0LaA44BywL8+0kNRnPJD5b90tA9M0B6wEZ7hOJcbX=L+ZA@mail.gmail.com>
References: <20180504123244.43049-1-alexander.kanavin@linux.intel.com>
	<20180504123244.43049-12-alexander.kanavin@linux.intel.com>
	<32602a82-f07d-3c69-2305-3f0f17f4c9dc@windriver.com>
	<CAJTo0La2eicsFUCAPOktYs110iFdOrFWNzLXC+EeeRrDzBHtNQ@mail.gmail.com>
	<282aab6b-9e7c-1d85-8e1e-443d1156c1fa@gmail.com>
	<b536b753-8e56-bb37-5a7a-1f66092e9c02@windriver.com>
	<CANNYZj8M+88frU6ci4n-=ufcMts1764FPK2AdbYSkmboafsnfg@mail.gmail.com>
	<CADqQcK7Q_eZBoRiE88_XY=FbZVfJSpkybHdTCPqFM9okVZqYcQ@mail.gmail.com>
	<CAJTo0LaA44BywL8+0kNRnPJD5b90tA9M0B6wEZ7hOJcbX=L+ZA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 20 Jun 2018 00:13:09 +0100
Message-ID: <CAJTo0Lbc-csvZj3qZPEvqbVbH-U0TyCgqeUQeF1Z_=xwfe7=NA@mail.gmail.com>
To: Nirbheek Chauhan <nirbheek.chauhan@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 12/14] meson: update to 0.46.0 -- broke systemd on qemuppc
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
X-List-Received-Date: Tue, 19 Jun 2018 23:13:28 -0000
Content-Type: text/plain; charset="UTF-8"

Okay, odd.  Hacked in a few compile fixes and now systemd v237 fails
to build with Meson git master:

| FAILED: libsystemd.so.0.21.0
| powerpc-poky-linux-gcc -m32 -mhard-float -mcpu=7400 -mno-spe
-fstack-protector-strong -D_FORTIFY_SOURCE=2 -no-pie -fno-PIE
--sysroot=/data/poky-tmp/master/work/ppc7400-poky-linux/systemd/1_237-r0/recipe-sysroot
 -o libsystemd.so.0.21.0  -Wl,--no-undefined -Wl,--as-needed -shared
-fPIC -Wl,--start-group -Wl,-soname,libsystemd.so.0
-Wl,--whole-archive src/libsystemd/libsystemd.a
src/journal/libjournal-client.a -Wl,--no-whole-archive -Wl,-z,relro
-Wl,-z,now -pie -Wl,--gc-sections src/basic/libbasic.a
src/basic/libbasic-gcrypt.a -pthread -shared
-Wl,--version-script=/data/poky-tmp/master/work/ppc7400-poky-linux/systemd/1_237-r0/git/src/libsystemd/libsystemd.sym
-lrt -Wl,--end-group
/data/poky-tmp/master/work/ppc7400-poky-linux/systemd/1_237-r0/recipe-sysroot/usr/lib/liblzma.so
/data/poky-tmp/master/work/ppc7400-poky-linux/systemd/1_237-r0/recipe-sysroot/lib/libcap.so
/data/poky-tmp/master/work/ppc7400-poky-linux/systemd/1_237-r0/recipe-sysroot/usr/lib/libblkid.so
-lrt -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong
-D_FORTIFY_SOURCE=2 -no-pie -fno-PIE
--sysroot=/data/poky-tmp/master/work/ppc7400-poky-linux/systemd/1_237-r0/recipe-sysroot
-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fstack-protector-strong
-Wl,-z,relro,-z,now
| /data/poky-tmp/master/work/ppc7400-poky-linux/systemd/1_237-r0/recipe-sysroot/usr/lib/../lib/crt1.o:(.rodata+0x4):
undefined reference to `main'

I'm guessing the compile option re-ordering is going wrong with our
compiler flags?

Ross

On 20 June 2018 at 00:02, Burton, Ross <ross.burton@intel.com> wrote:
> On 19 June 2018 at 21:24, Nirbheek Chauhan <nirbheek.chauhan@gmail.com> wrote:
>> On Wed, Jun 20, 2018 at 1:39 AM Alexander Kanavin
>> <alex.kanavin@gmail.com> wrote:
>>> FWIW, I did fix a similar (or maybe even same) issue with this patch:
>>> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools/meson/meson/0001-Linker-rules-move-cross_args-in-front-of-output_args.patch
>>>
>>> It's possible that more rearranging needs to be done, or this patch no
>>> longer has the desired effect.
>>>
>>
>> So far in this thread, I don't see any changes that would cause this
>> issue, and that patch shouldn't change things either. The bisection is
>> probably significant, but I am not sure what's going.
>>
>> Also, in general please try to talk to us first before doing a change
>> like that (switching the order of cross_args) so we can investigate
>> and figure out what we should fix. The cross_args are at the end so
>> they can override existing arguments, such as -D flags or -W flags.
>>
>> Another thing to try would be current git, which has significant
>> changes in how we do library resolution, de-duplication, and so on.
>> Specifically, instead of `-lfoo`, we now prefer full paths to the
>> library to use instead since this allows greater flexibility in
>> selecting whether to use shared or static libraries.
>
> So I just generated a snapshot of current git and am building systemd
> with it.  Interestingly, the flag order change is resulting in what
> were warnings now being fatal and systemd fails to build.  One was
> easily fixed with a patch from master, the other will have to wait
> until tomorrow morning, but I will get back to this.
>
> Ross


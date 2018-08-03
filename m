Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id A3A8374598
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Aug 2018 08:16:05 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id g18-v6so3439739uam.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Aug 2018 01:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=z+n2WsM1tjcBaLngI/rwRgai4W5fcendM+BKHVNleQU=;
	b=W7XZhOL5kijRivclRI+34Sr0ujjTgb12GrW4/kMr5xW6S1bfg1TblejO1/QdCMKDVD
	/Ai8XKpsL8H/5qdqODhG0tlBNXmkjlA1kGkv4H67mGXQUgWFK9lLJeTthHPXwe89LaKj
	svWvB1iaJgXUXvGzoHz8DkC4BDray1pB0H46XZm1KmmOFrJdkxYEHyynOeZastiEudaf
	KQ15+dsSAxQv3XJo94d1JWsKWsaDUTeuifZZ/sbVEE4hsz7XC2na08xbkIElrnPc0Fj6
	5f3A0yAh4KohR3EplE0Dvf+DejELqPRD6eC4QxAfenHD7ApfJM9DUF0/wbNTQM94O0ro
	cHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=z+n2WsM1tjcBaLngI/rwRgai4W5fcendM+BKHVNleQU=;
	b=Wtu6Sk0auetoTb1I/TCdFdlgcGEPO0W41mteLwFVUpYbP+TEJ4TGLEhZbaT3q1Gxzl
	C1gnW6GQeMqynW9j/JX0MTzQ/LRuSJv9qPQ2PwzzflslmT6ChBnCOtS7EGnCxzQ0w8lV
	ncL6fBq2b9N0mOYbtKfFi+Ih67Z1u+Kpi7+hZYDf7f2z9qdXQDtA1fEN4RO2hzd9pD8V
	MNaEcSLz3uAvOwng0ZdYwbcvFl0hZW8ZioeSvisaAS5AKRWPJxptJ8tkw7v/GOEgm/eG
	WHpDWovOR53kgIFbL7dNhN3er/RgidPmgBPIVtYqqmc3ECrRH6uMfiPfWP/51jO4funG
	z4cw==
X-Gm-Message-State: AOUpUlEMEN0/qcp6gRvbS33u59t3SOd+HEJP1SLTahWnNiM/zo8Kznyq
	wePoIPXNFICxYH36u5EdcM0Ocu0WeYyazS4U8Wg=
X-Google-Smtp-Source: AAOMgpf4xYzSpjgG+KiQ2AksTyHkU4sBc8ctV1SMQpdge4rS0fkX1irhNPiwL6P6AuQmbsiK6aW47fy2or7wo9ulBYw=
X-Received: by 2002:ab0:15ac:: with SMTP id
	i41-v6mr2179299uae.150.1533284166240; 
	Fri, 03 Aug 2018 01:16:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Fri, 3 Aug 2018 01:16:05 -0700 (PDT)
In-Reply-To: <0D62475714C01347BCA118AE7A61400376B2C8A3@FMSMSX109.amr.corp.intel.com>
References: <0D62475714C01347BCA118AE7A61400376B2C64D@FMSMSX109.amr.corp.intel.com>
	<5e8c54728e6990907fa60f2454ab7961c7561a93.camel@linuxfoundation.org>
	<0D62475714C01347BCA118AE7A61400376B2C8A3@FMSMSX109.amr.corp.intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 3 Aug 2018 01:16:05 -0700
Message-ID: <CAJ86T=W4pbBfk2GxKz4dGdXptd2ndfezHdgqEWh4yN5PQo_8Xw@mail.gmail.com>
To: "Ocampo Coronado, Omar" <omar.ocampo.coronado@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Strip kernel modules and signatures
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
X-List-Received-Date: Fri, 03 Aug 2018 08:16:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 2, 2018 at 9:54 AM, Ocampo Coronado, Omar
<omar.ocampo.coronado@intel.com> wrote:
> Neither 'nm' or 'readelf' provide a symbol that we can use to strip.
> I'm having a hard time reading kernel-source/scripts/sign-file.c and how exactly how the sign works and what bytes are being added, so we can avoid stripping them.
>
> Looking into dracut, they simple avoid strip signed modules:
>         From dracut.sh:1671 # strip kernel modules, but do not touch signed modules
>
> Perhaps we can do the same as dracut within meta/lib/oe/package.py.

Some more information here:

  https://www.kernel.org/doc/html/v4.17/admin-guide/module-signing.html#signed-modules-and-stripping

It looks like signed kernel modules can't be stripped at all. The
packaging code should probably be updated to detect signed modules and
then leave them alone.

> -----Original Message-----
> From: richard.purdie@linuxfoundation.org [mailto:richard.purdie@linuxfoundation.org]
> Sent: Thursday, August 2, 2018 4:19 AM
> To: Ocampo Coronado, Omar <omar.ocampo.coronado@intel.com>; openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] Strip kernel modules and signatures
>
> On Wed, 2018-08-01 at 22:46 +0000, Ocampo Coronado, Omar wrote:
>> Hello OE,
>>
>> While attempting to sign our kernel modules (using the kernel
>> configuration  CONFIG_MODULE_SIG) the drivers in our image did not
>> have the signature, even the certificate was being loaded by the
>> kernel or the driver being signed during do_install().
>>
>> Turns out package.bbclass, while it ignores to create debug info files
>> it does strips the kernel modules files:
>>
>> python split_and_strip_files () {
>>       ...
>>       ...
>>               for f in kernmods:
>>                           sfiles.append((f, 16, strip))
>>
>>         oe.utils.multiprocess_exec(sfiles, oe.package.runstrip)
>>     #
>>     # End of strip
>>     #
>>     os.chdir(oldcwd)
>> }
>>
>> The strip is required for many reasons yet it removes the signature
>> which we want to preserve in this scenario.
>> To work around this issue add
>>      INHIBIT_PACKAGE_STRIP = "1"
>>      either on your virtual/kernel bb file or driver bb file.
>>
>> Hope this helps someone in the future when adding signature to files,
>> perhaps including this into the Yocto kernel development manual.
>
> The code which handles kernel module stripping is in
> meta/lib/oe/package.py:
>
> stripcmd.extend(["--strip-debug", "--remove-section=.comment",
>             "--remove-section=.note", "--preserve-dates"])
>
> It would be good to see what we'd have to do to tweak that to work for signed modules.
>
> Cheers,
>
> Richard
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9811672EA1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2018 14:39:45 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id j20-v6so5937925pff.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2018 07:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=PT93AiEabop0wkP6a0J7T0ORFOO6BJ+F9e2fwg6suXU=;
	b=UCw/UrN584/UzwTGCRiLg0db7rD8zyZcv2cxzZszUHN3kGLI9syvtebCoqNK/wm6zK
	fr2P4TbwM6D13FpXwNi/0SQSv3N9XSoaoklKLbMPKtVtABPsaSwlCdeA+wJJktLrBrmV
	ODxTZtQRwCOqP0sBX5cPo4GdLMAy07K+SeAlS/6UAJhFjk6ijrTBITbgPXmhbLZqJ67N
	o2RkydA5U1LtC4WKzlxm8occyLbgPglSJ5k4wDjJSHiUMX7nl9ZALuhzz/kqVA6tOoq6
	zkmhGTw67jtXQMI6ja3UHb0JxCr3Obd77H+PO9GrJPjHW6USRvOAGvtq6G6RXsz5ud7p
	sYGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=PT93AiEabop0wkP6a0J7T0ORFOO6BJ+F9e2fwg6suXU=;
	b=J/dqmvDVizQaDBXd8ENkT19EtAnfay6HomHrllDFqfoaNDM4nFg+IRMdVl/yIG6Qtp
	HokGJpi2G+ws8AUkyVWod9xrN6yYgrq2wCeCr2kNuJmXKNoEw+J/wbw1NDTQCll3gRKa
	AwLf4TYQgrXdPUty9jt4KqooN6WPumXdBcFeaTtl7AcrcwLztrxasxNoE+FI50nzqxcM
	9rEjEnmYmMIjtl6JgB1ouovW98z29N9A6vbkWFuh0H3V918gHHEmy7pVmKLl0vW+ilSe
	4xt30TdRCT5wcrVzbkF8SEFoRrDwBGPbuGsk8/0PH59bynRsBkBRObU/dNoBKJkEfw8q
	qbHQ==
X-Gm-Message-State: ALKqPwduSOoOP2+QWE7xR1ai1LnPtobbOdAXo3/3ohg26ANNGgH6C3wL
	J1I/SSOv1zygSWUYfP/54yc+CQ==
X-Google-Smtp-Source: ADUXVKIpWPVXNpAOfh8hFEnDK1eeuS8wRMHOKeOsMpDo0wED1LF0xCtwyWdFlD8dRn+9g/6dSdAieQ==
X-Received: by 2002:a63:a74c:: with SMTP id
	w12-v6mr5037844pgo.374.1527518386080; 
	Mon, 28 May 2018 07:39:46 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184::5a1c? ([2601:202:4000:1184::5a1c])
	by smtp.gmail.com with ESMTPSA id
	u13-v6sm15069527pfn.59.2018.05.28.07.39.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 May 2018 07:39:45 -0700 (PDT)
To: Andre McCurdy <armccurdy@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>
References: <1526827795-10448-1-git-send-email-akuster@mvista.com>
	<CAJ86T=XKQdbiH3ND0Smmpne7FX=PqEtox9GJrJJi9WfiRZcOBQ@mail.gmail.com>
	<759e0c6d-d9cc-4ec2-2e56-871b18ae9313@gmail.com>
	<CAJ86T=UX195m2f_aSiR4uM7G++1rjLKj+_vvtERsKCLH7uMDOg@mail.gmail.com>
	<CAJ86T=WVzwj5j+W3GFTtW9akh3M=SEH5HTLVrBt_mkdFV0XCmA@mail.gmail.com>
	<b45998ef-41af-b965-c64a-b10a12f5ecfd@windriver.com>
	<CAJ86T=VY-OoF+QpL-vAJzhtDiWyZm-vNMptqQ1w-5K3-dHr-sA@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <4bdc7e5c-46cf-0cb2-a1fd-bac15c13f4d7@gmail.com>
Date: Mon, 28 May 2018 07:39:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=VY-OoF+QpL-vAJzhtDiWyZm-vNMptqQ1w-5K3-dHr-sA@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [V2][PATCH] busybox: update to 1.28.3
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
X-List-Received-Date: Mon, 28 May 2018 14:39:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 05/22/2018 06:19 PM, Andre McCurdy wrote:
> On Tue, May 22, 2018 at 5:48 PM, Randy MacLeod
> <randy.macleod@windriver.com> wrote:
>> On 05/22/2018 07:06 PM, Andre McCurdy wrote:
>> ...
>>> Building before and after Armin's patch and then diffing .config file=
s
>>> in each build directory gives:
>>>
>> I didn't know what all of these configs were so I've
>> listed them below and stated a straw-man opinion as
>> to whether to keep them or not.
> Thanks for digging in to the details!
>
>>> Old 1.27.2 specific config options removed:
>>>
>>> -CONFIG_FEATURE_ADDGROUP_LONG_OPTIONS=3Dy
>>> -CONFIG_FEATURE_ADDUSER_LONG_OPTIONS=3Dy
>>> -CONFIG_FEATURE_ENV_LONG_OPTIONS=3Dy
>>> -CONFIG_FEATURE_HWCLOCK_LONG_OPTIONS=3Dy
>>> -CONFIG_FEATURE_MKDIR_LONG_OPTIONS=3Dy
>> I'm okay with following upstream busybox wrt long options so
>> we can drop this.
> There's no real choice but to drop these (ie they disappear when you
> run "make oldconfig").

There is only LONG_OPTIONS now=C2=A0 with ADDGROUP, ADDUSER,=C2=A0 etc co=
ntrolling
if its enabled.
>>> New 1.28.3 specific options added:
>>>
>>> +CONFIG_BB_ARCH=3Dy
>>
>> Adds 'arch' which is the same output as 'uname -m' but
>> I always use arch and didn't know off-hand that uname -m was the same.=

>>
>> Keep it.
>>
>>> +CONFIG_FEATURE_CATN=3Dy
>>   This adds an option to cat:
>>    -n numbers all output lines while -b numbers nonempty output lines.=

>>   The commit that added this feature says:
>>      a2bdc5c55 cat: allow compiling out -n and -b
>>   so since previously the feature was always available,
>>
>> I'm okay with keeping it.
>>
>>> +CONFIG_FEATURE_SH_READ_FRAC=3Dy
>>
>>   Enables a fractional second read timeout for the shell builtin.
>>   bool "read -t N.NNN support (+110 bytes)"
>>   Enable support for fractional second timeout in read builtin.
>>
>> Potentially useful, keep it.
>>
>>> +CONFIG_FEATURE_SWAPONOFF_LABEL=3Dy
>>
>>   This allows for specifying a device by label or uuid, rather than by=

>>   name. This feature utilizes the same functionality as blkid/findfs.
>>
>> Useful. Keep it.
>>
>>> +CONFIG_FEATURE_VOLUMEID_MINIX=3Dy
>>
>> I don't know of a case where this would be generally useful.
>>
>> Omit.
>>
>>> +CONFIG_FEATURE_XARGS_SUPPORT_ARGS_FILE=3Dy
>>     xargs: support -a FILE
>>
>>     The GNU-specific option -a lets xargs read the arguments from a fi=
le
>>     rather than from stdin.
>>
>>     This is particularly convenient when debugging in gdb interactivel=
y,
>>     and it might be of more general use.
>>
>> Huh... what?
>> Digging through the findutils repo, I see that there's a better explai=
nation
>> in the findutils/NEWS file from 2004(!):
>>
>> *** xargs can now read a list of arguments from a named file, allowing=

>>     the invoked program to use the same stdin as xargs started with
>>     (for example ``xargs --arg-file=3Dtodo emacs'').
>>
>> Keep it (I suppose).
>>
>>> +CONFIG_FEATURE_XARGS_SUPPORT_PARALLEL=3Dy
>>
>> From: https://bugs.busybox.net/show_bug.cgi?id=3D9511
>> Example:
>> find samplegz | xargs -n1 -P4 sh parse.sh
>>
>> Costs 241 bytes.
>>
>> Keep it.
>>
>> The next group are described below but
>> I've put my conclusions after each config.
>>
>>> +CONFIG_HEXEDIT=3Dy
>> Drop it.
>>
>>> +CONFIG_NUKE=3Dy
>> Drop it.
>>
>>> +CONFIG_RESUME=3Dy
>> Drop it -- maybe?
>>
>>> +CONFIG_RUN_INIT=3Dy
>> Drop it.
>>
>>> +CONFIG_SETFATTR=3Dy
>> Drop it.
>>
>>> So new applets hexedit, nuke, etc, are going to sneak in to our build=
s
>>> unless we refresh our defconfig to disable them.
>>>
>>
>> Here is the rough estimate of the new applet sizes:
>>
>> $ git show 38da4c4420ea6d7b3cf120c0902458e7d8256560 | \
>>    grep "^+//config:.*bool"
>> +//config:      bool "nuke (2.4 kb)"
>> +//config:      bool "resume (3.3 kb)"
>> +//config:      bool "run-init (7.5 kb)"
>> +//config:      bool "hexedit (20 kb)"
>> +//config:      bool "setfattr (3.6 kb)"
>>
>>
>> and the commit that added most of the applets that includes
>> a brief explanation of the applet's function:
>>
>> commit ab77e81a8527fa11a4f9392d97c2da037d6f4f98
>> Author: Denys Vlasenko <vda.linux@googlemail.com>
>> Date:   Fri Aug 18 19:15:29 2017 +0200
>>
>>     klibc-utils: new applets: resume, nuke, minips
>>
>>     minips is a pure alias to ps,
>>     just in case someone needs 100% klibc-utils compat.
>>
>>     nuke is a primitive version of "rm -rf" without
>>     options and error checks. ~30 bytes.
>>
>>     resume is a tool for initramfs which resumes from
>>     a given block device.
>>
>>     function                                         old     new   del=
ta
>>     resume_main                                        -     582    +5=
82
>>     packed_usage                                   31640   31712     +=
72
>>     nuke_main                                          -      28     +=
28
>>     xstrtoull                                          -      24     +=
24
>>     applet_names                                    2646    2665     +=
19
>>     applet_main                                     1532    1544     +=
12
>>     applet_suid                                       96      97      =
+1
>>     applet_install_loc                               192     193      =
+1
>>     applet_flags                                      96      97      =
+1
>>
>> ----------------------------------------------------------------------=
--
>>     (add/remove: 5/0 grow/shrink: 6/0 up/down: 740/0)   Total: 740 byt=
es
>>
>>     Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
>>
>>
>>
>> While these are useful utilities,
>> I don't see a need for any of the new applets in the oe-core defconfig=
=2E
> All the proposals seem reasonable to me.
>
>> Armin,
>> If no one objects to my suggestions, please change the defconfig
>> in the next update or ping me and I'll do it.
all changes made. Will send v3 shortly

thanks
Armin
> As an aside, it looks like the poky-tiny defconfig for busybox hasn't
> been refreshed since busybox 1.19.3 so anyone building poky-tiny now
> is going to get 6 years worth of new applets and features which they
> might not be expecting.
>
>> --
>> # Randy MacLeod
>> # Wind River Linux




Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id EAF1478557
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2018 18:38:01 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id u10so4771547wmu.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2018 11:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rSeSADGtvXFzVhgP7XQA/8yhqkiKGehbxLMK1lScGFE=;
	b=CqQGYwXKugbyTP70jf+zZC9aSlovz7R5Q6Y4U0uRf/2IoN92rp6PHV4OlaeVnzkS4R
	+odIe4OkJsUvNn8lbNV+OcQ37bTL0Gjk17XMm9gm9iCzTJVY4JpXo+XDC/HP8opvBG2I
	d75Sl9M+enA/od8jcaf5K6qrzOAxcAF9EkfMLQ9Ahz43H8n9aRYNfwKtBfThO5P7aqWX
	xHUYhIyIFkQ417/1T8N5YWY7AblMFJg/KnkmclTgEMjUGJAO0DBdEhQ0fiiSzxfmE3/W
	DkeAMy5Wzcam11O3NZ805RGzt318urKw0+uN5gw4iLIiMHicWGcqfZSM6vx5xwT/oRgx
	I3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rSeSADGtvXFzVhgP7XQA/8yhqkiKGehbxLMK1lScGFE=;
	b=nFod33Mjlv9+1Qcd0cTqnWGu6Spkkyp+CWW1pOCJYbomiCVpaY0ovuCgHFM13yDCNM
	hXBLpvoT9L5iTBAbhd6hHb+J12x73OWjYz2NDbCOnpIKyRiAhnPVxKfDaMhe+rcmFKNF
	Ydz8N1RKN6pEy5d/ZbmDDoKm+mwF7Z7h8yE3XoJqtqeUhx6g5/C514v3u0gZpRymBrU3
	8KzYud7W79PnOl71I0qpnkCcQ+T9qe5w2XPtG3XrJJ6K/wiM3ShGxkpsTG/E+IOewXUa
	WKqJZq34ikcoxael7IXh3FiCBAvQJ+A+mRUMnfOHcQZboeH5TOzOpG8Y+s2Kf39wpDBG
	5RtA==
X-Gm-Message-State: AElRT7G39G+sa63bzg4/n6m8MaRDRJGaJfeW8zX/UjyAWYSiCBzSQIqv
	mnadlRrnLjMH7D7EM3xetB7uM0vgKUQF1Ox4XE0=
X-Google-Smtp-Source: AG47ELv3NL1k2IJncaOFxcTVOYyxEcexFx9Qv5yeJdqLzEndHIkrw4JmHlApnHz+NH9ToCZ4wEXMw7w7youbH7Q2VAY=
X-Received: by 10.28.23.143 with SMTP id 137mr2717547wmx.153.1521225482577;
	Fri, 16 Mar 2018 11:38:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.163.65 with HTTP; Fri, 16 Mar 2018 11:38:02 -0700 (PDT)
In-Reply-To: <CAJTo0LZHnuZN4u6YUKBM-38QG6ZdDQMawB9x8HWt7w6fgxZ4HQ@mail.gmail.com>
References: <20180125031227.18327-1-california.l.sullivan@intel.com>
	<3dab59e8-c09c-622e-148b-4c8d1ffe2fc9@intel.com>
	<CAJTo0LZHnuZN4u6YUKBM-38QG6ZdDQMawB9x8HWt7w6fgxZ4HQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 16 Mar 2018 11:38:02 -0700
Message-ID: <CAJ86T=XRNgY5J=7B0adZ6eypjyTs6C0EN=Y=e_P3cxvun9rQkA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: set HOSTLDFLAGS in KCONFIG_CONFIG_COMMAND
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
X-List-Received-Date: Fri, 16 Mar 2018 18:38:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 16, 2018 at 3:13 AM, Burton, Ross <ross.burton@intel.com> wrote:
> Picked to mut, thanks Cal
>
> Ross
>
> On 15 March 2018 at 19:42, Cal Sullivan <california.l.sullivan@intel.com>
> wrote:
>>
>> Ping. This is still an issue and it looks like this patch fell through the
>> cracks!
>>
>> Thanks,
>> Cal
>>
>>
>> On 01/24/2018 07:12 PM, California Sullivan wrote:
>>>
>>> Kernel v4.14 and newer contain the following in their Makefile:
>>>
>>> HOST_LFS_LDFLAGS := $(shell getconf LFS_LDFLAGS)
>>> HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS)
>>>
>>> This breaks our menuconfig, because it can no longer find ncurses if its
>>> not on the host machine. This can be seen in linux-yocto-dev, for
>>> example:
>>>
>>> [clsulliv@clsulliv build]$ bitbake virtual/kernel -c menuconfig
>>>
>>>    GEN     ./Makefile
>>>    HOSTLD  scripts/kconfig/mconf
>>> /home/clsulliv/yocto/poky/build/tmp/hosttools/ld: cannot find -lncurses
>>> /home/clsulliv/yocto/poky/build/tmp/hosttools/ld: cannot find -ltinfo
>>> collect2: error: ld returned 1 exit status
>>> make[3]: *** [scripts/Makefile.host:99: scripts/kconfig/mconf] Error 1
>>> make[2]: ***
>>> [/home/clsulliv/yocto/poky/build/tmp/work-shared/intel-corei7-64/kernel-source/Makefile:504:
>>> menuconfig] Error 2
>>> make[1]: *** [Makefile:146: sub-make] Error 2
>>> make: *** [Makefile:24: __sub-make] Error 2
>>> Command failed.
>>> Press any key to continue...
>>>
>>> Fix this by setting HOSTLDFLAGS to ${BUILD_LDFLAGS} in our
>>> 'make menuconfig' command.
>>>
>>> Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
>>> ---
>>>   meta/classes/kernel.bbclass | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>>> index 2f6eca382e9..e4df1531c19 100644
>>> --- a/meta/classes/kernel.bbclass
>>> +++ b/meta/classes/kernel.bbclass
>>> @@ -531,6 +531,8 @@ addtask savedefconfig after do_configure
>>>     inherit cml1
>>>   +KCONFIG_CONFIG_COMMAND_append = " HOSTLDFLAGS='${BUILD_LDFLAGS}'"

What's the reasoning behind appending to KCONFIG_CONFIG_COMMAND from
kernel.bbclass rather than appending from inside cml1.bbclass (the
only place KCONFIG_CONFIG_COMMAND is used) or simply updating the
default value of KCONFIG_CONFIG_COMMAND?

>>> +
>>>   EXPORT_FUNCTIONS do_compile do_install do_configure
>>>     # kernel-base becomes kernel-${KERNEL_VERSION}
>>
>>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 35FA171E06
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Feb 2017 01:05:06 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id n19so377761vkd.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Feb 2017 17:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/y50/Yti+RmxQAHGi+Wh9T+ZvxGYWzANFFXxsv0+9Ck=;
	b=Qk98ly9D3junCDHr+zQt8oDquyMADdE45CQ0Xd7XZ/0laE6OIWPYVk+8EHDLKvEXJa
	jHD6l4/JcIg5Vhbk+kEYLsnS7jjzz9zL79oSKByQwHlFeVkzJTrAk49oy1JqF0z7ZMoJ
	IYwjTk+i7SntdESf/ArGGCjsl+FwfH/szBeqMLhNtAoN0cpJDvW0rOVlUhYkMjG5mL5x
	PISU9q9QbvwzhF+kZwpNpzd7Ihp8XrJhkZ7Vgra/sRdip+Paox1O8KZmA+6QaFSqzbiA
	d+xCS6jiWFjYzxe5cemROwCOSTklny3LDwE1C/LMO7f3DZ9IlVYF6XL0SbTRhvrTZjmJ
	BcOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/y50/Yti+RmxQAHGi+Wh9T+ZvxGYWzANFFXxsv0+9Ck=;
	b=S0zl79dZHf1DRBgr1axxnj+aGsOcBzkMRYHwTl15pzS+ZgCum4+WtdkcRZILFeZ9tn
	f42pOQBzkFJOAovQci6KTHOY/hZyvWH3UfThhfd16tCPRMp1HfqL19hWyS+Wm4q11CuT
	HtEyz8O94TWCJAGSZbJHw64YR5FURCL22yBVv+XmYUADDL7SxqLqapR0nUig++8LHvYo
	5Wv5Nwn8ebrjvi75JIp5h7nbWx0WVLvSpkBdvLn6D21ckZ1zbAmvQTajj9/B9dQVdseM
	ybtdyc1fze2tD3mjAxHc0QnFIVIM8V4Dtykm+Ip3AMuSx3kox/7xMImXzyheyJYjKTd4
	O2FQ==
X-Gm-Message-State: AIkVDXItXbFmmaeLqkbGYgJ4+694auYvMIPsHW8FsfmEtYzmXVfgdGPd3DUMFLJ/VXtPycVA9RrwabZUrUwMOw==
X-Received: by 10.31.115.142 with SMTP id o136mr5411931vkc.139.1486083906902; 
	Thu, 02 Feb 2017 17:05:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Thu, 2 Feb 2017 17:04:36 -0800 (PST)
In-Reply-To: <CAJ86T=XZSyyieay0Vdhm5Te+BXRKb5+SWjAUWwbLzSz-W4ni3g@mail.gmail.com>
References: <1485489993-29677-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1spAAtA=vjmUYx-WrpTmZjXrh0bdEmmesO=NS8BYEfNY8w@mail.gmail.com>
	<CAJ86T=X6SmEw9eJQAmmGUuq33e2vreHAuGZ77WDC1dHwwEsymg@mail.gmail.com>
	<CAJ86T=XZSyyieay0Vdhm5Te+BXRKb5+SWjAUWwbLzSz-W4ni3g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 2 Feb 2017 17:04:36 -0800
Message-ID: <CAMKF1sryQHLBxYXtMtV4Dsyek+NsoJoZSzTXHC_v0-=-=xejGw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: respect USE_LDCONFIG when setting default PACKAGECONFIG
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
X-List-Received-Date: Fri, 03 Feb 2017 01:05:07 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 2, 2017 at 4:58 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Mon, Jan 30, 2017 at 12:42 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> On Thu, Jan 26, 2017 at 10:18 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> On Thu, Jan 26, 2017 at 8:06 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>>> Avoid trying to call ldconfig at run-time in distros which force
>>>> USE_LDCONFIG to 0 and therefore don't provide it.
>
> Ping.
>
> Perhaps merge this simple patch first if there's no consensus on
> adding a distro config.


No, please ping the distro config patches instead.

>
>>>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>>>> ---
>>>>  meta/recipes-core/systemd/systemd_232.bb | 4 +++-
>>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta/recipes-core/systemd/systemd_232.bb b/meta/recipes-core/systemd/systemd_232.bb
>>>> index cc8781e..cfe6958 100644
>>>> --- a/meta/recipes-core/systemd/systemd_232.bb
>>>> +++ b/meta/recipes-core/systemd/systemd_232.bb
>>>> @@ -39,8 +39,10 @@ SRC_URI_append_libc-uclibc = "\
>>>>  "
>>>>  SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
>>>>
>>>> +USE_LDCONFIG ?= "1"
>>>
>>> now that we have more recipes using this variables. I think it should
>>> to global config space. May be have it as a DISTRO_FEATURE is more
>>> appropriate
>>
>> Patches for both approaches have now been sent to the list.
>>
>>>> +
>>>>  PACKAGECONFIG ??= "xz \
>>>> -                   ldconfig \
>>>> +                   ${@base_conditional('USE_LDCONFIG', '1', 'ldconfig', '', d)} \
>>>>                     ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
>>>>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
>>>>                     ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
>>>> --
>>>> 1.9.1
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


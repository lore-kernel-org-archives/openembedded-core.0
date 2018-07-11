Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id EEA39777EF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2018 10:38:46 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id i12-v6so48371587oik.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2018 03:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hJ0g0ioSbJxArAOfAwAnvRgHWD2d8zMVcOLKTSh0gCY=;
	b=MrYks9Y6xBp7u6fjW2nOPOeWgzHwna+XJDRh4bwrzd6sQhq7VFpQEIXeYWeNLUEuHR
	Zkm9sNGJVx1+ddz9zJHQGicbBB2AMw8HIgqNCucqxAmfLFcj/+uHJHz5wqJb0c5aVV6G
	afzqO10G1Nskd5UD/gjesA7+S2FmYfAqiJWmxl8ITxFpQlW6Mk7t8aVVLL45ScUhLeDs
	R/Tb3r4j9MzzmF3vRXhhCFXgFrPLu0nu/kyGChUdUpSAgdZCkcd4WAJvqSZU0SALr5/O
	asUpgNQPHTE+iiaZXNTcxerFmk9olKD+IR39qnAa3Tm/PzwxI1IkTyckQPwwBm4OCWgP
	rs8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hJ0g0ioSbJxArAOfAwAnvRgHWD2d8zMVcOLKTSh0gCY=;
	b=t/HnpCmX9WdPxQXy+LTYNO/WLnp6ic0iwTpV9bmjJMyaWhoGWrR43T1VssVoNA1+m2
	UT4hdSMQQkcpE7eNMlkCIqaA1xYJwloOf3ckOj7n6+qqp65UpeNTgtMY6zIulmPrvVrd
	JYanvOPpUfdZScGG+6xjaXSDdEOSXzojEBOTkWKqY+7sfhl/Pl5W83mF9aQWuR85/Nf9
	RgYEAP89eE7yneSTndwjjY5+uv71VS8MuHEwBp2WhHunzisvu/VXvdU3nW5NAzKjeWFU
	xomw16zzURMU+s0+KTaxFdcRTV0p4SKF3FWP3RIRnc6YMaADoHKK0hT52ojnAV4/P/mv
	Z3hw==
X-Gm-Message-State: APt69E2JqICZezOXb0Ki2q3IODeMDVarzTOq/b4qeH0paNSeFsgK1YLi
	VIVdAw4JdcySyZKr3LNpMPgOG5bnDiPybBgkgBH24g==
X-Google-Smtp-Source: AAOMgpcissAynW6Am0YtAl5zqKn9xpVnbfXvM/Hl9NUNTi2WvGa/JBeRC0GHZg+rTkecqjYNEEpOnCY1+JDrRRv3MU4=
X-Received: by 2002:aca:4c8e:: with SMTP id
	z136-v6mr33847331oia.170.1531305527891; 
	Wed, 11 Jul 2018 03:38:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Wed, 11 Jul 2018 03:38:27
	-0700 (PDT)
In-Reply-To: <3cf12664-4fac-2311-eb39-37722dd5d6e3@windriver.com>
References: <cover.1529919069.git.Qi.Chen@windriver.com>
	<c8a7632a1f27b73ac623c5399ed4e452f2b37571.1529919069.git.Qi.Chen@windriver.com>
	<CAJTo0LaW-4wBMWcp+ZdDJd0kKQMm_fRGo6nQph3GKXPJ6SuCPQ@mail.gmail.com>
	<838c72f4-251b-5183-073e-e83c93230e93@windriver.com>
	<0cdaabbf-0716-53d9-17b8-3daa0ca70f57@windriver.com>
	<3cf12664-4fac-2311-eb39-37722dd5d6e3@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 11 Jul 2018 11:38:27 +0100
Message-ID: <CAJTo0LZx+-2LdYuA3bMcHWVQruq2c7X8S5t4keGy9RZ8zAHFYw@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] oeqa/runtime/cases/systemd.py: avoid timeout problem
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
X-List-Received-Date: Wed, 11 Jul 2018 10:38:47 -0000
Content-Type: text/plain; charset="UTF-8"

The problem is that when the system is loaded, systemctl calls may be
too slow and they will time out.  This patch simply changes *one* of
the many systemctl calls to use busctl directly, leaving many other
calls as a potential failure point.

Surely a better solution would be to patch in a way to override the
timeout, so we can pass that in all calls.

Ross

On 11 July 2018 at 06:46, ChenQi <Qi.Chen@windriver.com> wrote:
> ping
>
> Is there some problem with this patch?
>
> Recently when I'm doing testimage test for systemd upgrade, the 'systemctl
> list-unit-files' command in this test case revealed a 'segment fault' error
> on musl qemuarm.
> So I'd suggest to keep 'systemctl list-unit-files' command and use 'busctl'
> as a fallback in case of timeout.
>
> Best Regards,
> Chen Qi
>
>
> On 07/04/2018 06:05 PM, ChenQi wrote:
>>
>> ping
>>
>>
>> On 06/26/2018 09:48 AM, ChenQi wrote:
>>>
>>> On 06/25/2018 09:40 PM, Burton, Ross wrote:
>>>>
>>>> The busctl invocation will only rarely be called so is very prone to
>>>> bitrot, maybe it should just always use busctl?
>>>>
>>>> Personally I think that there should be a way for VM time to be
>>>> independent of host time to avoid this sort of problem...
>>>>
>>>> Ross
>>>
>>>
>>> Hi Ross,
>>>
>>> I now realize that I didn't include enough information in the commit
>>> message.
>>> In fact, for qemuarm, this problem always appeared.
>>> Compared to other qemu bsps (e.g. qemux86-64), qemuarm is running much
>>> slower.
>>>
>>> I've now updated the commit the message to include this qemuarm info, and
>>> also updated the remote branch.
>>>
>>>   git://git.pokylinux.org/poky-contrib ChenQi/systemd-bus-timeout
>>>
>>> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/systemd-bus-timeout
>>>
>>>
>>> If you think we should still use `busctl' directly, I can send out a new
>>> patch. Either way is OK to me.
>>>
>>> Best Regards,
>>> Chen Qi
>>>
>>>> On 25 June 2018 at 10:33, Chen Qi <Qi.Chen@windriver.com> wrote:
>>>>>
>>>>> I've encountered the following error when doing testimage.
>>>>>
>>>>>    RESULTS - systemd.SystemdBasicTests.test_systemd_list - Testcase
>>>>> 551: FAILED
>>>>>
>>>>> After investigation, I found that it's not functionality issue. It's
>>>>> just that the qemu was not running fast enough. And it resulted 'time
>>>>> out'
>>>>> problem when using `systemctl list-unit-files'.
>>>>>
>>>>> The correctness could be verified by using 'busctl' directly.
>>>>> e.g.
>>>>> busctl --timeout=240 call org.freedesktop.systemd1 \
>>>>> /org/freedesktop/systemd1 org.freedesktop.systemd1.Manager \
>>>>> ListUnitFilesByPatterns asas 0 0
>>>>>
>>>>> Checking the source codes, I can see that the timeout is 25s. I don't
>>>>> think we should patch systemd's source codes just for such a simple
>>>>> runtime test case.
>>>>>
>>>>> So instead, I change the test case to use 'busctl' directly if
>>>>> 'systemctl list-unit-files' gets a timeout error.
>>>>>
>>>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>>>> ---
>>>>>   meta/lib/oeqa/runtime/cases/systemd.py | 14 +++++++++++++-
>>>>>   1 file changed, 13 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/meta/lib/oeqa/runtime/cases/systemd.py
>>>>> b/meta/lib/oeqa/runtime/cases/systemd.py
>>>>> index db69384..b4f1025 100644
>>>>> --- a/meta/lib/oeqa/runtime/cases/systemd.py
>>>>> +++ b/meta/lib/oeqa/runtime/cases/systemd.py
>>>>> @@ -81,7 +81,19 @@ class SystemdBasicTests(SystemdTest):
>>>>>       @OETestID(551)
>>>>> @OETestDepends(['systemd.SystemdBasicTests.test_systemd_basic'])
>>>>>       def test_systemd_list(self):
>>>>> -        self.systemctl('list-unit-files')
>>>>> +        command = 'systemctl list-unit-files'
>>>>> +        status, output = self.target.run(command)
>>>>> +        message = '\n'.join([command, output])
>>>>> +        match = re.search('Connection timed out', output)
>>>>> +        if match:
>>>>> +            # it's possible that qemu is running slow
>>>>> +            # use busctl to check the results with timeout set to 240s
>>>>> +            command = 'busctl --timeout=240 call
>>>>> org.freedesktop.systemd1 /org/freedesktop/systemd1
>>>>> org.freedesktop.systemd1.Manager ListUnitFilesByPatterns asas 0 0'
>>>>> +            status, output = self.target.run(command)
>>>>> +            message = '\n'.join([command, output])
>>>>> +            self.assertEqual(status, 0, message)
>>>>> +        else:
>>>>> +            self.assertEqual(status, 0, message)
>>>>>
>>>>>       @OETestID(550)
>>>>> @OETestDepends(['systemd.SystemdBasicTests.test_systemd_basic'])
>>>>> --
>>>>> 1.9.1
>>>>>
>>>>> --
>>>>> _______________________________________________
>>>>> Openembedded-core mailing list
>>>>> Openembedded-core@lists.openembedded.org
>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>>
>>>
>>
>


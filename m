Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id EEE657858E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Feb 2018 21:40:02 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id f3so134212wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Feb 2018 13:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OolhO/LaaUraq+VtWXiXhTcAPz4WRHpmGBMh2qwFyz8=;
	b=b+nF7OWbQj372QcOhwvLD8FrfeuQCRQS5l3uCWGQLoOGFZdn/Dm3GI14NETeO8mKML
	chveiBdoSXIaCDn6/uMVDpayGbzsj4JAckp49zw0nfHn3sMDFVcAlADRxmKOQUWuBvly
	Iv4ofik81T8KWwz5yPE3WS3QiG+tjLNMFcSu/D2h/eVAljgsINKQ9FE4AZJuM6q47ANv
	dtj/08O7Z4ctXX2evT+uDqrsegbhAy3pVMqXwDsl8gTqoAlRMNeEdghkmF8emBldCMJC
	FIBHZe8cMq/YqH5jEUsx0G3hszt6+Qxe0OLsKNuL93culL6vMT2w9oJ6fCGjbVIkaipR
	Pvew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OolhO/LaaUraq+VtWXiXhTcAPz4WRHpmGBMh2qwFyz8=;
	b=J+C676TtP0nDtkJcrHlJ0hatcCJBc+ZBFMgMud61KsjqEFbaZou4uQiu0VoeHKc6+H
	zh6WW5Qn3ZE9Z//r4RpKMR0EFu6FR5GyuAvP1tCnWTdzi0RU5yPUySQY+thUu3FY7+hA
	OOuCFHlqlmYbjnS1TsPpsSTuw0qwNB9n3hNqoy8xrTcOW/fLVpJpf+WdL3oisJ9YEAov
	lGhvsJjxVsU/uhpNhuyhuyROHpkOIuQZipL+i0jmejWfoRrGp1hlRaMPewOw0RQLreYE
	W3HUjPgQr8c01BuRazpFf61y75XQpdoN9FW6bP8+DHNJF5+M4iCK7T8idnOy5P2r7lBy
	e65w==
X-Gm-Message-State: APf1xPB7jk5d6OuJbkxPZhJEWnE4Hssu5GqNq/DUF0IEIC5+uBXTunyF
	FwYLyOrCDzjb+/VygJi3/hDAwEezXSQVpSB9+R4=
X-Google-Smtp-Source: AH8x226mlJGmBU/23/ZafCmxgpcYfhSzE9nvPYuwhGGg4bc501a2zWw3Otkp5TmU/7q8xegesyLOeuegB4aU5leklcw=
X-Received: by 10.28.30.130 with SMTP id e124mr3286772wme.153.1519249202544;
	Wed, 21 Feb 2018 13:40:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.173.193 with HTTP; Wed, 21 Feb 2018 13:40:02 -0800 (PST)
In-Reply-To: <CAJ86T=WiHB_6J8Rj0YXv7MTqu7xBgLFt9+09W+UsEjKd-PoyAA@mail.gmail.com>
References: <1512524120-16006-1-git-send-email-armccurdy@gmail.com>
	<CAJ86T=WiHB_6J8Rj0YXv7MTqu7xBgLFt9+09W+UsEjKd-PoyAA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 21 Feb 2018 13:40:02 -0800
Message-ID: <CAJ86T=Ur=A8XQH=UJu9NmxE7KmPgYmWN0bLL8X1akvV0vLNA7w@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [morty][PATCH] lib/oe/terminal.py: use an absolute path to execute oe-gnome-terminal-phonehome
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
X-List-Received-Date: Wed, 21 Feb 2018 21:40:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 23, 2018 at 12:16 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Tue, Dec 5, 2017 at 5:35 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> From: Ming Liu <liu.ming50@gmail.com>
>>
>> A flaw was found on my Ubuntu 14.04.5 LTS, on which that gnome-terminal is
>> the default terminal, when I run any of the tasks:
>> bitbake busybox -c menuconfig/devshell/devpyshell
>> bitbake virtual/kernel -c menuconfig/devshell/devpyshell
>>
>> I got a error as follows:
>> "Failed to execute child process "oe-gnome-terminal-phonehome" (No such file or directory)"
>>
>> Seems the environment of the process calling Popen is not passed to the
>> child process, this behaviour is a known issue in Python bug tracker:
>> http://bugs.python.org/issue8557
>>
>> It could be fixed by using an absolute path instead per test.
>
> Ping.

Ping again.

>> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> (cherry picked from commit 2117c148ef07d84bc605768e3b3671b0126b9337)
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  meta/lib/oe/terminal.py | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
>> index 3c8ef59..df4c75b 100644
>> --- a/meta/lib/oe/terminal.py
>> +++ b/meta/lib/oe/terminal.py
>> @@ -67,7 +67,7 @@ class Gnome(XTerminal):
>>          import tempfile
>>          pidfile = tempfile.NamedTemporaryFile(delete = False).name
>>          try:
>> -            sh_cmd = "oe-gnome-terminal-phonehome " + pidfile + " " + sh_cmd
>> +            sh_cmd = bb.utils.which(os.getenv('PATH'), "oe-gnome-terminal-phonehome") + " " + pidfile + " " + sh_cmd
>>              XTerminal.__init__(self, sh_cmd, title, env, d)
>>              while os.stat(pidfile).st_size <= 0:
>>                  continue
>> --
>> 1.9.1
>>


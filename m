Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 242FD788E3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2018 04:15:25 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id z12so10783527wrg.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Mar 2018 20:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FCctVUdy+HuuQ+bII8sSlFogRbHpld1MgVYPbJYAerM=;
	b=eMdgv/w2EUY0YSDivHlkJOCZl9xpr33oJX80p1TVAw67/Cx/Mj1f6KxWz9Mu0l73sc
	iIZwA3nYk9bCz+WPUTjpXpnZblKkJvfuwn6xHLWHRp8wPJPazW/g9aRYnYFem3+l0g/v
	aEdE/uracF71NKno35xe7j1Re48TXoczLaxyrBfHpmyxG4W3HcgxRmCI1Zg/CGtX1vrX
	1WanrJYklRtFyzXnHSs+1BzaDeWS/crRKJ4ooUNmMACbxPQZ4bKqr5/x53+MWxTEJpXM
	FeBcyJltH6ZDKhNf+d6vq4MB3ZJ4wHci6tHVNBwv7Q5DH7j3IqCK0DG4Urk4DNt/Zwyn
	jJrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FCctVUdy+HuuQ+bII8sSlFogRbHpld1MgVYPbJYAerM=;
	b=AlV6NG8teO9yBx5NKk2d/csA8nH8+5EaqSkjenwihxw/eAZaIpsZXD5hPv4Z7vU81g
	rEjdQPSFfvUDVIpJ0T9H4FYLM30V3O6a1tHD8JoBv/s9QJVJY5nxEpsy1KquDikGN29L
	nALLz1xBuF+FHGhvbiqQNU/ftp4DcH3/3RX14wjg0bdmb93/El9Qz6A+IDko+81WItrZ
	3qR9Hf4CXIlqbPqZQRVZ1kQonI/EXIbzS2H4Fk4nws5uwhWZGyihvzSrsq/S5gYewtxw
	syxP95acb/qDSiyGC+9+XvnkobwGZrQoGK+kKamJ9eeup2yIrRt7P6by1NKSVWL9P4JQ
	aiww==
X-Gm-Message-State: AElRT7HY5hMaM8jKzcjy+BneppGVn+17IFHGDgz3v4lU6PkDfqJ2iRRz
	1x2yDo1rnDV5qi969oJbCPUBGHnh9Npg/il3LcdPIA==
X-Google-Smtp-Source: AG47ELszAFLC+rWaUuW+uhyph3uC0vSfBGwtNWXMbR0Ulc6t32ED12S6WLE05Gr0llAjpv2j+MMbmyE18zaCfEp4vbI=
X-Received: by 10.223.182.135 with SMTP id j7mr326234wre.66.1520655326692;
	Fri, 09 Mar 2018 20:15:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.173.65 with HTTP; Fri, 9 Mar 2018 20:15:26 -0800 (PST)
In-Reply-To: <CAJ86T=Ur=A8XQH=UJu9NmxE7KmPgYmWN0bLL8X1akvV0vLNA7w@mail.gmail.com>
References: <1512524120-16006-1-git-send-email-armccurdy@gmail.com>
	<CAJ86T=WiHB_6J8Rj0YXv7MTqu7xBgLFt9+09W+UsEjKd-PoyAA@mail.gmail.com>
	<CAJ86T=Ur=A8XQH=UJu9NmxE7KmPgYmWN0bLL8X1akvV0vLNA7w@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 9 Mar 2018 20:15:26 -0800
Message-ID: <CAJ86T=U+mP5KPJBUL+18i3g21nCiMX_JNi0_Ad2mj5iGNqFvog@mail.gmail.com>
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
X-List-Received-Date: Sat, 10 Mar 2018 04:15:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 21, 2018 at 1:40 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Tue, Jan 23, 2018 at 12:16 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> On Tue, Dec 5, 2017 at 5:35 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>> From: Ming Liu <liu.ming50@gmail.com>
>>>
>>> A flaw was found on my Ubuntu 14.04.5 LTS, on which that gnome-terminal is
>>> the default terminal, when I run any of the tasks:
>>> bitbake busybox -c menuconfig/devshell/devpyshell
>>> bitbake virtual/kernel -c menuconfig/devshell/devpyshell
>>>
>>> I got a error as follows:
>>> "Failed to execute child process "oe-gnome-terminal-phonehome" (No such file or directory)"
>>>
>>> Seems the environment of the process calling Popen is not passed to the
>>> child process, this behaviour is a known issue in Python bug tracker:
>>> http://bugs.python.org/issue8557
>>>
>>> It could be fixed by using an absolute path instead per test.
>>
>> Ping.
>
> Ping again.

And again...

It looks like this (and a couple of other patches) made it as far as:

  http://git.openembedded.org/openembedded-core-contrib/log/?h=stable/morty-next

but then got stuck or forgotten?

>>> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>> (cherry picked from commit 2117c148ef07d84bc605768e3b3671b0126b9337)
>>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>>> ---
>>>  meta/lib/oe/terminal.py | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
>>> index 3c8ef59..df4c75b 100644
>>> --- a/meta/lib/oe/terminal.py
>>> +++ b/meta/lib/oe/terminal.py
>>> @@ -67,7 +67,7 @@ class Gnome(XTerminal):
>>>          import tempfile
>>>          pidfile = tempfile.NamedTemporaryFile(delete = False).name
>>>          try:
>>> -            sh_cmd = "oe-gnome-terminal-phonehome " + pidfile + " " + sh_cmd
>>> +            sh_cmd = bb.utils.which(os.getenv('PATH'), "oe-gnome-terminal-phonehome") + " " + pidfile + " " + sh_cmd
>>>              XTerminal.__init__(self, sh_cmd, title, env, d)
>>>              while os.stat(pidfile).st_size <= 0:
>>>                  continue
>>> --
>>> 1.9.1
>>>


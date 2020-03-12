Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 51D8C61C2D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 16:13:09 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id z65so3487276pfz.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 09:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=+xNY3Tn5/lxVWrwj3+kUW3n6l9Ni1qUEcYWVlwyA9GY=;
	b=ufQYbT2vP2vFVYTMacNZoof2CRRHG08qk9fE/cZHpBj9cjNqz1pw5KUy3Ffp3LepXg
	QO+6TEqadunss0yC9Fp8uyd2/qjaqH5PVJppGkc8am+jvNjuUdhRlc3MvUFCzVDkDeNn
	Vo2HnhKSV0oUcyKOoFGt4aLQ0WcAEI6XgVakgyZVRCJ8C5uM+XFiAC+RMWY6/QK9BXDi
	JNxC0ThzORZvHGXeoUpYt/uLEAG66MZdFg9kQ3Vp6aNpz6zRVHrnuj8yeQYbmHgNCeKT
	M6XeKQqXuioa+fDmPAnIUje5jZx90QmK4bzzWTQQVkgT4g/SSrgnUL2E4aoz7szHrgjC
	Z7rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=+xNY3Tn5/lxVWrwj3+kUW3n6l9Ni1qUEcYWVlwyA9GY=;
	b=QGdIc/HyZ+6TeAai0OZmZb5P4fsl3o/ot+iJoJmP1KjViGQdNX0QbUxiI+pAhFfCAS
	+N+xz3q+WUzm33WUfmUwH/CgqJFhM4jvNTmN8nzRaZcnTKMu1AhT+Zh+sT9bMB5gS0CS
	ONiK7CZFfQvQ8svNHzV/5D5KE8auuAbUr9b7mf+aWChMKQicFtx71LhyQzAS8mKxs48h
	5q9Mydva+jIhTE3jJea+YeVQue2YW1I0IbfcNYG2p73ICf94K5i+TvUTMXp+dFt2ybYa
	JmsK8Uhp4cYHIWZnAoGwdIq94///Wiuuy+W5yCdjNaeG+CywO089jJGtE2BfJ1BW4BIU
	Y2mQ==
X-Gm-Message-State: ANhLgQ2imxVPSYptAIiB2tal3HpGmlfdhr5BA9wFd1o2ffzt0lmIpjGI
	Gy1AqhJDp/lYvh8vIKxYvVOtDo44994=
X-Google-Smtp-Source: ADFU+vv4GqGuteX427vL51WPRkBSaKrPG0PxJ2eqlZWCFIzCOhSpRrX+tA+TClepmOx6e5FxuXUfzA==
X-Received: by 2002:aa7:958f:: with SMTP id z15mr7316192pfj.130.1584029589996; 
	Thu, 12 Mar 2020 09:13:09 -0700 (PDT)
Received: from ?IPv6:2601:646:9200:4e0:d558:25ee:538d:b97a?
	([2601:646:9200:4e0:d558:25ee:538d:b97a])
	by smtp.gmail.com with ESMTPSA id u3sm9369911pjv.32.2020.03.12.09.13.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 12 Mar 2020 09:13:09 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <VI1PR10MB366487DDF67A917978FD21D7FDFD0@VI1PR10MB3664.EURPRD10.PROD.OUTLOOK.COM>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <80a2ec8e-cb96-9e2c-77e4-64fc2d5163dc@gmail.com>
Date: Thu, 12 Mar 2020 09:13:08 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <VI1PR10MB366487DDF67A917978FD21D7FDFD0@VI1PR10MB3664.EURPRD10.PROD.OUTLOOK.COM>
Subject: Re: runqemu nographic and hvc0
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
X-List-Received-Date: Thu, 12 Mar 2020 16:13:09 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 3/12/20 8:21 AM, Marko, Peter wrote:
> Hi,
> 
> I'm trying to boot my own qemu image on zeus branch with "runqemu nographic /path/to/extracted/rootfs" but I have problem that console is flooded with
> process '/sbin/getty 115200 hvc0' (pid 383) exited. Scheduling for restart.
> starting pid 385, tty '': '/sbin/getty 115200 hvc0'
> I'm using yocto qemuarm kernel and qemuarm machine (but it's the same with qemuarm64).
> 
> Basically qemuarm machine has
> SERIAL_CONSOLES ?= "115200;ttyAMA0 115200;hvc0"
> which is transferred to /etc/inittab, however hvc0 device does not exist after booting in nographic mode.
> 
> What kind of configuration am I missing in my image?
> I think that might be the graphic console which does not exist in nographic mode?

that is correct

> Is there a way to get rid of this problem without breaking graphic mode console?

I did not find one, it particularly happens with busybox init.

> 
> Thanks,
>    Peter
> 


Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7EC8E6C10F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 03:41:19 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id y8so2635906plk.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 20:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=2s348W++ERbqCL6dD1DmcIp8x+aynTHWd4vd+ieuvr0=;
	b=exsMpxCqU9QByrkZL+vTleYN+Xe3vqykbagzyQy5gKUc4xcpD/E8Px9245fyd/paLR
	Imni0pqgYeyDfDAIAJcrCryUOe0ZbtWYXmKu3j37+d2XhFbCk9PObXqn3ElrOsOc6cnY
	FMRt0FlUlPVhfHszTU2j3qVWbbg8t3Olfa7JCdmw1rUFwsZSX/wfNBTI7b0zV0vT0naB
	zXT9hQfQJQWjQonvrq7vVqKm9YVGkix7YHXy4b5UR5iq54GDM4C8wPRlDm0PzN4rfXji
	cQKka6QjCODGmlOcZKdbhlvK9LATVHbE1tR1yKskJZeiAtJv0Y+4zS9Qn3oBqNtjm4Da
	wGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=2s348W++ERbqCL6dD1DmcIp8x+aynTHWd4vd+ieuvr0=;
	b=d0vDUYi6jV6Ib9imG21frZ3JCYdaFlXMlP+haBvE3Mda555A+m4JZmeDNu5Tgos2G4
	3DuId0Jb7ETmEx0d0oa+qmjEQ0dgnXwxBf+DU44UbXzFq7lRvDVlVOWfleSYPBK3o4e2
	mzWAyuPco7LlX770S/udx/vJRvpmCbQHQ4+DCtW/CJl4r+/qZsYbCgu+EWpznuQqQC70
	fLb2GfOxLMGQy+WlQis74UiIFYxowblG0I6U8ye2RLsm6+QeNs4jgLBfUISlYo21CJKk
	z66j+v3Cj4EO7yz11MCL2owDqxwE9ukCKbkLtYQfw2qI9Y3oYW1KNs9sXgnnDHOvFZQj
	dXIw==
X-Gm-Message-State: APjAAAWx7XqP4O2wT+eyDIbmCkAu+wYQ2I5S+a0d87fGAqXMHs3VHlVl
	3r9IwlvDTrQseXAIzHSfynJN7O/J
X-Google-Smtp-Source: APXvYqwtmuG2KvcMVVKSEbsDQneIoCIy8zUWsYbIJOQXRqcw3RQeKun5c1h2U0a838UWdNrW/PwPjA==
X-Received: by 2002:a17:902:6b8a:: with SMTP id
	p10mr13673186plk.192.1571888480290; 
	Wed, 23 Oct 2019 20:41:20 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:f44c:1fc7:d2e8:7fe1?
	([2601:202:4180:a5c0:f44c:1fc7:d2e8:7fe1])
	by smtp.gmail.com with ESMTPSA id
	r19sm22297643pgj.43.2019.10.23.20.41.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Oct 2019 20:41:19 -0700 (PDT)
To: Haiqing Bai <Haiqing.Bai@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <1571884385-3662-1-git-send-email-Haiqing.Bai@windriver.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <d75b6ca2-ab06-1487-a526-8ebf7e798fc5@gmail.com>
Date: Wed, 23 Oct 2019 20:41:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1571884385-3662-1-git-send-email-Haiqing.Bai@windriver.com>
Subject: Re: [PATCH] unfs3: fixed the issue that unfsd consumes 100% CPU
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
X-List-Received-Date: Thu, 24 Oct 2019 03:41:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 10/23/19 7:33 PM, Haiqing Bai wrote:
> The 'accept' function on the socket of unfsd daemon
> is always in below error state:
> accept(4, 0x7ffd5e6dddc0, [128]) = -1 EINVAL (Invalid argument)
> accept(6, 0x7ffd5e6dddc0, [128]) = -1 EINVAL (Invalid argument)
with backport to zeus?


>
> And 'strace -c -p <the pid of unfsd>' shows:
> % time     seconds  usecs/call     calls    errors syscall
> ------ ----------- ----------- --------- --------- ----------------
>  70.87    0.005392           0    513886    513886 accept
>  29.13    0.002216           0    256943           poll
>
> This error state is in the 'for' loop of the daemon, so it consumes 100%
> CPU. The reason is that 'listen' is not called for the TCP socket before
> 'accept'. Actually the called 'svc_tli_create' from libtirpc will not call
> 'listen' on a bound socket.
>
> Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
> ---
>  .../0001-Add-listen-action-for-a-tcp-socket.patch  | 54 ++++++++++++++++++++++
>  meta/recipes-devtools/unfs3/unfs3_git.bb           |  1 +
>  2 files changed, 55 insertions(+)
>  create mode 100644 meta/recipes-devtools/unfs3/unfs3/0001-Add-listen-action-for-a-tcp-socket.patch
>
> diff --git a/meta/recipes-devtools/unfs3/unfs3/0001-Add-listen-action-for-a-tcp-socket.patch b/meta/recipes-devtools/unfs3/unfs3/0001-Add-listen-action-for-a-tcp-socket.patch
> new file mode 100644
> index 0000000..e9b9d3d
> --- /dev/null
> +++ b/meta/recipes-devtools/unfs3/unfs3/0001-Add-listen-action-for-a-tcp-socket.patch
> @@ -0,0 +1,54 @@
> +From b42ab8e1aca951dd06c113159491b3fd5cf06f2e Mon Sep 17 00:00:00 2001
> +From: Haiqing Bai <Haiqing.Bai@windriver.com>
> +Date: Thu, 24 Oct 2019 09:39:04 +0800
> +Subject: [PATCH] Add "listen" action for a tcp socket which does not call
> + 'listen' after 'bind'
> +
> +It is found that /usr/bin/unfsd customus 100% cpu after starting qemu with 'nfs'
> +option, and below lots of error messages shows when strace the process:
> +
> +poll([{fd=3, events=POLLIN|POLLPRI|POLLRDNORM|POLLRDBAND},{fd=4, events=POLLIN|POLLPRI|POLLRDNORM|POLLRDBAND},
> +{fd=5, events=POLLIN|POLLPRI|POLLRDNORM|POLLRDBAND},{fd=6, events =POLLIN|POLLPRI|POLLRDNORM|POLLRDBAND}],
> +4, 2000) = 2 ([{fd=4, revents=POLLHUP},{fd=6, revents=POLLHUP}])
> +accept(4, 0x7ffd5e6dddc0, [128]) = -1 EINVAL (Invalid argument)
> +accept(6, 0x7ffd5e6dddc0, [128]) = -1 EINVAL (Invalid argument)
> +
> +% time     seconds  usecs/call     calls    errors syscall
> +------ ----------- ----------- --------- --------- ----------------
> + 70.87    0.005392           0    513886    513886 accept
> + 29.13    0.002216           0    256943           poll
> +  0.00    0.000000           0         4           read
> +
> +The root cause is that 'listen' is not called for the binded
> +socket. The depended libtipc does not call 'listen' if found
> +the incomming socket is binded, so 'accept' reports the error
> +in the 'for' loop and cpu consumed.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
> +---
> + daemon.c | 7 +++++++
> + 1 file changed, 7 insertions(+)
> +
> +diff --git a/daemon.c b/daemon.c
> +index 028a181..4c85903 100644
> +--- a/daemon.c
> ++++ b/daemon.c
> +@@ -814,6 +814,13 @@ static SVCXPRT *create_tcp_transport(unsigned int port)
> + 	    fprintf(stderr, "Couldn't bind to tcp port %d\n", port);
> + 	    exit(1);
> + 	}
> ++
> ++	if (listen(sock, SOMAXCONN) < 0) {
> ++	    perror("listen");
> ++	    fprintf(stderr, "Couldn't listen on the address \n");
> ++	    close(sock);
> ++	    exit(1);
> ++	}
> +     }
> + 
> +     transp = svctcp_create(sock, 0, 0);
> +-- 
> +1.9.1
> +
> diff --git a/meta/recipes-devtools/unfs3/unfs3_git.bb b/meta/recipes-devtools/unfs3/unfs3_git.bb
> index 79d0978..d60cee8 100644
> --- a/meta/recipes-devtools/unfs3/unfs3_git.bb
> +++ b/meta/recipes-devtools/unfs3/unfs3_git.bb
> @@ -23,6 +23,7 @@ SRC_URI = "git://github.com/unfs3/unfs3.git;protocol=https \
>             file://tcp_no_delay.patch \
>             file://0001-daemon.c-Libtirpc-porting-fixes.patch \
>             file://0001-attr-fix-utime-for-symlink.patch \
> +           file://0001-Add-listen-action-for-a-tcp-socket.patch \
>            "
>  SRCREV = "c12a5c69a8d59be6916cbd0e0f41c159f1962425"
>  UPSTREAM_CHECK_GITTAGREGEX = "unfs3\-(?P<pver>.+)"



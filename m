Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id CC5846E666
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 17:02:13 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 207so15653916pgc.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 09:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=75UT5GKj/MwJm3qFIGogYE3Pg+pBeVGNk6PQ71zNXUI=;
	b=NwrBO862flCrxUxdnoQJui2U90j7SOkZWV/WEo6xXVCJ+Iai9TSiM+6SMeJiOWOC09
	kzYkIfpzDcBWm+HiiUxYisM0k5/9kpj0AH2QX/YdMjh5C91lwkWVNNGRDliaL457DOCq
	W2F76/uWfOL4Dwo7bcLywtkbTlyEYYITTFKeDX76bT5o1b/T+l6LYidOl0IxtD2QLaX3
	NSNaa5BBighPsGZjaoyWPxU/1+Tn0Nycsc29+jOcDwibg8aEJ4sJdrW9xxET5dBC1QXB
	n3jrLGAvaj5csYUWmH3kVO94P87CMfByisxgnKvIIZnJLMNRLuQW6eWMVdmxYkUsfaUM
	jnqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=75UT5GKj/MwJm3qFIGogYE3Pg+pBeVGNk6PQ71zNXUI=;
	b=QgU/lHXTVnuQ+PBCVCbvtgJPRxSDZV3+vdTWldsMPxfFY9EPtKvQ3jhM0ui6EGuu0m
	VMtGPaPwEVnaA5UB3FJeelSn++Px26jMh4Yw8Pdxw08EY0yQxW0CAmcrqfMquUJQzwCy
	9yEa7Xum1hEt92CD3+XnzBV2/YzL3dcyKvkAjmfWk0FGsocnAoEhkbet8UHRHkHrYgck
	N0jA+kR/jR1SoJqRDqCnUdKT2gJTaoEsxpQDj2Hc5V0NQl7R1969LsTg0znpebBTCx7I
	oeel8et8dMbdgdtn7Qpgk/tAWLn2uVJJWphUk50CT9wm8LlQwnxmaRyqNr3oI6GzpQKH
	Exqw==
X-Gm-Message-State: AJaThX4gIYwGTUQQDn8tzqIK2bolTG3AkSWLQbMODUn13qnHCenG7tiz
	qMDHQAQ5Ng0/XKO/ScUIxo6PAw==
X-Google-Smtp-Source: AGs4zMYPQIRLpjMJzzQWTJvLDqoB/wa2TWHvs72u6/ClKmXAbC7q/yDLmtdaDUgm5qHlDZ/KhvsaQw==
X-Received: by 10.101.97.173 with SMTP id i13mr14003093pgv.449.1511542934750; 
	Fri, 24 Nov 2017 09:02:14 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:2178:58dc:281c:c010?
	([2601:202:4001:9ea0:2178:58dc:281c:c010])
	by smtp.gmail.com with ESMTPSA id
	68sm40417226pfk.162.2017.11.24.09.02.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Nov 2017 09:02:14 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <1511202957-3269-1-git-send-email-armccurdy@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <0a1fc46c-1d37-5b0c-96ea-089f990df5f4@gmail.com>
Date: Fri, 24 Nov 2017 09:02:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1511202957-3269-1-git-send-email-armccurdy@gmail.com>
Subject: Re: [pyro][PATCH] lib/oe/terminal.py: use an absolute path to execute oe-gnome-terminal-phonehome
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
X-List-Received-Date: Fri, 24 Nov 2017 17:02:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

in stable/pyro-next


On 11/20/2017 10:35 AM, Andre McCurdy wrote:
> From: Ming Liu <liu.ming50@gmail.com>
>
> A flaw was found on my Ubuntu 14.04.5 LTS, on which that gnome-terminal is
> the default terminal, when I run any of the tasks:
> bitbake busybox -c menuconfig/devshell/devpyshell
> bitbake virtual/kernel -c menuconfig/devshell/devpyshell
>
> I got a error as follows:
> "Failed to execute child process "oe-gnome-terminal-phonehome" (No such file or directory)"
>
> Seems the environment of the process calling Popen is not passed to the
> child process, this behaviour is a known issue in Python bug tracker:
> http://bugs.python.org/issue8557
>
> It could be fixed by using an absolute path instead per test.
>
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 2117c148ef07d84bc605768e3b3671b0126b9337)
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/lib/oe/terminal.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
> index 89ddb46..2f18ec0 100644
> --- a/meta/lib/oe/terminal.py
> +++ b/meta/lib/oe/terminal.py
> @@ -224,7 +224,7 @@ def spawn(name, sh_cmd, title=None, env=None, d=None):
>      import time
>      pidfile = tempfile.NamedTemporaryFile(delete = False).name
>      try:
> -        sh_cmd = "oe-gnome-terminal-phonehome " + pidfile + " " + sh_cmd
> +        sh_cmd = bb.utils.which(os.getenv('PATH'), "oe-gnome-terminal-phonehome") + " " + pidfile + " " + sh_cmd
>          pipe = terminal(sh_cmd, title, env, d)
>          output = pipe.communicate()[0]
>          if output:



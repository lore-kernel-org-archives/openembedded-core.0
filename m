Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f47.google.com (mail-pl0-f47.google.com
	[209.85.160.47])
	by mail.openembedded.org (Postfix) with ESMTP id 4496C74D9C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Apr 2018 00:29:00 +0000 (UTC)
Received: by mail-pl0-f47.google.com with SMTP id c21-v6so12996623plz.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Apr 2018 17:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=5XS5JaC1+ayJoOB85FEsN49NMMsvLMwQuQcTo/midnk=;
	b=T4J4QhBMe4SoqnWb0ho1rCIKsJ2+Xuo3cvvwtrXjlObF/QzaZfvjx2XR/8Kaw1csNm
	z0X/+wudh/j4CD0wnbonfP2LltzpzDTleKQ8/ffwh6zcTsZSFjYtRDo+REiKj6AKjcPJ
	86ZYCwNJB5zmtu3mksh8DJ5rgHUIz9rKjg4LQ4XvnnUwBXW0knQAVgVQrZW/EaLB1f9j
	jam0GFJaIijf8KxVRWAXX8O/hcrB2FQHoimf4+g4kNbWpBdUcvX8WTioyBURFrtSAx5o
	+A0fTwTq/I8Fdi+GD2Ypb+qa1kt4gyg9yu6oNUQ5MtqfHAol4WUtJdhIUAhsGTZZUqDi
	h2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=5XS5JaC1+ayJoOB85FEsN49NMMsvLMwQuQcTo/midnk=;
	b=GKSiE7Goxk6l4/60T+hiNlN8ZZ2HXmvXRI5qFzK+sFJYR257X+xp6zuUCiFvOC2xiZ
	CDW+1PXwC4vLERhGTpuhaKiDniaLnH4Lgg1ifBQMkP9FCYz/7Gu2cBTZ57JAvm6MtYt/
	CXpZjmqkDGA7mAOMwD7Fd0bet6dbSqUMo+nIPAR+nIgvue4tH9icLWOwb2jZYDgnB5hT
	cV2BGBGfFjYnCx5TKZslK+zE1Lw5FXX9xsMESf8qghZKp7ifUI930G5UodbNLbIRRbTw
	2ytoDMmB8emB1cI1YS9WnEFzeL8z1/tz0USfrgx3O6cydd8hK8vaSXG2U4B7R5lQb+wP
	H7NA==
X-Gm-Message-State: ALQs6tBq8aTOoF+s+KmbWKsgfVFVQo8FN/7YYfDlr8Sh33KnIB0gu4xY
	5KWMrxtqohyOKGfkegVAbtsB5km4
X-Google-Smtp-Source: AIpwx49SyP3UAeEPbAyRDnDw+iXsg6llZ7B5V8LEfzEJzrnw2mfNnCt9NSbEu7eegmbmRSKvxNnpBw==
X-Received: by 2002:a17:902:7798:: with SMTP id
	o24-v6mr9928711pll.349.1522888141831; 
	Wed, 04 Apr 2018 17:29:01 -0700 (PDT)
Received: from ?IPv6:2601:646:8880:466c:fde8:8784:7436:3e7a?
	([2601:646:8880:466c:fde8:8784:7436:3e7a])
	by smtp.gmail.com with ESMTPSA id
	h20sm6418576pfn.118.2018.04.04.17.29.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Apr 2018 17:29:00 -0700 (PDT)
To: Tom Hochstein <tom.hochstein@nxp.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <AM5PR0402MB2817BAED1816216C67E76BC6E2A40@AM5PR0402MB2817.eurprd04.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <5910479d-230f-a502-d83e-53e3dc9cb2c1@gmail.com>
Date: Wed, 4 Apr 2018 17:29:00 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:59.0)
	Gecko/20100101 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <AM5PR0402MB2817BAED1816216C67E76BC6E2A40@AM5PR0402MB2817.eurprd04.prod.outlook.com>
Subject: Re: python3-native certificate failure
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
X-List-Received-Date: Thu, 05 Apr 2018 00:29:01 -0000
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 4/4/18 1:09 PM, Tom Hochstein wrote:
> I am trying to download a URL from a source package using
> python3-native, but it is failing with a certificate failure. I added
> DEPENDS on ca-certificates-native and python3-certifi-native, but it
> doesn’t seem to help. A colleague with a corresponding SDK took the
> aarch64 sysroot certificates and dropped them in x86_64 sysroot and the
> problem was fixed.
> 
>  

you might try adding nativesdk-ca-certificates to TOOLCHAIN_HOST_TASK
and regenerate SDK

> 
> Tom
> 
>  
> 
> r60874@tx30imx-01:~/rocko/build-xwayland$ bitbake imx-gpu-sdk -c devshell
> 
> root@tx30imx-01:~/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/imx-gpu-sdk/5.0.2-r0/git#
> python3
> 
> Python 3.5.3 (default, Mar  6 2018, 14:15:44)
> 
> [GCC 5.4.0 20160609] on linux
> 
> Type "help", "copyright", "credits" or "license" for more information.
> 
>>>> import urllib.request
> 
>>>>
> urllib.request.urlretrieve("https://sourceforge.net/projects/tclap/files/tclap-1.2.2.tar.gz",
> "~")
> 
> Traceback (most recent call last):
> 
>   File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/urllib/request.py",
> line 1254, in do_open
> 
>     h.request(req.get_method(), req.selector, req.data, headers)
> 
>   File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/http/client.py",
> line 1107, in request
> 
>     self._send_request(method, url, body, headers)
> 
>   File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/http/client.py",
> line 1152, in _send_request
> 
>     self.endheaders(body)
> 
>   File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/http/client.py",
> line 1103, in endheaders
> 
>     self._send_output(message_body)
> 
>   File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/http/client.py",
> line 934, in _send_output
> 
>     self.send(msg)
> 
>   File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/http/client.py",
> line 877, in send
> 
>     self.connect()
> 
>   File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/http/client.py",
> line 1261, in connect
> 
>     server_hostname=server_hostname)
> 
>   File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/ssl.py",
> line 385, in wrap_socket
> 
>     _context=self)
> 
>   File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/ssl.py",
> line 760, in __init__
> 
>     self.do_handshake()
> 
>   File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/ssl.py",
> line 996, in do_handshake
> 
>     self._sslobj.do_handshake()
> 
>   File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/ssl.py",
> line 641, in do_handshake
> 
>     self._sslobj.do_handshake()
> 
> ssl.SSLError: [SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed
> (_ssl.c:720)
> 
>  
> 
> During handling of the above exception, another exception occurred:
> 
>  
> 
> Traceback (most recent call last):
> 
>   File "<stdin>", line 1, in <module>
> 
>   File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/urllib/request.py",
> line 188, in urlretrieve
> 
>     with contextlib.closing(urlopen(url, data)) as fp:
> 
>   File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/urllib/request.py",
> line 163, in urlopen
> 
>     return opener.open(url, data, timeout)
> 
>   File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/urllib/request.py",
> line 466, in open
> 
>     response = self._open(req, data)
> 
>   File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/urllib/request.py",
> line 484, in _open
> 
>     '_open', req)
> 
>   File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/urllib/request.py",
> line 444, in _call_chain
> 
>     result = func(*args)
> 
>   File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/urllib/request.py",
> line 1297, in https_open
> 
>     context=self._context, check_hostname=self._check_hostname)
> 
>   File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/imx-gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/urllib/request.py",
> line 1256, in do_open
> 
>     raise URLError(err)
> 
> urllib.error.URLError: <urlopen error [SSL: CERTIFICATE_VERIFY_FAILED]
> certificate verify failed (_ssl.c:720)>
> 
> 



Return-Path: <ross.burton@intel.com>
Received: from mail-ot0-f175.google.com (mail-ot0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id 10A437320B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Apr 2018 10:36:13 +0000 (UTC)
Received: by mail-ot0-f175.google.com with SMTP id w2-v6so5298987otj.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Apr 2018 03:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Kn7YptxdkaQ+5YNm6kXmjJEj5tSK9jWZXuOy5Jame8k=;
	b=cRxpb1NZwUPAs0Ti6RureJ4uR56UiWaeiBXAmWkNuFmRr8O+55KxVJqko7y7Wrh+jG
	ab6hRaQzghg7F0NJ+KkjqIkpIgJ3aW2ifNvRQCEZ8E5SbAydYc+MQwuVDgWAQkUb3NnS
	bfhpHFntcvZLQRNo7ay/jW42TGOsFXfMXLzPAiU/mCs2k3wF8hnJNIgJz4SlmvQHX+YH
	aFI4sA4wKtcn4/54O8t6Fv4U5yO1+Xj9nPV3M2a/MkY5QeygVLd3CGltnuP1yIOkuRa4
	aFsQUTjG6IFUkiAENZFg0juoYCZQc3HYG9uojwXhNH2qCfgeOYcSz+6oR5Piiu9eheJy
	op2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Kn7YptxdkaQ+5YNm6kXmjJEj5tSK9jWZXuOy5Jame8k=;
	b=IJKGCds3CVztjBe8uswsYczmUL4wakMZ5OwwmOwEoxcI3IECU5gCPaEdKkh6IdTMo/
	BVMUQeZ8lt9RndGFKlf7B3U0/jy/wo1kacfAomILqxQfO7IoaFgnEeLwhZvMCy6Q80k/
	t2i+2GA99wUg6uGWIkAXAW6rvzTkk0PBpUKx+bKYit+FAR4YIqwKLHGQ4FHxdgl3eufC
	aF9/bUiTg5aL40NCDgnFf3Fd1Aj4g/aZVmCA0YlermVIFetovWZ7xMBS0jPjHaDVbI+E
	V/Nk0/3+EZLBCsnNCiZXweelb+vwFi/PMUTKY0t/r51kc+iQhozMoVjUcGMbLdL0FHfw
	K/qA==
X-Gm-Message-State: ALQs6tBp8B8qLpB9L7man3xJh9PJa2lStc5dQVxexjGrHTTWyULZ01TG
	B7/akxrObYq1NDC/eqiaIdDLJmhDOwGlRqpxhLuXQw==
X-Google-Smtp-Source: AIpwx4/RMXHpR3l0fJiWwWvUeiImwR89sTBgV4RGSy2qpk01HHpFVdPpN80xcHXBPwDqimgBrveVfgFRoHD8FfPFDiw=
X-Received: by 2002:a9d:1850:: with SMTP id
	t16-v6mr3864320ott.300.1524134174853; 
	Thu, 19 Apr 2018 03:36:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.138.17.198 with HTTP; Thu, 19 Apr 2018 03:35:54 -0700 (PDT)
In-Reply-To: <AM5PR0402MB2817BAED1816216C67E76BC6E2A40@AM5PR0402MB2817.eurprd04.prod.outlook.com>
References: <AM5PR0402MB2817BAED1816216C67E76BC6E2A40@AM5PR0402MB2817.eurprd04.prod.outlook.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 19 Apr 2018 11:35:54 +0100
Message-ID: <CAJTo0LZmxAW4QvWKStapOhCf23FDTPReDWHFvOWJHbhfkFwr_g@mail.gmail.com>
To: Tom Hochstein <tom.hochstein@nxp.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 19 Apr 2018 10:36:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Why don't you just use the host Python?

This is probably due to the certificate path not being correctly
remapped as it goes in/out of sstate, you'll have to tell the SSL code
explicitly where to find the certificates.

Ross

On 4 April 2018 at 21:09, Tom Hochstein <tom.hochstein@nxp.com> wrote:
> I am trying to download a URL from a source package using python3-native,
> but it is failing with a certificate failure. I added DEPENDS on
> ca-certificates-native and python3-certifi-native, but it doesn=E2=80=99t=
 seem to
> help. A colleague with a corresponding SDK took the aarch64 sysroot
> certificates and dropped them in x86_64 sysroot and the problem was fixed=
.
>
>
>
> Tom
>
>
>
> r60874@tx30imx-01:~/rocko/build-xwayland$ bitbake imx-gpu-sdk -c devshell
>
> root@tx30imx-01:~/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/=
imx-gpu-sdk/5.0.2-r0/git#
> python3
>
> Python 3.5.3 (default, Mar  6 2018, 14:15:44)
>
> [GCC 5.4.0 20160609] on linux
>
> Type "help", "copyright", "credits" or "license" for more information.
>
>>>> import urllib.request
>
>>>>
>>>> urllib.request.urlretrieve("https://sourceforge.net/projects/tclap/fil=
es/tclap-1.2.2.tar.gz",
>>>> "~")
>
> Traceback (most recent call last):
>
>   File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/imx-=
gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/urllib/request.py"=
,
> line 1254, in do_open
>
>     h.request(req.get_method(), req.selector, req.data, headers)
>
>   File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/imx-=
gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/http/client.py",
> line 1107, in request
>
>     self._send_request(method, url, body, headers)
>
>   File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/imx-=
gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/http/client.py",
> line 1152, in _send_request
>
>     self.endheaders(body)
>
>   File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/imx-=
gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/http/client.py",
> line 1103, in endheaders
>
>     self._send_output(message_body)
>
>   File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/imx-=
gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/http/client.py",
> line 934, in _send_output
>
>     self.send(msg)
>
>   File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/imx-=
gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/http/client.py",
> line 877, in send
>
>     self.connect()
>
>   File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/imx-=
gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/http/client.py",
> line 1261, in connect
>
>     server_hostname=3Dserver_hostname)
>
>   File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/imx-=
gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/ssl.py",
> line 385, in wrap_socket
>
>     _context=3Dself)
>
>   File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/imx-=
gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/ssl.py",
> line 760, in __init__
>
>     self.do_handshake()
>
>   File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/imx-=
gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/ssl.py",
> line 996, in do_handshake
>
>     self._sslobj.do_handshake()
>
>   File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/imx-=
gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/ssl.py",
> line 641, in do_handshake
>
>     self._sslobj.do_handshake()
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
>   File "<stdin>", line 1, in <module>
>
>   File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/imx-=
gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/urllib/request.py"=
,
> line 188, in urlretrieve
>
>     with contextlib.closing(urlopen(url, data)) as fp:
>
>   File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/imx-=
gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/urllib/request.py"=
,
> line 163, in urlopen
>
>     return opener.open(url, data, timeout)
>
>   File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/imx-=
gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/urllib/request.py"=
,
> line 466, in open
>
>     response =3D self._open(req, data)
>
>   File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/imx-=
gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/urllib/request.py"=
,
> line 484, in _open
>
>     '_open', req)
>
>   File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/imx-=
gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/urllib/request.py"=
,
> line 444, in _call_chain
>
>     result =3D func(*args)
>
>   File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/imx-=
gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/urllib/request.py"=
,
> line 1297, in https_open
>
>     context=3Dself._context, check_hostname=3Dself._check_hostname)
>
>   File
> "/home/r60874/rocko/build-xwayland/tmp/work/aarch64-mx8qm-poky-linux/imx-=
gpu-sdk/5.0.2-r0/recipe-sysroot-native/usr/lib/python3.5/urllib/request.py"=
,
> line 1256, in do_open
>
>     raise URLError(err)
>
> urllib.error.URLError: <urlopen error [SSL: CERTIFICATE_VERIFY_FAILED]
> certificate verify failed (_ssl.c:720)>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C27ADC61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 22:29:46 +0000 (UTC)
Subject: Re: [PATCH v4 01/27] bitbake: globally define KERNEL_PACKAGE_NAME
To: openembedded-core@lists.openembedded.org
From: "Vincent Davis Jr" <vince@underview.tech>
X-Originating-Location: Royal Oak, Michigan, US (99.71.187.50)
X-Originating-Platform: Linux Firefox 154
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 02 Sep 2026 15:29:43 -0700
References: <20260712184307.3259642-1-vince@underview.tech> <DB5PR02MB102131BF9EDB1F84965702DABEFFA2@DB5PR02MB10213.eurprd02.prod.outlook.com> <953617.1784488771319074426@lists.openembedded.org> <f3e758ba0987e94d70e6b2f9f4950073a9d6f80d.camel@linuxfoundation.org>
In-Reply-To: <f3e758ba0987e94d70e6b2f9f4950073a9d6f80d.camel@linuxfoundation.org>
Message-ID: <2546320.1788388183210489037@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="B76LmtTYn9Ms19rkrKMQ"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 22:29:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244991

--B76LmtTYn9Ms19rkrKMQ
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello resurfacing this,

Finally setup a layer that builds multiple distro's
simultaneously. It doesn't set KERNEL_PACKAGE_NAME.
Builds just fine by changing TMPDIR in each multiconfig.
Will run into issues like bellow if you don't.

ERROR: mc:liveusb-install:liveusb-install-linux-6.12.101-r0 do_packagedata:
Recipe liveusb-install-linux is trying to install files into a shared area
when those files already exist. The files and the manifests listing them ar=
e:
/../../runtime-rprovides/kernel-6.12.101-amd-tiny/kernel-base

I think if we want the kernel-XXX prefix to be the default namespace we may
need to remove KERNEL_PACKAGE_NAME entirely and force user to build
in different TMPDIR's. Which I'm fine with that. I also think the original
ideal was to 1 allow a single TMPDIR to be used and 2 have better
separation between the kernels when using a package manager.
If you build 2 separate kernels, but they both have the same package
name which one would the package manager install.

To fix this I have to set KERNEL_PACKAGE_NAME.

Can find layer here.

https://github.com/under-view/meta-udoo-bolt

For quick setup recommend using Docker container. Link in README.

Have a branch for this patch series that I'm keeping up to date.
As well as supporting branches.

May be found here.

https://github.com/under-view/openembedded-core/tree/bugfix/kernel-package-=
name-2
https://github.com/under-view/meta-openembedded/tree/feature/kernel-package=
-name
https://github.com/under-view/meta-udoo-bolt/tree/feature/set-kernel-pn

Lastly, the above setup doesn't fix bug 11905. So, working on that now.

--B76LmtTYn9Ms19rkrKMQ
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hello resurfacing this,<br /><br />Finally setup a layer that builds m=
ultiple distro's<br />simultaneously. It doesn't set KERNEL_PACKAGE_NAME.<b=
r />Builds just fine by changing TMPDIR in each multiconfig.<br />Will run =
into issues like bellow if you don't.<br /><br />ERROR: mc:liveusb-install:=
liveusb-install-linux-6.12.101-r0 do_packagedata:<br />Recipe liveusb-insta=
ll-linux is trying to install files into a shared area<br />when those file=
s already exist. The files and the manifests listing them are:<br />&nbsp; =
/../../runtime-rprovides/kernel-6.12.101-amd-tiny/kernel-base<br /><br />I =
think if we want the kernel-XXX prefix to be the default namespace we may<b=
r />need to remove KERNEL_PACKAGE_NAME entirely and force user to build</di=
v>
<div>in different TMPDIR's. Which I'm fine with that. I also think the orig=
inal</div>
<div>ideal was to 1 allow a single TMPDIR to be used and 2 have better</div=
>
<div>separation between the kernels when using a package manager.</div>
<div>If you build 2 separate kernels, but they both have the same package</=
div>
<div>name which one would the package manager install.<br /><br />To fix th=
is I have to set KERNEL_PACKAGE_NAME.<br /><br />Can find layer here.<br />=
<br />https://github.com/under-view/meta-udoo-bolt<br /><br />For quick set=
up recommend using Docker container. Link in README.<br /><br />Have a bran=
ch for this patch series that I'm keeping up to date.<br />As well as suppo=
rting branches.<br /><br />May be found here.<br /><br />https://github.com=
/under-view/openembedded-core/tree/bugfix/kernel-package-name-2<br />https:=
//github.com/under-view/meta-openembedded/tree/feature/kernel-package-name<=
br />https://github.com/under-view/meta-udoo-bolt/tree/feature/set-kernel-p=
n<br /><br />Lastly, the above setup doesn't fix bug 11905. So, working on =
that now.</div>

--B76LmtTYn9Ms19rkrKMQ--


Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 65AAA60620
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 10:33:55 +0000 (UTC)
Received: by iouu10 with SMTP id u10so41776255iou.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Dec 2015 02:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=D4tO+4U29QP33GRSUzuHANaIQlRdu/qxMd/kVGpPE2Q=;
	b=v7kCaSZb6u2QclOUHKjaP7Q64SEP+u02XhkXnjoXmUBc0iI6vcON1AXdXGH+i5nsTk
	lhNkgpFY8YZ++5eM6U4w5d1ObvMggU7z6Bqs+rkNNbKKNYc40VJjH7Dbt4gOeVb1P9YR
	2aBWwFtkBhh8eFGANy1PszM0shIF1jQo11HIixgVPBFBwOjSOqBVRNHIrhh2krt6pQFV
	3ek0mZx/8wLWSJFnRrEyxjVNjOtz3Y2ayYPZKXCjVlb2gKdg2XFjYUFuvG845jsNpZYh
	yAtK7oPCdKYYyAeD5ysxagyBugE0IirIGh8+XWSH97uf/Gt2DMrQc3IMePrnDOLYLYgT
	Eomg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=D4tO+4U29QP33GRSUzuHANaIQlRdu/qxMd/kVGpPE2Q=;
	b=NJ1HNi8quc1O1oJTHeGcuvHG+8XfrQ16F2Rg2Zqn9vhWY6pGzh8xyvCqMFhQ7X/suP
	F88XB1KE2/nNoj0WDyS8BHFTlU6jQzSyklLtpRmZmr8yX57IjplLvwCZhPyGhHxa2DoD
	3aOg4AXoHobND3AMLHjNB+8/hM1FjlBIAUZtaAzJkrkfVr1XXpvxAluAHOb3gpQjFUC3
	tLwCMilRA+0qUOnfVXltvbwe5LjOiHwd4j7+GXe/kw8S4K+JnJzentiVNul8l1ioUMWv
	H4XOmes3Vj43X8TESEyU5Ljxs6nuxbnyPngKyYHyklMUEWqjZuOgl258RWDNZs8JUvFk
	SgeA==
X-Gm-Message-State: ALoCoQltPpRFXyU4JsYAgUihhoaNQYIrb4zOXNjwbN25WrcLOweXEq3EiitSVEK+aAidfQj5HcZZ
X-Received: by 10.107.3.144 with SMTP id e16mr2689470ioi.99.1449052436559;
	Wed, 02 Dec 2015 02:33:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Wed, 2 Dec 2015 02:33:37 -0800 (PST)
In-Reply-To: <565EC7BE.6060105@windriver.com>
References: <cover.1449032673.git.hongxu.jia@windriver.com>
	<8e3c76d86f19c59b63908de6d7d9c2cc24858858.1449032673.git.hongxu.jia@windriver.com>
	<CAJTo0LaqebZA8akpdnAtFU2rJHsFX=1AxxtHWbq3JuEe5vBVyg@mail.gmail.com>
	<565EBF04.6050509@windriver.com>
	<CAJTo0Lag5J+cytX8C+Z7b8dmX65MZWJBV6JXQt=Ocwy==szenA@mail.gmail.com>
	<565EC7BE.6060105@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 2 Dec 2015 10:33:37 +0000
Message-ID: <CAJTo0LahZKzQxPrnh9=59HwMCfE12MMqbqWBsZ=YgChF3VN4Cg@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] python: gcc optimization level 2
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
X-List-Received-Date: Wed, 02 Dec 2015 10:33:56 -0000
Content-Type: multipart/alternative; boundary=001a113ecf40be11190525e7cfd3

--001a113ecf40be11190525e7cfd3
Content-Type: text/plain; charset=UTF-8

On 2 December 2015 at 10:28, Hongxu Jia <hongxu.jia@windriver.com> wrote:

> Trace the issue costs a lot of time,  the original failure was invoking
> 'smart update' in qemu, and found out the python md5/sha checksum
> output incorrect, and then found out qemu86-64 with corei7-64 did
> not support gcc optimization level 3 '-O3' very well [YOCTO #8748]
>

Sure.  So you've found out that Python is broken, but who knows what else
is broken?

Ross

--001a113ecf40be11190525e7cfd3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 December 2015 at 10:28, Hongxu Jia <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div bgcolor=3D"#FFF=
FFF" text=3D"#000000">Trace the issue costs a lot of time,=C2=A0 the origin=
al failure was
    invoking<br>
    &#39;smart update&#39; in qemu, and found out the python md5/sha checks=
um<br>
    output incorrect, and then found out qemu86-64 with corei7-64 did<br>
    not support gcc optimization level 3 &#39;-O3&#39; very well
   =20
    [YOCTO #8748]</div></blockquote></div><br>Sure.=C2=A0 So you&#39;ve fou=
nd out that Python is broken, but who knows what else is broken?</div><div =
class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ecf40be11190525e7cfd3--

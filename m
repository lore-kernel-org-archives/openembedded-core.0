Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 332E96011A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 10:41:46 +0000 (UTC)
Received: by iofh3 with SMTP id h3so14080305iof.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 02:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=oHO2iS/zjg9FjilM0kmi/hwx0Mb43TOwvWWElejXOzk=;
	b=fSI9T6DkcWS9KqIAlVLKewqsjZsG6ib84sv9RNutuJiiPx9vgsMhpirYqYbdPVgi52
	suSZtZbewnhyfSYDr/tAPF9yaseb1AmTkfITaD4MG7GzLYtrwS7ZeyHUTvQ37KJRSgjI
	pfhc0kJSppCajrWfe4Q8kWb4Tepb/xArU92Wdd02XPlaEX1VjJ3/3F7hmmgFCL3zC+aW
	absZN0wpPfYc8CQqHckRj9cJ0jjAQZm9PyBcj8GjOXwo8GnjL0ffk/8Cc9jUjHRhvoLR
	V3auxbIDBXCP0byoi86vcASFFFfr0+pM/YcIf7/MWZQwWtA84QC8kOTd9UOAlm34jQ2X
	AvSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=oHO2iS/zjg9FjilM0kmi/hwx0Mb43TOwvWWElejXOzk=;
	b=aTL6hI4jc2Csrn2NSSZ3Zisk+jFChNFDEiWZgIxjKPlgta3XMXYeisPbf01vVSyivt
	8XgPiKDPGj/xja/fc/zJtRttKT2sEEkebD9DII9Uv8ug4+JXOPLI/EKH/qTtjLyUr/CQ
	+UNvxVOHtB/qQF+6WzQHl4Saig5Yzknupv6lLU4UQYnfYK6gXbwYhnAw0b/moEKrNjEs
	uJ+3YCeT7NHRy846EJgIJpbODweSJmqNgH9amEXZJllL4BLuBQLPMnOirye17jmJoeuP
	BQmvlV3XAdn//O1+04vhmkfhOBtlSxOrDQ0qOoSnZdrigAvJa3nPInNpaNZ8tc9fthjd
	l77A==
X-Gm-Message-State: ALoCoQm9RjlBVtMq2ml9pCEncXfrYaJ2ZZFd/a2DLsh58bXOWgCUvkNwtRpRmWPD/6E8B7m+hzqU
X-Received: by 10.107.3.144 with SMTP id e16mr32389281ioi.99.1447756907439;
	Tue, 17 Nov 2015 02:41:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Tue, 17 Nov 2015 02:41:28 -0800 (PST)
In-Reply-To: <1447673972-31812-2-git-send-email-otavio@ossystems.com.br>
References: <1447673972-31812-1-git-send-email-otavio@ossystems.com.br>
	<1447673972-31812-2-git-send-email-otavio@ossystems.com.br>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Nov 2015 10:41:28 +0000
Message-ID: <CAJTo0LbACSOOgLwWGV83BpKcEcqmQn9bg5nz5sQxffQG7RXYHw@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/3] lttng-tools: Upgrade to 2.7 release
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
X-List-Received-Date: Tue, 17 Nov 2015 10:41:48 -0000
Content-Type: multipart/alternative; boundary=001a113ecf403080ce0524ba2c1f

--001a113ecf403080ce0524ba2c1f
Content-Type: text/plain; charset=UTF-8

On 16 November 2015 at 11:39, Otavio Salvador <otavio@ossystems.com.br>
wrote:

> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>

Fails with ptest enabled:

DEBUG: Executing shell function do_install_ptest_base
NOTE: make
DESTDIR=/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-lsb/build/build/tmp/work/core2-32-poky-linux/lttng-tools/2.7.0+gitAUTOINC+d71e55a5f1-r0/image/usr/lib/lttng-tools/ptest
install-ptest
cp -r ./tests
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-lsb/build/build/tmp/work/core2-32-poky-linux/lttng-tools/2.7.0+gitAUTOINC+d71e55a5f1-r0/image/usr/lib/lttng-tools/ptestfor
m in $(find
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-lsb/build/build/tmp/work/core2-32-poky-linux/lttng-tools/2.7.0+gitAUTOINC+d71e55a5f1-r0/image/usr/lib/lttng-tools/ptest/tests
-name Makefile); do \
          sed -i -e 's|^Makefile:|_Makefile:|' $m; \
        done
sed: can't read
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-lsb/build/build/tmp/work/core2-32-poky-linux/lttng-tools/2.7.0+gitAUTOINC+d71e55a5f1-r0/image/usr/lib/lttng-tools/ptest/tests/regression/run-report.py:
No such file or directory

http://errors.yoctoproject.org/Errors/Details/21841/

Ross

--001a113ecf403080ce0524ba2c1f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 November 2015 at 11:39, Otavio Salvador <span dir=3D"ltr">&lt;<a href=
=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.=
br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,20=
4);border-left-style:solid;padding-left:1ex"><div id=3D":5lo" class=3D"" st=
yle=3D"overflow:hidden">Signed-off-by: Otavio Salvador &lt;<a href=3D"mailt=
o:otavio@ossystems.com.br">otavio@ossystems.com.br</a>&gt;<br></div></block=
quote></div><br>Fails with ptest enabled:<br><br>DEBUG: Executing shell fun=
ction do_install_ptest_base<br>NOTE: make DESTDIR=3D/home/pokybuild/yocto-a=
utobuilder/yocto-worker/nightly-x86-lsb/build/build/tmp/work/core2-32-poky-=
linux/lttng-tools/2.7.0+gitAUTOINC+d71e55a5f1-r0/image/usr/lib/lttng-tools/=
ptest install-ptest<br>cp -r ./tests /home/pokybuild/yocto-autobuilder/yoct=
o-worker/nightly-x86-lsb/build/build/tmp/work/core2-32-poky-linux/lttng-too=
ls/2.7.0+gitAUTOINC+d71e55a5f1-r0/image/usr/lib/lttng-tools/ptestfor m in $=
(find /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-lsb/build/=
build/tmp/work/core2-32-poky-linux/lttng-tools/2.7.0+gitAUTOINC+d71e55a5f1-=
r0/image/usr/lib/lttng-tools/ptest/tests -name Makefile); do \<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;s|^Makefile:|_Makefile:|&#39; $m=
; \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>sed: can&#39;t read /home/pokybu=
ild/yocto-autobuilder/yocto-worker/nightly-x86-lsb/build/build/tmp/work/cor=
e2-32-poky-linux/lttng-tools/2.7.0+gitAUTOINC+d71e55a5f1-r0/image/usr/lib/l=
ttng-tools/ptest/tests/regression/run-report.py: No such file or directory<=
br><br><a href=3D"http://errors.yoctoproject.org/Errors/Details/21841/">htt=
p://errors.yoctoproject.org/Errors/Details/21841/</a></div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ecf403080ce0524ba2c1f--

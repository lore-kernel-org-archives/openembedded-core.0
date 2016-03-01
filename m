Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 199D5731F6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Mar 2016 14:21:52 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id b188so5890056iof.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Mar 2016 06:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PCgcRkQib2dd1aEImuuCSd1I4OEsATG8A4axfObcrGI=;
	b=yhMpca11+FeZfKqG8573s9lh6vrRfQCYPxZoz21+f531D2GIkvcFsLfYII1CmIM98g
	TwnEgO2PS3CwUtUUiwYZX53lgJ6xhncmfLb+FF0H/dHjgPMyD1Cu4F6+Y/Ok8bi3o9jI
	5ZVSs7ZqIm3ONFKFFIk620mwgy5ktangMuPQlo2r9l/fODRRH6QzNsIpDcT/M+U4LAJ+
	cQsBN4qcDcOl9uGkz8MfncKVADJoN/6F6hgC1aNNioace+t53dpViCujUgOnflhzNRHg
	RV3hQi6ZfaVy5HveHg6Qn3jc/FZ3ZAX85wxE0y9txq3pIbhflPGnI9PBt5ccMuJVDAqB
	s9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PCgcRkQib2dd1aEImuuCSd1I4OEsATG8A4axfObcrGI=;
	b=fv8C7U0M+ioj0MMZ2rxBGFlOiGhFWoWN0DteaH6vedWldG8qIYyYM7AS5opwswoJKh
	y46Q0tCqiH+ZsdmetfJP7ug8EFeEEkU2RlOcIa2wmlnh7S6xtxDg6ELllTE6xbpO6OlU
	2h9/GMxq70uSy6fSRl3gjx9fcUgldAQxMtC+uW7k2lNQhAY+C4c0airLlXzNKY4ggbE5
	Z3xWoOZzl6QSHRcCm02mlycRX6BKxWSzdApuuikZSflgDYp/Bt3+AHb62nZFj/TGs7un
	9Dhm7n033j5gnLvwP+8kmov8IfWfkqeVvxhtvnkNzL2SI3cIKrQI0AvhWXxut35wUJV6
	MEDg==
X-Gm-Message-State: AG10YOT4BlMzGgUrozkfMUbTDj8BI9byRhacfz2AxFMkJ368/WAbdar9P+6YYHd4YlchVdPsMXmj4NP+jE+7wbBi
X-Received: by 10.107.137.92 with SMTP id l89mr27814490iod.133.1456842113270; 
	Tue, 01 Mar 2016 06:21:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 1 Mar 2016 06:21:33 -0800 (PST)
In-Reply-To: <CAJTo0LZTCidmPn6ewUPmu60s0ettwL_e2wZfWUJWd6=2kG2j=w@mail.gmail.com>
References: <cover.1456805147.git.mark.hatle@windriver.com>
	<CAJTo0LZTCidmPn6ewUPmu60s0ettwL_e2wZfWUJWd6=2kG2j=w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 1 Mar 2016 14:21:33 +0000
Message-ID: <CAJTo0La64gchAoKeW1f6t51+qPD7f=wwRcJ=sspRQHMa4MJiMQ@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Upgrade RPM to 5.4.16 (CVE HEAD)
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
X-List-Received-Date: Tue, 01 Mar 2016 14:21:53 -0000
Content-Type: multipart/alternative; boundary=001a113ebdb4a7dafb052cfd7c37

--001a113ebdb4a7dafb052cfd7c37
Content-Type: text/plain; charset=UTF-8

On 1 March 2016 at 13:38, Burton, Ross <ross.burton@intel.com> wrote:

> http://errors.yoctoproject.org/Errors/Details/38890/:
>
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-rpm/5.4.16-r0/build/popt/.libs/libpopt.so:
> undefined reference to `__stack_chk_guard'


As discussed on IRC I can confirm that removing the stack guard sections
from the popt configure fixes this.

Ross

--001a113ebdb4a7dafb052cfd7c37
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 March 2016 at 13:38, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><a href=3D"http://errors.yo=
ctoproject.org/Errors/Details/38890/" target=3D"_blank">http://errors.yocto=
project.org/Errors/Details/38890/</a>:<br><br>/home/pokybuild/yocto-autobui=
lder/yocto-worker/nightly-x86-64/build/build/tmp/work/i686-nativesdk-pokysd=
k-linux/nativesdk-rpm/5.4.16-r0/build/popt/.libs/libpopt.so: undefined refe=
rence to `__stack_chk_guard&#39;</blockquote></div><br>As discussed on IRC =
I can confirm that removing the stack guard sections from the popt configur=
e fixes this.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail=
_extra">Ross</div></div>

--001a113ebdb4a7dafb052cfd7c37--

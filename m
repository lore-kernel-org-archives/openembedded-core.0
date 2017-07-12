Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id 31870780C0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 22:14:17 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id m84so26401313ita.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 15:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aOBKFGVMp/VlSJive0T7IpbBn5Ys4/mXQftGhfs3mtw=;
	b=0LLYANcbRRo4WmNSCywkZ4qXdV31WntgDqa5jXIW3mfiU+DqKK6a8uTebslql1tpv0
	7xnF84P4/jckMC3tsmS6GOBmgQzh6ptPQ7qXfvSU5a6Twm9z6y2ndrs0F4UVhV7FqXlW
	WwDvGQV3I+C1d9SWgTev45zCuR0b4LLEUD3A8lZ/5uduSQlwil/5p/TgP33DLgovpuyk
	cHIdVsu6dybgT0PazngyBk7TX+08GJa9pyIjS2W92qwaYyMSOtKOZN4G+IaCIERO8ti3
	c8KfYWZgRSYnMflVIHooQq17ZbN6Vw7mHnNRC0R9cj9XMLLc3wF8pwum7rbPvWyUhUpm
	wq6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aOBKFGVMp/VlSJive0T7IpbBn5Ys4/mXQftGhfs3mtw=;
	b=aRL9fEmyqrBAoFsW51QvNtpPOsnSq1JP2Qp/uIaxiT66EywgA4/aYFnAJnU++bIYGs
	J/yHEeAlHKoQRnhZEyt5QvouYB3LuV1aQry+OvQPMWroLD4Pi0Q0A0eKtJI4woHbmZ93
	R159Gzk0jOMd1BqJrgQE7v6omLBrij5eHrc0N6Fg+KKSA0Bj35IqAk51kQ3+zSLvnVgw
	Hivg3YCTpT1d2NMx4PiCZFpoccjFZBceURzl9Ae44JrkwFHu5fph6VzgZN8+E/SKIo/i
	LPKq523I2ibKjvpo54JY95dShGEUvr9cXUgWKbUTFywXMKdGWC6nZA/3+nRc4E9zECPp
	/FiQ==
X-Gm-Message-State: AIVw111cyNo0srezBny+mdBU9L9vQ2ThP9MABh3FO67QjQzALlw67f9V
	mAAchfaL+NygI1S+W5iT0fWnBONAAtsG
X-Received: by 10.36.40.196 with SMTP id h187mr10856943ith.43.1499897659333;
	Wed, 12 Jul 2017 15:14:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.161 with HTTP; Wed, 12 Jul 2017 15:13:58 -0700 (PDT)
In-Reply-To: <1499777893-16292-2-git-send-email-maxin.john@intel.com>
References: <1499777893-16292-1-git-send-email-maxin.john@intel.com>
	<1499777893-16292-2-git-send-email-maxin.john@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 12 Jul 2017 23:13:58 +0100
Message-ID: <CAJTo0LZabyvyXxGkFeeBOCNGy7p50+-Zb7p8WuvZTbvxc=bRfg@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: "Lock, Joshua G" <joshua.g.lock@intel.com>,
	Christopher Larson <chris_larson@mentor.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] pkgconf: add recipe
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
X-List-Received-Date: Wed, 12 Jul 2017 22:14:18 -0000
Content-Type: multipart/alternative; boundary="001a1143f65a2f3658055426239f"

--001a1143f65a2f3658055426239f
Content-Type: text/plain; charset="UTF-8"

On 11 July 2017 at 13:58, Maxin B. John <maxin.john@intel.com> wrote:
> Move pkgconf recipe to oe-core from meta-pkgconf:
> https://github.com/kergoth/meta-kergoth-wip/tree/master/meta-pkgconf

Fails under mingw, which is a regression compared to pkg-config.

libpkgconf/.libs/path.o:path.c:(.text+0x164): undefined reference to `lstat'
libpkgconf/.libs/path.o:path.c:(.text+0x1f9): undefined reference to
`S_ISLNK'
libpkgconf/.libs/path.o:path.c:(.text+0x2e5): undefined reference to
`readlink'

(http://errors.yoctoproject.org/Errors/Details/147303/)

Ross

--001a1143f65a2f3658055426239f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 11 July 2017 at 13:58, Maxin B. John &lt;<a href=3D"mai=
lto:maxin.john@intel.com">maxin.john@intel.com</a>&gt; wrote:<br>&gt; Move =
pkgconf recipe to oe-core from meta-pkgconf:<br>&gt; <a href=3D"https://git=
hub.com/kergoth/meta-kergoth-wip/tree/master/meta-pkgconf">https://github.c=
om/kergoth/meta-kergoth-wip/tree/master/meta-pkgconf</a><br><br>Fails under=
 mingw, which is a regression compared to pkg-config.<br><br>libpkgconf/.li=
bs/path.o:path.c:(.text+0x164): undefined reference to `lstat&#39;<br>libpk=
gconf/.libs/path.o:path.c:(.text+0x1f9): undefined reference to `S_ISLNK&#3=
9;<br>libpkgconf/.libs/path.o:path.c:(.text+0x2e5): undefined reference to =
`readlink&#39;<div><br></div><div>(<a href=3D"http://errors.yoctoproject.or=
g/Errors/Details/147303/">http://errors.yoctoproject.org/Errors/Details/147=
303/</a>)</div><div><br></div><div>Ross</div></div>

--001a1143f65a2f3658055426239f--

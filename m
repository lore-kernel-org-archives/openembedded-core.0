Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SAh6M-0004MB-5g
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 13:26:46 +0100
Received: by lagw12 with SMTP id w12so1570192lag.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 05:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=kMimG5mESpLUQvL6UCmojXR+PZLSFGGkJz3SpkGnTQs=;
	b=b/xQiJLF8h2XmYYMqGXBJIHBi5irbGlUa+KQNc0MGlfWVkAMRE6hWX4x43MGLecHJm
	xnE/v3IeI+flOcyh+cKfKBUsvFZBGehw4NsgIs7fp7yUX75i7k3V13iyHC3Rp5d4OETC
	msXgCvqslcH2uZZF/M5P+wDWaGi8hrPcYlcBUAnK7uxxgi7adKiKzZW2uS1zV+9LY6io
	zeXFM/mD1J5HhZrDO3uVJprIKX3xjatCGjw5LH8J80Z3X6fkG4T2FNCEV5a7EIKnfFgg
	+I+OKJq4P+WZgy6sP17JmNfksbTtuc/PXWO8jKGii2d6hiuw88pu7gedvJ5DKZDWSy9w
	Cqvg==
Received: by 10.152.127.136 with SMTP id ng8mr5640207lab.16.1332418671227;
	Thu, 22 Mar 2012 05:17:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.2.71 with HTTP; Thu, 22 Mar 2012 05:17:20 -0700 (PDT)
In-Reply-To: <20120322131310.1c6455d1@eb-e6520>
References: <cover.1332347414.git.nitin.a.kamble@intel.com>
	<ADD6A3980E8C39419A432FF422031B4C0137B3E3@ORSMSX106.amr.corp.intel.com>
	<20120321190208.25dc0387@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B406@ORSMSX106.amr.corp.intel.com>
	<20120321203249.54411613@eb-e6520>
	<20120321194906.GC3659@jama.jama.net>
	<ADD6A3980E8C39419A432FF422031B4C0137B557@ORSMSX106.amr.corp.intel.com>
	<20120321220253.00c4f254@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B5A8@ORSMSX106.amr.corp.intel.com>
	<20120321223521.36e49bba@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B66D@ORSMSX106.amr.corp.intel.com>
	<CAMKF1sq7hcTKrzFBYgmUOTcdQw6sC1FG4jUhsfKauqeXLQMgsg@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C0137B889@ORSMSX106.amr.corp.intel.com>
	<CAMKF1srP52bxqwkaqPZTQbRmhp_V+4-iJ7wTKeKWfC1z4W=fyw@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C0137BAA8@ORSMSX106.amr.corp.intel.com>
	<CAMKF1sobw_wT_ZKhXs9Y-d0jSG-QWzKOprgf7+zM8a_BjjQgEQ@mail.gmail.com>
	<20120322131310.1c6455d1@eb-e6520>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 Mar 2012 05:17:20 -0700
Message-ID: <CAMKF1sqEGjWMpPTQxP3j1bbP6H2FQqAgHZGm399ejC-RyDxboQ@mail.gmail.com>
To: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Revert "gdb-cross-canadian: build gdb with python support"
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Mar 2012 12:26:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 22, 2012 at 5:13 AM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
>
> so the problem seems to be in the libpython of the SDK

delete the readline.so in python modules and use the SDK python
does that make the crash go away ?
libpython sometimes expect debug versions of plugins and thats what I
am getting to



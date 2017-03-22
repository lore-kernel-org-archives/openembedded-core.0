Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 051FE602D9;
	Wed, 22 Mar 2017 18:24:51 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id t189so45757107wmt.1;
	Wed, 22 Mar 2017 11:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=IM+9MnZOYVBXQXYL5wftl8Nvn5g7/hqg1cGa3GltgaA=;
	b=BRkRTE2mqWXIqWP+l7aIXD9eDhAPT7yDaD5wyjBM7NVkED/gjfSRQVb9jf4qTauhlm
	DeMPsAjHmCG3pU4A5eWX3XhCMeKDuGDxXaDFzpqnTcHNOdcdp0dR6zfbZWDEoOPPrivY
	gy+wZFQZ1afnM64rkpSltjmeT/dqlKfogyPlQsDmjY8D8r090gWubaJhXobv+hxDDpNt
	GRPjvNtLm5vgUcT3q1qjE+Mmhz0t19GTSI7lWs7RuuNhqRG5s6IF9ooNzjEty0mvjOQK
	N4oWxhGye8jMb5J+rYob8EFS+L+/cbfm6dWoGyqbsyr2h3jo9HC2hmtx+9SeAqqCytA5
	yu0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=IM+9MnZOYVBXQXYL5wftl8Nvn5g7/hqg1cGa3GltgaA=;
	b=FdNFmZmFJQfwVl+IqvVfTshlko8YFsx1bE3UIKyrQmFRblMaluXVG/LbnSpp35vZLM
	z4loAgIGmUVZYVjbJCZavpKA2cyBNjD/6zaiqJ06SGXblqaBEr3E0GbIqurGcXrUV0Li
	aU8SkTblv2D/ED7vM6GU/IcJ4nZIWT94KOCjt8gY4wFdXwbFd7t13AHgN51PSVyOC1m4
	5cXoPk3P8Z+zcj1E7VewHtnFMmH1YikaLDFSiZoKUXReAVwOjJADBaoncWRk7mrt1BFi
	Yju5Epd/FYARL3GTbQTgoyOPi9X1kJFxpTVQ5XDYv0639qKWT8rzzOJBBDzutsd2wVMN
	5QDQ==
X-Gm-Message-State: AFeK/H1F5ULQ3yElW0ivzD7X6MXki0zjYkaQUVmDKVjVeTcrx1+brqh90eBRUN9Aa6Rs7sdH4vLYdKZNhLNpyw==
X-Received: by 10.28.165.145 with SMTP id o139mr9648131wme.13.1490207092356;
	Wed, 22 Mar 2017 11:24:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.162 with HTTP; Wed, 22 Mar 2017 11:24:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Mar 2017 11:24:21 -0700
Message-ID: <CAMKF1srxsxW=1Hc+ONia7uMAuFNPs74w8Wjy9u5G3S2xhKi=Eg@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Fedorahosted.org in SRC_URI
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
X-List-Received-Date: Wed, 22 Mar 2017 18:24:52 -0000
Content-Type: text/plain; charset=UTF-8

Hi

FYI I see this notice

https://fedoraproject.org/wiki/Infrastructure/Fedorahosted-retirement

and I then grep'ed for fedorahosted in SRC_URI, they need to be fixed

oe-core

meta/lib/oeqa/selftest/recipetool.py:        checkvars['SRC_URI'] =
'https://fedorahosted.org/releases/l/o/logrotate/logrotate-${PV}.tar.gz'
meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:SRC_URI =
"https://fedorahosted.org/releases/x/m/xmlto/xmlto-${PV}.tar.gz \
meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb:SRC_URI =
"http://fedorahosted.org/releases/c/h/chkconfig/${BPN}-${PV}.tar.bz2 \
meta/recipes-extended/cronie/cronie_1.5.1.bb:SRC_URI =
"https://fedorahosted.org/releases/c/r/cronie/cronie-${PV}.tar.gz \
meta/recipes-extended/libuser/libuser_0.62.bb:SRC_URI =
"https://fedorahosted.org/releases/l/i/libuser/libuser-${PV}.tar.xz \
meta/recipes-extended/logrotate/logrotate_3.9.1.bb:SRC_URI =
"https://fedorahosted.org/releases/l/o/logrotate/logrotate-${PV}.tar.gz
\
meta/recipes-extended/newt/libnewt_0.52.19.bb:SRC_URI =
"https://fedorahosted.org/releases/n/e/newt/newt-${PV}.tar.gz \
meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb:SRC_URI =
"https://fedorahosted.org/releases/l/i/liberation-fonts/liberation-fonts-${PV}.tar.gz
\


meta-openembedded

meta-networking/recipes-support/netcf/netcf_git.bb:SRC_URI =
"git://git.fedorahosted.org/netcf.git;protocol=git \
meta-oe/recipes-extended/dlm/dlm_4.0.2.bb:SRC_URI =
"https://git.fedorahosted.org/cgit/dlm.git/snapshot/${BP}.tar.xz"
meta-oe/recipes-extended/libqb/libqb_0.17.2.bb:SRC_URI =
"https://fedorahosted.org/releases/q/u/quarterback/${BP}.tar.xz \
meta-oe/recipes-extended/openlmi/openlmi-networking_0.3.1.bb:SRC_URI =
"http://fedorahosted.org/released/${BPN}/${BP}.tar.gz \
meta-oe/recipes-extended/openlmi/openlmi-providers_0.6.0.bb:SRC_URI =
"http://fedorahosted.org/released/${BPN}/${BP}.tar.gz \
meta-oe/recipes-extended/openlmi/openlmi-storage_0.8.1.bb:SRC_URI =
"http://fedorahosted.org/released/${BPN}/${BP}.tar.gz"
meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb:SRC_URI =
"http://fedorahosted.org/released/${BPN}/${BP}.tar.gz \
meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb:SRC_URI
= "https://fedorahosted.org/releases/l/i/liberation-fonts/liberation-fonts-ttf-${PV}.tar.gz
\
meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb:SRC_URI =
"http://fedorahosted.org/liberation-fonts/export/807b6dfd069b998cd9b4d3158da98817ef23c79d/F-9/liberation-fonts-ttf-3.tar.gz"
meta-oe/recipes-support/hwdata/hwdata_0.291.bb:SRC_URI =
"https://git.fedorahosted.org/cgit/${BPN}.git/snapshot/${BP}.tar.gz"
meta-oe/recipes-support/mailcap/mailcap_2.1.46.bb:SRC_URI =
"https://git.fedorahosted.org/cgit/${BPN}.git/snapshot/${BPN}-r2-1-46.tar.gz"
meta-oe/recipes-support/system-config-keyboard/system-config-keyboard_1.4.0.bb:SRC_URI
= "https://fedorahosted.org/releases/s/y/${BPN}/${BP}.tar.bz2"
meta-oe/recipes-support/system-setup-keyboard/system-setup-keyboard_0.8.8.bb:SRC_URI
= "https://git.fedorahosted.org/cgit/${PN}.git/snapshot/${BP}.tar.gz"
meta-python/recipes-devtools/python/python-slip-dbus_0.6.1.bb:SRC_URI
= "https://fedorahosted.org/released/${SRCNAME}/${SRCNAME}-${PV}.tar.bz2"


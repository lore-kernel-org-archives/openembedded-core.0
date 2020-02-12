Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
	[209.85.216.65])
	by mail.openembedded.org (Postfix) with ESMTP id D51CD60CC6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 17:18:05 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id q39so1169518pjc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 09:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=8WhDWKSI3taUgNqGF8wqnopW5r1AYzM67DPCmphZW3c=;
	b=boHsyC/CJ1A51txCLCaEiDZdFGMzsN4FFY1KiIUls8CWIYhIDmp+P+vFLJn1oCo3T2
	uTFe2jARjcqVt/hOTZXBrLPkIcSXUfjV/ccj78ZZyGNhQUyDTebHPeYnh4Ce3sAgExSi
	pGnQ6rxbeoxEEtW4OG7t5XHeSZBhNHkfOOU0VbaR2sDMHvk/ZIjvLhpI5fKuHDgfqqoH
	PuMOwHLRnwe1KwuzxcZElpauclWaWbTlVFeHFETpMK8NQ8ZUQoO9KXhLtHtEFXuTcBdr
	5olaNuWnBiyjmWt1gVqITSjOCWUuzB872SFCAeoj/Ue5MA7T+6zOnisUnN9e2IYXHwf+
	Q+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=8WhDWKSI3taUgNqGF8wqnopW5r1AYzM67DPCmphZW3c=;
	b=EztIXbQq2ngP+ZicLRWj+F9kPOzKHXBx+arqhGCY2/kkhP2nALjrB4psSMTRicbi18
	G8XA02wzTlouLMHUZeaoNEYNocJrHA4Zrq+gEahY8v5SsbrXHWMomG5yrffil6R/eNWa
	0qTxvRhwlJZxDBDZ6aW62l6oBGtnequ6lHyzyXJE/u+K5C+wkx9ln+SmdTmByXZ30o8Z
	g+UVzCe0c+AV4m/uISzSU40U0OGxDtVBwwK500r8g1+emNoXZrwbUzAQezugs1O0N7ar
	nYc6jp6o0uBaSnIpWT4m9uXsEaUuJAsi1HhlEcLepsitb7lYHCs3kC5/Q6GbZ7FNp9N5
	0oRQ==
X-Gm-Message-State: APjAAAX6IdxSV/KVSNSPTUDzufqTQk54vhMTbzBPUplkBimPtimX3uen
	W8lYE2YGWFibike6Eavw7/o+1yubu+M=
X-Google-Smtp-Source: APXvYqx3PT900tj3NoyP/wOGxlGDHPleFDasOwwILEmm7sIyxCAU3MUOOnBCrqIoMn2ht2m2ZSLTzw==
X-Received: by 2002:a17:90a:ac0f:: with SMTP id
	o15mr41386pjq.133.1581527886175; 
	Wed, 12 Feb 2020 09:18:06 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:1011:7401:8a59:f04c?
	([2601:646:9200:4e0:1011:7401:8a59:f04c])
	by smtp.gmail.com with ESMTPSA id
	w26sm1583946pfj.119.2020.02.12.09.18.04
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 12 Feb 2020 09:18:05 -0800 (PST)
To: Martin Jansa <martin.jansa@gmail.com>
References: <20200212051936.1610922-1-raj.khem@gmail.com>
	<CANNYZj9478oh1cNgK0U5oq8RX=q8VMYZpCnPZ8akgvUtQExFmg@mail.gmail.com>
	<CAMKF1srv-UPO0OjHKqqwu0GPW-rcdcO+0NJSnR4B0s-V43i8pg@mail.gmail.com>
	<CA+chaQevfESVZc2ee2p_Y7bJHOc=M54nWEzE4erb2+zJMFzjFA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <e9357257-9104-61a7-e85a-64dd368ebb96@gmail.com>
Date: Wed, 12 Feb 2020 09:18:04 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQevfESVZc2ee2p_Y7bJHOc=M54nWEzE4erb2+zJMFzjFA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dnf, libdnf: Ignore if PACKAGE_CLASSES does not have rpm
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
X-List-Received-Date: Wed, 12 Feb 2020 17:18:05 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 2/12/20 8:32 AM, Martin Jansa wrote:
> Will this work for you without anonymous python? I think it should.
> 
> PNBLACKLIST[dnf] ?= "${@oe.utils.conditional('PACKAGE_CLASSES', 
> 'package_rpm', '' 'does not build correctly without package_rpm in 
> PACKAGE_CLASSES', d)}"

I like this better than anon python. Perhaps worth it in a v2

> 
> On Wed, Feb 12, 2020 at 4:12 PM Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>> wrote:
> 
>     On Tue, Feb 11, 2020 at 11:11 PM Alexander Kanavin
>     <alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>> wrote:
>      >
>      > Please let’s try to avoid anonymous python. What problem does
>     this solve? If package_rpm is not enabled, then there should not be
>     a dependency chain that builds these anyway.
> 
>     for non rpm backend opkg, rpm is pulled in which is not desired
>     because opkg depends on libsolv
>     and libsolv by default depends on rpm which I sent another patch to
>     decouple, This caused opkg images to fail tests because testing infra
>     found rpm in the image and ran tests for it which obviously would
>     fail.
> 
>       libsolv does have rpm support as packageconfig but when that
>     is disabled then libdnf does not build anymore since it expects rpmdb
>     support in libsolv.
> 
>     so when we do world builds with opkg as package management then dnf
>     and libdbf starts to fail
>     due to their RPM needs.
> 
>     IF there was an override to identity packaging backends then we could
>     have used that
> 
>     If you have better suggestions to avoid anon python here, I am all ears.
> 
>      >
>      > Alex
>      >
>      > On Wed 12. Feb 2020 at 6.20, Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>> wrote:
>      >>
>      >> dnf does not work with opkg or dpkg/apt anyway
>      >>
>      >> Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>      >> ---
>      >>  meta/recipes-devtools/dnf/dnf_4.2.2.bb <http://dnf_4.2.2.bb>   
>          | 8 ++++++++
>      >>  meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
>     <http://libdnf_0.28.1.bb> | 7 +++++++
>      >>  2 files changed, 15 insertions(+)
>      >>
>      >> diff --git a/meta/recipes-devtools/dnf/dnf_4.2.2.bb
>     <http://dnf_4.2.2.bb> b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
>     <http://dnf_4.2.2.bb>
>      >> index f38167f1ad..9e6d5741af 100644
>      >> --- a/meta/recipes-devtools/dnf/dnf_4.2.2.bb <http://dnf_4.2.2.bb>
>      >> +++ b/meta/recipes-devtools/dnf/dnf_4.2.2.bb <http://dnf_4.2.2.bb>
>      >> @@ -84,3 +84,11 @@ SYSTEMD_SERVICE_${PN} =
>     "dnf-makecache.service dnf-makecache.timer \
>      >>                           dnf-automatic-notifyonly.service
>     dnf-automatic-notifyonly.timer \
>      >>  "
>      >>  SYSTEMD_AUTO_ENABLE ?= "disable"
>      >> +
>      >> +python () {
>      >> +    pkgb = d.getVar("PACKAGE_CLASSES")
>      >> +    pkgn = d.getVar("PN")
>      >> +    pkgv = d.getVar("PV")
>      >> +    if "package_rpm" not in pkgb:
>      >> +        raise bb.parse.SkipPackage("%s-%s Needs rpmdb support
>     in libsolv" % (pkgn, pkgv))
>      >> +}
>      >> diff --git a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
>     <http://libdnf_0.28.1.bb>
>     b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
>     <http://libdnf_0.28.1.bb>
>      >> index 882c435b32..5c9326ca64 100644
>      >> --- a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
>     <http://libdnf_0.28.1.bb>
>      >> +++ b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
>     <http://libdnf_0.28.1.bb>
>      >> @@ -27,3 +27,10 @@ EXTRA_OECMAKE_append_class-nativesdk = "
>     -DWITH_GIR=OFF"
>      >>
>      >>  BBCLASSEXTEND = "native nativesdk"
>      >>
>      >> +python () {
>      >> +    pkgb = d.getVar("PACKAGE_CLASSES")
>      >> +    pkgn = d.getVar("PN")
>      >> +    pkgv = d.getVar("PV")
>      >> +    if "package_rpm" not in pkgb:
>      >> +        raise bb.parse.SkipPackage("%s-%s Needs rpmdb support
>     in libsolv" % (pkgn, pkgv))
>      >> +}
>      >> --
>      >> 2.25.0
>      >>
>      >> --
>      >> _______________________________________________
>      >> Openembedded-core mailing list
>      >> Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>      >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 



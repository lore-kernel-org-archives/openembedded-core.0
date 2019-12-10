Return-Path: <anonumiko@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 56DCC7F7CD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2019 18:04:17 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id 21so20996228ljr.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2019 10:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=aCi7QggR/ZWhqUoz/u5lxM5xn+JVJLyQsVPBKcljYgE=;
	b=QyLZNFE/vSoVIhb4Mo61MniWUAzCZrrfNOKjH8B5SnToTocygk3iwnQ6sVStRqCGj2
	uUU1V5gVF7d1ni2E6+zqkA5y7RQZYzv/pP5FV+JiLHQakV/cXr+VM921iZZb0bsA08if
	vdGinh9vmrczbhmh7wowLzl8gdgts9qsjQSBKNP01N5FF1fLhlFU2rNlwBJLfxL0Qn5q
	02dn0+eYOsZRhXndpNJXoxHBUIUGTMkXNBPqiN+Lthb+prVHBsYk40/uNb+I+blASSnm
	ZPOGqeA1EsA0gr7uioKZQCYKM1zP/ToCbtYEv3gmnjCSgWOLSK757dzJ7aEfNSNIVOn1
	ZDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=aCi7QggR/ZWhqUoz/u5lxM5xn+JVJLyQsVPBKcljYgE=;
	b=BpUbbveCRYEQTG8p7lJ4WXbWm5cTHquCpEJdBxXFHqlwaj9YCzWAk2FZRymn3tcvBV
	ytK8wxym42fGALiJ0vXC7KjH5KIKbcoB2GqQb+5b4eo4ZzIsi2u01ZT7dlqIsFuJ19q0
	R9RAZOLH1EjFagAfhXt21UNk14KTRsTsOR8P70peaF26d3QFTn+QYyU9DJ33mYjeEFM8
	wJpXZ2/yBujlOqJMiumt/gpm/dyiSngCoV3u8MtiQxL6uT492IF/YEM6cy65xjPpVV3V
	eDa6Q6nbALberoafg0w1QcqYI+PKqJEqnE3h2eORkLS/KxiYQCag1wN+bzdFxnNLIfEo
	z0AA==
X-Gm-Message-State: APjAAAVmrkTyI+DzbMDnjuzChlxafugq5yskHf9xbY2GxKYeWIL8LXgb
	lNrYXj66Y7q7oxMdwzz2+5EZLWsS
X-Google-Smtp-Source: APXvYqySw4Scb1OLd8A4mpXoie1grP5mgvlKEqzc7CRcyEEh6/WeFG2dEcbmB9bJOaLgMWWU3lue4g==
X-Received: by 2002:a2e:9855:: with SMTP id e21mr21452010ljj.170.1576001057294;
	Tue, 10 Dec 2019 10:04:17 -0800 (PST)
Received: from [62.78.161.185] (62-78-161-185.bb.dnainternet.fi.
	[62.78.161.185]) by smtp.gmail.com with ESMTPSA id
	w17sm1982631lfn.22.2019.12.10.10.04.15
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 10 Dec 2019 10:04:16 -0800 (PST)
Sender: Niko Mauno <anonumiko@gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20191205200518.82007-1-niko.mauno@iki.fi>
	<f66739bfac294f33aa76aaa8b4bee7f7@XBOX03.axis.com>
From: Niko Mauno <niko.mauno@iki.fi>
Message-ID: <e9e68443-9072-631b-1cd6-b912b10d2e80@iki.fi>
Date: Tue, 10 Dec 2019 20:04:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f66739bfac294f33aa76aaa8b4bee7f7@XBOX03.axis.com>
Subject: Re: [zeus][PATCH 1/3] iptables: Cosmetic fixes to recipe
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
X-List-Received-Date: Tue, 10 Dec 2019 18:04:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/6/19 12:45 AM, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core-
>> bounces@lists.openembedded.org> On Behalf Of Niko Mauno
>> Sent: den 5 december 2019 21:05
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [zeus][PATCH 1/3] iptables: Cosmetic fixes to recipe
>>
>> Introduce cosmetic changes to recipe content, most notably
>>   - Change indentation style to four spaces in task statements
> 
> Unless I'm wrong, the standard for shell code in recipes in
> OE-Core is still to indent using tabs. (OpenEmbedded on the
> other hand uses four spaces for indentation also for shell
> code.)
> 
> //Peter
> 

Thanks Peter,

indeed looking at https://www.openembedded.org/wiki/Styleguide#Format_Guidelines mentions that "Shell functions in OE-Core usually use tabs for indentation, but other layers usually use consistent indentation with 4 spaces (in shell functions, python functions and for indentation of multi-line variables)", thus this commits indentation changes in particular could be questioned. I'll try to keep this in mind.

Out of curiousity, I now also looked at current master branch's .bb/.inc files (under poky/meta/recipes-*), and it would seem there's about 150 files which resort to 4-space indentation in shell funcs (excluding here cases of 8-space and even 2-space indentation used in some files). Considering the excerpt, are you aware if there has been any discussion wrt. OE-Core also switching to 4-space indentation prevalent in other layers? Just feels it would make sense as currently e.g. a discontinuity in indentation style is implied when bbappending OE-core shell functions from other layers.

-Niko

>>   - Reorder several entries according to oe-stylize.py suggestions
>>
>> (From OE-Core rev: c1d162b6165f11b7b5ae5c6066e7683d5e1379fc)
>>
>> Signed-off-by: Niko Mauno <niko.mauno@iki.fi>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>>   .../iptables/iptables_1.8.3.bb                | 60 +++++++++----------
>>   1 file changed, 29 insertions(+), 31 deletions(-)
>>
>> diff --git a/meta/recipes-extended/iptables/iptables_1.8.3.bb
>> b/meta/recipes-extended/iptables/iptables_1.8.3.bb
>> index ff9fcb1b53..563c8ae354 100644
>> --- a/meta/recipes-extended/iptables/iptables_1.8.3.bb
>> +++ b/meta/recipes-extended/iptables/iptables_1.8.3.bb
>> @@ -4,8 +4,9 @@ filtering code in Linux."
>>   HOMEPAGE = "http://www.netfilter.org/"
>>   BUGTRACKER = "http://bugzilla.netfilter.org/"
>>   LICENSE = "GPLv2+"
>> -LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263\
>> -
>> file://iptables/iptables.c;beginline=13;endline=25;md5=c5cffd09974558cf27d
>> 0f763df2a12dc"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>> +
>> file://iptables/iptables.c;beginline=13;endline=25;md5=c5cffd09974558cf27d
>> 0f763df2a12dc \
>> +"
>>
>>   SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-
>> ${PV}.tar.bz2 \
>>              file://0001-configure-Add-option-to-enable-disable-
>> libnfnetlink.patch \
>> @@ -13,16 +14,16 @@ SRC_URI =
>> "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
>>              file://iptables.service \
>>              file://iptables.rules \
>>   "
>> -
>>   SRC_URI[md5sum] = "29de711d15c040c402cf3038c69ff513"
>>   SRC_URI[sha256sum] =
>> "a23cac034181206b4545f4e7e730e76e08b5f3dd78771ba9645a6756de9cdd80"
>>
>> +SYSTEMD_SERVICE_${PN} = "iptables.service"
>> +
>>   inherit autotools pkgconfig systemd
>>
>>   EXTRA_OECONF = "--with-kernel=${STAGING_INCDIR}"
>>
>>   PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
>> -
>>   PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
>>
>>   # libnfnetlink recipe is in meta-networking layer
>> @@ -32,9 +33,19 @@ PACKAGECONFIG[libnfnetlink] = "--enable-libnfnetlink,--
>> disable-libnfnetlink,libn
>>   PACKAGECONFIG[libnftnl] = "--enable-nftables,--disable-nftables,libnftnl"
>>
>>   do_configure_prepend() {
>> -	# Remove some libtool m4 files
>> -	# Keep ax_check_linker_flags.m4 which belongs to autoconf-
>> archive.
>> -	rm -f libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4
>> ltversion.m4
>> +    # Remove some libtool m4 files
>> +    # Keep ax_check_linker_flags.m4 which belongs to autoconf-archive.
>> +    rm -f libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m4
>> +}
>> +
>> +do_install_append() {
>> +    install -d ${D}${sysconfdir}/iptables
>> +    install -m 0644 ${WORKDIR}/iptables.rules ${D}${sysconfdir}/iptables
>> +
>> +    install -d ${D}${systemd_system_unitdir}
>> +    install -m 0644 ${WORKDIR}/iptables.service
>> ${D}${systemd_system_unitdir}
>> +
>> +    sed -i -e 's,@SBINDIR@,${sbindir},g'
>> ${D}${systemd_system_unitdir}/iptables.service
>>   }
>>
>>   PACKAGES += "${PN}-modules"
>> @@ -47,30 +58,6 @@ python populate_packages_prepend() {
>>           d.appendVar('RDEPENDS_' + metapkg, ' ' + ' '.join(modules))
>>   }
>>
>> -FILES_${PN} += "${datadir}/xtables"
>> -
>> -# Include the symlinks as well in respective packages
>> -FILES_${PN}-module-xt-conntrack += "${libdir}/xtables/libxt_state.so"
>> -FILES_${PN}-module-xt-ct += "${libdir}/xtables/libxt_NOTRACK.so"
>> -
>> -INSANE_SKIP_${PN}-module-xt-conntrack = "dev-so"
>> -INSANE_SKIP_${PN}-module-xt-ct = "dev-so"
>> -
>> -ALLOW_EMPTY_${PN}-modules = "1"
>> -
>> -do_install_append() {
>> -
>> -        install -d ${D}${sysconfdir}/iptables
>> -        install -m 0644 ${WORKDIR}/iptables.rules
>> ${D}${sysconfdir}/iptables
>> -
>> -        install -d ${D}${systemd_system_unitdir}
>> -        install -m 0644 ${WORKDIR}/iptables.service
>> ${D}${systemd_system_unitdir}
>> -
>> -	sed -i -e 's,@SBINDIR@,${sbindir},g'
>> ${D}${systemd_system_unitdir}/iptables.service
>> -}
>> -
>> -SYSTEMD_SERVICE_${PN} = "iptables.service"
>> -
>>   RDEPENDS_${PN} = "${PN}-module-xt-standard"
>>   RRECOMMENDS_${PN} = " \
>>       ${PN}-modules \
>> @@ -84,3 +71,14 @@ RRECOMMENDS_${PN} = " \
>>       kernel-module-nf-nat \
>>       kernel-module-ipt-masquerade \
>>   "
>> +
>> +FILES_${PN} += "${datadir}/xtables"
>> +
>> +# Include the symlinks as well in respective packages
>> +FILES_${PN}-module-xt-conntrack += "${libdir}/xtables/libxt_state.so"
>> +FILES_${PN}-module-xt-ct += "${libdir}/xtables/libxt_NOTRACK.so"
>> +
>> +ALLOW_EMPTY_${PN}-modules = "1"
>> +
>> +INSANE_SKIP_${PN}-module-xt-conntrack = "dev-so"
>> +INSANE_SKIP_${PN}-module-xt-ct = "dev-so"
>> --
>> 2.20.1
> 



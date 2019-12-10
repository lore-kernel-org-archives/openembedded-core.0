Return-Path: <anonumiko@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7DB507F95C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2019 19:58:58 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id 15so14768686lfr.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2019 11:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=RWtJOJtpcovGlJSsiRC2vPef5+WRLaGBRLEmRzgL1oc=;
	b=OUWYucaz0UvbQ9GaufW/mI7y8QM2UQqq48FBvLNmdaAWC19LMwkYlxwGhQnYO1yiDQ
	q++r8B1oiUyw8mojKRjeeUeFWbaxmuksoC6SzcPltt8B4kHVWW1vJeIEWQX1p8qFt5AH
	91I3a/W1mcPUR3sfwesFbD1uzLn1l7RR06+qchjXPieG5gxDGx1MdKAk+8bjjCAh7dJO
	x+ayFt84qoR+yORyntcSO0RttoBP4g8+NTLzkqxuvOhJayA+VC3DBH1pgHZIA6bdUmDA
	3h8lgb8jWdeTgUhFhMb3sphneoY6uRgbIz+6fQswJk8HMrlyR7JZfa4/62qJ7oov0i6r
	Yisg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=RWtJOJtpcovGlJSsiRC2vPef5+WRLaGBRLEmRzgL1oc=;
	b=TS9YcatP/GD6kKTIOVVTMWvdgyNPV0UJeW8bCSQHy919B5+JC/VDq/VZ9Aopq2sYxO
	W/+udeIiPSbM+r9DqUzzD/U6BfNHp7y3ujxu9Dt36/YBegsYk7v+dU8noR8eD6vNE2OJ
	bhDkrR80tJVjHjSA1Jlo7i4AE2F00KXCG42ZZ9Tqv1CeCJHva9P5aH8H0qS+zs4oDbXm
	za/7bz3AhCD/fdJgjS8BtZLpEu/5i3n8o1H26u+7/9dh2156nTIBCvAGOOuwcjUa+Wzw
	3ckV5WdBICuJ7vEBb9XB+pDhpkrkH07eJeMCzB0wOTlKY5V2R1UZOFtgELO8n58Y8pL3
	EMxA==
X-Gm-Message-State: APjAAAUCzCGIvAp/Y/OV/xASInC35D4Gp3HojFhDslgBfVimWWFwti5T
	Fv7dDcfmUveXUz3UdjCMPB0=
X-Google-Smtp-Source: APXvYqxN2nlLVQH/7O7vzESIGCO5vRsMj9Cm/VgTVykXDDcvRCGVWBPbs6IJixf8XN5Id+rO0Ohvnw==
X-Received: by 2002:ac2:46dc:: with SMTP id p28mr12629358lfo.23.1576007939461; 
	Tue, 10 Dec 2019 11:58:59 -0800 (PST)
Received: from [62.78.161.185] (62-78-161-185.bb.dnainternet.fi.
	[62.78.161.185])
	by smtp.gmail.com with ESMTPSA id t2sm2290319ljj.11.2019.12.10.11.58.58
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 10 Dec 2019 11:58:58 -0800 (PST)
Sender: Niko Mauno <anonumiko@gmail.com>
To: akuster808 <akuster808@gmail.com>, openembedded-core@lists.openembedded.org
References: <20191205200518.82007-1-niko.mauno@iki.fi>
	<5c0c9f90-d4d5-fef5-838a-d8f596e20ebb@gmail.com>
From: Niko Mauno <niko.mauno@iki.fi>
Message-ID: <61ddebb6-8a18-8035-7db4-0f9c50bc0e92@iki.fi>
Date: Tue, 10 Dec 2019 21:58:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5c0c9f90-d4d5-fef5-838a-d8f596e20ebb@gmail.com>
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
X-List-Received-Date: Tue, 10 Dec 2019 19:58:59 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/6/19 1:32 AM, akuster808 wrote:
> 
> 
> On 12/5/19 12:05 PM, Niko Mauno wrote:
>> Introduce cosmetic changes to recipe content, most notably
>>   - Change indentation style to four spaces in task statements
>>   - Reorder several entries according to oe-stylize.py suggestions
>>
>> (From OE-Core rev: c1d162b6165f11b7b5ae5c6066e7683d5e1379fc)
>>
>> Signed-off-by: Niko Mauno <niko.mauno@iki.fi>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> These changes do not pass the 'stable' bar for backporting. Unless a
> more compelling reason is give, this series is being "NACKed" at this time.
> 
> - armin

Thanks for checking Armin. For the record, proposed mainly for complementing the existing systemd-specific automatic ipv4 rules loading functionality with ipv6, particularly since both 'ipv4' and 'ipv6' are enabled in DISTRO_FEATURES by default. 

-Niko

>> ---
>>   .../iptables/iptables_1.8.3.bb                | 60 +++++++++----------
>>   1 file changed, 29 insertions(+), 31 deletions(-)
>>
>> diff --git a/meta/recipes-extended/iptables/iptables_1.8.3.bb b/meta/recipes-extended/iptables/iptables_1.8.3.bb
>> index ff9fcb1b53..563c8ae354 100644
>> --- a/meta/recipes-extended/iptables/iptables_1.8.3.bb
>> +++ b/meta/recipes-extended/iptables/iptables_1.8.3.bb
>> @@ -4,8 +4,9 @@ filtering code in Linux."
>>   HOMEPAGE = "http://www.netfilter.org/"
>>   BUGTRACKER = "http://bugzilla.netfilter.org/"
>>   LICENSE = "GPLv2+"
>> -LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263\
>> -                    file://iptables/iptables.c;beginline=13;endline=25;md5=c5cffd09974558cf27d0f763df2a12dc"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>> +                    file://iptables/iptables.c;beginline=13;endline=25;md5=c5cffd09974558cf27d0f763df2a12dc \
>> +"
>>   
>>   SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
>>              file://0001-configure-Add-option-to-enable-disable-libnfnetlink.patch \
>> @@ -13,16 +14,16 @@ SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
>>              file://iptables.service \
>>              file://iptables.rules \
>>   "
>> -
>>   SRC_URI[md5sum] = "29de711d15c040c402cf3038c69ff513"
>>   SRC_URI[sha256sum] = "a23cac034181206b4545f4e7e730e76e08b5f3dd78771ba9645a6756de9cdd80"
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
>> @@ -32,9 +33,19 @@ PACKAGECONFIG[libnfnetlink] = "--enable-libnfnetlink,--disable-libnfnetlink,libn
>>   PACKAGECONFIG[libnftnl] = "--enable-nftables,--disable-nftables,libnftnl"
>>   
>>   do_configure_prepend() {
>> -	# Remove some libtool m4 files
>> -	# Keep ax_check_linker_flags.m4 which belongs to autoconf-archive.
>> -	rm -f libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m4
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
>> +    install -m 0644 ${WORKDIR}/iptables.service ${D}${systemd_system_unitdir}
>> +
>> +    sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_system_unitdir}/iptables.service
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
>> -        install -m 0644 ${WORKDIR}/iptables.rules ${D}${sysconfdir}/iptables
>> -
>> -        install -d ${D}${systemd_system_unitdir}
>> -        install -m 0644 ${WORKDIR}/iptables.service ${D}${systemd_system_unitdir}
>> -
>> -	sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_system_unitdir}/iptables.service
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
> 



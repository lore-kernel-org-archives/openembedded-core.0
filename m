Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1E1E96132D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2020 21:18:09 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id j9so6803882pfa.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2020 13:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Tg4Sr7wXMLYzbuC2a9MhTE8rn25vC6AeOtK8Wlahmyw=;
	b=rsoPKdMN4UYKS49KvBbkFvaoHfQHHaq5SlWKlhVLm65Bl6XuMn6/R4pNg7AqiLBcbt
	q8ZG1XQV6RZbyOVqMwgUi4QkN0Ttc0K9qw45PxfD4HcvZgaANAazyLkCaw6RGS1L99oF
	arlemnVPPn73Y5Ju2S0ygZ3KT8P61rHiywUO2W+eh8eHwq2415GK8iM1asCX0Wx9WKzz
	PXg4sziolDD11SdCXLEFVnOneb+vxXjM4zsaL1LG2UQRNb/Qc+0heVIKF/nf4M5TLk9k
	F0a7fuGHWZTCfhu6VVR2lxWaPoWfW7mMIvI4ezuKUOtAQ5EWvypygH6O5ZXKvpaJIAS3
	227g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=Tg4Sr7wXMLYzbuC2a9MhTE8rn25vC6AeOtK8Wlahmyw=;
	b=Knt/YrO5TamiC9DdyzMrP99JXZMs5ZE9YACRezrHHlJnOQdy2rMjZkv8h+SCOGhDA3
	wYCWiWenkQ/UDA7KF0FJTFwbRB7+HglYM+hp19L2cujflU2LUfE2jA0VnXbdSGysIKq+
	KxzMeLr5UpBxGClsk9TmcLPbEvviJTnEcduZwlRE10+QFQNvuI61BBC/4Ap36eCbd+Nw
	MmX7JfgTky4PAXH1Ud2JOPpUhT05YetY6BUR/koZNQAEaEgBd2hqqc0eOS9PC36s/HTV
	hXq8mbTyoAyiS5Re8XykYfJj52l43/jOtoyrOMhoUR1+MpbYJ9OFzpDEchQphnjdCHem
	QRbA==
X-Gm-Message-State: APjAAAVPKwvjr+sB8rcoXt03ybRKrGvNOgenWQuxsl1+R8NGWHGjP0+Y
	tye5EO5OstrGZ0HY60ioaX+c53A5eGU=
X-Google-Smtp-Source: APXvYqwTP45TX6RyyG7YMS4g4lh+O2RG55NwcQNXI+0PzElKeflwTgVAALJhu2T9l0eb3ge0O0/L6Q==
X-Received: by 2002:a63:5c17:: with SMTP id q23mr9970548pgb.287.1581801489812; 
	Sat, 15 Feb 2020 13:18:09 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:f551:d248:5fa4:86ab?
	([2601:646:9200:4e0:f551:d248:5fa4:86ab])
	by smtp.gmail.com with ESMTPSA id
	b42sm11317962pjc.27.2020.02.15.13.18.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sat, 15 Feb 2020 13:18:09 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <20200215094450.19705-1-alex.kiernan@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <41bb4973-dc7b-27d2-aee8-7d9e2627018e@gmail.com>
Date: Sat, 15 Feb 2020 13:18:08 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200215094450.19705-1-alex.kiernan@gmail.com>
Subject: Re: [PATCH v4 1/2] meson.bbclass: Parameterise meson.cross
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
X-List-Received-Date: Sat, 15 Feb 2020 21:18:10 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2/15/20 1:44 AM, Alex Kiernan wrote:
> Add MESON_CROSS_BINARIES, MESON_CROSS_PROPERTIES as a colon separated
> list of meson properties which are exported into meson.cross.
> 

I am seeing errors

13:14:54   File 
"/mnt/jenkins/workspace/yocto-world-glibc/sources/openembedded-core/meta/classes/meson.bbclass", 
line 130
13:14:54     echo "[properties]" > ${WORKDIR}/meson-tracker.cross
13:14:54                       ^
13:14:54 SyntaxError: invalid syntax


> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
> 
> Changes in v4: None
> Changes in v3:
> - new
> 
> Changes in v2: None
> 
>   meta/classes/meson.bbclass | 161 ++++++++++++++++++++-----------------
>   1 file changed, 86 insertions(+), 75 deletions(-)
> 
> diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
> index 06034e8b4731..e778e37d7f69 100644
> --- a/meta/classes/meson.bbclass
> +++ b/meta/classes/meson.bbclass
> @@ -34,88 +34,99 @@ MESON_CROSS_FILE = ""
>   MESON_CROSS_FILE_class-target = "--cross-file ${WORKDIR}/meson.cross"
>   MESON_CROSS_FILE_class-nativesdk = "--cross-file ${WORKDIR}/meson.cross"
>   
> -def meson_array(var, d):
> -    items = d.getVar(var).split()
> -    return repr(items[0] if len(items) == 1 else items)
> -
> -# Map our ARCH values to what Meson expects:
> -# http://mesonbuild.com/Reference-tables.html#cpu-families
> -def meson_cpu_family(var, d):
> -    import re
> -    arch = d.getVar(var)
> -    if arch == 'powerpc':
> -        return 'ppc'
> -    elif arch == 'powerpc64' or arch == 'powerpc64le':
> -        return 'ppc64'
> -    elif arch == 'armeb':
> -        return 'arm'
> -    elif arch == 'aarch64_be':
> -        return 'aarch64'
> -    elif arch == 'mipsel':
> -        return 'mips'
> -    elif arch == 'mips64el':
> -        return 'mips64'
> -    elif re.match(r"i[3-6]86", arch):
> -        return "x86"
> -    elif arch == "microblazeel":
> -        return "microblaze"
> -    else:
> -        return arch
> -
> -# Map our OS values to what Meson expects:
> -# https://mesonbuild.com/Reference-tables.html#operating-system-names
> -def meson_operating_system(var, d):
> -    os = d.getVar(var)
> -    if "mingw" in os:
> -        return "windows"
> -    else:
> -        return os
> -
> -def meson_endian(prefix, d):
> -    arch, os = d.getVar(prefix + "_ARCH"), d.getVar(prefix + "_OS")
> -    sitedata = siteinfo_data_for_machine(arch, os, d)
> -    if "endian-little" in sitedata:
> -        return "little"
> -    elif "endian-big" in sitedata:
> -        return "big"
> -    else:
> -        bb.fatal("Cannot determine endianism for %s-%s" % (arch, os))
> +MESON_CROSS_BINARIES ??= "c:CC \
> +                          cpp:CXX \
> +                          ar:AR \
> +                          nm:NM \
> +                          strip:STRIP \
> +                          readelf:READELF"
> +
> +MESON_CROSS_PROPERTIES ??= "c_args:CFLAGS \
> +                            c_link_args:LDFLAGS \
> +                            cpp_args:CXXFLAGS \
> +                            cpp_link_args:LDFLAGS"
>   
>   addtask write_config before do_configure
> -do_write_config[vardeps] += "CC CXX LD AR NM STRIP READELF CFLAGS CXXFLAGS LDFLAGS"
> -do_write_config() {
> -    # This needs to be Py to split the args into single-element lists
> -    cat >${WORKDIR}/meson.cross <<EOF
> +python do_write_config() {
> +    def meson_array(var):
> +        items = d.getVar(var).split()
> +        return repr(items[0] if len(items) == 1 else items)
> +
> +    # Map our ARCH values to what Meson expects:
> +    # http://mesonbuild.com/Reference-tables.html#cpu-families
> +    def meson_cpu_family(var):
> +        import re
> +        arch = d.getVar(var)
> +        if arch == 'powerpc':
> +            return 'ppc'
> +        elif arch == 'powerpc64' or arch == 'powerpc64le':
> +            return 'ppc64'
> +        elif arch == 'armeb':
> +            return 'arm'
> +        elif arch == 'aarch64_be':
> +            return 'aarch64'
> +        elif arch == 'mipsel':
> +            return 'mips'
> +        elif arch == 'mips64el':
> +            return 'mips64'
> +        elif re.match(r"i[3-6]86", arch):
> +            return "x86"
> +        elif arch == "microblazeel":
> +            return "microblaze"
> +        else:
> +            return arch
> +
> +    # Map our OS values to what Meson expects:
> +    # https://mesonbuild.com/Reference-tables.html#operating-system-names
> +    def meson_operating_system(var):
> +        os = d.getVar(var)
> +        if "mingw" in os:
> +            return "windows"
> +        else:
> +            return os
> +
> +    def meson_endian(prefix):
> +        arch, os = d.getVar(prefix + "_ARCH"), d.getVar(prefix + "_OS")
> +        sitedata = siteinfo_data_for_machine(arch, os, d)
> +        if "endian-little" in sitedata:
> +            return "little"
> +        elif "endian-big" in sitedata:
> +            return "big"
> +        else:
> +            bb.fatal("Cannot determine endianism for %s-%s" % (arch, os))
> +
> +    def meson_write_props(var, f):
> +        for property in d.getVar(var).split():
> +             (k, v) = property.split(':')
> +             print("{} = {}".format(k, meson_array(v)), file=f)
> +             d.appendVarFlag("do_write_config", "vardeps", v)
> +
> +    with open(oe.path.join(d.getVar('WORKDIR'), "meson.cross"), "w") as f:
> +        print("""\
>   [binaries]
> -c = ${@meson_array('CC', d)}
> -cpp = ${@meson_array('CXX', d)}
> -ar = ${@meson_array('AR', d)}
> -nm = ${@meson_array('NM', d)}
> -strip = ${@meson_array('STRIP', d)}
> -readelf = ${@meson_array('READELF', d)}
>   pkgconfig = 'pkg-config'
> -llvm-config = 'llvm-config${LLVMVERSION}'
> +llvm-config = 'llvm-config{}'""".format(d.getVar("LLVMVERSION")), file=f)
> +
> +        meson_write_props('MESON_CROSS_BINARIES', f)
>   
> +        print("""\
>   [properties]
>   needs_exe_wrapper = true
> -c_args = ${@meson_array('CFLAGS', d)}
> -c_link_args = ${@meson_array('LDFLAGS', d)}
> -cpp_args = ${@meson_array('CXXFLAGS', d)}
> -cpp_link_args = ${@meson_array('LDFLAGS', d)}
> -gtkdoc_exe_wrapper = '${B}/gtkdoc-qemuwrapper'
> -
> -[host_machine]
> -system = '${@meson_operating_system('HOST_OS', d)}'
> -cpu_family = '${@meson_cpu_family('HOST_ARCH', d)}'
> -cpu = '${HOST_ARCH}'
> -endian = '${@meson_endian('HOST', d)}'
> -
> -[target_machine]
> -system = '${@meson_operating_system('TARGET_OS', d)}'
> -cpu_family = '${@meson_cpu_family('TARGET_ARCH', d)}'
> -cpu = '${TARGET_ARCH}'
> -endian = '${@meson_endian('TARGET', d)}'
> -EOF
> +gtkdoc_exe_wrapper = '{}/gtkdoc-qemuwrapper'""".format(d.getVar('B')), file=f)
> +
> +        meson_write_props('MESON_CROSS_PROPERTIES', f)
> +
> +        print("[host_machine]", file=f)
> +        print("system = '{}'".format(meson_operating_system('HOST_OS')), file=f)
> +        print("cpu_family = '{}'".format(meson_cpu_family('HOST_ARCH')), file=f)
> +        print("cpu = '{}'".format(d.getVar('HOST_ARCH')), file=f)
> +        print("endian = '{}'".format(meson_endian('HOST')), file=f)
> +
> +        print("[target_machine]", file=f)
> +        print("system = '{}'".format(meson_operating_system('TARGET_OS')), file=f)
> +        print("cpu_family = '{}'".format(meson_cpu_family('TARGET_ARCH')), file=f)
> +        print("cpu = '{}'".format(d.getVar('TARGET_ARCH')), file=f)
> +        print("endian = '{}'".format(meson_endian('TARGET')), file=f)
>   }
>   
>   CONFIGURE_FILES = "meson.build"
> 



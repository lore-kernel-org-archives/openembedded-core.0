Return-Path: <elizabeth.flanagan@intel.com>
Received: from mail-vc0-f169.google.com (mail-vc0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 2833C61634
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jan 2014 17:04:14 +0000 (UTC)
Received: by mail-vc0-f169.google.com with SMTP id hu19so7430174vcb.28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jan 2014 09:04:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=3dOES3hSgc+qbal3rbrxxE6Ib2MHYjdzQS2S1mk4eXA=;
	b=RfHKiilw+9AuQlKc6YhpoOo50+To0VAGsnRg4j2/uxROPRYkpDvcOAwRy458/K1gtb
	gSTiioqlY+qqzB7CznncM6MqH12L912+oHpJMtnFecRihSe6xYnUZkL+mR6rFAJUftzq
	9f8Mj4iyPK8X5rDPlJaKOWXgCoGYPamK8TSQMX+tl/m6CJ+zqf9c8uqnjVG087u8FHmE
	9tBrsghyH3t/DVlEWDX5FF/b/5l6MNpokxnDITGxKt0z/m2XmJLUrJrmq8aRDViIE2PK
	zLyF5TodPxAZzIZLFv3vyp7NhYx5nl5q6FnRsWnKgcNk74VQMUe83Qoo0ixSJbTBVcCS
	CIug==
X-Gm-Message-State: ALoCoQkYLJ48g8/2GWa/IUB8MmTbJXiwqAeoaXzewtdzoutMXYL+q2j0S2lURj6TTI0Ihn7x9iOL
MIME-Version: 1.0
X-Received: by 10.52.120.11 with SMTP id ky11mr11358894vdb.28.1388682254240;
	Thu, 02 Jan 2014 09:04:14 -0800 (PST)
Received: by 10.52.164.142 with HTTP; Thu, 2 Jan 2014 09:04:14 -0800 (PST)
In-Reply-To: <52C0B457.3070002@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
	<adab38ead3101f3c88240606dc40ee629cac6f79.1388269205.git.paul.eggleton@linux.intel.com>
	<52C0B457.3070002@linux.intel.com>
Date: Thu, 2 Jan 2014 17:04:14 +0000
Message-ID: <CAPhnLPBokEcR+5zDW8ueFWyXv2iu0HwpVq_6Ys9GtLJx=w_Z+w@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/38] *-basic: rename to *-standardlinux - AB Change NEEDED
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
X-List-Received-Date: Thu, 02 Jan 2014 17:04:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

Yes,

This will need a LAYERVERSION_core bump and I'll need to do the
appropriate things for the autobuilder on my end before it goes in.

-b

On Sun, Dec 29, 2013 at 11:46 PM, Saul Wold <sgw@linux.intel.com> wrote:
>
> This will need a heads up to Beth to fix the autobuilder since we build the
> -basic target for the -lsb builds, it will need to change also.
>
> Sau!
>
>
> On 12/28/2013 02:28 PM, Paul Eggleton wrote:
>>
>> This more accurately represents what this image and packagegroup are
>> intended to provide, and avoids confusion with the similarly named
>> core-image-base and packagegroup-base.
>>
>> Part of the fix for [YOCTO #2424].
>>
>> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>> ---
>>   meta/recipes-extended/images/core-image-lsb.bb     |   2 +-
>>   ...-image-basic.bb => core-image-standardlinux.bb} |   2 +-
>>   .../packagegroups/packagegroup-core-basic.bb       | 138
>> -----------------
>>   .../packagegroup-core-standardlinux.bb             | 163
>> +++++++++++++++++++++
>>   .../recipes-graphics/images/core-image-directfb.bb |   2 +-
>>   5 files changed, 166 insertions(+), 141 deletions(-)
>>   rename meta/recipes-extended/images/{core-image-basic.bb =>
>> core-image-standardlinux.bb} (87%)
>>   delete mode 100644
>> meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
>>   create mode 100644
>> meta/recipes-extended/packagegroups/packagegroup-core-standardlinux.bb
>>
>> diff --git a/meta/recipes-extended/images/core-image-lsb.bb
>> b/meta/recipes-extended/images/core-image-lsb.bb
>> index f22d199..713a48e 100644
>> --- a/meta/recipes-extended/images/core-image-lsb.bb
>> +++ b/meta/recipes-extended/images/core-image-lsb.bb
>> @@ -6,7 +6,7 @@ IMAGE_FEATURES += "splash ssh-server-openssh hwcodecs
>> package-management"
>>
>>   IMAGE_INSTALL = "\
>>       ${CORE_IMAGE_BASE_INSTALL} \
>> -    packagegroup-core-basic \
>> +    packagegroup-core-standardlinux \
>>       packagegroup-core-lsb \
>>       "
>>
>> diff --git a/meta/recipes-extended/images/core-image-basic.bb
>> b/meta/recipes-extended/images/core-image-standardlinux.bb
>> similarity index 87%
>> rename from meta/recipes-extended/images/core-image-basic.bb
>> rename to meta/recipes-extended/images/core-image-standardlinux.bb
>> index d599e72..19985a9 100644
>> --- a/meta/recipes-extended/images/core-image-basic.bb
>> +++ b/meta/recipes-extended/images/core-image-standardlinux.bb
>> @@ -5,7 +5,7 @@ IMAGE_FEATURES += "splash ssh-server-openssh"
>>
>>   IMAGE_INSTALL = "\
>>       packagegroup-core-boot \
>> -    packagegroup-core-basic \
>> +    packagegroup-core-standardlinux \
>>       ${CORE_IMAGE_EXTRA_INSTALL} \
>>       "
>>
>> diff --git
>> a/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
>> b/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
>> deleted file mode 100644
>> index c89923d..0000000
>> --- a/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
>> +++ /dev/null
>> @@ -1,138 +0,0 @@
>> -#
>> -# Copyright (C) 2010 Intel Corporation
>> -#
>> -
>> -DESCRIPTION = "Create Basic Image Tasks"
>> -PR = "r6"
>> -LICENSE = "MIT"
>> -
>> -inherit packagegroup
>> -
>> -PACKAGES = "\
>> -    packagegroup-core-basic \
>> -    packagegroup-core-basic-libs \
>> -    packagegroup-core-basic-utils \
>> -    packagegroup-core-basic-extended \
>> -    packagegroup-core-dev-utils \
>> -    packagegroup-core-multiuser \
>> -    packagegroup-core-initscripts \
>> -    packagegroup-core-sys-services \
>> -    "
>> -
>> -python __anonymous () {
>> -    # For backwards compatibility after rename
>> -    packages = d.getVar("PACKAGES", True).split()
>> -    for pkg in packages:
>> -        d.appendVar("RPROVIDES_%s" % pkg,
>> pkg.replace("packagegroup-core", "task-core"))
>> -        d.appendVar("RREPLACES_%s" % pkg,
>> pkg.replace("packagegroup-core", "task-core"))
>> -        d.appendVar("RCONFLICTS_%s" % pkg,
>> pkg.replace("packagegroup-core", "task-core"))
>> -}
>> -
>> -
>> -RDEPENDS_packagegroup-core-basic = "\
>> -    packagegroup-core-basic-libs \
>> -    packagegroup-core-basic-utils \
>> -    packagegroup-core-basic-extended \
>> -    packagegroup-core-dev-utils \
>> -    packagegroup-core-multiuser \
>> -    packagegroup-core-initscripts \
>> -    packagegroup-core-sys-services \
>> -    "
>> -
>> -RDEPENDS_packagegroup-core-basic-libs = "\
>> -    glib-2.0 \
>> -    "
>> -
>> -RDEPENDS_packagegroup-core-basic-utils = "\
>> -    bash \
>> -    acl \
>> -    attr \
>> -    bc \
>> -    coreutils \
>> -    cpio \
>> -    e2fsprogs \
>> -    ed \
>> -    file \
>> -    findutils \
>> -    gawk \
>> -    gmp \
>> -    grep \
>> -    makedevs \
>> -    mc \
>> -    mc-fish \
>> -    mc-helpers \
>> -    mc-helpers-perl \
>> -    mc-helpers-python \
>> -    mktemp \
>> -    ncurses \
>> -    net-tools \
>> -    pax \
>> -    popt \
>> -    procps \
>> -    psmisc \
>> -    sed \
>> -    tar \
>> -    time \
>> -    util-linux \
>> -    zlib \
>> -    "
>> -
>> -RDEPENDS_packagegroup-core-basic-extended = "\
>> -    iproute2 \
>> -    iputils \
>> -    iptables \
>> -    module-init-tools \
>> -    openssl \
>> -    "
>> -
>> -RDEPENDS_packagegroup-core-dev-utils = "\
>> -    byacc \
>> -    diffutils \
>> -    m4 \
>> -    make \
>> -    patch \
>> -    "
>> -
>> -VIRTUAL-RUNTIME_initscripts ?= "initscripts"
>> -VIRTUAL-RUNTIME_init_manager ?= "sysvinit"
>> -VIRTUAL-RUNTIME_login_manager ?= "busybox"
>> -VIRTUAL-RUNTIME_syslog ?= "sysklogd"
>> -RDEPENDS_packagegroup-core-initscripts = "\
>> -    ${VIRTUAL-RUNTIME_initscripts} \
>> -    ${VIRTUAL-RUNTIME_init_manager} \
>> -    ethtool \
>> -    ${VIRTUAL-RUNTIME_login_manager} \
>> -    ${VIRTUAL-RUNTIME_syslog} \
>> -    "
>> -
>> -RDEPENDS_packagegroup-core-multiuser = "\
>> -    cracklib \
>> -    gzip \
>> -    ${@base_contains('DISTRO_FEATURES', 'pam', 'libuser', '', d)} \
>> -    shadow \
>> -    sudo \
>> -    "
>> -
>> -RDEPENDS_packagegroup-core-sys-services = "\
>> -    at \
>> -    bzip2 \
>> -    cronie \
>> -    dbus \
>> -    dbus-glib \
>> -    python-dbus \
>> -    elfutils \
>> -    gzip \
>> -    less \
>> -    libcap \
>> -    libevent \
>> -    lighttpd \
>> -    logrotate \
>> -    nfs-utils \
>> -    pciutils \
>> -    libpcre \
>> -    rpcbind \
>> -    sysfsutils \
>> -    tcp-wrappers \
>> -    tzdata \
>> -    "
>> -
>> diff --git
>> a/meta/recipes-extended/packagegroups/packagegroup-core-standardlinux.bb
>> b/meta/recipes-extended/packagegroups/packagegroup-core-standardlinux.bb
>> new file mode 100644
>> index 0000000..3b04067
>> --- /dev/null
>> +++
>> b/meta/recipes-extended/packagegroups/packagegroup-core-standardlinux.bb
>> @@ -0,0 +1,163 @@
>> +#
>> +# Copyright (C) 2010 Intel Corporation
>> +#
>> +
>> +SUMMARY = "Standard full-featured Linux system"
>> +DESCRIPTION = "Package group bringing in packages needed for a more
>> traditional full-featured Linux system"
>> +PR = "r6"
>> +LICENSE = "MIT"
>> +
>> +inherit packagegroup
>> +
>> +PACKAGES = "\
>> +    packagegroup-core-standardlinux \
>> +    packagegroup-core-standardlinux-libs \
>> +    packagegroup-core-standardlinux-utils \
>> +    packagegroup-core-standardlinux-extended \
>> +    packagegroup-core-standardlinux-dev-utils \
>> +    packagegroup-core-standardlinux-multiuser \
>> +    packagegroup-core-standardlinux-initscripts \
>> +    packagegroup-core-standardlinux-sys-services \
>> +    "
>> +
>> +python __anonymous () {
>> +    # For backwards compatibility after rename
>> +    namemap = {}
>> +    namemap["packagegroup-core-standardlinux"] =
>> "packagegroup-core-basic"
>> +    namemap["packagegroup-core-standardlinux-libs"] =
>> "packagegroup-core-basic-libs"
>> +    namemap["packagegroup-core-standardlinux-utils"] =
>> "packagegroup-core-basic-utils"
>> +    namemap["packagegroup-core-standardlinux-extended"] =
>> "packagegroup-core-basic-extended"
>> +    namemap["packagegroup-core-standardlinux-dev-utils"] =
>> "packagegroup-core-dev-utils"
>> +    namemap["packagegroup-core-standardlinux-multiuser"] =
>> "packagegroup-core-multiuser"
>> +    namemap["packagegroup-core-standardlinux-initscripts"] =
>> "packagegroup-core-initscripts"
>> +    namemap["packagegroup-core-standardlinux-sys-services"] =
>> "packagegroup-core-sys-services"
>> +
>> +    packages = d.getVar("PACKAGES", True).split()
>> +    for pkg in packages:
>> +        if pkg.endswith('-dev'):
>> +            mapped = namemap.get(pkg[:-4], None)
>> +            if mapped:
>> +                mapped += '-dev'
>> +        elif pkg.endswith('-dbg'):
>> +            mapped = namemap.get(pkg[:-4], None)
>> +            if mapped:
>> +                mapped += '-dbg'
>> +        else:
>> +            mapped = namemap.get(pkg, None)
>> +
>> +        if mapped:
>> +            oldtaskname = mapped.replace("packagegroup-core",
>> "task-core")
>> +            mapstr = " %s %s" % (mapped, oldtaskname)
>> +            d.appendVar("RPROVIDES_%s" % pkg, mapstr)
>> +            d.appendVar("RREPLACES_%s" % pkg, mapstr)
>> +            d.appendVar("RCONFLICTS_%s" % pkg, mapstr)
>> +}
>> +
>> +
>> +RDEPENDS_packagegroup-core-standardlinux = "\
>> +    packagegroup-core-standardlinux-libs \
>> +    packagegroup-core-standardlinux-utils \
>> +    packagegroup-core-standardlinux-extended \
>> +    packagegroup-core-standardlinux-dev-utils \
>> +    packagegroup-core-standardlinux-multiuser \
>> +    packagegroup-core-standardlinux-initscripts \
>> +    packagegroup-core-standardlinux-sys-services \
>> +    "
>> +
>> +RDEPENDS_packagegroup-core-standardlinux-libs = "\
>> +    glib-2.0 \
>> +    "
>> +
>> +RDEPENDS_packagegroup-core-standardlinux-utils = "\
>> +    bash \
>> +    acl \
>> +    attr \
>> +    bc \
>> +    coreutils \
>> +    cpio \
>> +    e2fsprogs \
>> +    ed \
>> +    file \
>> +    findutils \
>> +    gawk \
>> +    gmp \
>> +    grep \
>> +    makedevs \
>> +    mc \
>> +    mc-fish \
>> +    mc-helpers \
>> +    mc-helpers-perl \
>> +    mc-helpers-python \
>> +    mktemp \
>> +    ncurses \
>> +    net-tools \
>> +    pax \
>> +    popt \
>> +    procps \
>> +    psmisc \
>> +    sed \
>> +    tar \
>> +    time \
>> +    util-linux \
>> +    zlib \
>> +    "
>> +
>> +RDEPENDS_packagegroup-core-standardlinux-extended = "\
>> +    iproute2 \
>> +    iputils \
>> +    iptables \
>> +    module-init-tools \
>> +    openssl \
>> +    "
>> +
>> +RDEPENDS_packagegroup-core-standardlinux-dev-utils = "\
>> +    byacc \
>> +    diffutils \
>> +    m4 \
>> +    make \
>> +    patch \
>> +    "
>> +
>> +VIRTUAL-RUNTIME_initscripts ?= "initscripts"
>> +VIRTUAL-RUNTIME_init_manager ?= "sysvinit"
>> +VIRTUAL-RUNTIME_login_manager ?= "busybox"
>> +VIRTUAL-RUNTIME_syslog ?= "sysklogd"
>> +RDEPENDS_packagegroup-core-standardlinux-initscripts = "\
>> +    ${VIRTUAL-RUNTIME_initscripts} \
>> +    ${VIRTUAL-RUNTIME_init_manager} \
>> +    ethtool \
>> +    ${VIRTUAL-RUNTIME_login_manager} \
>> +    ${VIRTUAL-RUNTIME_syslog} \
>> +    "
>> +
>> +RDEPENDS_packagegroup-core-standardlinux-multiuser = "\
>> +    cracklib \
>> +    gzip \
>> +    ${@base_contains('DISTRO_FEATURES', 'pam', 'libuser', '', d)} \
>> +    shadow \
>> +    sudo \
>> +    "
>> +
>> +RDEPENDS_packagegroup-core-standardlinux-sys-services = "\
>> +    at \
>> +    bzip2 \
>> +    cronie \
>> +    dbus \
>> +    dbus-glib \
>> +    python-dbus \
>> +    elfutils \
>> +    gzip \
>> +    less \
>> +    libcap \
>> +    libevent \
>> +    lighttpd \
>> +    logrotate \
>> +    nfs-utils \
>> +    pciutils \
>> +    libpcre \
>> +    rpcbind \
>> +    sysfsutils \
>> +    tcp-wrappers \
>> +    tzdata \
>> +    "
>> +
>> diff --git a/meta/recipes-graphics/images/core-image-directfb.bb
>> b/meta/recipes-graphics/images/core-image-directfb.bb
>> index 0c6c882..20588f0 100644
>> --- a/meta/recipes-graphics/images/core-image-directfb.bb
>> +++ b/meta/recipes-graphics/images/core-image-directfb.bb
>> @@ -12,6 +12,6 @@ CONFLICT_DISTRO_FEATURES = "x11"
>>
>>   IMAGE_INSTALL += "\
>>         ${CORE_IMAGE_BASE_INSTALL} \
>> -       packagegroup-core-basic \
>> +       packagegroup-core-standardlinux \
>>         packagegroup-core-directfb \
>>   "
>>
>



-- 
Elizabeth Flanagan
Yocto Project
Build and Release


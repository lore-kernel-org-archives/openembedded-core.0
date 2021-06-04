Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.2302.1622827327842476017
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 04 Jun 2021 10:22:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LxjM7Y6s;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id y7so5410860wrh.7
        for <Openembedded-core@lists.openembedded.org>; Fri, 04 Jun 2021 10:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=NjMHcgPWImg5TxybCbXI7RQfrvJFZmRUodkCOiO2s+o=;
        b=LxjM7Y6sQ/tKilYU9C26/Pgkdd1Fif+A6kga/oe0mjmFV6BbXvNO/+Vyiiu7KhAfPI
         D0H5gzPZRDfNqtsN4YSrN3v+eRn/K266ymp0woVHSwm3mrzm19v7HzzX5kDBGALrvdjE
         LrOe4ecKtsG59II1a0rChCAp6y89E2xxPrUFnFVzEKqjogrJm6rvC6pOi/igTztsJLk+
         KILMsD/6PH+S3BqBmr6NQsSr26gSnh8AOMDRbPajyJML8sL6D7a+6RosreI2zj572DAs
         prxZgZxaFEi/jydODlzkmj9dvLUikuTeY7DcYEmfc7GJn/D56TWbTQjx5wG1NcdhnBrA
         P9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=NjMHcgPWImg5TxybCbXI7RQfrvJFZmRUodkCOiO2s+o=;
        b=m+JQgyZGYa3n2z+vb+phMvtN8BwRYOLo0Wy3kRBVsq0zYbzLDDoES97hJpN9BSQmcc
         0o+G9j6aa+vwO0Ba4xuy8qwzbCGNYo5NZpWYFhlgejfdKulDmpaa9odHcih/AH0g9q/T
         5x95ddjeeOORfCrxz7yz1/i6PsyfmGvWR2IXmcYa0UUMqVnyPrbdsJ1daWYrhW/z9xgv
         LIGV9k0Bi4Il5i+Ok1JMoyWeM5DNoN6ZNyEKXXysxKSYOp+0V6zAJ3prkp75lzm22Sw4
         JgChkgRf3NGpWkKp1q/LU5CuJufikZbNLXJeAxCZymcNdzgHezcZMK8DX03xK/P4erSb
         kYpQ==
X-Gm-Message-State: AOAM5319KOpmqFV6NdJ1+NES85YSav3V9yRcMLvahJivERfLTWyxsQSu
	o7BpW0TcQkMvDnDf6IFvXNVwp9LT1UeYyjKd
X-Google-Smtp-Source: ABdhPJzt4ikeFEdXL8Tlr+OTesGuamxMJ5kvDSnfFpx6L6RxIZPhTZCu6W3O/56QrCUJHPiWBhWNDA==
X-Received: by 2002:a5d:64c9:: with SMTP id f9mr2874653wri.121.1622827325715;
        Fri, 04 Jun 2021 10:22:05 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from Vyacheslavs-MacBook-Pro.local ([37.120.204.196])
        by smtp.gmail.com with ESMTPSA id u2sm7089868wrn.38.2021.06.04.10.22.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jun 2021 10:22:05 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] overlayfs.bbclass: generate overlayfs mount units
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <Openembedded-core@lists.openembedded.org>
References: <20210603142106.115932-1-uvv.mail@gmail.com>
 <CADkTA4PF=kie6Q=sqUkZjyX=NB-yq5Ccqy-XryhZ6DNVgcrRFA@mail.gmail.com>
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
Message-ID: <e661a550-5977-9ffe-f30f-98cfd2f1ac4e@gmail.com>
Date: Fri, 4 Jun 2021 19:22:03 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4PF=kie6Q=sqUkZjyX=NB-yq5Ccqy-XryhZ6DNVgcrRFA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Bruce,
Thanks for a quick feedback.

> Hi Vyacheslav,
>
> This looks like it could be quite useful, but a few comments came to
> mind on a really quick scan.
>
> Since this is systemd based, it should probably have
> REQUIRED_DISTRO_FEATURES = "systemd", to ensure that the rest of the
> system and packages are consistently enabled.

Will include it in my v2.

> As part of getting this into core, it needs some sort of test cases /
> test suite (and one that covers the different modes you describe in
> the class) .. so something like a test image (a user) and the tests
> themselves.

Could you please give me a few hints as to where current tests are 
stored and how to run them? Is it meta-selftest layer?

> It really also needs a maintainer entry, since otherwise the
> maintenance work falls to the same already overloaded folks.

You mean just an entry like:
MAINTAINER = "Vyacheslav Yurkov <uvv.mail@gmail.com>

in the class itself?
Because meta/conf/distro/include/maintainers.inc mentions only recipe 
maintainers.

> Since this is intended to be used on a per-recipe basis (at least that
> is my understanding from reading it), what happens if two recipes
> create conflicting overlay mounts ? or if the mentioned data.mount is
> not present in the image ?

These are good questions. I guess if two recipes would try to use the 
same mounts, then do_rootfs should simply fail the same way when two 
recipes install the same file.
As for handling a mount.unit, that has to be done on an image level, I 
guess. The other question is how to do that.. Perhaps a QA-hook in 
ROOTFS_POSTPROCESS_COMMAND, which checks the file existence (not 
validity though!)?

Vyacheslav

> Bruce
>
>> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
>> ---
>>   meta/classes/overlayfs.bbclass | 132 +++++++++++++++++++++++++++++++++
>>   1 file changed, 132 insertions(+)
>>   create mode 100644 meta/classes/overlayfs.bbclass
>>
>> diff --git a/meta/classes/overlayfs.bbclass b/meta/classes/overlayfs.bbclass
>> new file mode 100644
>> index 0000000000..7fac3e696e
>> --- /dev/null
>> +++ b/meta/classes/overlayfs.bbclass
>> @@ -0,0 +1,132 @@
>> +# Class for generation of overlayfs mount units
>> +#
>> +# It's often desired in Embedded System design to have a read-only rootfs.
>> +# But a lot of different applications might want to have a read-write access to
>> +# some parts of a filesystem. It can be especially useful when your update mechanism
>> +# overwrites the whole rootfs, but you want your application data to be preserved
>> +# between updates. This class provides a way to achieve that by means
>> +# of overlayfs and at the same time keeping the base rootfs read-only.
>> +#
>> +# Usage example.
>> +#
>> +# Set a mount point for a partition overlayfs is going to use as upper layer
>> +# in your machine configuration. Underlying file system can be anything that
>> +# is supported by overlayfs
>> +#
>> +#   OVERLAYFS_MOUNT_POINT[data] ?= "/data"
>> +#
>> +# The class assumes you have a data.mount systemd unit defined elsewhere in your
>> +# BSP and installed to the image.
>> +#
>> +# Then you can specify writable directories on a recipe base
>> +#
>> +#   OVERLAYFS_WRITABLE_PATHS[data] = "/usr/share/my-custom-application"
>> +#
>> +# To support several mount points you can use a different variable flag. Assume we
>> +# what to have a writable location on the file system, but not interested where the data
>> +# survive a reboot. The we could have a mnt-overlay.mount unit for a tmpfs file system:
>> +#
>> +#   OVERLAYFS_MOUNT_POINT[mnt-overlay] = "/mnt/overlay"
>> +#   OVERLAYFS_WRITABLE_PATHS[mnt-overlay] = "/usr/share/another-application"
>> +
>> +OVERLAYFS_WRITABLE_PATHS[data] ?= ""
>> +
>> +inherit systemd
>> +
>> +def strForBash(s):
>> +    return s.replace('\\', '\\\\')
>> +
>> +def unitFileList(d):
>> +    fileList = []
>> +    overlayMountPoints = d.getVarFlags("OVERLAYFS_MOUNT_POINT")
>> +    for mountPoint in overlayMountPoints:
>> +        for path in d.getVarFlag('OVERLAYFS_WRITABLE_PATHS', mountPoint).split():
>> +            fileList.append(mountUnitName(path))
>> +            fileList.append(helperUnitName(path))
>> +
>> +    return fileList
>> +
>> +# this function is based on https://github.com/systemd/systemd/blob/main/src/basic/unit-name.c
>> +def escapeSystemdUnitName(path):
>> +    escapeMap = {
>> +        '/': '-',
>> +        '-': "\\x2d",
>> +        '\\': "\\x5d"
>> +    }
>> +    return "".join([escapeMap.get(c, c) for c in path.strip('/')])
>> +
>> +def mountUnitName(unit):
>> +    return escapeSystemdUnitName(unit) + '.mount'
>> +
>> +def helperUnitName(unit):
>> +    return escapeSystemdUnitName(unit) + '-create-upper-dir.service'
>> +
>> +python do_create_overlayfs_units() {
>> +    CreateDirsUnitTemplate = """[Unit]
>> +Description=Overlayfs directories setup
>> +Requires={DATA_MOUNT_UNIT}
>> +After={DATA_MOUNT_UNIT}
>> +DefaultDependencies=no
>> +
>> +[Service]
>> +Type=oneshot
>> +ExecStart=mkdir -p {DATA_MOUNT_POINT}/workdir{LOWERDIR} && mkdir -p {DATA_MOUNT_POINT}/upper{LOWERDIR}
>> +RemainAfterExit=true
>> +StandardOutput=journal
>> +
>> +[Install]
>> +WantedBy=multi-user.target
>> +"""
>> +    MountUnitTemplate = """[Unit]
>> +Description=Overlayfs mount unit
>> +Requires={CREATE_DIRS_SERVICE}
>> +After={CREATE_DIRS_SERVICE}
>> +
>> +[Mount]
>> +What=overlay
>> +Where={LOWERDIR}
>> +Type=overlay
>> +Options=lowerdir={LOWERDIR},upperdir={DATA_MOUNT_POINT}/upper{LOWERDIR},workdir={DATA_MOUNT_POINT}/workdir{LOWERDIR}
>> +
>> +[Install]
>> +WantedBy=multi-user.target
>> +"""
>> +
>> +    def prepareUnits(data, lower):
>> +        args = {
>> +            'DATA_MOUNT_POINT': data,
>> +            'DATA_MOUNT_UNIT': mountUnitName(data),
>> +            'CREATE_DIRS_SERVICE': helperUnitName(lower),
>> +            'LOWERDIR': lower,
>> +        }
>> +
>> +        with open(os.path.join(d.getVar('WORKDIR'), mountUnitName(lower)), 'w') as f:
>> +            f.write(MountUnitTemplate.format(**args))
>> +
>> +        with open(os.path.join(d.getVar('WORKDIR'), helperUnitName(lower)), 'w') as f:
>> +            f.write(CreateDirsUnitTemplate.format(**args))
>> +
>> +    overlayMountPoints = d.getVarFlags("OVERLAYFS_MOUNT_POINT")
>> +    for mountPoint in overlayMountPoints:
>> +        for lower in d.getVarFlag('OVERLAYFS_WRITABLE_PATHS', mountPoint).split():
>> +            prepareUnits(d.getVarFlag('OVERLAYFS_MOUNT_POINT', mountPoint), lower)
>> +}
>> +
>> +# we need to generate file names early during parsing stage
>> +python () {
>> +    unitList = unitFileList(d)
>> +    for unit in unitList:
>> +        d.appendVar('SYSTEMD_SERVICE_' + d.getVar('PN'), ' ' + unit);
>> +        d.appendVar('FILES_' + d.getVar('PN'), strForBash(unit))
>> +
>> +    d.setVar('OVERLAYFS_UNIT_LIST', ' '.join([strForBash(s) for s in unitList]))
>> +}
>> +
>> +do_install_append() {
>> +    install -d ${D}${systemd_system_unitdir}
>> +    for unit in ${OVERLAYFS_UNIT_LIST}; do
>> +        install -m 0444 ${WORKDIR}/${unit} ${D}${systemd_system_unitdir}
>> +    done
>> +}
>> +
>> +addtask create_overlayfs_units before do_install
>> --
>> 2.28.0
>>
>>
>> 
>>


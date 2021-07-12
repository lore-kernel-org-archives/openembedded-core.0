Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web08.8627.1626082944299303609
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 12 Jul 2021 02:42:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UktgjeoJ;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: uvv.mail@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id q16so5883648lfa.5
        for <Openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 02:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=9q0AttpJXTizTy0DzvP9QZKifQJBxtc82ovoGPwkFb4=;
        b=UktgjeoJnUaMj9QKmjhPLjZnGnHO8Bj9HCt4vJwB8hhMr5CjSCOjzendSD6P+pHwa2
         mBBmIcBRblaad0KCcKEwj0hh8HFNQjqhNGDa0A5mtjj1gHpWl1BKMJWQfT70LA0EW0Jt
         Pc7bqU7bKRvwZA3sW0NfZXRIDy3K8qCDp8EHDoefTP4+/blmHyjatjmg+yfhjNFVr2n9
         JomiSB1UZebeg1UKsfJjmrJhDvRp4FD9lXFX7FM117KahiAV1k7OvWE9v4h+Mc6LXQBY
         zmpwZa2uQe+jEKkimVqnyOI4t8/91n0+TS2XEa3cDauLbGtz7ANBhVau32pmzsLJmMNU
         kpfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=9q0AttpJXTizTy0DzvP9QZKifQJBxtc82ovoGPwkFb4=;
        b=M527N6sF5gSGJrzrufANYf2VdmQ3xQed+2E+Xal9vXIH/3vvrWeZqpJO+wFqfCsjJb
         1+eE2HWRk7SavfAZFVlX013fxkics6IBG6ggXxgBx7spsqKWavaU1EGvsdFvg/aDNGug
         REeaniA++9dk2mghgSUJwKmQ/gyA/IKe0W+DyKVO4hE1q+1QbddNJ+yJ5ol7vYcgsZIf
         vWGnnmVT5psDUHjsl71eaoCXmLsxdr69LH2dhlRygq7fougK+Idzz6Apo3ofnRowx3UW
         0J1Z0lQSuOSE1vlhVf+aspY+4i9Lhk1iglHC+4TEfX4lIOD1Ue7CTAEuzhe4Fli3KtF6
         xKrg==
X-Gm-Message-State: AOAM5333dreJEY/Gz+oHtJdNGNhYn/1yeeVHlr1/182Up8e0H8qJfZQf
	JzJ0lz1pzGaASb/C+jbpacBsmV70SS6DzL6F
X-Google-Smtp-Source: ABdhPJyrwRRe5JHVKjghTutmVzGALSEi9ZLTGWL01/HcWZGH74j3xDTcQbUbE94lBxsWoOYaq2zoSA==
X-Received: by 2002:a05:6512:2186:: with SMTP id b6mr39091577lft.490.1626082942249;
        Mon, 12 Jul 2021 02:42:22 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from Vyacheslavs-MacBook-Pro.local ([185.253.97.14])
        by smtp.gmail.com with ESMTPSA id d8sm384710ljg.86.2021.07.12.02.42.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jul 2021 02:42:21 -0700 (PDT)
Subject: Re: [PATCH v2 7/8] oeqa/selftest: overlayfs unit tests
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Openembedded-core@lists.openembedded.org
References: <YOnVwpvuj3OFT5Ti@piout.net>
 <20210711151629.40035-1-uvv.mail@gmail.com> <YOwH5Gi22iL5uzuE@piout.net>
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
Message-ID: <fe457e1d-a651-d3dd-8848-3950fd028871@gmail.com>
Date: Mon, 12 Jul 2021 11:42:20 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YOwH5Gi22iL5uzuE@piout.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Alexandre,
I updated 6/8, could you please run them again?

Thanks,
Vyacheslav

On 12.07.2021 11:14, Alexandre Belloni wrote:
> Hello,
>
> On 11/07/2021 17:16:29+0200, Vyacheslav Yurkov wrote:
>> Unit tests for overlayfs.bbclass
>>
> This still seems to fail the tests:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/2299/steps/14/logs/stdio
>
>> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
>> ---
>>   meta/lib/oeqa/selftest/cases/overlayfs.py | 167 ++++++++++++++++++++++
>>   1 file changed, 167 insertions(+)
>>   create mode 100644 meta/lib/oeqa/selftest/cases/overlayfs.py
>>
>> diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/selftest/cases/overlayfs.py
>> new file mode 100644
>> index 0000000000..a5a4792eb0
>> --- /dev/null
>> +++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
>> @@ -0,0 +1,167 @@
>> +#
>> +# SPDX-License-Identifier: MIT
>> +#
>> +
>> +from oeqa.selftest.case import OESelftestTestCase
>> +from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu
>> +
>> +class OverlayFSTests(OESelftestTestCase):
>> +    """Overlayfs class usage tests"""
>> +
>> +    def getline(self, res, line):
>> +        for l in res.output.split('\n'):
>> +            if line in l:
>> +                return l
>> +
>> +    def add_overlay_conf_to_machine(self):
>> +        machine_inc = """
>> +OVERLAYFS_MOUNT_POINT[mnt-overlay] = "/mnt/overlay"
>> +"""
>> +        self.set_machine_config(machine_inc)
>> +
>> +    def test_distro_features_missing(self):
>> +        """
>> +        Summary:   Check that required DISTRO_FEATURES are set
>> +        Expected:  Fail when either systemd or overlayfs are not in DISTRO_FEATURES
>> +        Author:    Vyacheslav Yurkov <uvv.mail@gmail.com>
>> +        """
>> +
>> +        config = """
>> +IMAGE_INSTALL_append = " overlayfs-user"
>> +"""
>> +        self.write_config(config)
>> +        self.add_overlay_conf_to_machine()
>> +
>> +        res = bitbake('core-image-minimal', ignore_status=True)
>> +        line = self.getline(res, "overlayfs-user was skipped: missing required distro features")
>> +        self.assertTrue("overlayfs" in res.output, msg=res.output)
>> +        self.assertTrue("systemd" in res.output, msg=res.output)
>> +        self.assertTrue("ERROR: Required build target 'core-image-minimal' has no buildable providers." in res.output, msg=res.output)
>> +
>> +    def test_not_all_units_installed(self):
>> +        """
>> +        Summary:   Test QA check that we have required mount units in the image
>> +        Expected:  Fail because mount unit for overlay partition is not installed
>> +        Author:    Vyacheslav Yurkov <uvv.mail@gmail.com>
>> +        """
>> +
>> +        config = """
>> +IMAGE_INSTALL_append = " overlayfs-user"
>> +DISTRO_FEATURES += "systemd overlayfs"
>> +"""
>> +
>> +        self.write_config(config)
>> +        self.add_overlay_conf_to_machine()
>> +
>> +        res = bitbake('core-image-minimal', ignore_status=True)
>> +        line = self.getline(res, "Unit name mnt-overlay.mount not found in systemd unit directories")
>> +        self.assertTrue(line and line.startswith("WARNING:"), msg=res.output)
>> +        line = self.getline(res, "Not all mount units are installed by the BSP")
>> +        self.assertTrue(line and line.startswith("ERROR:"), msg=res.output)
>> +
>> +    def test_mount_unit_not_set(self):
>> +        """
>> +        Summary:   Test whether mount unit was set properly
>> +        Expected:  Fail because mount unit was not set
>> +        Author:    Vyacheslav Yurkov <uvv.mail@gmail.com>
>> +        """
>> +
>> +        config = """
>> +IMAGE_INSTALL_append = " overlayfs-user"
>> +DISTRO_FEATURES += "systemd overlayfs"
>> +"""
>> +
>> +        self.write_config(config)
>> +
>> +        res = bitbake('core-image-minimal', ignore_status=True)
>> +        line = self.getline(res, "A recipe uses overlayfs class but there is no OVERLAYFS_MOUNT_POINT set in your MACHINE configuration")
>> +        self.assertTrue(line and line.startswith("Parsing recipes...ERROR:"), msg=res.output)
>> +
>> +    def test_wrong_mount_unit_set(self):
>> +        """
>> +        Summary:   Test whether mount unit was set properly
>> +        Expected:  Fail because not the correct flag used for mount unit
>> +        Author:    Vyacheslav Yurkov <uvv.mail@gmail.com>
>> +        """
>> +
>> +        config = """
>> +IMAGE_INSTALL_append = " overlayfs-user"
>> +DISTRO_FEATURES += "systemd overlayfs"
>> +"""
>> +
>> +        wrong_machine_config = """
>> +OVERLAYFS_MOUNT_POINT[usr-share-overlay] = "/usr/share/overlay"
>> +"""
>> +
>> +        self.write_config(config)
>> +        self.set_machine_config(wrong_machine_config)
>> +
>> +        res = bitbake('core-image-minimal', ignore_status=True)
>> +        line = self.getline(res, "Missing required mount point for OVERLAYFS_MOUNT_POINT[mnt-overlay] in your MACHINE configuration")
>> +        self.assertTrue(line and line.startswith("Parsing recipes...ERROR:"), msg=res.output)
>> +
>> +    def test_correct_image(self):
>> +        """
>> +        Summary:   Check that we can create an image when all parameters are
>> +                   set correctly
>> +        Expected:  Image is created successfully
>> +        Author:    Vyacheslav Yurkov <uvv.mail@gmail.com>
>> +        """
>> +
>> +        config = """
>> +IMAGE_INSTALL_append = " overlayfs-user systemd-machine-units"
>> +DISTRO_FEATURES += "systemd overlayfs"
>> +
>> +# Use systemd as init manager
>> +VIRTUAL-RUNTIME_init_manager = "systemd"
>> +
>> +# enable overlayfs in the kernel
>> +KERNEL_EXTRA_FEATURES_append = " features/overlayfs/overlayfs.scc"
>> +"""
>> +
>> +        systemd_machine_unit_append = """
>> +SYSTEMD_SERVICE_${PN} += " \
>> +    mnt-overlay.mount \
>> +"
>> +
>> +do_install_append() {
>> +    install -d ${D}${systemd_system_unitdir}
>> +    cat <<EOT > ${D}${systemd_system_unitdir}/mnt-overlay.mount
>> +[Unit]
>> +Description=Tmpfs directory
>> +DefaultDependencies=no
>> +
>> +[Mount]
>> +What=tmpfs
>> +Where=/mnt/overlay
>> +Type=tmpfs
>> +Options=mode=1777,strictatime,nosuid,nodev
>> +
>> +[Install]
>> +WantedBy=multi-user.target
>> +EOT
>> +}
>> +
>> +"""
>> +
>> +        self.write_config(config)
>> +        self.add_overlay_conf_to_machine()
>> +        self.write_recipeinc('systemd-machine-units', systemd_machine_unit_append)
>> +
>> +        bitbake('core-image-minimal')
>> +
>> +        def getline_qemu(out, line):
>> +            for l in out.split('\n'):
>> +                if line in l:
>> +                    return l
>> +
>> +        with runqemu('core-image-minimal') as qemu:
>> +            # Check that we have /mnt/overlay fs mounted as tmpfs and
>> +            # /usr/share/my-application as an overlay (see overlayfs-user recipe)
>> +            status, output = qemu.run_serial("/bin/mount -t tmpfs,overlay")
>> +
>> +            line = getline_qemu(output, "on /mnt/overlay")
>> +            self.assertTrue(line and line.startswith("tmpfs"), msg=output)
>> +
>> +            line = getline_qemu(output, "upperdir=/mnt/overlay/upper/usr/share/my-application")
>> +            self.assertTrue(line and line.startswith("overlay"), msg=output)
>> -- 
>> 2.28.0
>>


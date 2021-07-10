Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web10.24072.1625921225902995338
 for <Openembedded-core@lists.openembedded.org>;
 Sat, 10 Jul 2021 05:47:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LEC1xp1Z;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: uvv.mail@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id y8so15940447iop.13
        for <Openembedded-core@lists.openembedded.org>; Sat, 10 Jul 2021 05:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=kndHlKoeNFX0WaIifqBU7N8FBiKFxrHhcTjcglzwdOU=;
        b=LEC1xp1ZDuXS3zAgNtfSGH2QizPmNLG4KLh/vCBnIvSvtX4weiOb1EUVT3bdXi1zA3
         WI/R/0D+wujHV8/PtkAkq1mHAIi/NSb5SVY+Onu1Y0LIGotAalyrQZAd2nkEyaX8jg+g
         KTr3LYKrrBofG5lC+hCLeX1sKetyFsJEqivtp2XNdE9mA2itkwbsyQqJIXUbEJuC9Q3j
         SYDaN4S1/go1yfQgIOxP87IuSwVDCF5BGB4edLztZn3ZFbB6ZSg9Ie6czjaeM3EDCbRH
         lTDz7SCFl52AzVzNFErh01e5vPv4rpvooCyh/GWQ+y4jLnnhuI3nZULpD2PyhGa21QbA
         1BfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=kndHlKoeNFX0WaIifqBU7N8FBiKFxrHhcTjcglzwdOU=;
        b=ueYHNHBjTTlZjKkqOijuUQEsqtzJDSYixyXNvZ51c1zW2KTUFewC7xRzRUukK7olRs
         l9XDaTdeI3k4q7pUzsIFG4JYf1sOjxvcqGkWaLyj9LDx0gw213x8VAHd/fHDMW1te4eq
         7fhp4FFiCejSE7gFj/8MVDM4vmnrzdR2PeTTC0uRSQ18Z7Kh2zCFcg/DHu9ZfseBsVPi
         HJkJaJRR2h5JpvsX7Qja7PkLh1KlY7+HncNPPtwE3ElNLIqo4rtfAZnrsCinD8xg1y2M
         6DDo6+o/2Dduu3gedxryWq8uY1T1Q+hm05M0j0LLvZ+OaI991NLqjEYQqE6aX9nX5/YQ
         LxIg==
X-Gm-Message-State: AOAM5323PHUZqgZ8t+3Z2gSC7DKbY6Y2zhlVkSHoyH0wozyVUY7MKL6J
	PX6P5DwaUHKRnZuaS/82niw=
X-Google-Smtp-Source: ABdhPJwVwc79Wtw6sIEyiEUeu04mhHPqJ2v8BfNdoTQqHKuiU0K74E4M8WIfxFCBmtUC4GEgYAr3MQ==
X-Received: by 2002:a05:6602:10e:: with SMTP id s14mr33022854iot.52.1625921225316;
        Sat, 10 Jul 2021 05:47:05 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from Vyacheslavs-MacBook-Pro.local ([37.120.205.173])
        by smtp.gmail.com with ESMTPSA id d14sm4588481iln.48.2021.07.10.05.47.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jul 2021 05:47:04 -0700 (PDT)
Subject: Re: [OE-core] [PATCH v2 7/8] oeqa/selftest: overlayfs unit tests
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Openembedded-core@lists.openembedded.org,
 Alexander Kanavin <alex.kanavin@gmail.com>
References: <20210709113146.69020-1-uvv.mail@gmail.com>
 <20210709113146.69020-7-uvv.mail@gmail.com> <YOlrZMKjhMGDaJz2@piout.net>
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
Message-ID: <cbaa979e-a0fc-7d3a-8789-4bb265abc759@gmail.com>
Date: Sat, 10 Jul 2021 14:47:01 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YOlrZMKjhMGDaJz2@piout.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Alexandre,
Thanks for the build.
Seems like I forgot a space in _append :/

I'd like to address Alex request too to include a run-time test. Is 
there a way to update only this patch without resending the whole series?

Thanks,
Vyacheslav

On 10.07.2021 11:41, Alexandre Belloni wrote:
> Hello,
>
> On 09/07/2021 13:31:45+0200, Vyacheslav Yurkov wrote:
>> Unit tests for overlayfs.bbclass
>>
> I believe I properly applied the series but it fails with:
>
> Parsing recipes...ERROR: /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-1517413/meta-selftest/recipes-test/overlayfs/overlayfs-user.bb: A recipe uses overlayfs class but there is no OVERLAYFS_MOUNT_POINT set in your MACHINE configuration
>
> See https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/2290/steps/14/logs/stdio
>
>> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
>> ---
>>   meta/lib/oeqa/selftest/cases/overlayfs.py | 126 ++++++++++++++++++++++
>>   1 file changed, 126 insertions(+)
>>   create mode 100644 meta/lib/oeqa/selftest/cases/overlayfs.py
>>
>> diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/selftest/cases/overlayfs.py
>> new file mode 100644
>> index 0000000000..74bf1c4167
>> --- /dev/null
>> +++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
>> @@ -0,0 +1,126 @@
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
>> +    def test_distro_features_missing(self):
>> +        """
>> +        Summary:   Check that required DISTRO_FEATURES are set
>> +        Expected:  Fail when either systemd or overlayfs are not in DISTRO_FEATURES
>> +        Author:    Vyacheslav Yurkov <uvv.mail@gmail.com>
>> +        """
>> +
>> +        config = """
>> +OVERLAYFS_MOUNT_POINT[mnt-overlay] = "/mnt/overlay"
>> +IMAGE_INSTALL_append = "overlayfs-user"
>> +"""
>> +        self.write_config(config)
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
>> +OVERLAYFS_MOUNT_POINT[mnt-overlay] = "/mnt/overlay"
>> +IMAGE_INSTALL_append = "overlayfs-user"
>> +DISTRO_FEATURES += "systemd overlayfs"
>> +"""
>> +        self.write_config(config)
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
>> +IMAGE_INSTALL_append = "overlayfs-user"
>> +DISTRO_FEATURES += "systemd overlayfs"
>> +"""
>> +        self.write_config(config)
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
>> +OVERLAYFS_MOUNT_POINT[usr-share-overlay] = "/usr/share/overlay"
>> +IMAGE_INSTALL_append = "overlayfs-user"
>> +DISTRO_FEATURES += "systemd overlayfs"
>> +"""
>> +        self.write_config(config)
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
>> +OVERLAYFS_MOUNT_POINT[mnt-overlay] = "/mnt/overlay"
>> +IMAGE_INSTALL_append = "overlayfs-user systemd-machine-units"
>> +DISTRO_FEATURES += "systemd overlayfs"
>> +"""
>> +
>> +        systemd_machine_unit_append = """
>> +SYSTEMD_SERVICE_${PN} += " \
>> +    mnt-overlay.mount \
>> +"
>> +
>> +do_install() {
>> +    install -d ${D}${systemd_unitdir}/system
>> +    cat <<EOT > ${D}${systemd_unitdir}/system/mnt-overlay.mount
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
>> +        self.write_config(config)
>> +        self.write_recipeinc('systemd-machine-units', systemd_machine_unit_append)
>> +        bitbake('core-image-minimal')
>> -- 
>> 2.28.0
>>

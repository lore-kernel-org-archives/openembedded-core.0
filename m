Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id D74396093E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Dec 2016 10:23:29 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id y21so218632914lfa.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Dec 2016 02:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=PWoTjCapk8nypaYpJOzOiOaedzp73BaoQY3Hb7OUTDs=;
	b=g/pypTByahhpvaa1Ghgo9RGj5jQAOYK0wWVWUyWHF1eT1gmcMszwdUABsZuTHKf0kC
	P79MwBCE7qWMMS34MT8f33ffjLVjOImebyik04rZF6ML6Yq587/rHcAvzGURz2W6I287
	QtOIExDCHwlS+y4A81BIfmp7hNM1+erDNGqOdujmoLPE8YUQQGxQi0AURwMw8dI/HrFg
	W5TGJe4xK1/batPvGydsmAHGHrK81Z05iSHaQFnxkuNGdCgKYdin1Kes5dhASrclMqCr
	nm22VyZPBkWW/psPASF65Ngu8POE3zXdNCms5TO1ECKpZl+TwsF3qLxLpLlbtmiNhUWj
	QJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=PWoTjCapk8nypaYpJOzOiOaedzp73BaoQY3Hb7OUTDs=;
	b=KvCcI1YaIrx1FNRV8ffLwBliB9auT8bg3+1ho29mrIsKikN97Q40h9slEJFy1cYquc
	tO18BpdfWMt4QSdlyrOoXZz+rnMfSdU+ny4BRc6sE7pgOZw+pYJYJcCDuYPPQcrKS0UK
	VsPFjTVaVlakBEdJ42TSUvh6WFqHyMr1GxA+dwBYEzQStUDYSu/2qKCnHvhynxIkOIJQ
	RuvhRJd2KhgMpdlq1edjOvR2glVbgW4Q1adiPa5X+Lc4xJA7PxeQBJDdYxaHbfYkSQF1
	aivc08eF5SQRi6XTApuCbcwxkzUndRpcblFifwoKlKpZVESixo2ek3sQkbsaQmOb4bF+
	9M7w==
X-Gm-Message-State: AIkVDXLNsKkczcZCJ3ySgbr+AuFL7Cyxxm465CLnZPxr5hXR4H26fEnHZ01EScG/lKxYYw==
X-Received: by 10.25.145.91 with SMTP id y27mr15165143lfj.29.1483007010138;
	Thu, 29 Dec 2016 02:23:30 -0800 (PST)
Received: from [10.25.0.170] ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	x17sm12965099lja.6.2016.12.29.02.23.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Dec 2016 02:23:29 -0800 (PST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <CAJTo0LZ4S6FWzR6u2Kek_KjcXD48qTWbVLn5Vm2j20fJtyts9A@mail.gmail.com>
	<1483005929-8231-1-git-send-email-kristian.amlie@mender.io>
	<1483005929-8231-3-git-send-email-kristian.amlie@mender.io>
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <b7a30224-1198-ac92-7f70-708196ca7814@mender.io>
Date: Thu, 29 Dec 2016 11:23:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <1483005929-8231-3-git-send-email-kristian.amlie@mender.io>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 2/2] selftest/wic: Add tests for --exclude-dir option.
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
X-List-Received-Date: Thu, 29 Dec 2016 10:23:30 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Sorry, I forgot to rebase, I will repost.

-- 
Kristian


On 29/12/16 11:05, Kristian Amlie wrote:
> Based partially on an earlier patch by Maciej Borzecki.
> 
> Signed-off-by: Kristian Amlie <kristian.amlie@mender.io>
> ---
>  meta/lib/oeqa/selftest/wic.py | 97 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 97 insertions(+)
> 
> diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
> index faac11e..9afa696 100644
> --- a/meta/lib/oeqa/selftest/wic.py
> +++ b/meta/lib/oeqa/selftest/wic.py
> @@ -299,3 +299,100 @@ class Wic(oeSelfTest):
>          self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
>                                     % image).status)
>          self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
> +
> +    def test_exclude_path(self):
> +        """Test --exclude-path wks option."""
> +
> +        wks_file = 'temp.wks'
> +        with open(wks_file, 'w') as wks:
> +            rootfs_dir = get_bb_var('IMAGE_ROOTFS', 'core-image-minimal')
> +            wks.write("""part / --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path usr
> +part /usr --source rootfs --ondisk mmcblk0 --fstype=ext4 --rootfs-dir %s/usr
> +part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --rootfs-dir %s/usr"""
> +                      % (rootfs_dir, rootfs_dir))
> +        self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
> +                                   % wks_file).status)
> +
> +        os.remove(wks_file)
> +        wicout = glob(self.resultdir + "%s-*direct" % 'temp')
> +        self.assertEqual(1, len(wicout))
> +
> +        wicimg = wicout[0]
> +
> +        # verify partition size with wic
> +        res = runCmd("parted -m %s unit b p 2>/dev/null" % wicimg)
> +        self.assertEqual(0, res.status)
> +
> +        # parse parted output which looks like this:
> +        # BYT;\n
> +        # /var/tmp/wic/build/tmpfwvjjkf_-201611101222-hda.direct:200MiB:file:512:512:msdos::;\n
> +        # 1:0.00MiB:200MiB:200MiB:ext4::;\n
> +        partlns = res.output.splitlines()[2:]
> +
> +        self.assertEqual(3, len(partlns))
> +
> +        for part in [1, 2, 3]:
> +            part_file = os.path.join(self.resultdir, "selftest_img.part%d" % part)
> +            partln = partlns[part-1].split(":")
> +            self.assertEqual(7, len(partln))
> +            start = int(partln[1].rstrip("B")) / 512
> +            length = int(partln[3].rstrip("B")) / 512
> +            self.assertEqual(0, runCmd("dd if=%s of=%s skip=%d count=%d" %
> +                                       (wicimg, part_file, start, length)).status)
> +
> +        # Test partition 1, should contain the normal root directories, except
> +        # /usr.
> +        res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % os.path.join(self.resultdir, "selftest_img.part1"))
> +        self.assertEqual(0, res.status)
> +        files = [line.split('/')[5] for line in res.output.split('\n')]
> +        self.assertIn("etc", files)
> +        self.assertNotIn("usr", files)
> +
> +        # Partition 2, should contain common directories for /usr, not root
> +        # directories.
> +        res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % os.path.join(self.resultdir, "selftest_img.part2"))
> +        self.assertEqual(0, res.status)
> +        files = [line.split('/')[5] for line in res.output.split('\n')]
> +        self.assertNotIn("etc", files)
> +        self.assertNotIn("usr", files)
> +        self.assertIn("share", files)
> +
> +        # Partition 3, should contain the same as partition 2, including the bin
> +        # directory, but not the files inside it.
> +        res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % os.path.join(self.resultdir, "selftest_img.part3"))
> +        self.assertEqual(0, res.status)
> +        files = [line.split('/')[5] for line in res.output.split('\n')]
> +        self.assertNotIn("etc", files)
> +        self.assertNotIn("usr", files)
> +        self.assertIn("share", files)
> +        self.assertIn("bin", files)
> +        res = runCmd("debugfs -R 'ls -p bin' %s 2>/dev/null" % os.path.join(self.resultdir, "selftest_img.part3"))
> +        self.assertEqual(0, res.status)
> +        files = [line.split('/')[5] for line in res.output.split('\n')]
> +        self.assertIn(".", files)
> +        self.assertIn("..", files)
> +        self.assertEqual(2, len(files))
> +
> +        for part in [1, 2, 3]:
> +            part_file = os.path.join(self.resultdir, "selftest_img.part%d" % part)
> +            os.remove(part_file)
> +
> +    def test_exclude_path_errors(self):
> +        """Test --exclude-path wks option error handling."""
> +        wks_file = 'temp.wks'
> +
> +        rootfs_dir = get_bb_var('IMAGE_ROOTFS', 'core-image-minimal')
> +
> +        # Absolute argument.
> +        with open(wks_file, 'w') as wks:
> +            wks.write("part / --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path /usr")
> +        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal" \
> +                                      % wks_file, ignore_status=True).status)
> +        os.remove(wks_file)
> +
> +        # Argument pointing to parent directory.
> +        with open(wks_file, 'w') as wks:
> +            wks.write("part / --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path ././..")
> +        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal" \
> +                                      % wks_file, ignore_status=True).status)
> +        os.remove(wks_file)
> 


Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id B3A0777835
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 10:37:18 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id j90so61747523lfk.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 03:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=nknlBAzMfUulDhwedi3Bqi7YMnvR0/Wo3lJXajyXnaU=;
	b=ykxJpLuhwFpU8jvX2HYbW/+qNItKxfiDiFxYuUqmPeXiJGaNu9A9QWfc8ZhISuIm4V
	mw+NTpIzRGcHxHPD5cCt13KkZmx/tokcYBJnlv+76iTkDx8iOxu9hpVzjf1/rYl9+6du
	JkQ1by+hRv4Ssv4OILRc8lA9fplxb+VidCQOPKWrR7YCeaYERTxUKFjMedqH9G2h4l2y
	xWvjkTzyDA2+7lDPPW61/7LEigyuQnlWtuGG07apxhE642BriMmEd9+arFaKTqHSwNgs
	G5fHRAG9dcmOBxXcLEBVY6KK2Yg5KyD7eGM5s9HxaAHbO6gc8AX1syupC18qL2RPTN0y
	QS6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=nknlBAzMfUulDhwedi3Bqi7YMnvR0/Wo3lJXajyXnaU=;
	b=tY/rgV81ZUue4CAqT93syTvVsl/+didUUZKBu/SOhzyoXw8WyZ6LXHHPgB9V+4h1aE
	r2BVeatV6E8+YVGfjDD0LL+0mSpMEpWu+wAmysvwDDPN+6PrB7pmkH3TRzRMVH2g4lzj
	EjaForYDCm6mst0axyhI9nqqCXUKbpd6GzxzSO1Ed6QpzY3WvFbCMJ85b0huWBon0YVX
	71zxsm2gQOWiq9e7da1rtOx7U4XD3pi24DfsXRIxt8ocMnBSDdpSxM6M9jmdzoqoCiY8
	k+U1cnJ74EsBr2Mlmj74E6tvogAdLGMDtvnzBiKvmD7wy34OPiaXOLj792b4E0D9ohXZ
	db6A==
X-Gm-Message-State: AMke39lt8tOgy7pwi5K02cbugw5NKllsbKOuhUMMolkjptxMEm7Ua2OwXQ0synapPQojFA==
X-Received: by 10.25.233.21 with SMTP id g21mr8610181lfh.130.1489401439061;
	Mon, 13 Mar 2017 03:37:19 -0700 (PDT)
Received: from [10.25.0.177] ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	l11sm3558373ljb.45.2017.03.13.03.37.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Mar 2017 03:37:17 -0700 (PDT)
To: Maciej Borzecki <maciej.borzecki@rndity.com>,
	openembedded-core@lists.openembedded.org
References: <1b0cfc24faa5ed847db7b1c795e400645289c629.1489390933.git.maciej.borzecki@rndity.com>
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <35b7d949-8df4-14ba-5278-14054bc66b20@mender.io>
Date: Mon, 13 Mar 2017 11:37:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1b0cfc24faa5ed847db7b1c795e400645289c629.1489390933.git.maciej.borzecki@rndity.com>
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: Re: [PATCH] wic: selftest: account for occasional newline in debugfs file names
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
X-List-Received-Date: Mon, 13 Mar 2017 10:37:19 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 13/03/17 11:19, Maciej Borzecki wrote:
> Debugfs output may contain a newline in file names in 'ls -p' output. Make sure
> that output is correctly split into lines by matching '/\n' and newlines are
> removed from file names.
> 
> Fixes the following error appearing in AB tests:
> 
>    Traceback (most recent call last):
>      File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/wic.py", line 388, in test_exclude_path
>        files = [line.split('/')[5] for line in res.output.split('\n')]
>      File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/wic.py", line 388, in <listcomp>
>        files = [line.split('/')[5] for line in res.output.split('\n')]
>    IndexError: list index out of range
> 
> Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
> ---
>  meta/lib/oeqa/selftest/wic.py | 25 +++++++++++++++++++++----
>  1 file changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
> index dcb88bacad13a2da4c725abf1c986b39ea70f0fc..825312e5a55639129d88246e7335174484260fc1 100644
> --- a/meta/lib/oeqa/selftest/wic.py
> +++ b/meta/lib/oeqa/selftest/wic.py
> @@ -381,11 +381,28 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
>                  self.assertEqual(0, runCmd("dd if=%s of=%s skip=%d count=%d" %
>                                             (wicimg, part_file, start, length)).status)
>  
> +            def extract_files(debugfs_output):
> +                # extract file names from the output of debugfs -R 'ls -p',
> +                # which looks like this:
> +                #
> +                # /2/040755/0/0/.//\n
> +                # /2/040755/0/0/..//\n
> +                # /11/040700/0/0/lost+found^M//\n
> +                # /12/040755/1002/1002/run//\n
> +                # /13/040755/1002/1002/sys//\n
> +                # /14/040755/1002/1002/bin//\n
> +                # /80/040755/1002/1002/var//\n
> +                # /92/040755/1002/1002/tmp//\n
> +                #
> +                # NOTE the occasional ^M in file names
> +                return [line.split('/')[5].strip() for line in \
> +                        debugfs_output.strip().split('/\n')]
> +
>              # Test partition 1, should contain the normal root directories, except
>              # /usr.
>              res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % os.path.join(self.resultdir, "selftest_img.part1"))
>              self.assertEqual(0, res.status)
> -            files = [line.split('/')[5] for line in res.output.split('\n')]
> +            files = extract_files(res.output)
>              self.assertIn("etc", files)
>              self.assertNotIn("usr", files)
>  
> @@ -393,7 +410,7 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
>              # directories.
>              res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % os.path.join(self.resultdir, "selftest_img.part2"))
>              self.assertEqual(0, res.status)
> -            files = [line.split('/')[5] for line in res.output.split('\n')]
> +            files = extract_files(res.output)
>              self.assertNotIn("etc", files)
>              self.assertNotIn("usr", files)
>              self.assertIn("share", files)
> @@ -402,14 +419,14 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
>              # directory, but not the files inside it.
>              res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % os.path.join(self.resultdir, "selftest_img.part3"))
>              self.assertEqual(0, res.status)
> -            files = [line.split('/')[5] for line in res.output.split('\n')]
> +            files = extract_files(res.output)
>              self.assertNotIn("etc", files)
>              self.assertNotIn("usr", files)
>              self.assertIn("share", files)
>              self.assertIn("bin", files)
>              res = runCmd("debugfs -R 'ls -p bin' %s 2>/dev/null" % os.path.join(self.resultdir, "selftest_img.part3"))
>              self.assertEqual(0, res.status)
> -            files = [line.split('/')[5] for line in res.output.split('\n')]
> +            files = extract_files(res.output)
>              self.assertIn(".", files)
>              self.assertIn("..", files)
>              self.assertEqual(2, len(files))

Looks good to me.

-- 
Kristian


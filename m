Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id F11E56AD0D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jul 2015 13:22:38 +0000 (UTC)
Received: by wiga1 with SMTP id a1so125537079wig.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jul 2015 06:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=MjvLXkIedGjXim2XzJsPD2Dfnit/FR+9/UbFpyeI9eM=;
	b=ThAB6iYpg7CcXFn4IG508aZRCPdJ8ln7dxHe7Lb8vXaiNlISbSYIomGw2g2t8qfnU9
	T9Ud5UYidwnuT9sHf/qHCFb1B2WdGu4ScV8JihdWVnA5voQ53yN4PSxPEEVaiqVVnlTG
	fmDO4DZ5JB6CqAakLQhbtIa2G9qYz2Kmsoz0rHn71LLXYdB2dhKhfCLl56BAkJi9M189
	lUMVRlEQGvGhwxgmB8d6QpcYRO9LT7sB1tiLwojwVJyiXpjpjwtopgCihixp4kB2afos
	97vjmwdSKLSKgFlpKYAzEh+4tDT16FSXvJyD2iOV+mx5/vm3yy82zvIJL/BzyKMtXKXq
	utYQ==
X-Received: by 10.180.74.210 with SMTP id w18mr6474343wiv.77.1435756958564;
	Wed, 01 Jul 2015 06:22:38 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	lz10sm2906054wjb.48.2015.07.01.06.22.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Jul 2015 06:22:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 1 Jul 2015 15:23:00 +0200
To: openembedded-core@lists.openembedded.org
Message-ID: <20150701132300.GI2409@jama>
References: <1433765628-15931-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1433765628-15931-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] squashfs-tools: upgrade to newer revision from git
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
X-List-Received-Date: Wed, 01 Jul 2015 13:22:39 -0000
X-Groupsio-MsgNum: 67412
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1ppIqr1kl39GnwQx"
Content-Disposition: inline

--1ppIqr1kl39GnwQx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 08, 2015 at 02:13:48PM +0200, Martin Jansa wrote:
> * 4.3 release has nasty hard to reproduce bug in LZO compression
>   which in few cases results in one of these 2 errors:
>   1) Lseek failure when creating the FS:
>     | writer: Lseek on destination failed because Bad file descriptor, offset=0x1f72306
>     | FATAL ERROR:Probably out of space on output filesystem
>     | Parallel mksquashfs: Using 32 processors
>     | Creating 4.0 filesystem on rootfs.squashfs, block size 262144.
>     ..
>   2) failing to read the filesystem in runtime, kernel 3.16.0 showing
>     errors like this:
>     [   46.720568] SQUASHFS error: lzo decompression failed, data probably corrupt
>     [   46.730003] SQUASHFS error: squashfs_read_data failed to read block 0x1f72305
>     [   46.740076] SQUASHFS error: Unable to read fragment cache entry [1f72305]
>   it's fixed in upstream git repo:
>   https://github.com/plougher/squashfs-tools/commit/de03266983ceb62e5365aac84fcd3b2fd4d16e6f
>   https://github.com/plougher/squashfs-tools/commit/9c1db6d13a51a2e009f0027ef336ce03624eac0d
>   the official repo is:
>   https://git.kernel.org/cgit/fs/squashfs/squashfs-tools.git
>   but author's github is kept in sync so we can use just that

Ping

--1ppIqr1kl39GnwQx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWT6bMACgkQN1Ujt2V2gByadQCeNQuMblxewY9ja9OHYK8vNkKL
wOoAoJdblKNhsFdE5e0RTe01HXMQ9iL3
=3sPp
-----END PGP SIGNATURE-----

--1ppIqr1kl39GnwQx--

Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1693971ABC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Apr 2017 14:13:19 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id o123so30206389pga.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Apr 2017 07:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=b7cSJZ1MifxWgrLWjhXEK3blSG6ReuFQ/RL5Y6jyMf4=;
	b=lr7OrISHOQckl94CO4TLwHl82Lac0anIYd7dTQRw4yJQSjakElM++s9TMJBYhbk2Jb
	ieErfFFSfU28B1WS+dtRFo2Mj1Oklf4gFQ2Td9JCw0QVX0Fsr7RjkM/uHLEufLu5zIJp
	Cv5GKYua1IzTXbZl0wyIez+eMYWowWW83/J/YLU8VsVkLnqclod/qstJdKLxCKecRNTF
	lqVV1MGyaFqKwBrDgwDZFblsATK6UgVAEW2QV9SkBh1qQaCCloJJNX38JJ/1ktuRZsl/
	WO3t2IhwX7F6j3eYXUGEFA05GSQiljJFAKWF8W9vAwJSyiRVA+gGjzw9l1GpTTXY1ri1
	59yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=b7cSJZ1MifxWgrLWjhXEK3blSG6ReuFQ/RL5Y6jyMf4=;
	b=jjI5tr806pnQqmwdhQ4iW/06wlwjr/vGB570NylRrF0MXGjl1gBm1CJetXSJWA0r4r
	NMtKgogT+VDfLQs6ndw+ynWxCmvirwSWBIOnU6rqe2pIUrxHMVxmOsP+RrjoPvUtRKcD
	hZWOsWX1A4TCQqmtVDlG22fOIEpzfPup4okJ8lZHkoiPVfYt0NtVxw6JT2tAQd29zowF
	RYhMgdD/0K284rRj+09K10FkeYmgSaopKu86i9WPePnbPOCB2a69/55kjIzzrBC9WkTQ
	iCJJsb2/kyy/kUm/xcR7An1nrN37TrjJEZtEhghHrvjWsZ+oez+Hr0JMOgXuW+IMxv9D
	MJcg==
X-Gm-Message-State: AFeK/H2z3yInupXg1i60+q81iv2TZuctA24kBZBO2qxhDkveBqO6TZrCr2RAhplfxdQ2YA==
X-Received: by 10.84.218.71 with SMTP id f7mr22389247plm.188.1491228800829;
	Mon, 03 Apr 2017 07:13:20 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:e3df:bf0a:9f90:498e?
	([2601:202:4001:9ea0:e3df:bf0a:9f90:498e])
	by smtp.gmail.com with ESMTPSA id
	l28sm26576612pgc.11.2017.04.03.07.13.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Apr 2017 07:13:20 -0700 (PDT)
To: Daniel Schultz <d.schultz@phytec.de>,
	openembedded-core@lists.openembedded.org
References: <1491205675-41194-1-git-send-email-d.schultz@phytec.de>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5e4181fb-03ce-d521-2e68-fea083e5d423@gmail.com>
Date: Mon, 3 Apr 2017 07:13:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1491205675-41194-1-git-send-email-d.schultz@phytec.de>
Subject: Re: [PATCH morty v3] wic: partition: Run fsck on EXT file systems
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
X-List-Received-Date: Mon, 03 Apr 2017 14:13:20 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 04/03/2017 12:47 AM, Daniel Schultz wrote:
> Mkfs may create EXT file systems which can only be optimized by fsck
> and not by itself, e.g. directory optimization (in Pass 3A).
>
> To prevent those optimizations during runtime, it will be performed after
> the creation of an EXT file system.
>
> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
> ---
> Changes:
> 	v3: Added 'test' to avoid build failures with missing e2fsprogs backport
Ah, this might help me.

I am seeing loads of failures in oe-selftest over the weekend on my 
staging changes.

thanks for the update.

- armin
>
>   scripts/lib/wic/partition.py | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> index 3b3bd2d..ec3aa66 100644
> --- a/scripts/lib/wic/partition.py
> +++ b/scripts/lib/wic/partition.py
> @@ -239,6 +239,9 @@ class Partition():
>               (self.fstype, extra_imagecmd, rootfs, label_str, rootfs_dir)
>           exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
>   
> +        mkfs_cmd = "fsck.%s -pvfD %s || [ $? -le 3 ]" % (self.fstype, rootfs)
> +        exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
> +
>       def prepare_rootfs_btrfs(self, rootfs, oe_builddir, rootfs_dir,
>                                native_sysroot, pseudo):
>           """



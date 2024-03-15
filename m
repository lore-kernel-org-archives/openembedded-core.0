Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B287BC54E58
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 18:19:28 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web11.403.1710526761554674246
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 11:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=AG5DIjNn;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67, mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-2.intern.sigma-chemnitz.de (mail-mta-2.intern.sigma-chemnitz.de [192.168.12.70])
	by mail-out-3.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTPS id 42FIJJOH147019
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 19:19:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1710526759;
	bh=f6fyE8KGJAqpJOtWczR/wkaxWF2H9DJAYbqyiXvWA+c=; l=2043;
	h=From:To:Subject:In-Reply-To:Date:References;
	b=AG5DIjNn5EbDRvgn+eg284shs5JtguTUK0rfNfWDQy2T9GW+0RF/1NN0HgVokDiE9
	 bFEmjAT+mwuCfP1KDu9ivcXNmUXaBPikonB6u/5Rt/pDrvK4xy7v+X1fhnr/3k7MNA
	 U1cJAp02XjsjKwMSCbzsTNfo5ln71SqsXqbxuo/mEIwqPf5wcEizCXZaVAMmZ6E3hC
	 guABWnvuFgeC2Y2qBLbAxjZBQYYfJVQkLBHigCIP8mA3Tj6pWYSLyslZTxp7nMLsqP
	 RYo/dislwAJRJlqE08k9aMHScxyVMLAz3KNeURwJzCvqG5kUhs7MVkTOrBJEqeImUO
	 0yVs77qYwv9ig==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local [192.168.16.32])
	by mail-mta-2.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTP id 42FIJDYW261999
	for <openembedded-core@lists.openembedded.org> from enrico.scholz@sigma-chemnitz.de; Fri, 15 Mar 2024 19:19:13 +0100
Received: from mail-msa-2.intern.sigma-chemnitz.de ([192.168.12.72])
	by reddoxx.intern.sigma-chemnitz.de with ESMTP
	id S03LLS1Y9H; Fri, 15 Mar 2024 19:19:12 +0100
Received: from ensc-pc.intern.sigma-chemnitz.de (ensc-pc.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-2.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTPS id 42FIJCR1203673
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org> from ensc@sigma-chemnitz.de; Fri, 15 Mar 2024 19:19:12 +0100
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.97.1)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1rlC9A-00000005JvQ-38AE
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Mar 2024 19:19:12 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Subject: Re: '.bashrc': Unknown file type; file ignored
In-Reply-To: <lysf0r7ahx.fsf@ensc-pc.intern.sigma-chemnitz.de> (Enrico
	Scholz's message of "Fri, 15 Mar 2024 16:58:18 +0100")
Date: Fri, 15 Mar 2024 19:12:34 +0100
References: <lysf0r7ahx.fsf@ensc-pc.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
Message-ID: <lycyrv73z3.fsf@ensc-pc.intern.sigma-chemnitz.de>
MIME-Version: 1.0
Content-Type: text/plain
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-REDDOXX-Id: 65f49120b121c496daa906d0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 18:19:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197248

Enrico Scholz <enrico.scholz@sigma-chemnitz.de> writes:

> Seen on scarthgap bc793fa9d1fe24c102d91e97b7002b6e637cbfa5 and it seems
> to be very reproducible (both the failure on ubuntu-20.04 and the success
> on fedora-39).

Can be reproduced manually by setting the PSEUDO environment and
invoking

| pseudo useradd -R `pwd`/rootfs bar1
| pseudo ls -la rootfs/home/bar1


Problem is somewhere in the interpretation of the fstatat() result in

4.14.2/shadow-4.14.2/lib/copydir.c

| 443		if (fstatat(dst->dirfd, dst->name, &sb, AT_SYMLINK_NOFOLLOW) != -1) {
| 			return 0;
| 		}
| 
| +		printf("fstatat(%d, %s) -> dev=%d, ino=%d, mode=%o\n",
| +		       dst->dirfd, dst->name, (int)sb.st_dev, (int)sb.st_ino, sb.st_mode);


Shows here (content is from /etc/skel)

| fstatat(5, .profile) -> dev=64514, ino=1787061952, mode=15241063300
| fstatat(5, .bashrc) -> dev=64514, ino=1787061952, mode=15241063300

While

| $ stat rootfs/etc/skel/. 
|   File: rootfs/etc/skel/.bashrc
|   Size: 410             Blocks: 8          IO Block: 4096   regular file
| Device: 252,2   Inode: 19552578    Links: 1

is expected.



Pseudo log shows for this call

1914825: wrapper called: __fxstatat
1914825: __fxstatat - signals blocked, obtaining lock
1914825: paes: newpath .../rootfs/etc/skel, element list <.bashrc>
1914825: element to add: '.bashrc'
1914825: pae: '.../rootfs/etc/skel', + '.bashrc', is_dir 1
1914825: paes: append_element gave us '.../rootfs/etc/skel/.bashrc', current ''
1914825: .../rootfs/etc/skel + .bashrc => <.../rootfs/etc/skel/.bashrc>
1914825: base_path[nofollow]: .../rootfs/etc/skel</>.bashrc => .../rootfs/etc/skel/.bashrc
1914825: root_path [__fxstatat, 235]: '.../rootfs/etc/skel/.bashrc' from '.bashrc'
1914825: statat .../rootfs/etc/skel/.bashrc (+buf) (0100755): processing request [ino 19552578]
1914825: sending request [ino 19552578]
1914825: sending a message: ino 19552578
1914825: msg type 3 (stat), external path .../rootfs/etc/skel/.bashrc, mode 0100755
1914825: wrote 182 bytes
1914825: sent!



Enrico


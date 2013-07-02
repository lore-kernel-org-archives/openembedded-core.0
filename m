Return-Path: <niqingliang2003@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5545261AD1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 13:56:03 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id 14so3608152pdj.26
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jul 2013 06:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:user-agent:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type;
	bh=GledtWqWQoaibUywW68gCqgD1g3ri1i3H7Ip9EO3jZI=;
	b=EKfCJktKb8NrVMGPpn9j8WTayAWqf/IdalEDa8gJvmm+QXP0nLBWFTMBvJJ0uSUl7n
	r4I7f6Lu7vaFCx4ytfik4vuAXcv8kiRYQArRzUI+wjdgxbWZtpV2xKhGt9EqlFnz6KWW
	5UuuoAUkF4MsaXo3NucBZY4Zg3S4eDWMMUEYj3lKief7pgV8cFQw/jPLZsdyf0u9eQY8
	78dvAGDZBxI3SBsqbLeGVnc/axidsh+as4+DDIVwiUOqgtAhCC07BTbTx0e52eUXW+u0
	tu9+81LJbariokvcl6FDIK2TgKDWfr1qh/oQoBgxuS5aa83sA+Rzog33nOzKNklAwpGN
	0HZQ==
X-Received: by 10.68.182.130 with SMTP id ee2mr14288512pbc.26.1372773364391;
	Tue, 02 Jul 2013 06:56:04 -0700 (PDT)
Received: from ll-pc.localnet ([183.209.52.92])
	by mx.google.com with ESMTPSA id
	re16sm29444328pac.16.2013.07.02.06.56.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 02 Jul 2013 06:56:03 -0700 (PDT)
From: Yi Qingliang <niqingliang2003@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 02 Jul 2013 21:55:58 +0800
Message-ID: <1494596.WlB1q1TXdi@ll-pc>
User-Agent: KMail/4.10.4 (Linux/3.9.7-1-ARCH; KDE/4.10.4; x86_64; ; )
In-Reply-To: <4783685.hnM3VA9Ozj@yiqingliang-pc>
References: <4783685.hnM3VA9Ozj@yiqingliang-pc>
MIME-Version: 1.0
Subject: Re: systemd
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
X-List-Received-Date: Tue, 02 Jul 2013 13:56:03 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, July 02, 2013 09:35:20 AM Yi Qingliang wrote:
> Hi, All:
> 
> I want use systemd, add following into my own distro.conf
>      DISTRO_FEATURES_append = " systemd"
>      VIRTUAL-RUNTIME_init_manager = "systemd"
>      DISTRO_FEATURES_BACKFILL_CONSIDERED = "sysvinit"
> 
> but when do_rootfs for my own image, I got error:
>      error: package update-rc.d is not installed
>      error: package base-passwd is not installed
>      error: package run-postinsts is not installed
> 
> Any idea? Thanks!

I have found it:

	ROOTFS_POSTPROCESS_COMMAND += "remove_packaging_data_files ; "

the 'remove_packaging_data_files' is the reason!

why? it is always there, and everything ok, but after recent update!






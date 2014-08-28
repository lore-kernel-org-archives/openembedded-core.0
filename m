Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id A809A65D34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 08:10:15 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id ey11so1553460pad.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 01:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=aGEQx4F5DMOVytDrUr7KcdI5XLwpbnXVjMFgKbFFO6Y=;
	b=nRob0SENRB1if1aHxc1z/yxVlq6j5BekLCNhjkf7sgClY9oRXgT9S/9BGGy/8CEQPv
	tDa1c29u6ES+4V7LVNgxPIy535F2qE9N02YvKP98DiZ1z8o/kJHdaJHJNctOTPrbxh6P
	PDw71TR8wLuCi+PtSp2ZDO+KzVbaDKg4qf3A10g3dVnU5L+UVqhjgeq2vhhyBT1k8Pkr
	av7YHPmzIsbkyG668rwxebafDH4Pfp4OjO++Z2+QI0BGGUOPIEDJd4PVaw77ZqOC4e/M
	Gb0pzpn7Z4Vas9wj5TTagCOmeJ9elv2fPZugJwUCWulqQJHO/TlsvjjWd4gf1Qk2fm4V
	YWMg==
X-Received: by 10.70.41.11 with SMTP id b11mr3110883pdl.11.1409213412073;
	Thu, 28 Aug 2014 01:10:12 -0700 (PDT)
Received: from haswell ([2601:9:3580:7a5:baca:3aff:fe80:aa8f])
	by mx.google.com with ESMTPSA id b15sm4125889pdm.90.2014.08.28.01.10.11
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Aug 2014 01:10:11 -0700 (PDT)
Date: Thu, 28 Aug 2014 01:13:51 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <20140828081351.GJ13139@haswell>
References: <53FDB8B5.8030802@windriver.com> <20140828073315.GF13139@haswell>
	<53FEE267.6010303@windriver.com>
MIME-Version: 1.0
In-Reply-To: <53FEE267.6010303@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: Question about aarch64 target
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
X-List-Received-Date: Thu, 28 Aug 2014 08:10:16 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On 14-08-28 16:03:51, Kang Kai wrote:
> On 2014年08月28日 15:33, Khem Raj wrote:
> >On 14-08-27 18:53:41, Kang Kai wrote:
> >>Hi Saul,
> >>
> >>I am working on Bug 6487 - Add Aarch64 qemu target. I take tune and config
> >>files from linaro then succeeds to build core-image-minimal and
> >>core-image-sato.
> >>
> >>And I have 2 question about it now:
> >>1 What should the new qemu aarch64 bsp looks like at the end? Do the files
> >>in the patch attached are enough? And what more test should we do except to
> >>build images such as core-image-sato, core-image-sato even build world?
> >>
> >may be eventually support linux-yocto, and linux-linaro both, it should
> >be tested at same level as other QEMU BSPs
> >
> >>2 There 2 aarch64 configure files from linaro. First one is little endian
> >>and it is as default, and the other one is big endian. I take the little
> >>endian one as qemuarm64.conf as linaro does. Do we need add the other one as
> >>qemuarm64_be.conf or something like that?
> >Name them same as meta-linaro please, so eventually linaro layer can
> >drop it and take up the maintenance of them in OE-Core
> 
> Keep same name with linaro is convenient for merge work. But the name
> 'genericarmv8'  is not coordinated with existing qemu bsps. I prefer to use
> qemuarmv8 for coordination.

Thats a valid point, I would give in.


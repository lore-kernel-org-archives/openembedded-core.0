Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 80FF2605F1;
	Mon,  2 Feb 2015 10:02:59 +0000 (UTC)
Received: by mail-ie0-f181.google.com with SMTP id rd18so7224607iec.12;
	Mon, 02 Feb 2015 02:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=M3qq6jNaVswAtmBRJ1eNx/CNl8Z+B8RZhUMSyfH9uFg=;
	b=C6yS4YccN99OXMeW7eUILUYLSoBJLJd6r6qZtBcKfL+mfpl02WS+3kO2D8SClDQRPY
	D9gfZVvR8zXVN5hLF1Ed225a1myvp/KjjOpSvmLuGtUDQWUhncQ+JUfM2ttqBk50//ho
	vvQt4mYqJt77meAhsAyAsVVMitScvXSTNfNmgbgg1DIbAtWw/i4bqauq114VMJxda1m/
	eQcwvjlIk2LzQQUBMBombJlVzM0fZWxMCuHP8ttq+RkRMlvmTfDycRfsSxAhxLyfipeo
	HzNSkL5yfY5pZR6Psi/prxwrZ9kgSlWQ4VK5741IMwsxu2Jo2iT+kOr02GhV7Rl9MExR
	BAsQ==
X-Received: by 10.42.201.78 with SMTP id ez14mr18054675icb.22.1422871380126;
	Mon, 02 Feb 2015 02:03:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.117.7 with HTTP; Mon, 2 Feb 2015 02:02:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Feb 2015 02:02:29 -0800
Message-ID: <CAMKF1souj1-FLTjkQb0y8myTiKMJyNeAa7wiM5-pW1fz0EtheA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>, 
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: [RFT] upcoming glibc 2.21 and gcc 4.9 upgrade
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
X-List-Received-Date: Mon, 02 Feb 2015 10:03:03 -0000
Content-Type: text/plain; charset=UTF-8

Hi All

I have put together upgrade to gcc 4.9.2 as well as glibc 2.21 (
upcoming ) on  a contrib branch ( top 2 patches) its has not got much
testing besides x86 qemu thus far.

http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/gcc-glibc-upgrade

I would like to request some help in testing these out in your
respective environments and please report any issues you see so we can
start sorting them out at earlier and making its way into OE-Core.

Thanks for your help

-Khem


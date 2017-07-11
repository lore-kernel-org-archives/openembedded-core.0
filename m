Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id F225F77E9C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 20:06:07 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id x23so713405wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 13:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=C7yKBxzmKYGBuSTXDertx/jooGB3E/PYugJG/1wlDpw=;
	b=jsYeJqwTUe9xMrWW+HeDJLEsoiYgYkVHRlcXP36baAwRQqMeeH1TapDIj3gnTNH2sI
	W0Cy+hPEkgpZw87LFd0Y+Wnvx2aIUysJsg9ulhS7a5WxwygTuDAK9usGMPBRKn2day1L
	uh19oy1nVcz2n98WA33uXRxHljkGWnHI74Z4F/Y6B97kcqDq1Oue7uk86KHtrwJdralm
	zCGsnfis7A1qIRsI+QPyEi/68CHSbyGseZxonVVmg4PqZnxrkBz6Tz/6/IsWw9qKcN0p
	aeKjKfmxJdJI8RMKuoQq476f0QKA4lFbYtiq81RhvYEciZ91CM/E0ypR0cwFhxgCGAB2
	QdMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=C7yKBxzmKYGBuSTXDertx/jooGB3E/PYugJG/1wlDpw=;
	b=R2ZbZ+AOWpbxKRvpfDahjhK9+AamcZoIBC+osnGMCmQvqNoaqJraB8HRwkPpQaPP3y
	w6jjdAqFsK1jy4882A4LotWutg7279sboAxhjNLFNrH7OhmMEEljHv2oj7ITai/TmSB1
	XlpGd3PBMLwJoiP+01gzxtqSjoLCJScb42UaLzy1woJhUyqg1UJRsuJuJF0m0uuYYg8e
	lrmYrjwmp3FZY/OLE1Ufn9v/fhmywxMfUE5kRXOoVxmM68zd9oIJ1jtf63Kp/7azuKc5
	kUJTYEdapUTWaA9RbO4DAtxTGEchEhH17ED1eIOIcLmO4oSJhZZTU5MCLOvOx0dmCwoR
	oDBQ==
X-Gm-Message-State: AIVw113xC4vmR8J57Bbsjkf9uFGWQ16g25G6dNPjA8rV5fYmryHfLWTJ
	ujdLkPBtmN5OwD6SjT0=
X-Received: by 10.28.181.6 with SMTP id e6mr27433wmf.25.1499803568383;
	Tue, 11 Jul 2017 13:06:08 -0700 (PDT)
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com.
	[209.85.128.179]) by smtp.gmail.com with ESMTPSA id
	i185sm180457wmf.34.2017.07.11.13.06.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Jul 2017 13:06:07 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wr0-f179.google.com with SMTP id r103so4028880wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 13:06:07 -0700 (PDT)
X-Received: by 10.28.195.67 with SMTP id t64mr56976wmf.41.1499803567104; Tue,
	11 Jul 2017 13:06:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.73.84 with HTTP; Tue, 11 Jul 2017 13:06:06 -0700 (PDT)
In-Reply-To: <cover.1499705409.git.wei.tee.ng@intel.com>
References: <cover.1499705409.git.wei.tee.ng@intel.com>
Date: Tue, 11 Jul 2017 17:06:06 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrY3+kakT7DcX61TXM0L4oKK5fu6qupFxvLznRLrJk=jw@mail.gmail.com>
Message-ID: <CAP9ODKrY3+kakT7DcX61TXM0L4oKK5fu6qupFxvLznRLrJk=jw@mail.gmail.com>
To: "Ng, Wei Tee" <wei.tee.ng@intel.com>
Cc: Saul Wold <saul.wold@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky][master] [PATCH v4 0/1] initramfs-framework: configuration to boot up live image
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
X-List-Received-Date: Tue, 11 Jul 2017 20:06:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 10, 2017 at 2:09 PM,  <wei.tee.ng@intel.com> wrote:
> From: "Ng, Wei Tee" <wei.tee.ng@intel.com>
>
> Hi,
>
> This patch is to get initramfs-framework able to boot up live image.
> A new scriplet named setup-live module has been created to handle
> the removeable media detection and assign the rootfs.img. This is
> because the current rootfs module has no support for rootfs images,
> only rootfs partitions.
>
> This version 4 included the changes for squashing 2 commits into
> single commit. It involve the creation of initramfs-module-setup-live
> in the recipe and added udev-extraconf rdepends on this module because
> it is needed for automounting process.

As I said on the other patch, it still has indenting issues; please check.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


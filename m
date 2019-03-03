Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1E1DE6058C
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Mar 2019 17:40:54 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id q81so2069463oic.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Mar 2019 09:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tZRCau8VH9aLV/knRspDTNgzJ+G3tbjcFWhqPdDKnL8=;
	b=N1x9KAb5YJukrDJdxbtNy5wGm+hIkXhSMpFWC4OWRwuUiJvjlbZNGO5fh/EXHiWobL
	/PVyKajVYzRixFHB0o88VQjuXiDg0ez3LDUi0ifTWB/zGGbsZs4JxhvS2y2u5oIHiA8Y
	jpbDrKsU8amLDVdFa5LTXXu6t4UnYjUmmcYKfFpZfo0a8XY/1G2grOvQuEC4vdw7d9HJ
	Sldxw8Nl9KGAleuYQwIbP8mkxA2ntb5W0YReaFTCHCE4sXPXVXaM2+MA099WIr8ht6OK
	+RJNOmXfpQ25YsS8tNbRt7LPhiKKOuWsCg4sUv52C6kEdpltiVRALUfhdE9Wug69Z0XK
	eNyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tZRCau8VH9aLV/knRspDTNgzJ+G3tbjcFWhqPdDKnL8=;
	b=uhNr47K7ETd9mpv6c296J2kCRn7Pzk6O6oRaxzeFoM6s8WYqapy9trSYjtk0LnYPle
	kvqdKqFL9tLCvHFgRJ9ZjJaj/RZjyEfM6AUqYuVllpez0UprHGP6B0u3/rx4a74ulOsM
	ZZC7fHaHvwApOxA8a75SoFrWCgPFMR+POw97k1GyYYheeaYNa8HFywlLV0pzJS1a1r5h
	UWkGcSSr0yneiKPz5NoBFH7AWdCZJBH+1FENhAjeYrFd9BGIghjjDKjc8PN/S+2oWXwO
	+YofPkcKh0mMYpaoCpwGhcsSN6BXbtxQ5IXlxWiFY3uONr75UuVvsZuCjvRrve57Fw7U
	OcKA==
X-Gm-Message-State: APjAAAV9ynII5TjTMnRBEUk8AAGthOLzBCj4V9JGb8fgVv7kRwmoirZU
	gtkQjS6KJKVbj4S0RC0vdxUV4jubLFCWrQa8yxCxoQ==
X-Google-Smtp-Source: AHgI3IYscd28qRbvsBXox3wtlcBDYAEd5QnuAOi2hCC7TXuWUJCdnuBKcRBw6xpjl96DZRlGKh52vhX7ql0JA7EIJr0=
X-Received: by 2002:aca:4b51:: with SMTP id y78mr9748642oia.88.1551634856082; 
	Sun, 03 Mar 2019 09:40:56 -0800 (PST)
MIME-Version: 1.0
References: <20190303173808.12198-1-i.efimov@inango-systems.com>
In-Reply-To: <20190303173808.12198-1-i.efimov@inango-systems.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 3 Mar 2019 18:40:43 +0100
Message-ID: <CANNYZj9z-899=vC9upcBMX2azcKuNvr4qOMF6E6Hcw9+FtpVwA@mail.gmail.com>
To: Ivan Efimov <i.efimov@inango-systems.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [morty][PATCH v2] perl, do_install_ptest_base: add "--" into "tar" command line
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
X-List-Received-Date: Sun, 03 Mar 2019 17:40:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, 3 Mar 2019 at 18:38, Ivan Efimov <i.efimov@inango-systems.com> wrote:
> Upstream-Status: Pending

This is used only in patches to upstream source, and so not needed here.

Alex


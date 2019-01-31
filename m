Return-Path: <leon@sidebranch.com>
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
	[209.85.217.46])
	by mail.openembedded.org (Postfix) with ESMTP id C15B26004D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2019 21:17:57 +0000 (UTC)
Received: by mail-vs1-f46.google.com with SMTP id e7so2899650vsc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2019 13:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sidebranch-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=X8ZhDu7STHGz8UDvjSWEiKqetGqpRFBW30JmOwIgaTg=;
	b=o27TmHskd2uth07GL2DYEY+hsybqHCT2dUUvf9tCMYunjpj7C0LYndD1GgsYtG9dfD
	rikD8mzt5h1Fsxn8811DeFlOBmHL9qdf5TvhSRRk/W4j7qEdmZy/zcLYLpqJFiaH7enW
	9okhq5DOY93K8IYuIPL5p7L4KKhxzGpgyAL68VCV3ftbL9q0hI1Lbx09EfENsn8thsFh
	h8884orbqIeaNeYcyAkIPGaZ7bikmQVmPA40q4OYe8zQwz72MWDsH9dq4i5zAYC/4gEk
	oEmPjnnm3z8g6x4MeOypZIsSAdzNG8l0v7jbMFX0ZgqgFfZub8nrLYzuLeDyEjytlZHG
	ozZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=X8ZhDu7STHGz8UDvjSWEiKqetGqpRFBW30JmOwIgaTg=;
	b=ZWv+8HV3MZnSPWXoz0e7jHmY1zylhO7Ajx3rU1pyPxP7ehrpKX4lEze77DsTcbbP+N
	tx8/vcfn26xgunT/6/OXzTeQs1aNKY01knJRiSaHFTdJhh1/P7bVvxqteJWrOVO76WyW
	szllgh+wQxXpcV5xvT3VQEoRihrR4L6RPCAkoSwoVZ+ILWCa2f7Fsf/mxV4V9RnZiUTz
	IwyjqHEr2wTb/c8qLLzMNkghcWEJk9EHr8WC79jdeXgpzMAOSjVEJQui50zxlU4Eug0i
	cNgNS1QRZ/Mjw45qDzlXyRCAh4BQEQhzTo/2syXtimZO1BLXCSN+LIo6Cf3Rle+HCVUL
	ctFg==
X-Gm-Message-State: AJcUukfLW7JufDBanpBdwld7fRVC+jyYi4QlCrvK12kt3/Fc3bND014M
	pueWWJ1NZGU1nEpu+oHWLs4wSG7BW773m28+sWmUMGJiOEK0pA==
X-Google-Smtp-Source: ALg8bN47uLaj7ATTKEOdkcyX1WhsDT157JOnhyyskxzg9F7ztLyL07z3xbKv7nvjG4QlC0Tq6cK1yY8XP+UAB7G0UdQ=
X-Received: by 2002:a67:d684:: with SMTP id o4mr16159919vsj.174.1548969478225; 
	Thu, 31 Jan 2019 13:17:58 -0800 (PST)
MIME-Version: 1.0
References: <4881796E12491D4BB15146FE0209CE64681CF335@DE02WEMBXB.internal.synopsys.com>
In-Reply-To: <4881796E12491D4BB15146FE0209CE64681CF335@DE02WEMBXB.internal.synopsys.com>
From: Leon Woestenberg <leon@sidebranch.com>
Date: Thu, 31 Jan 2019 22:17:45 +0100
Message-ID: <CAMjhiJjNLN7Rnj8es_860h2=XdTbf9nnawouhUBYd+dEApmr4w@mail.gmail.com>
To: Alexey Brodkin <alexey.brodkin@synopsys.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Always install initramfs-framework-base in case of linux-yocto & INITRAMFS_IMAGE_BUNDLE=1
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
X-List-Received-Date: Thu, 31 Jan 2019 21:17:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 29, 2019 at 9:01 PM Alexey Brodkin
<alexey.brodkin@synopsys.com> wrote:
> --------------------------->8----------------------
> /dev/console is missing or not a character device!
> Please ensure your rootfs is properly configured
> --------------------------->8----------------------

I thought /dev/console could also be created by the kernel itself onto
a "temporary filesystem for device nodes" (DEVTMPFS).
I am not sure, but here is a similar case:
http://lists.busybox.net/pipermail/buildroot/2015-March/123309.html

Is your (other) kernel configured with CONFIG_DEVTMPFS=y?

Regards,

Leon.


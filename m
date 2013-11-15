Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id 046636D12D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 13:26:50 +0000 (UTC)
Received: by mail-ob0-f175.google.com with SMTP id va2so3768266obc.20
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 05:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=Bztmz2FZe7JHEgytFefYn2/XgQ8XuDamBwFfSLDZmiU=;
	b=qO/IGngkxYiNqeGFoZ4yYU6SS0x+f1OsJ7v5gPDS0gM1A0F4B/XyXbFFOMIKzdCuau
	xSKHDdqlK8YLoxS6pmtb9HoKS/FfIwzTC8Z6om8WcsUCbZz+d0TQ9a2WGnjQXQtwgKb5
	xCQCwtkuQsBW1LcmezpQh4LYuIrBO3mZUI8dPHQgAwltEpY2AsLo3XBD4DlzRO9Bj6Yl
	j0x5GX+Il7X0D7V3HBvm2GCtcbQAoiB4yYWsio8htqtn+5JJF0d8Ft91AuOR6F7n5b8C
	vwyO55p7vvU6+fULtb5309QPdMR6INBFGx8TpCHQ1v94ZMFaHnWcvx7v8GswU1tWV7iK
	WE/A==
MIME-Version: 1.0
X-Received: by 10.182.18.9 with SMTP id s9mr6868228obd.15.1384522011613; Fri,
	15 Nov 2013 05:26:51 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Fri, 15 Nov 2013 05:26:51 -0800 (PST)
In-Reply-To: <1384520708.23724.12.camel@phil-desktop.brightsign>
References: <1384520708.23724.12.camel@phil-desktop.brightsign>
Date: Fri, 15 Nov 2013 11:26:51 -0200
X-Google-Sender-Auth: 1nhJXN784__0y7EVjlM1jqpfuAU
Message-ID: <CAP9ODKqVib+iDsGEges9Hhy2dyWoOi2JtfhVJ+pNCs=KUq7Q4A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Phil Blundell <pb@pbcl.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: Tolerate empty INITRAMFS_IMAGE when INITRAMFS_TASK is set
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
X-List-Received-Date: Fri, 15 Nov 2013 13:26:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Phil,

On Fri, Nov 15, 2013 at 11:05 AM, Phil Blundell <pb@pbcl.net> wrote:
> The idiomatic way to reinstate the old-style initramfs handling appears to be to
> set:
>
> INITRAMFS_TASK = "${INITRAMFS_IMAGE}:do_rootfs"

What problems are you having with the 'new-style'?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


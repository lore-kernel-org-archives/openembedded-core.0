Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RLcHS-0008DR-GW
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 15:59:07 +0100
Received: by qyg14 with SMTP id 14so314448qyg.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2011 07:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=fAOZ6CgsAvSdQpXLuj/NujqKf8hjOeGDFhdcPqm7P5Y=;
	b=hkk7l3x+xO2PCTaZbVU6ZLauk6jdtkW6FyKMum+SBYVpu0AFLs655DUADGUZdf6Bci
	IUpKPdVUDLUE8VlX5lpPkXezJ1U4cuWP/B4dfzJ6LZKqUn9iEhgzQRgfShBL7l9QqdZu
	iBd25R4wMzcq13CxJXSXUaQ4yAHLrAYmq0m4Y=
MIME-Version: 1.0
Received: by 10.229.19.72 with SMTP id z8mr597821qca.36.1320245577710; Wed, 02
	Nov 2011 07:52:57 -0700 (PDT)
Received: by 10.229.94.72 with HTTP; Wed, 2 Nov 2011 07:52:57 -0700 (PDT)
In-Reply-To: <1320243402-2116-1-git-send-email-koen@dominion.thruhere.net>
References: <1320243402-2116-1-git-send-email-koen@dominion.thruhere.net>
Date: Wed, 2 Nov 2011 07:52:57 -0700
Message-ID: <CA+M6bXms9JtD928CKD5SUFb4+bd78tHE_v1ct8Nqc7HD0fbGBA@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] image_types bbclass: use 4k bytes per inode so we don't run out of space immediately
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Nov 2011 14:59:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 2, 2011 at 7:16 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> genext2fs only creates the minimum number of inodes, after this patch it will scale with the rootfs size
>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

Acked-by: Tom Rini <tom.rini@gmail.com>

-- 
Tom



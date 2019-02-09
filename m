Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id B867D6C538
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Feb 2019 10:04:57 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id i20so10172727otl.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Feb 2019 02:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jTT4cAGs/woxXnJUirD/Xr/R8m4Ivcx3axtinPu+oOk=;
	b=DN2A46/RCbmCe8/j/F1jO2DhAPYhYbx8n3Ed7gkyfKYiM1jQyxyVQcK4+v31BheMbZ
	XZ9kFGY0kOWtVKHngAn1sWr9wVmbQzaveq6RYBJFqf9DAFl6lI5HatrlF+zdaejRQAcD
	TD1XhOYf3mo09yxCblj3S+nPO/Lq0SkeaVwBWWipCaR8AfGYfKQageGH8uvZfNTGT3oB
	unME8C8AKCgV8+2pHFV4jj1Q/yoVmPXvGR46OYMi5mBNoCgVqdVnT29Rznpvrn4DX/6t
	EUnPBgPXq9O9JSvIjVzjyxHFOZzFPdfQtPGcGtRKffgpwBDnteZNDrXIO8t6kbtwME3j
	1Rnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jTT4cAGs/woxXnJUirD/Xr/R8m4Ivcx3axtinPu+oOk=;
	b=san9aBU51OWvl/KUF7bmYjjZcr6xW/t2x+HZWmiQrgf9HQ4hroFb89Ku/LgN3zgSx3
	kOyhDAyskpyAEgIxdaUotRCgI6drsM2PwP9T5LAILecxkrpDRiadl3BjztIAxDGDRgpL
	b/Lbjd3EWuTbzWSJnj7G4vUgSwqfhYq7nW2TewhHtxBX8UNXsf2F8AIjf+J5BbeA7A44
	Xfnr4I3wn1zXWykfTZN7fMX2TpfUrx0cAKkapkwhAHuTlyOWjLg+LDcPns8SbtP8qywS
	dLGlDhjPJrJt1sWvcTFUYwKQE4xgmdhLRlSBc1rSraK4CvW9PeGF4CPuiq8PIBnaMH3y
	1Vog==
X-Gm-Message-State: AHQUAuY2ojEEVy5xcZaCA72YhouxFbvjYQrMyxMNttcOkF3L2CKIup3a
	MNR26lLHhXSH7750dtGY2Kc3mDxeGTZHFNkxmlM=
X-Google-Smtp-Source: AHgI3Ib+9LBZJMWmo9zp1RigEhw3wuCN5bnY5EZBmxki7hgWK0+1SbAdFeCBGPKqH0exWTSg+4HudqacCTjk3Upew0Y=
X-Received: by 2002:a9d:6a91:: with SMTP id l17mr7637501otq.354.1549706698593; 
	Sat, 09 Feb 2019 02:04:58 -0800 (PST)
MIME-Version: 1.0
References: <cover.1549637121.git.alex.kanavin@gmail.com>
	<bb8c993db03526b5f7ef16b2c076055b1ce6de40.1549637121.git.alex.kanavin@gmail.com>
	<20190208231255.GA2258@jama>
	<CANNYZj-LeigbBS592R5qwvfG5yCApqgQhU_Fjhiz79U=y-ZddA@mail.gmail.com>
	<20190209093259.GB2258@jama>
In-Reply-To: <20190209093259.GB2258@jama>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 9 Feb 2019 11:04:47 +0100
Message-ID: <CANNYZj9dH=ursLkSb_uDnac48p_RmW1dZ573zLzs6WiCd4Tr=Q@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/12] qemu: enable virglrenderer and glx options for native/nativesdk builds
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
X-List-Received-Date: Sat, 09 Feb 2019 10:04:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, 9 Feb 2019 at 10:32, Martin Jansa <martin.jansa@gmail.com> wrote:

> Does enabling virglrenderer and glx do anything useful without any UI?
> If not then I guess it should be enabled directly here or all 3 enabled
> only in the poky's local.conf.

Yes, absolutely. You can instruct qemu to render to an off-screen
buffer, and access that with vnc, even across the network (and maybe
spice will work too, I didn't try :). I explained this in the cover
letter...

Alex


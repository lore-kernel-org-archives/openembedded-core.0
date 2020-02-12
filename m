Return-Path: <alex.kiernan@gmail.com>
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2B39660135
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 13:05:27 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id i7so1654710ilr.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 05:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=VZL64mB36PfD2MdnE4MQnCXQElRIazFEwTiwQowbXdE=;
	b=HNB4qA5GkLMhseEkoRXPqhwQhAKqRmKgt2xBoI35y0s0LvUV2Q5heRS/qG7+gzhefd
	s+ofQSDlvgUxJf/vplq07yMGisnwUfvs6gHR4TyGEaEbzq9iTX/sqxMXw5GDwrZn0uVF
	4LD8SkFDEDoQnpKE9nYRRCYtmcaCJRPJfbecVryKoERHt7QZ8i/b6Xu2j9Jz0mP8ox1q
	6H2cQZqdPMxfgdR7rzBIrS0Z9E7brunnjtBOeZfMIMgjvPlLJfvtedlpV8o/qAA68w+Y
	3mtxsPf3JfY+YIp1g9ndzT0Fht63TPsZKqYx7u1CBderlhPecmq+Q8vVJPVUYZ95qJZj
	lw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=VZL64mB36PfD2MdnE4MQnCXQElRIazFEwTiwQowbXdE=;
	b=YKPkiwDO7mk/PdiSHbVGAdbpaR4UMsrqMdZOi+SmLTgkbjovhHRlDuDKGfyqAd+Jwd
	CqY++mZOJKkKtzuhZJO4cP0EokF7LYViCfjN2qe3wntQsiHcmbUixhlczj5NR0feZ1vy
	zBw2oBqapxG+M1pNGNdolnR9WXZqo2NOlFF/amAmJWLhtqHxgQFKDGcgKGNfm+PJfnxt
	ttBP8ZY27RIBXg2l1xMy43MDzQUeq9O2DXgG0l/0dLmeDhVcCCzxY0AWVnWuNEtcgLLq
	+zL8lqVyn6S64kV7g/YCJG/oTi6eP4ZPKkq30UQbYHJeqL7pNUT2nO9zGXRt22SqnnjW
	g3eA==
X-Gm-Message-State: APjAAAVvOfDa3yh/JKALkSyzRdJzHj2VZPkpPmafg1nrAdJEmNHsAF3b
	mzV5FxTmRmfFxRzESaZPU7IkbLaKP/SBkzgfWeahng==
X-Google-Smtp-Source: APXvYqxWrNRGhEU51+SUO7pt7HwYSRxxqSiFCNfPcvG/C72ucaxIsGxKqUFMjNQ2p+yUKQwI/8AXZgl7AQn+XO9q4UM=
X-Received: by 2002:a92:5c8f:: with SMTP id d15mr719843ilg.102.1581512727853; 
	Wed, 12 Feb 2020 05:05:27 -0800 (PST)
MIME-Version: 1.0
References: <20200212113336.62171-1-alex.kiernan@gmail.com>
In-Reply-To: <20200212113336.62171-1-alex.kiernan@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 12 Feb 2020 13:05:16 +0000
Message-ID: <CAO5Uq5RRsmrUKPKD09=g2KapY_GspaHakyQ9hYWM9p+Fv7ArfA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-fitimage: fix devicetree reproducibility
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
X-List-Received-Date: Wed, 12 Feb 2020 13:05:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 12, 2020 at 11:33 AM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> Ensure that the order of dtb/dtbo files in the generated fitimage is
> reproducible.
>
> Fixes: 71bfa9838cbf ("kernel-fitimage: Handle overlays in EXTERNAL_KERNEL_DEVICETREE")
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>

I'd not realised the previous change was still in master-next. I'll
squash this one into that.


-- 
Alex Kiernan


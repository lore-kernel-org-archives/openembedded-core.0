Received: from mail-ve0-f172.google.com ([209.85.128.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UQDIP-0003C4-GV
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Apr 2013 10:56:29 +0200
Received: by mail-ve0-f172.google.com with SMTP id oz10so1219599veb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2013 01:38:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=EXTQ9acL91KJKi6sucQ8pQUOumkVvkTsr/jEx6TTFGo=;
	b=CMAqR91+DDRJHRh5sMrmTlX7HFI3q8dz5fyRuK75jyfYzHUvfRj8WcQNM34bhQ3dQP
	crbng8bsxN3bKYJCJwmo1PaKsIdITm6xfJvUuidgxSyR7Eiz52I29eKUMObIhp7OzF1M
	DOQ0KPIO/3y+L5IFOw7Oo7wACVOcvNWUYD+0BzXpY7JEKfjx1r4XDhczEweSGJRr9vcD
	+fORJaolWNUOMe11SQDobF5K8XEwDfOT3G+ZWXGuPtIlTdC5wTTOUykm6baH2euWbCaO
	dJPtzW5jYNGM3D2x0veHHd9WfMMSu2+sLfwjIjnH9PYIgLLfcsVyc7zfD27arB5cfNnt
	Fq7g==
X-Received: by 10.220.80.67 with SMTP id s3mr1710485vck.12.1365669510498; Thu,
	11 Apr 2013 01:38:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Thu, 11 Apr 2013 01:38:10 -0700 (PDT)
In-Reply-To: <1365669088-18442-1-git-send-email-zhenhua.luo@freescale.com>
References: <1365669088-18442-1-git-send-email-zhenhua.luo@freescale.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 11 Apr 2013 09:38:10 +0100
Message-ID: <CAJTo0LYz3mSM6WGukYssD_fZnF5U2p16TZ5iTK2OYGFZJ2_kyA@mail.gmail.com>
To: Zhenhua Luo <zhenhua.luo@freescale.com>
X-Gm-Message-State: ALoCoQnsI4v9Pv8tgpg/VjLL7x50PYmOcUKjsmjBgZ6oetBRGBK9+W/2PPJjRpzvHlKoYLZkEKxt
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core master] wayland: add necessary dependencies to fix build error
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Apr 2013 08:56:30 -0000
Content-Type: text/plain; charset=UTF-8

On 11 April 2013 09:31, Zhenhua Luo <zhenhua.luo@freescale.com> wrote:
> add libffi into DEPENDS to fix following build error:
> | checking for FFI... no
> | configure: error: Package requirements (libffi) were not met:
> |
> | No package 'libffi' found
>
> Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>



Received: from mail-vc0-f172.google.com ([209.85.220.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UZkWq-0003Uf-5n
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 18:14:12 +0200
Received: by mail-vc0-f172.google.com with SMTP id m17so676097vca.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2013 08:56:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=MHsDxnQp4nxiVO+gaO4ydv3IXEql5EFia8N1ArkjsSQ=;
	b=LLH2HpM4vA4Yn/IkiVmy2TanGldcfXMj+ITn2EiiAn8RvC0J4nGg0Y2Qu0Tw+u1/8y
	9UHB546OYnOUZnrZ5BF5QRQ4sJrdyKGzCX2vZm6HdE/Sf2BJkqalrioiVr/RcMag1lCO
	I/7wEewoo7LleTETjBJ6EdVzSs5QCnjMmg/kOtZsLpf6JyhHwe5KdA6UFJr4VNEAB+Ro
	8nvIoLDrSqK/iPAzi1W8RkVqBynnU7Ft++67MHUX3I6vGx/6f1jXbmsGN0d8aHoQScYW
	hKirqrJbDEw55ob/XmOMRWyBdM+mCbkSyFWR/p7FhgbuSmXwiV3Q4TcrSJUTjRX6dMRO
	IkJw==
X-Received: by 10.52.117.212 with SMTP id kg20mr1439882vdb.55.1367942170912;
	Tue, 07 May 2013 08:56:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Tue, 7 May 2013 08:55:49 -0700 (PDT)
In-Reply-To: <1367941537-11885-1-git-send-email-stefanx.stanacar@intel.com>
References: <1367941537-11885-1-git-send-email-stefanx.stanacar@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 7 May 2013 16:55:49 +0100
Message-ID: <CAJTo0Lab+9_qo8D3HyR7O8O0VxQrHtQtG+NrohMS_tAg2mDxYA@mail.gmail.com>
To: Stefan Stanacar <stefanx.stanacar@intel.com>
X-Gm-Message-State: ALoCoQmEk5vY/YPM5yOMoNocOGx79ZoZ1cOyzow0UAFshRgmIBZj53TP15Fb/Wt6FvvLWkHhVoIS
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] xserver-xorg: Add xkbcomp to RRECOMMENDS
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
X-List-Received-Date: Tue, 07 May 2013 16:14:20 -0000
Content-Type: text/plain; charset=UTF-8

On 7 May 2013 16:45, Stefan Stanacar <stefanx.stanacar@intel.com> wrote:
> OE-Core commit bdcc5e8f1286d288baf410458efc39a59b68d751 removed xkbcomp
> from RDEPENDS for xkeyboard-config but X server still needs it otherwise
> it fails to start.
>
> Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>



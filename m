Received: from mail-vc0-f179.google.com ([209.85.220.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UPZoK-0004jZ-5n
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 16:46:13 +0200
Received: by mail-vc0-f179.google.com with SMTP id hz11so622872vcb.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2013 07:28:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=yT7Cml2xpDADHNpJp40f5L+c4fw40LyaxzPTFrJEkz0=;
	b=Pqs2ELPptAs9zjNeNl9uorx53OlBMNU2Dr65czKnXUYa0JuN3z7LatM1n2bYgSylhN
	+vAjcj1bl8ls2MLdMd7A6oLKUspa/4W7w5dCAKHsXCdGe8wgfRAQ0Xck4yhfyLR0iYn5
	LS/oZ4JcTzJuYcsphubAYkNLscpC/h+cVlxtUkiRAmBQAThxkig0ZJ9FKz6J2aynqJyK
	ld3StEWo1mwVK9TQUg+Idi4+QaqpkGSU0qe6CXtbiO+evRr0dHw7biYCuj7cNd21LmlI
	tvdUfEoiAzO+Zyr+MrozheML6xtFP/h7gnNDxRlnThbBNzFzM9clw3HzGHS1LwQ94op3
	OY+w==
X-Received: by 10.220.153.2 with SMTP id i2mr19155482vcw.53.1365517731362;
	Tue, 09 Apr 2013 07:28:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Tue, 9 Apr 2013 07:28:31 -0700 (PDT)
In-Reply-To: <1365517194-30916-1-git-send-email-m.cavallini@koansoftware.com>
References: <1365517194-30916-1-git-send-email-m.cavallini@koansoftware.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Apr 2013 15:28:31 +0100
Message-ID: <CAJTo0LbhX65mPgh3e0uRO+1ZP+wBuos3fHdXshttN_ZqcattpQ@mail.gmail.com>
To: Marco Cavallini <koansoftware@gmail.com>
X-Gm-Message-State: ALoCoQnBr8Er3qGa/FtifbqsO23aaBwuacQF7BLogoT/m1iG1rcyo28a5VmvPhj2bD6doq4MSJ7E
Cc: Marco Cavallini <m.cavallini@koansoftware.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe][meta-oe][PATCH 1/4] xinput-calibrator: calibrate touch screen with xorg
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
X-List-Received-Date: Tue, 09 Apr 2013 14:46:20 -0000
Content-Type: text/plain; charset=UTF-8

On 9 April 2013 15:19, Marco Cavallini <koansoftware@gmail.com> wrote:
> +# force native X11 ui as we don't have gtk+ in DEPENDS
> +EXTRA_OECONF += "--with-gui=x11"

This should be a PACKAGECONFIG as people who have a GTK+-based shell
will probably prefer the GTK+ UI.

Ross



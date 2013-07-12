Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f177.google.com (mail-vc0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id D99566B03A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 16:05:26 +0000 (UTC)
Received: by mail-vc0-f177.google.com with SMTP id hv10so7679951vcb.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 09:05:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=+KGh7JrGxtkXegb6ArR1H9wDumZRBfW1TdbwewneSBQ=;
	b=kbKj+Vvalw6EbeYtec0exQJ/j6XVuVmCEwygYDovo6wJNK2GUYyxL4LOOjTfvLLYh+
	c8y9qU9KDWfX2gxVde7IsoE/9dOD874DdsebY8FB485lhftd5y4wJXFNKHUAsPBK7v25
	xgP176TsqOA8LplraK3NWyHoMlU0vkbDyGq/xfNRTqtMbU87YxssLBraPTBCirp3SAj2
	2uJvvTFyMYHHx4PQEHykNlsSLmI+OcDYF5j1NKY+LQh5oKAJk0xjluVN8sobFMBtmxok
	EPnKO/Po5xzSt2Vqzk8JQ+weZ3+HeYk7cYgjWHcBq1JnU2chVSl21gRlYUupqBz4YzoB
	p7sA==
X-Received: by 10.220.42.147 with SMTP id s19mr24788448vce.46.1373645127498;
	Fri, 12 Jul 2013 09:05:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Fri, 12 Jul 2013 09:05:07 -0700 (PDT)
In-Reply-To: <1373637989-24991-6-git-send-email-cristian.iorga@intel.com>
References: <1373637989-24991-1-git-send-email-cristian.iorga@intel.com>
	<1373637989-24991-6-git-send-email-cristian.iorga@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 12 Jul 2013 17:05:07 +0100
Message-ID: <CAJTo0LZK81Nr7NJDJ13sms4vuZh=Kqcf5-UuodoWwuVRomiPfA@mail.gmail.com>
To: Cristian Iorga <cristian.iorga@intel.com>
X-Gm-Message-State: ALoCoQkz7D5e5navF6d2qaAzroGKgDB5hl5uA4S2I/VZNVtGUk5hE7/hlzcTyPNNCtn09qkSGINH
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/5] bluez5: Set udev variables using pkg-config
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
X-List-Received-Date: Fri, 12 Jul 2013 16:05:27 -0000
Content-Type: text/plain; charset=UTF-8

On 12 July 2013 15:06, Cristian Iorga <cristian.iorga@intel.com> wrote:
> +  --with-udevrulesdir=`pkg-config --variable=udevdir udev`/rules.d \

Again this commit should be squashed, but if we're doing this line in
particular then we're negating the point of fix-udev-paths.patch
introduced in 1/5.  Drop the patch and this argument.

Ross


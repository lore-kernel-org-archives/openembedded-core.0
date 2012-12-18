Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TkvVA-0005qq-4G
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 12:38:27 +0100
Received: from mail-qa0-f70.google.com ([209.85.216.70])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 18 Dec 2012 03:23:41 -0800
Received: by mail-qa0-f70.google.com with SMTP id hg5so1246857qab.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2012 03:23:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=p6O4dBJ1oSyu5QYsxUYv1tJ1ttdirP7JauabLPs6LxU=;
	b=U9WdZ6oUz/HYk4OD+35EGtFRkpxEYImXe9yQG/i2Pp6tK9JbvEhCw9NDXsA0Z08df9
	vWUZoLVy1DDNfXzaRbrteZYm4dqOHOufTGpOaR3NCEDAnba+AvghgTDvgzFGJL0GRfQ2
	1ugFVQvAalNpp4zyPLlsTNJIalrw73AzcFZ12ObUHGUZfQP8TbwP/4WmNpoth6PMkX6o
	PuJxd2Y5OtyyX7rLdZk6Y5Uvcno05bOydPl0MfcJ5OKO0Xp4bP7iI+nQ/Z5o25fpUmQ7
	hPC7CYZ0fLi5Cw6HfAJagajD0lqQR/70SirJPUyuVmGLp930oZIVtx8KcUi0iMYE/6Xk
	CG5Q==
X-Received: by 10.58.221.130 with SMTP id qe2mr2473896vec.14.1355829820375;
	Tue, 18 Dec 2012 03:23:40 -0800 (PST)
Received: by 10.58.221.130 with SMTP id qe2mr2473886vec.14.1355829820285; Tue,
	18 Dec 2012 03:23:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.178.244 with HTTP; Tue, 18 Dec 2012 03:23:20 -0800 (PST)
In-Reply-To: <1355811791-4681-1-git-send-email-ming.liu@windriver.com>
References: <1355811791-4681-1-git-send-email-ming.liu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 18 Dec 2012 11:23:20 +0000
Message-ID: <CAJTo0LYDMxZ+2u_mpTevCD6cCX3OZgxs2ABxGauhuNDc+hzSSg@mail.gmail.com>
To: Ming Liu <ming.liu@windriver.com>
X-Gm-Message-State: ALoCoQmr7hvMCwaPrN4OfcttUHyEbhcg06rWJYLAM15PT174rSEIb7XSO6abtAaEbiofeXchyToT0GIcmjFYUdatDTppqNP7peMuZnSmGj8eUzrKzWrMvLJxI7YJDps01bBqEXhqCQKAxWy4Hfh64+Uz1hMrfLiQl8HsoqeS6dg5yIe6zE4IDSFIINGXFmSBt2EdmspM0TX0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] initscripts: add urandom directory into volatiles
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
X-List-Received-Date: Tue, 18 Dec 2012 11:38:33 -0000
Content-Type: text/plain; charset=UTF-8

On 18 December 2012 06:23, Ming Liu <ming.liu@windriver.com> wrote:
> /etc/init.d/urandom fails to start/stop because it tries to save
> random-seed into /var/lib/urandom folder which does not exist in the
> file system.
>
> Fixed by adding /var/lib/urandom into volatiles.

Doesn't this mean that the persistent state of urandom will be saved
to a ramdisk?

Mixing up persistent and transient state in /var is exactly why /run
exists, and why we should switch to support /run as soon as
possible...

Ross



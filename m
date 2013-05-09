Received: from mail-vc0-f171.google.com ([209.85.220.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UaWFP-0005hv-QI
	for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 21:11:35 +0200
Received: by mail-vc0-f171.google.com with SMTP id m16so2954191vca.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 May 2013 11:53:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=ESiqmm0+r2kC1+hhq5ObT1PyeQU5MWWCObX3jxhvQBk=;
	b=Fqx7LL09lE7ONDEV/fiZvqNgBKWLfjGZ4SrgQiPchI/lueEDEIokvUDDnDvOx2uIBk
	sT8Yl9IDEy5L9XskTeSsMnCgEFLutQOqGeQBZtQs64ZqV2CelDyPrEzdlL4vw2B2K6T4
	JmbgezzUmmQqkTmQJnKZ+2wRYXl5gbfPNzZgq9vOtxolKBevyx0atiO1/Vm/WAFdH0ll
	rlZFD48Fd/5q68Dg+KF4+f1mfkQcrXan4HIYrL1SaXEyxZ2yqdk/wUA7PMduPBYQWIKi
	qRd7XSFXehc/W2eHLrGVXc08gxHqE+1cVnoWKhzcY8hbu/yawR3g/U4sZrDyXF2dJ0rc
	1NuQ==
X-Received: by 10.52.174.41 with SMTP id bp9mr7483451vdc.4.1368125599423; Thu,
	09 May 2013 11:53:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Thu, 9 May 2013 11:52:59 -0700 (PDT)
In-Reply-To: <1368122193-4893-1-git-send-email-jslater@windriver.com>
References: <1368122193-4893-1-git-send-email-jslater@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 9 May 2013 19:52:59 +0100
Message-ID: <CAJTo0Lbi=Sg9N1-G8m=m2piRppec=+B6GJTetCDR8XRimWYt9g@mail.gmail.com>
To: Joe Slater <jslater@windriver.com>
X-Gm-Message-State: ALoCoQnO9xxKvGd/eRu6Q8VIVr2KXpu3Ce8wGLqQS/3sIhGhdQDIVuQoxehTh1O6vLv27nKl+qj/
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] sysvinit: add /sbin/service utility
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
X-List-Received-Date: Thu, 09 May 2013 19:11:46 -0000
Content-Type: text/plain; charset=UTF-8

On 9 May 2013 18:56, Joe Slater <jslater@windriver.com> wrote:
> Provide a handy utility which is found on Red Hat/Fedora
> systems.

NACK.

That appears to be the copy of service from Ubuntu so it supports
sysvinit and upstart.  *If* we're going to ship an abstraction tool in
our images (and I'm not sure we should, to be honest) then at least
have one that abstracts the init systems we support - sysvinit and
systemd.

Ross



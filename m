Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f173.google.com (mail-yw0-f173.google.com
	[209.85.161.173])
	by mail.openembedded.org (Postfix) with ESMTP id C2DF6607A4
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Oct 2017 22:00:39 +0000 (UTC)
Received: by mail-yw0-f173.google.com with SMTP id w22so2619438ywa.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Oct 2017 15:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=SBIdM2iEso/mop9r5ttjvMzDVJRwl5coFe49RVHSeuw=;
	b=NO46hlFAqU76+AhdxN39855xP1N7isDIN857TEf8zAkMrJ7Xc1cGSVBG/71TReYirz
	gbBKEEONyiJXK/P62Vs+l1oJBDbzN5ucxCVZbSEDjN1UZTVHLdY6+z6pwNFrIjv8+uPT
	f/xSsf/iJhFNUIXFzszgHOcoLdChsk2RMvU+AFa/DRnUZR/8BlwRqrZuyJ/q9PwFNX4T
	X5vV8SDVV8O1rCyvE7qb0+HFcWkdvP5sWpePtf4cgVRucJ4TBEsyXV83csAaCm2m+VYi
	6CcOzJFtv4pr3k/4TZ5wk749xa0/n5LTJTHRPlCg5dszn3aDuAYHhNt9x5st1msKSRxM
	//eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=SBIdM2iEso/mop9r5ttjvMzDVJRwl5coFe49RVHSeuw=;
	b=KaubkUDqMNw+uh3j94jYPN7XN6CO4I79brEp3yglfADbmtcssoBU5g2r//YMIYjK4x
	iZFhXzTsMWcMzYZytUEuCSDuTm9YO431NcpRVUSjJPOEDPNoH896Pn7ZEPC9iHbdBNHD
	zzgy++El+D6FUW1hoM0+wEdRoot0gQZ/5f8p5WUduC5wYmzvE1cZqVzv3drDxRw4uZiX
	GppgK1iMeZkKFBk9dDa3mCr/Vm497q2Pd+UmhqsjXPJl8WPvAfAjmumro892R34S9bvV
	uB20+HHS6mVDQdEbPmPQDA9L4LAmt/u4D9dYXgyErrY3VGf5atY3D6N9dwmtEZfIXGYd
	Ccvg==
X-Gm-Message-State: AHPjjUjLh3alpiucVrtRK4pcFfwVlBTltlqfGPKCnE3N0/a2HsumFg3D
	2EHK4hk+dHd7yWsxbYOm8srcAP5P
X-Received: by 10.129.109.151 with SMTP id i145mr11630449ywc.82.1506895240199; 
	Sun, 01 Oct 2017 15:00:40 -0700 (PDT)
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com.
	[209.85.218.50]) by smtp.gmail.com with ESMTPSA id
	x4sm3684216ywe.109.2017.10.01.15.00.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 01 Oct 2017 15:00:38 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f50.google.com with SMTP id c77so4465820oig.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Oct 2017 15:00:38 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCIJ7+vTibk/NRJLRGvRubHpmStWXlgO6BJJvruf+vlsFtJ9FHj95DJU8uYgW0uwqeiDT2FBmNI1xtEA0lnwAg=
X-Received: by 10.157.24.15 with SMTP id b15mr5851261ote.476.1506895237886;
	Sun, 01 Oct 2017 15:00:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.56.216 with HTTP; Sun, 1 Oct 2017 15:00:37 -0700 (PDT)
In-Reply-To: <d270479c-2e98-0211-1cc0-b7775a318d1b@linux.intel.com>
References: <20170930180655.25134-1-otavio@ossystems.com.br>
	<d270479c-2e98-0211-1cc0-b7775a318d1b@linux.intel.com>
Date: Sun, 1 Oct 2017 19:00:37 -0300
X-Gmail-Original-Message-ID: <CAP9ODKopd3YGyd7wfz-Xyc+QDEJSJX3yeCwY7ced+aFAY4+Lgg@mail.gmail.com>
Message-ID: <CAP9ODKopd3YGyd7wfz-Xyc+QDEJSJX3yeCwY7ced+aFAY4+Lgg@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] lib/oe/package_manager.py (rpm): Signature check is enabled by default
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
X-List-Received-Date: Sun, 01 Oct 2017 22:00:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 1, 2017 at 4:36 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 09/30/2017 09:06 PM, Otavio Salvador wrote:
>>
>> The dnf has GPG signature check enabled by default. It has been confimed
>> using:
>>
>> ,----
>> | root@qemux86-64:~# grep gpgcheck /etc/dnf/dnf.conf
>> | gpgcheck=1
>
> ...
>>
>>           if self.d.getVar('PACKAGE_FEED_SIGN') == '1':
>> -            gpg_opts = 'repo_gpgcheck=1\n'
>>               gpg_opts +=
>> 'gpgkey=file://%s/pki/packagefeed-gpg/PACKAGEFEED-GPG-KEY-%s-%s\n' %
>> (self.d.getVar('sysconfdir'), self.d.getVar('DISTRO'),
>> self.d.getVar('DISTRO_CODENAME'))
>
>
>
> NAK both patches, I'm afraid. gpgcheck and repo_gpgcheck are two different
> options, which control different things, and you thoroughly confused them
> here.

I did test both patches and this is not what I figured. Did you test it?


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


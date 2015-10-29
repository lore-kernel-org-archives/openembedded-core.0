Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 5071873CC7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 11:52:33 +0000 (UTC)
Received: by iody8 with SMTP id y8so42387051iod.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 04:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems_com_br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=NQtKKrrZ8Ffw3iFbFKPGSIElMEH+qulJiDcsVFGRxNM=;
	b=gsFJ392aw2SPtS6I58lRd7Bv4CNL7orRuDABYfey3Yjhm/w0YIHXozsTzUscUYBMeu
	/4dlsS0S704RIt1v+9yn9tiAhqwVK9yQbA6E4KraO6wts2kB8t0bQr8FOdZAh8xfiL8A
	hYyCieq/WR04ByH8xsgFMeRFgRczOsZJIrJjOoRfTnROfxcLe4eKeKI6Yqw/AFhti0yG
	ymTUR/F8FuIVYbT5SAFtLHo98rJkQP2lka78+cqdcI+q5XD2j1CDdbVyFKVLDcjVbDyg
	sNRQnKQblQc4bEaBOsgUri/vZ+ff06gGwvkZPRxccaoCXXHHc2a915XvqD/yY9YL9NZf
	MczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=NQtKKrrZ8Ffw3iFbFKPGSIElMEH+qulJiDcsVFGRxNM=;
	b=kwRqkKyZQfiuKZPlr5eC33Wt0d6WeAUBjrksRc0vaV8A2F1JvVE3zZiHwDY6hPkqok
	VjdDBwGrO6mayLf0H5IX9086rG0L2jgTLPBnCppXbWC5rgeyg3BGkuq/16H3CrBpzQGX
	1qRgYGGYcNGoYwDc8EkYup1EcSWpD1LJ7L70m6Q9AX0OXtwUmjoZ5Y1xiTMSM/dhCaJL
	lB0QKu//bje2jnO+fuSKnjwuweQXmjDRVSu+ggJphbQ7Ldp3E1qSlbN3ko0/FRpLmaAa
	iYgjrN7euoMcfqRHZTfWYiO5Nm1XKJYleId6ja2nZMqDVYP7suHz+pcdFu68ltPWtOe5
	j+tw==
X-Gm-Message-State: ALoCoQlH7fVt7YPFTvT0GvYWBtNRGOXvhBEsj5jvE4HZuTj7xVq2MwRKETN5Zy2HnY4xpi89AOZi
X-Received: by 10.107.32.17 with SMTP id g17mr3386911iog.55.1446119553745;
	Thu, 29 Oct 2015 04:52:33 -0700 (PDT)
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com.
	[209.85.223.175])
	by smtp.gmail.com with ESMTPSA id c23sm916312iod.0.2015.10.29.04.52.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Oct 2015 04:52:32 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iody8 with SMTP id y8so42386331iod.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 04:52:32 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.17.18 with SMTP id z18mr3194051ioi.28.1446119552122;
	Thu, 29 Oct 2015 04:52:32 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Thu, 29 Oct 2015 04:52:32 -0700 (PDT)
In-Reply-To: <64124F70-A6D7-4B9E-BAEC-883D2AB76956@gmail.com>
References: <64124F70-A6D7-4B9E-BAEC-883D2AB76956@gmail.com>
Date: Thu, 29 Oct 2015 09:52:32 -0200
Message-ID: <CAP9ODKoBcBJu7Doiyd+HkTLe-=KO8c4S8dV5SxdCKKw=qK9X5g@mail.gmail.com>
To: Jens Rehsack <rehsack@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] udev: Don't introduce usb or pci dependencies without usb or pci being featured
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
X-List-Received-Date: Thu, 29 Oct 2015 11:52:38 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 13, 2015 at 5:37 PM, Jens Rehsack <rehsack@gmail.com> wrote:
>
> Fixes that udev always requires PCI or USB, idenpendently from DISTRO_FEATURES
> or PACKAGECONFIG.
>
> Signed-off-by: Jens Rehsack <sno@netbsd.org>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


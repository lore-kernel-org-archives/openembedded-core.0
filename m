Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6348C6E668
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 17:51:00 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id g192so1592405ywh.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 10:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=hECQk18vNhFXBBWGoiU8qw4LGtEPjilOcHD+o5Y0MYQ=;
	b=fnEmNXP9FcE4Mh2l3J06DENmC16H+QOvJXmxn9XsSUjRRuytl5nkGdFtxRWy8g/W/s
	ptN4NQVQaQRF4+xeEIZm9lxHJa7lY2WF/CTVOYrlq4+LprLlEAzO7GAraW2B3WzDZ27V
	zP7dCsWLERYwUD7P1vJ/T602XqvgmHqvfFQN83sm3o68yHJPUEKd36IrUEnYdqE8CZ3r
	6DpbFsGA5QjI30x5Btch5gdhthAkpmfl2ldEbyyK6s4hQ350qGppvtgMZY14r6WOTX1N
	XHsmTpmUk+yslPD3IT0/cKf2vvuBP6yEoZYAeokalhcTe8Zl5cxIYBGaE5cLWzLkc7vc
	ZDpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=hECQk18vNhFXBBWGoiU8qw4LGtEPjilOcHD+o5Y0MYQ=;
	b=jAGiB9ulgQ/yp9o9Ev3j0XYC784z5S5Iz4Z2wZW7wYQLEKqbn7Bhkfd2rWuNZ6rKXO
	Tewvhr1/YWR+J6hBD4s/3G5xdiHuLmWYUK+njeseoJxME1xYzgRyXzdGctVFTNJpzeWj
	sqm/OkjBAsZAY2JG0eT/mdvukJIJWtsSTtWNUIaKUcppMYsa/BdZURVGCpM668OL+6A5
	Dn8yUCF1S5dl4GJLvUSz9KK7t+4zSTFfuk/ZbGFT+ye2usr6j46GZ1JW06hnO6i24as0
	rYJSt2OlvxYlkoqWw/coTpKEhPZqKSmS4fCPyr1LsPRjnYCtPhuzFfHSBoK5tJ0Ur1Pu
	MLXQ==
X-Gm-Message-State: AE9vXwO13lSBGRSHDGPq3nFCg0+2GNAwO2cquA3bKVsDrN+YPyOGdbienlQbGcWFBulGlg==
X-Received: by 10.129.45.194 with SMTP id t185mr4488952ywt.220.1473875460699; 
	Wed, 14 Sep 2016 10:51:00 -0700 (PDT)
Received: from mail-yw0-f181.google.com (mail-yw0-f181.google.com.
	[209.85.161.181]) by smtp.gmail.com with ESMTPSA id
	k20sm3044774ywe.27.2016.09.14.10.50.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Sep 2016 10:50:59 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-yw0-f181.google.com with SMTP id g192so33451825ywh.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 10:50:58 -0700 (PDT)
X-Received: by 10.13.213.19 with SMTP id x19mr4692650ywd.226.1473875458669;
	Wed, 14 Sep 2016 10:50:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.154.68 with HTTP; Wed, 14 Sep 2016 10:50:58 -0700 (PDT)
In-Reply-To: <1473871297-28966-2-git-send-email-ross.burton@intel.com>
References: <1473871297-28966-1-git-send-email-ross.burton@intel.com>
	<1473871297-28966-2-git-send-email-ross.burton@intel.com>
Date: Wed, 14 Sep 2016 14:50:58 -0300
X-Gmail-Original-Message-ID: <CAP9ODKowGs-bZ2oyAmUn4=b6BCZPZKR9vhS9Hd==etoU5o2Pvg@mail.gmail.com>
Message-ID: <CAP9ODKowGs-bZ2oyAmUn4=b6BCZPZKR9vhS9Hd==etoU5o2Pvg@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] cmake: use convenience options for clarity
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
X-List-Received-Date: Wed, 14 Sep 2016 17:51:01 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 14, 2016 at 1:41 PM, Ross Burton <ross.burton@intel.com> wrote:
> The intention here was "everything but jsoncpp is system provided" so use the
> convenience option to ensure this remains true in the future.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>

Why jsoncpp cannot be also linked?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


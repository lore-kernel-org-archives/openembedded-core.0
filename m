Return-Path: <twoerner@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id C28E27FAA8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 17:24:53 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id 71so2486375qkl.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 10:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=j7rhoUqMmt3+5iZJE6TzgM71yg2PIK3KnIlUnEuVTJk=;
	b=HGRO3y2z5bKmHWQy7QBvcwjptdrjAFaiF9xzxVsQTHT0LBkSIUepcdMLPptc4hlWzD
	bZGa/+VJBanEiUDC/KeXumZteYTwJM1ea+XNcO6aP0iq0a0gWLI40arRpqd2vUpcLeQa
	xIg9IrBlu4wENUf7vEB/o7YOKrZmCi4YhdgIsp89/ngEV3WfFTegbFzcVjCfKl3eya5k
	t3rB+s42NzQ4m9pbwiKBWua5rh07IMW1OBT+tCXf3QCEJjnHDCfQj/UMvGuxuCHWDAA3
	tsi3NTO2510tsYu0XMQI1A9TfdhKaGgcQ2Ov1WLhBXgmDw3koftspq26qQwhktx3MOcx
	e/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=j7rhoUqMmt3+5iZJE6TzgM71yg2PIK3KnIlUnEuVTJk=;
	b=IH577mkC4Rpgx+nXTAvMcM7gn+/k7XBMFdji2wZlo0qRw2mOoyCUPx9bvsIauHvuGB
	J7YUBo4l7BmVXZZShyx5+VaxKhQCf+gvedBweaIe4qZuodobyyuyKpwW/MVGnAtcewlk
	Tw+JuXSrLYY2C+JZSVuVmOGNgGCsSfDAg0wTDMfMxGid0Bt1gLk8x6FXhocWV7QF8E0X
	D3Qh4EgtwPf6FzmeIrNoA7mOT1OyBkL71+ItmsAeavtp51OS7KDqme1ofJThN+71fJkT
	3Wsr8R8CbcCHcPJ+5kk791BiH5Io6h/0/EgnJVRxF9UyZDlu70C6K+mzneQ6HrbQUXOZ
	hVJw==
X-Gm-Message-State: APjAAAXRrcEsSekIbq0zpjrSgpcKN0UaPMlDWE1MG0lnzf2VQfWUP0mK
	jJ6cr/BcFcJjTu0UMjEt1bN+4saz
X-Google-Smtp-Source: APXvYqwEEyxA1YSj5Gn6Zxn4Ft8VVzYQjJTDyhVqoz7ApzSijn8KIWUAtxuWlCvCj66C+FSovrcqcA==
X-Received: by 2002:ae9:f50c:: with SMTP id o12mr3925407qkg.322.1572024294795; 
	Fri, 25 Oct 2019 10:24:54 -0700 (PDT)
Received: from linux-uys3 ([206.248.190.95]) by smtp.gmail.com with ESMTPSA id
	j12sm1452151qkk.18.2019.10.25.10.24.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Oct 2019 10:24:54 -0700 (PDT)
Date: Fri, 25 Oct 2019 13:24:51 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20191025172451.GC25729@linux-uys3>
References: <20191021055052.10882-1-zangrc.fnst@cn.fujitsu.com>
	<20191024130641.GA30191@linux-uys3>
	<20191024230510.smxm7zf3qvpec3xy@apollo.localdomain>
	<20191025132204.GB19333@linux-uys3>
	<20191025134458.GA22739@linux-uys3>
	<1e316ec4-e809-b66d-7a6f-53b0cc6fd1d5@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1e316ec4-e809-b66d-7a6f-53b0cc6fd1d5@gmail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libcap-ng:upgrade 0.7.9 -> 0.7.10
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
X-List-Received-Date: Fri, 25 Oct 2019 17:24:54 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri 2019-10-25 @ 07:37:34 AM, akuster808 wrote:
> is someone going to send a patch?

Yes, I'm working on that now. This looks like something that should be fixed
upstream, so that's the approach I'm taking. Please bear with me :-)


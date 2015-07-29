Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8B558763F4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 18:50:50 +0000 (UTC)
Received: by pdjr16 with SMTP id r16so10458356pdj.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 11:50:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=kKoOD33HmBIQWtCCBU4Rsm2qyIIWJX/5gQaBZ7PPeSI=;
	b=CHmQvl/A6eT8RW8+2x8/8RJDS9HWWx7YtacG14ZRv8IlrSwD8+lATFEpNbJ1kphUQc
	uUkwGIcPyqS6BdvPQwg/AMQG5U47oscWqCHGsQTxClqdoHmkqCewdMsc0dlxXVolt+Zw
	EfHBkZNYIc1dHhX1EtUSnVi42iW8Dk1axCF2ub0EqfG6/yHgV0WNuMkHZQWx6zA4IY4s
	sj9TJ7lj/lLAMbAbXS9aR7pe1sICOHe3I+qt0AxI/TkZHJ8uBGsg3NYJX5TPnMCl85BZ
	AgxaF8hGBBCfUbyWu8A5BLeezzYDMp2dPEQTz4FiIeaaeckKZU2eF3b71Rp3vi0Q7jIK
	P+iw==
X-Gm-Message-State: ALoCoQkbR19pEvN/g5EUyFSzjeQBj/C5jklYiEiL/zwS3TXfStX0NIb6EQ/fnIbv9DWZwbDWlxdx
X-Received: by 10.70.34.171 with SMTP id a11mr95751439pdj.18.1438195850413;
	Wed, 29 Jul 2015 11:50:50 -0700 (PDT)
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com.
	[209.85.220.41]) by smtp.gmail.com with ESMTPSA id
	oi17sm42054649pdb.74.2015.07.29.11.50.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Jul 2015 11:50:49 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by padck2 with SMTP id ck2so9900918pad.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 11:50:47 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.67.5.2 with SMTP id ci2mr95596178pad.97.1438195847821; Wed,
	29 Jul 2015 11:50:47 -0700 (PDT)
Received: by 10.70.59.105 with HTTP; Wed, 29 Jul 2015 11:50:47 -0700 (PDT)
In-Reply-To: <CAJ86T=Ugozr1qJ6cHpCBwzHef3QNEUKcK4QRR5TScPx9LqFipQ@mail.gmail.com>
References: <1438125665-14966-1-git-send-email-armccurdy@gmail.com>
	<1438125665-14966-9-git-send-email-armccurdy@gmail.com>
	<CAP9ODKqSeym02zoqOn5Mim3mXq1RWzpzMkq9Oqr_e525cyxTiA@mail.gmail.com>
	<CAJ86T=Ugozr1qJ6cHpCBwzHef3QNEUKcK4QRR5TScPx9LqFipQ@mail.gmail.com>
Date: Wed, 29 Jul 2015 15:50:47 -0300
Message-ID: <CAP9ODKo-C0whENS7wsrt49vHSczmNdde7N9oV9Adq33bXCKs4w@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 8/8] busybox: disable volumeid support for exFAT, F2FS and NILFS
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
X-List-Received-Date: Wed, 29 Jul 2015 18:50:50 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 29, 2015 at 3:49 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Wed, Jul 29, 2015 at 9:33 AM, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>> On Tue, Jul 28, 2015 at 8:21 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>> These are less common filesystem formats, so disable volumeid support
>>> for them by default.
>>>
>>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>>
>> F2FS could be of use. It is being more adopted now that Android is
>> starting to be deployed to some devices with it.
>
> The current list of filesystems with volume ID support is below.
>
> If support for F2FS should be enabled, how about enabling support for
> btrfs, luks and squashfs too?

I agree.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


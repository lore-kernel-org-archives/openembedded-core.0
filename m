Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0B00D7597C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 12:42:10 +0000 (UTC)
Received: by pdbnt7 with SMTP id nt7so5539245pdb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 05:42:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=+0QCFuPVbyJ2LM0Aew0Qpv+RndtdVOzZWo7db1g30YM=;
	b=P/RUTZLf0fxW26rRi7t6PR+4ZFy7jaqnsCHc0XD30BTtqt25+2mEv2kh4tCLeQtsJy
	Jvv5nWaqS2Z9KB48CCshdG29jMb6d740y00fSFasALF3hkTuzGoLWgKnCqwQk63KUnPD
	jKqiU6lLZiWV4E2XufJHP1+c2LwVKkPnklO/Zpdhuw3c3vq4drNu4y7cgsiWQIWW5zZa
	1o+G1KYVNO6EUp2thW2ngkFZK3ug2dGVPy3iw7agHoy2n9LQM7Q4FYb/0GioElKygdIN
	dq/tlGp+x4OAMEf5xo1C4ZlaR1u1U30J7Sn8ZNyqezhgm76sQHUY+DzhnLUuES8ZYwOz
	pjAg==
X-Gm-Message-State: ALoCoQlZkb6GzvTvp49O7zB1/dLGHwRmoQv5Si2cMFD8Af5t9d+xoZWAatjoTdI8Gq2bOlFQy9zd
X-Received: by 10.70.130.3 with SMTP id oa3mr92472688pdb.51.1438173731045;
	Wed, 29 Jul 2015 05:42:11 -0700 (PDT)
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com.
	[209.85.220.51]) by smtp.gmail.com with ESMTPSA id
	b4sm31854306pdn.42.2015.07.29.05.42.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Jul 2015 05:42:09 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pachj5 with SMTP id hj5so5226266pac.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 05:42:08 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.66.101.9 with SMTP id fc9mr91998164pab.37.1438173728551;
	Wed, 29 Jul 2015 05:42:08 -0700 (PDT)
Received: by 10.70.59.105 with HTTP; Wed, 29 Jul 2015 05:42:08 -0700 (PDT)
In-Reply-To: <1438194339-13618-5-git-send-email-b54851@freescale.com>
References: <1438194339-13618-1-git-send-email-b54851@freescale.com>
	<1438194339-13618-5-git-send-email-b54851@freescale.com>
Date: Wed, 29 Jul 2015 09:42:08 -0300
Message-ID: <CAP9ODKqiivRLubz=kW+A5Xp66EW7NWPGqs9oscscHYz+TwUc9A@mail.gmail.com>
To: Yuqing Zhu <b54851@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky][PATCH v4 4/5] gstreamer1.0-plugins-base: Add GST_VIDEO_FRAME_MAP_FLAG_NO_REF related patch
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
X-List-Received-Date: Wed, 29 Jul 2015 12:42:12 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 29, 2015 at 3:25 PM, Yuqing Zhu <b54851@freescale.com> wrote:
> -Add GST_VIDEO_FRAME_MAP_FLAG_NO_REF
>  This makes sure that the buffer is not reffed another time when
>  storing it in the GstVideoFrame, keeping it writable if it was writable.
>
> -Use new GST_VIDEO_FRAME_MAP_FLAG_NO_REF to replace the old one because it's kind of ugly.
>
> -Don't ref buffers twice when mapping
>
> Signed-off-by: Yuqing Zhu <b54851@freescale.com>


Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


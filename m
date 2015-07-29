Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 761EA7597C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 12:41:31 +0000 (UTC)
Received: by pacan13 with SMTP id an13so5380637pac.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 05:41:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=XYh8QOA/FUpT/d+TX+w+WyskjcY1S35f8JVD3rFw3mg=;
	b=fOzL9n0B0IeQuZ0ycpeU98NBbVGr9PS4SaceApyLTzro/SCVbUnObzGZAN3rsO2yAn
	jISK89uz4/jdSc9jw7XeYmZhj464X7Da87Qw57BnXSHaRcODjYnYQc+Yg+l4p33pJyup
	y+3iFCxFQiUe4sfYs1gf5IBm+Edgy512PEq0zjOFFOY5bis6YH8W4HAAWzeRWRgyiDUk
	RYVktsanMA0GD4ux3iATBA2rfTJI5UPCInUoT61bJ5H25CeSK4TSVhWrAqTnZSwCx2Kb
	7XoKlEQ20t/iJnZp3Hkb8oj0gLri9Eg05yrWeVSEXYCgzHmJ0TNgiqTctB4yOXSa4MGA
	VMQA==
X-Gm-Message-State: ALoCoQl7uCvCrJMsziVqV96waBODGdC/FB/mzbvYz0WscuZ4HsmugOEj9sAGjz8MJxs1JJWA40gn
X-Received: by 10.66.63.71 with SMTP id e7mr91535586pas.57.1438173691417;
	Wed, 29 Jul 2015 05:41:31 -0700 (PDT)
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com.
	[209.85.192.181]) by smtp.gmail.com with ESMTPSA id
	da3sm40705273pdb.8.2015.07.29.05.41.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Jul 2015 05:41:30 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pdbnt7 with SMTP id nt7so5530297pdb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 05:41:29 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.70.133.42 with SMTP id oz10mr94439641pdb.85.1438173688995;
	Wed, 29 Jul 2015 05:41:28 -0700 (PDT)
Received: by 10.70.59.105 with HTTP; Wed, 29 Jul 2015 05:41:28 -0700 (PDT)
In-Reply-To: <1438194339-13618-4-git-send-email-b54851@freescale.com>
References: <1438194339-13618-1-git-send-email-b54851@freescale.com>
	<1438194339-13618-4-git-send-email-b54851@freescale.com>
Date: Wed, 29 Jul 2015 09:41:28 -0300
Message-ID: <CAP9ODKpv73pii76og94jsnVy_8K++36Viwgs8YLCF1CyfsES1Q@mail.gmail.com>
To: Yuqing Zhu <b54851@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky][PATCH v4 3/5] gstreamer1.0-plugins-base: update video alignment after video alignment
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
X-List-Received-Date: Wed, 29 Jul 2015 12:41:31 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 29, 2015 at 3:25 PM, Yuqing Zhu <b54851@freescale.com> wrote:
> Video buffer pool will update video alignment to respect stride alignment
> requirement. But haven't update it to video alignment in configure.
> Which will cause user get wrong video alignment.
>
> Signed-off-by: Yuqing Zhu <b54851@freescale.com>


Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


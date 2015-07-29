Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 9B8B876230
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 12:05:50 +0000 (UTC)
Received: by pdrg1 with SMTP id g1so5007600pdr.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 05:05:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=SODhd9G/MxkGAb0jY1gyjEwDz+gUT1aYTEfZAyxPpWs=;
	b=G4o3ojL9A9dKFMri4BvaY4ZmoIrpKgvL6tFJ5/MzGBcqUbU4SD1EdfQrJleLvcqDTI
	lvUSJU4MzlsOQ0oUBDqbtPzE2PBsKZ4zqqp/tAZOaKi4uqufp+LZ79XzIs/Xl7cuNQZn
	5FEwJoznQeC45eU5csx48mUr7lca5q/VBVGYzB/vIPlqmY2CrDhFaXaV9d/7O8MyTg04
	ji7YGVoeP18Z1MeEL3kncrhvrabY3UgEXYyldAq2EKSJj7lG2zHX1i/qQz296NX9yaaW
	m5DBaW6VTxA3Myf5NZt1chvKxg+gKvfoyL9zlejfHERhsINEQ782qYPwZl/3yOxFf4Kb
	vqEw==
X-Gm-Message-State: ALoCoQl5vBTFvsesxJP6SetNyfKs+1H44ewj3T04aHjz+paN82txuS1ueAOC7FQfXBipMueUFLM3
X-Received: by 10.70.0.166 with SMTP id 6mr91867045pdf.119.1438171550546;
	Wed, 29 Jul 2015 05:05:50 -0700 (PDT)
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com.
	[209.85.192.172]) by smtp.gmail.com with ESMTPSA id
	ob15sm40493497pdb.40.2015.07.29.05.05.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Jul 2015 05:05:49 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pdbnt7 with SMTP id nt7so5066094pdb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 05:05:47 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.70.118.163 with SMTP id kn3mr75449844pdb.115.1438171547840; 
	Wed, 29 Jul 2015 05:05:47 -0700 (PDT)
Received: by 10.70.59.105 with HTTP; Wed, 29 Jul 2015 05:05:47 -0700 (PDT)
In-Reply-To: <BN3PR0301MB1172D32B8B54AF37974C4345868C0@BN3PR0301MB1172.namprd03.prod.outlook.com>
References: <1437996407-29463-1-git-send-email-b54851@freescale.com>
	<1437996407-29463-5-git-send-email-b54851@freescale.com>
	<CAP9ODKqYBs8XdR2+xL5ixxPRqSt2tMK1PbLmkAcg_Srhx5suMw@mail.gmail.com>
	<DM2PR0301MB118383021F988F9AD22C44AB868D0@DM2PR0301MB1183.namprd03.prod.outlook.com>
	<CAP9ODKrv04uCiQjEBS_0MV5i39j8UccuOBoZ-Ti0XMx5wOqm7A@mail.gmail.com>
	<BN3PR0301MB1172D32B8B54AF37974C4345868C0@BN3PR0301MB1172.namprd03.prod.outlook.com>
Date: Wed, 29 Jul 2015 09:05:47 -0300
Message-ID: <CAP9ODKpQzKgMmVbMs2_z2ooRtQukuKBNBSseooq-dqpHRkzX7A@mail.gmail.com>
To: Zhu Carol <B54851@freescale.com>,
	Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky][PATCH v2 4/6] gstreamer1.0-plugins-base: Add video-frame related patch
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
X-List-Received-Date: Wed, 29 Jul 2015 12:05:52 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 29, 2015 at 6:22 AM, Zhu Carol <B54851@freescale.com> wrote:
>    The 1.4.2 fix is ugly, so [OE-core] [poky][PATCH v3 5/6] gstreamer1.0-plugins-base: Add videofilter related patch is used to revert it.
>    Actually these patches are all back port from 1.5.1, I will change the Upstream-Status and merge these two patches together.

I am sure Sebastian had a reason to not backport 1.5.1 fix but I am
not in a position to make a call here... Carlos know the code better
and should be the final word on this.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 45D7776E04
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 14:11:28 +0000 (UTC)
Received: by igcpb10 with SMTP id pb10so105339113igc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Sep 2015 07:11:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=ybuw9SyCA3vz+Xcu+x2HYniW35ZosS2NGINY/kR8C8Q=;
	b=iJ3P0Nh4+PDb3WyEkQK8aqepbMdNdTkcvXfMxjhUDDB7MiBxcaLAvkHoK1n3VEqVk9
	LLDAdwDoCAFeBL36t7hOqkKNnuh0AVB/L1vGnAZvpbt4YCTGxRyLL4Lus6/D0vadiztr
	mpwAyJFSEjkpQMLz4V6GXeLElF9EwdCT/GFTly1DQzFm2rPhh/H7NoRUKuq8xDRksDzx
	Pw/He5jo853rffVDcXhRj2T/SeuV6iroW19s3QrKe1rBR6ONpFgZPSatlSETcuggaemS
	oIWw4z291+EcdbtWPPThp2ZEW4u4t384wLUfvNlMi6qV/tPkZqRkYud7dHnhUVIRlRCJ
	kRtQ==
X-Gm-Message-State: ALoCoQk46t1xIdqgxwxFMXpTpe6flsZPAZaKk53qteoxecHIcEmRTshVHH7YCbecN+e8RbDfdvK3
X-Received: by 10.50.176.225 with SMTP id cl1mr38198791igc.80.1441807888700;
	Wed, 09 Sep 2015 07:11:28 -0700 (PDT)
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com.
	[209.85.213.176]) by smtp.gmail.com with ESMTPSA id
	m18sm4606934ioi.44.2015.09.09.07.11.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Sep 2015 07:11:28 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igxx6 with SMTP id x6so15002138igx.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Sep 2015 07:11:27 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.17.67 with SMTP id m3mr3109756igd.5.1441807887685; Wed,
	09 Sep 2015 07:11:27 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Wed, 9 Sep 2015 07:11:27 -0700 (PDT)
In-Reply-To: <08da5db32769473be4884f87ad002fe426770a91.1441803055.git.patrick.ohly@intel.com>
References: <cover.1441803055.git.patrick.ohly@intel.com>
	<e0e5e8bdc09dcfe3b5410ccfed0b11c0c8d63d3b.1441803055.git.patrick.ohly@intel.com>
	<08da5db32769473be4884f87ad002fe426770a91.1441803055.git.patrick.ohly@intel.com>
Date: Wed, 9 Sep 2015 11:11:27 -0300
Message-ID: <CAP9ODKr6sJ_x4SB1FdFi+aM=ZmpA7AyNCSK26dujrz=HPfmv7w@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] initramfs-framework: support init boot parameter
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
X-List-Received-Date: Wed, 09 Sep 2015 14:11:29 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 9, 2015 at 10:10 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> It can be useful for debugging to override the default /sbin/init.
> This is something typically done via the init boot parameter which
> then gets interpreted by the kernel. But when using an initramfs, it
> is the initramfs which must react to the option.
>
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>


Acked-by: Otavio Salvador <otavio@ossystems.com.br>


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


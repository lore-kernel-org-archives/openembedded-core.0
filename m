Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 076C074CB4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 14:00:30 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id 13-v6so21862723ois.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 07:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=+qbsSLxkhc+LBXosLUn36u0IlPtmY0pbhoTD5VxK+2w=;
	b=U8/V+TzRVELO8aL5fPtJ/SapAP1mHEoV60KLI8HCxmkfuQl4bzgQZWyEHL+KaP0Fum
	aQaP7U6A/D/7rlJmdIHS4tnojdJfl+6RsIQ89ZvTK01UF1JouBzT4u/SKSauJK1y+AeO
	u9Z80YVHe4A97jsjsejepU+PUfNSVr4aiYgpHbhvPw3YQU8qNB8OJUOt8/YJ5hzMgAuE
	tuoC1cqCpzo+TXo7Oqd+mzP41wi+GwDYYwDdlhHQ4mEJtlorgaQN4T2Y2MFKpd4dMqLT
	9UsJ0r5IbkbUAGUjkFKL0zXdMrbu/ESEbSrZLPF0Pnb0uD4dFEoLK7Lg+NloYCbklx/k
	mwSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=+qbsSLxkhc+LBXosLUn36u0IlPtmY0pbhoTD5VxK+2w=;
	b=UMIgspeCdxeUVhVeuxf+N7iWxxgwlYAh8UdgVLHWRy/4sXeQQayk2TDQn75AxoGMAO
	ny00Q5hjpkNxyZos9B0hVeSWYZywtpSwWcXLXiR+wxXY9zOED5nR12xfpQRbMXw+fm9m
	+gNrrqcXP5sZhirNBDFAyKULzUGmepQAqr+OYAsHn+OxN/ixRBezT7m7yS8hz8Nn/f18
	o/oBwPbcpfTi6F19Ur3qBD5uLTE/m05UADOBQqVUI08O6nWmZT0DEYMi6DYESXs55aOg
	hhiy3adfl4P81gmXvU5J0eO3jLj1JPsOnn/woZfI2KGxemb0lFj5zWmOuDqPhjgPSpMm
	+kEg==
X-Gm-Message-State: APzg51ASrtI4lpITcgOUjQ2LORMfQZh0sL0Sq1hDVy9p5APuKZtEnLVN
	sEAtLLM16KKBBfbpxLJjJXTTNJ8lnpgEbQ==
X-Google-Smtp-Source: ANB0Vda44Jbk0Of+cg/Nkzs55QVfkL05NjpTPejQHN3QPhzRKSTP1e+6DR8uh23BHGUg4Y1Qn97W6A==
X-Received: by 2002:aca:4ec6:: with SMTP id
	c189-v6mr7926763oib.186.1535724031488; 
	Fri, 31 Aug 2018 07:00:31 -0700 (PDT)
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com.
	[209.85.218.50]) by smtp.gmail.com with ESMTPSA id
	a8-v6sm6468936oia.24.2018.08.31.07.00.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Aug 2018 07:00:30 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f50.google.com with SMTP id 13-v6so21862423ois.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 07:00:30 -0700 (PDT)
X-Received: by 2002:aca:1802:: with SMTP id
	h2-v6mr7202737oih.353.1535724029697; 
	Fri, 31 Aug 2018 07:00:29 -0700 (PDT)
MIME-Version: 1.0
References: <20180830172737.26950-1-otavio@ossystems.com.br>
	<20180830172737.26950-2-otavio@ossystems.com.br>
	<CAJTo0LZ0o1ZN7o-NgaRJxidKZb3eCh=4POf3nk+7aW7FdqGSNQ@mail.gmail.com>
In-Reply-To: <CAJTo0LZ0o1ZN7o-NgaRJxidKZb3eCh=4POf3nk+7aW7FdqGSNQ@mail.gmail.com>
Date: Fri, 31 Aug 2018 11:00:17 -0300
X-Gmail-Original-Message-ID: <CAP9ODKquN+ek-9dzOgHZ3tq+L4QxCrG0goP_gWEfCbC6jNoZ_g@mail.gmail.com>
Message-ID: <CAP9ODKquN+ek-9dzOgHZ3tq+L4QxCrG0goP_gWEfCbC6jNoZ_g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/3] linux-firmware: Update to feb25f3e revision
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
X-List-Received-Date: Fri, 31 Aug 2018 14:00:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 31, 2018 at 7:09 AM Burton, Ross <ross.burton@intel.com> wrote:
>
> ERROR: linux-firmware-1_0.0+gitAUTOINC+d114732723-r0 do_populate_lic:
> QA Issue: linux-firmware: LIC_FILES_CHKSUM points to an invalid file:
> /data/poky-tmp/master/work/all-poky-linux/linux-firmware/1_0.0+gitAUTOINC+d114732723-r0/git/LICENCE.cadence
> [license-checksum]
> ERROR: linux-firmware-1_0.0+gitAUTOINC+d114732723-r0 do_populate_lic:
> QA Issue: linux-firmware: LIC_FILES_CHKSUM points to an invalid file:
> /data/poky-tmp/master/work/all-poky-linux/linux-firmware/1_0.0+gitAUTOINC+d114732723-r0/git/LICENCE.mediatek
> [license-checksum]

That's weird as I did test it here. Sorry for the problem. But I
couldn't reproduce it here.

Are you sure you did use the v2?

% ye l linux-firmware do_populate_lic | egrep '.(cadence|mediatek);'
NOTE: linux-firmware: md5 checksum matched for
file://LICENCE.cadence;md5=009f46816f6956cfb75ede13d3e1cee0
NOTE: linux-firmware: md5 checksum matched for
file://LICENCE.mediatek;md5=7c1976b63217d76ce47d0a11d8a79cf2

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750


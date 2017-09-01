Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id CC24777BBF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 13:07:44 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id n18so139551oig.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Sep 2017 06:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=uJr3Cg95+EYSXt1vMxyamQT8O+77QH25G/UXRMyAm3g=;
	b=0o8QzvcaBkijNzOgyGUJBuUW72IpXgoIwF2YDCoSJUXAkSa5itUvW6Q0vz1YU8obS7
	Os6N2ItwjKaLl2w2+nMJZxGssDDmSxYoKvSsian3Sr8lClYnFbLn95VhMHEI0EyPXxIw
	1Fan6vadJjSFmPNON9wBEtjIpaEAQw1HA80WUrPJcXL0B87n7o19lA/za0R5KLDmRAfA
	N4jYmRnjj4I5gg1tEV2AI/rak/9CLBT1qq/boYcXlzNbXljSv1Z4N89MtKVVjSwxMJDO
	eqjeZNn8TsyLg739vwg/wavn7Ex3lAjeqDhDvynm4qtGK4myfZYXEum5W3Iog70RGjbw
	3FuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=uJr3Cg95+EYSXt1vMxyamQT8O+77QH25G/UXRMyAm3g=;
	b=ufUMc/pn3CgNSpBDGqyTQtrgzvGaaehfBV7WZKLs8sIwlo/iD5fBirrOBMBmP2lsG8
	MjlbEZQpvHEaW/RH7sDRXiRBLe3BEAgD7QnKt/lbpBrz+AA5g9j4DiSucFCZEBcDv28Z
	47dhPn/B67T1NfD7x7rvqOLBYSNHB8uCAHKWUAS6vQC3N+3wLInEdH+R7lQ6iKZBNFPo
	ZhdT+HKV65VJskL4IUigShdIeZtcsTU0HI7+yhHVwamJA+gTvVBkMT1nn/9uu4zgaB7p
	CNUBVMQ9Gc7cJVTDfvQ7dH6CjrZ9apbZzNTURWjx7BYAFbO2ZnS3qxyyIa+fwI979eC3
	YrJg==
X-Gm-Message-State: AHPjjUgbA+KJ6fwIBhSG8TYqkqP+619zBTOd1BwLnFQyXqij00EEHa+o
	0y1aOa2RPBX8Y01EtP8=
X-Received: by 10.202.195.139 with SMTP id t133mr1535285oif.110.1504271265574; 
	Fri, 01 Sep 2017 06:07:45 -0700 (PDT)
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com.
	[209.85.218.50])
	by smtp.gmail.com with ESMTPSA id k13sm116781oib.7.2017.09.01.06.07.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Sep 2017 06:07:44 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f50.google.com with SMTP id t75so1384617oie.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Sep 2017 06:07:44 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb6+zcNEgnove3xAfcjraa8A6rgV6J4iIsvXECJ+9F5RCHS5yVwgrrxZ5K6SrWcpIcSwIKAzvR5IZFetQe8j5HE=
X-Received: by 10.202.186.10 with SMTP id k10mr1610932oif.100.1504271263945;
	Fri, 01 Sep 2017 06:07:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.0.37 with HTTP; Fri, 1 Sep 2017 06:07:43 -0700 (PDT)
In-Reply-To: <1504219388-19927-1-git-send-email-sgw@linux.intel.com>
References: <1504219388-19927-1-git-send-email-sgw@linux.intel.com>
Date: Fri, 1 Sep 2017 10:07:43 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrXtcR=DnxwMVRnyMjY-ydf_h06fmeE+UOgEFS=+2aPvw@mail.gmail.com>
Message-ID: <CAP9ODKrXtcR=DnxwMVRnyMjY-ydf_h06fmeE+UOgEFS=+2aPvw@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mkelfimage: Add update convert.bin.c file
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
X-List-Received-Date: Fri, 01 Sep 2017 13:07:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 31, 2017 at 7:43 PM, Saul Wold <sgw@linux.intel.com> wrote:
> This is a compile code fragment that has an elf signature, it needs to be
> updated for the newer tools.
>
> After 2.4 we will be removing the elf Image type as it has been expunged
> from the coreboot repo since 2014.
>
> [YOCTO #11967]
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

Why not remove it now?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


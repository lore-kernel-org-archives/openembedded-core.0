Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 5A7CA6AC00
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 21:07:39 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id n5so326186230pfn.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 14:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=oaw0nDHZBYaV0EfoMY0hLS39PC+6wqe6LFNmKZHCBF8=;
	b=Y5MqPkShvtEn+SmrdQWU8ybLkeQ/g6EI6cEcmiC1vm/ep6nVRaYYVErEEO+m6RIFlp
	bDewaxxQdhsqNWCNLu238fSU5dtvEtcU3R6f1J/GhHIqBS4srdZ5X5DpcOJwMjavDOXr
	Q6xwij+4h8jyko5e8uMl0DPgPIzLBxWEm3lU0wc1i6Q0nAhSIch0TaLHMHI5B4JC7xIM
	5yedhUvll1UlWMdbLqjZiTT8NOIwOWjtuEUbfQqK5eijDMCUFTavb4L9kdoroK+pOUw2
	ZxmsuFHULlcNrrDMQC/1SZBhN2QD/75sA10LYwyOGEz9R8Jtb+hXi6KsUhmJKLqk8lNj
	Mt0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=oaw0nDHZBYaV0EfoMY0hLS39PC+6wqe6LFNmKZHCBF8=;
	b=X7KQCVoo7/GG5lBiM+/4tCB76Tuvxm6MDbImvhzDkTMr8k8pSv4CLo3kruZFKtLPzT
	ozR6nUluafcTCw4f2BMrJ+Sq/yn38TUSv+aIAcxC595meHCojvTX1iZ0Tr2cIAJTkiGy
	vpG7Fx366djYXGv5xbGKol9TxUpv9+SOKM9BlcBJ/G1Chbn8X0YLdlSYRGTGoiMNCZJy
	wu8zWBDj782T5BiK0DGbz3K2F4el01My4ostUwldSd/nyDaBSNV4LTPx0aQ1iSzwzWeZ
	oASCQ8qcVtrpciMA1vuL5/JX/giRRFYCGVaPT19j1gfltzTJiwo2IRfR0NvVVvDzZJqL
	8fzA==
X-Gm-Message-State: AD7BkJK5xayekUCAq4fOWZI9h1/U/jJzOO/3kG3/rsWq+v7K1fbipb0oSz1fsppUzMOfeA==
X-Received: by 10.98.7.153 with SMTP id 25mr57670896pfh.38.1458680860053;
	Tue, 22 Mar 2016 14:07:40 -0700 (PDT)
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com.
	[209.85.192.175]) by smtp.gmail.com with ESMTPSA id
	s87sm50385349pfa.89.2016.03.22.14.07.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Mar 2016 14:07:38 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f175.google.com with SMTP id n5so326185107pfn.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 14:07:38 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.98.74.200 with SMTP id c69mr56623064pfj.129.1458680858048;
	Tue, 22 Mar 2016 14:07:38 -0700 (PDT)
Received: by 10.67.3.163 with HTTP; Tue, 22 Mar 2016 14:07:37 -0700 (PDT)
In-Reply-To: <1458670391-26915-5-git-send-email-sgw@linux.intel.com>
References: <1458670391-26915-1-git-send-email-sgw@linux.intel.com>
	<1458670391-26915-5-git-send-email-sgw@linux.intel.com>
Date: Tue, 22 Mar 2016 18:07:37 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrtzYwE-Y2pCD7wCMcwY9CVixxAg+dmNJkL2o=CQrmL=w@mail.gmail.com>
Message-ID: <CAP9ODKrtzYwE-Y2pCD7wCMcwY9CVixxAg+dmNJkL2o=CQrmL=w@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] linux-firmware: Break out some additional firmware
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
X-List-Received-Date: Tue, 22 Mar 2016 21:07:39 -0000
Content-Type: text/plain; charset=UTF-8

Hello Saul,

First I would like to thank you to manage this upgrade and
refactoring. This recipe was indeed requiring some love and you did a
great job.

On Tue, Mar 22, 2016 at 3:13 PM, Saul Wold <sgw@linux.intel.com> wrote:
> This breaks out new firmware from the iwlwifi firmware along with the i915 graphics firmware.
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  .../linux-firmware/linux-firmware_git.bb           | 25 +++++++++++++++++++---
>  1 file changed, 22 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> index 04d9471..6f6581a 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> @@ -224,6 +224,9 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
>               ${PN}-iwlwifi-6050-4 ${PN}-iwlwifi-6050-5 \

As done in the other one, this might make sense to consolidate into a
single one.

>               ${PN}-iwlwifi-7260 \
>               ${PN}-iwlwifi-7265 \
> +             ${PN}-iwlwifi-7265D ${PN}-iwlwifi-8000C ${PN}-iwlwifi-8265 \

Does it make sense to split D out ? I think adding it inside the
former might avoid too much fragmentation.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


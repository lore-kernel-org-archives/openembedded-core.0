Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5CF0060939
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2016 13:26:35 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id 83so2414175vkd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2016 06:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=3WF+tRlzpwUSt7jxUq7fpq9pnNnbfFAjlqXhAKnBwXU=;
	b=1T8Mw0suwAvPlj1KyoGEtLpzucK+HyYmOLVPBWr+DbRLktQvJuDpsD03Urc8aziUyH
	XevSUnHeFHUDiVBrohzMkbJmmLMwuoQgRYXdxS7XEWG+pq9yTd08BewPeeghvV+gSAbN
	gQc7yrVgkZthlQVoaOVpDAJL7Opfr6KPxpMULHCWL9mirlM8/I3RupAa8GAB/jch2SXV
	vlpC1CwRd2V1sUaNDoE1divBE18MBLx5f3L/wSTsgxMUfHA+58A/CN52kmXRhBU0dwV1
	gX95+360BUkfQVLKRQcac0ZWzFf4Zo08DEEmq9mGauN3sEMqMbhzsar2+4Il4LIZA3GA
	dpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=3WF+tRlzpwUSt7jxUq7fpq9pnNnbfFAjlqXhAKnBwXU=;
	b=cBDM+QSHT+BE7Ci07RwNJpFFlS/yX3x1xRNvu90g06/Hl27lsVqq2olT2bzZaGNC3W
	sbN3D9DssdNeoSv9vWr2/fO3nG9IIIUBV05GoPWAIp7n+FLDhj5zxbRlAFqfWVf6aNyi
	WLpGc/pEeDqfuXMm3WboD/sgmCIq4agKK7U2uEm+ZyN1SW9yvpf37+tlaH/kPa9itYAO
	spBsvOT6XQCDgdf8k68Vy2YRqxQoXLb4Uo2i1Ba3jv92nRZ+adCalvsqmN0ktVHA411R
	Qcto31JYAJeZJJgWGcte5GibyWCKgJEJsl1DMfL0t1d6ndJA1rfTiHkE3vLDSknh3/MX
	6x2g==
X-Gm-Message-State: AA6/9Rlna/klCCx2isg4UFs8HF+/HW7N5cgQY7OQObQEfdUO1h8Dx4dZWg2jpBB3C4KM5w==
X-Received: by 10.31.11.82 with SMTP id 79mr3113701vkl.165.1476365196557;
	Thu, 13 Oct 2016 06:26:36 -0700 (PDT)
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com.
	[209.85.213.42]) by smtp.gmail.com with ESMTPSA id
	k194sm5171424vkf.17.2016.10.13.06.26.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Oct 2016 06:26:35 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f42.google.com with SMTP id q126so24563971vkd.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2016 06:26:35 -0700 (PDT)
X-Received: by 10.31.203.3 with SMTP id b3mr4470676vkg.131.1476365194975; Thu,
	13 Oct 2016 06:26:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.120.78 with HTTP; Thu, 13 Oct 2016 06:26:34 -0700 (PDT)
In-Reply-To: <1476189160-17339-1-git-send-email-ross.burton@intel.com>
References: <1476189160-17339-1-git-send-email-ross.burton@intel.com>
Date: Thu, 13 Oct 2016 10:26:34 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpDs3B+eGa4y5ukP+ZyaOcj2cjKw4A0fZsm8Sb2QB6Azw@mail.gmail.com>
Message-ID: <CAP9ODKpDs3B+eGa4y5ukP+ZyaOcj2cjKw4A0fZsm8Sb2QB6Azw@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake: improve CMAKE_SYSTEM_PROCESSOR assignment in nativesdk
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
X-List-Received-Date: Thu, 13 Oct 2016 13:26:36 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 11, 2016 at 9:32 AM, Ross Burton <ross.burton@intel.com> wrote:
> The previous string manipulations would result in the wrong string being used
> for machines such as intel-corei7-64 as the sysroot was split at the first
> hyphen (so would result in corei7 instead of corei7-64).
>
> Change the logic so that it looks for processor-distro-os and uses the whole of
> the processor field.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>
Tested-by: Otavio Salvador <otavio@ossystems.com.br>


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


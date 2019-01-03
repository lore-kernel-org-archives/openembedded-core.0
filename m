Return-Path: <trini@konsulko.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6178C6E499
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jan 2019 15:46:58 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id e5so37247439qtr.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2019 07:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=uywQlV9Ar8wPPYEhBo3joxaxVUbmtTLGA6KqljYTAoM=;
	b=SlOmkFFrJG6JsWQUqy+LBp3jN7/hbBjGO8VyvLfQbCFO7pDoSgZwdSGQILJo6Y7SON
	sEqrOTYZZD+fcDCIf+GnBXUvpuhARpAI0pst1rD8t7jDBxcUzmxh1xp+RyeeP540HXL2
	iPwj+4bx5Dlbx/Oq3DkDXT1pYbriMr1lXq36o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=uywQlV9Ar8wPPYEhBo3joxaxVUbmtTLGA6KqljYTAoM=;
	b=A1OaM5psio6MEt1c1wcH5/kqheC/V9b2mskTwMW6yC/+2S249H2hAhEFlNiWYeqgWV
	yj/9d28cKbkjGz2GQBWhaCvKlZFbx0aZR8w5UnvjD2y0paTmOMmca7A0kGXNfTp+1kki
	gISMrmc6qiiNW4qsMQnd+p5NwWZerSjj+JMZDgQFUHRtWZWlbR8n5ZxUFI59TBjFyTJz
	9nFsBdbqy8OaLsepSrDCNPXEkAw0V5bt+SdKY4b5jwy8SG8DG8bu0zAPr/o0pwiZp1JY
	3md5wa80MvHVL1f3+HdIE15HLCiRVOe8gAQmYkQR3x3zd+zbIHFQXzUFlEdOsAEYHART
	bMNw==
X-Gm-Message-State: AJcUukd1Q1MCv8qoPSSnJ9OEn3Fr1K3ctuFB5wGG6aTaeMYN100Chcx7
	A4P1fY2p3tmBDY61jftxQT9UNg==
X-Google-Smtp-Source: ALg8bN4oRJUvC+AXQcta9vZrQwOICB4SKYgpEHvmrnbmF5dDPTDynNoZ9g5ZPlTUiKRSf9tC81NMOQ==
X-Received: by 2002:a0c:d792:: with SMTP id z18mr47698549qvi.183.1546530419059;
	Thu, 03 Jan 2019 07:46:59 -0800 (PST)
Received: from bill-the-cat
	(cpe-2606-A000-1401-82A1-8CC9-CD5F-C65E-833E.dyn6.twc.com.
	[2606:a000:1401:82a1:8cc9:cd5f:c65e:833e])
	by smtp.gmail.com with ESMTPSA id
	r1sm29059979qte.28.2019.01.03.07.46.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Jan 2019 07:46:58 -0800 (PST)
Date: Thu, 3 Jan 2019 10:46:56 -0500
From: Tom Rini <trini@konsulko.com>
To: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
Message-ID: <20190103154656.GP16433@bill-the-cat>
References: <1546408097-27055-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
MIME-Version: 1.0
In-Reply-To: <1546408097-27055-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] u-boot.inc: Support menuconfig for u-boot
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
X-List-Received-Date: Thu, 03 Jan 2019 15:46:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 01, 2019 at 09:48:17PM -0800, Manjukumar Matha wrote:

> u-boot mainline supports menuconfig, this patch enables menuconfig for
> u-boot using cml1.
> 
> u-boot recipe in OE-core handles multi configuration of u-boot using
> UBOOT_CONFIG. Since we cannot determine on which u-boot config the
> menuconfig should run, the patch limits when UBOOT_CONFIG is not
> defined.
> 
> Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>

Reviewed-by: Tom Rini <trini@konsulko.com>

-- 
Tom


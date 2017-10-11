Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 204296067D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 14:29:47 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id y45so2645638qty.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 07:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=avt2ZfYZPff9V2jvQyZpfBlhXew2fCJ4Fq/y1aVy4dY=;
	b=i5NP+sSrsNxz7RsTrqZDuDRPlueD3YVyQqi2CrzPDN+6oo1sDfSdFJxz/N4fVSSTXK
	jJ1awez3prZH9d/DxjH9q2vW3nPm7cewzvfIPadIGAYZ1STLtcgp60TwratdhJZ9DGL4
	45peysN06v+MC0YR20y7spjHXGfmt3axocqYj+cYbFJcgnV6a4UbBKiA4XeVObZR0Xgc
	b915foIndZZ4WdYJRbm5anWNxYHewGZ/8lMrjxRiCIZZkl1x9w186QUrt6rx9kVMvpEr
	BM+SsX5WFev+J+BJXZ1oqGhjVYGYyDNfCVFYtgWzPFj3PLc14YsG6MbV1NbKZ2NyDO8s
	dFhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=avt2ZfYZPff9V2jvQyZpfBlhXew2fCJ4Fq/y1aVy4dY=;
	b=O/ZfgjtIQ1/zdePz2x1DA9pgeDwvQlhhv1uXMzisQFeJweaE2yjTeHdPIysOvzowW/
	WD396jpA2zKrp+tSgJ4LZmxPRqnfls81LexMToaP+mCvpLf9hBaKAViZuY9PIpZuayyL
	8Ai0BgyyL7dltHdnXsGslvhYH+ARQYp41AXRuGbovmZOUPowN6lES7Q1LGhCaH/4vLgo
	MOPgyrMH9qrOanft6FSFVK+XI8iipGCT8Ku6I40QKV8d6DCASvygs9zxBhCJ3diUy8lA
	qWuqpPoYfPkTh33HcZ1HIdNBF4LdqdijDncU90cMDhGQdpWtzBC+X+zwinDwkNL8EDnx
	RgYA==
X-Gm-Message-State: AMCzsaVJeZFpWRkTsN0mmpslEzJ+FQ/n7GSRS5nJNFfFj0IXXe+laqeh
	h7qjzWXA+pHZ8WL6mAowWFOvcB8S
X-Received: by 10.129.120.17 with SMTP id t17mr4428943ywc.144.1507732188688;
	Wed, 11 Oct 2017 07:29:48 -0700 (PDT)
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com.
	[209.85.218.44]) by smtp.gmail.com with ESMTPSA id
	c74sm7641206ywh.19.2017.10.11.07.29.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Oct 2017 07:29:47 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f44.google.com with SMTP id f66so3375044oib.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 07:29:47 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBcjgx+ky3SKxKNdl1utfOwjlTzo0cP4qLEG1RkSLWD55lnLCer86jbEc4Einmqi+ky79GOGicraRBBxvu7sSw=
X-Received: by 10.202.4.69 with SMTP id 66mr8373757oie.409.1507732186964; Wed,
	11 Oct 2017 07:29:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.56.216 with HTTP; Wed, 11 Oct 2017 07:29:46 -0700 (PDT)
In-Reply-To: <20171010122706.6975-1-mikko.ylinen@linux.intel.com>
References: <20171010122706.6975-1-mikko.ylinen@linux.intel.com>
Date: Wed, 11 Oct 2017 11:29:46 -0300
X-Gmail-Original-Message-ID: <CAP9ODKp7DA_jTo0GnM6Z+Zos=tGnvvAzPg0E29U1Vkdrs4ZTZA@mail.gmail.com>
Message-ID: <CAP9ODKp7DA_jTo0GnM6Z+Zos=tGnvvAzPg0E29U1Vkdrs4ZTZA@mail.gmail.com>
To: Mikko Ylinen <mikko.ylinen@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-firmware: make i.MX SDMA split complete
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
X-List-Received-Date: Wed, 11 Oct 2017 14:29:48 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Mikko,

On Tue, Oct 10, 2017 at 9:27 AM, Mikko Ylinen
<mikko.ylinen@linux.intel.com> wrote:
> The commit to split i.MX SDMA firmware blobs in their
> own packages was not complete and results in a failure
> when trying to install full linux-firmware:
>
>  * Solver encountered 1 problem(s):
>  * Problem 1/1:
>  *   - nothing provides linux-firmware-imx-sdma-license needed
>  *     by linux-firmware-1:0.0+git0+a61ac5cf83-r0.all
>  *
>  * Solution 1:
>  *   - do not ask to install a package providing linux-firmware
>
> Make the split complete by installing the license in
> ${PN}-imx-sdma-license and have the blob packages depend on it.
>
> Signed-off-by: Mikko Ylinen <mikko.ylinen@linux.intel.com>

First, thanks for fixing my mistake ... I will try to find what I did
wrong here as I did test it.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


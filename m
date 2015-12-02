Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id ADFD160589
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 12:56:55 +0000 (UTC)
Received: by pacdm15 with SMTP id dm15so40339873pac.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Dec 2015 04:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=sIrtFQR7vze+DQJq8+JTuHCiG/porf/mnzK6r0mm7dM=;
	b=vkHOFybeMBxkPqFHZZ+aMAcw3PKPUP8qOnLmBa2JtpcNMyTkJPMlRJJIJ1WOCPKmb0
	0JjZuIXCOuifMrAU88fF1R4p7gyWcg0eg++jQYjtqS/WNnGWVUhlH75MsDCFPezZ+C1/
	NPQPp3FPsznGkPWgvRrQkJLGPS4Y0czK1pQOGJgCzYHIIeJxJdv2roLwkxtoJqfVwlx6
	CG5gOQwYS0sv/GvRj5sD+Xz0F7FBjIOeJDu5WV4Q0Jzq78I/5nNWxKmAPV1sWrjqR8Lt
	CSrFDrjhZ0EVH55k4PasZiudxbjqKtnAdYZR+45Q2TOeV4UEmo4b69VpXoRzCSenMlpU
	//YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=sIrtFQR7vze+DQJq8+JTuHCiG/porf/mnzK6r0mm7dM=;
	b=Xyl9pw3S2617d20tXLoewjY4JLv23POK9o8brLasMplt0C4HcEa1hjT0l9RAzpKVfI
	//t78ecmpxL1pIeGexZuNV4r2+lnQVTjFXbirWWg0IB1ypH0+B4fHG/2fT0N6Wv2HJZJ
	WHuU5wORejodmPZLCxHLxXk5yCujYIyMNNfa7lkncskXh6At0PEpdwplVUc68P//eTIP
	Gk23o/HvrGY3wEPhM8+vtP+0rHe+mA/VXK+ed06zbOz1kvV6eB2anvdlVH1LxwTRXNpC
	raG7INnpHfQtm0c/zsKcTDPlu/NTkfHU/DidyFB98B2Lq0FY7NNksYeXwsfiC5Ey1wMi
	AWEQ==
X-Gm-Message-State: ALoCoQkKvEDd6myWLpg/OciQdyHpjMLDvVJ6Vs5UVpSB5yLTjZgDxGbldQcNbQXRfkbIck5R8eGp
X-Received: by 10.98.74.26 with SMTP id x26mr4301620pfa.15.1449061016598;
	Wed, 02 Dec 2015 04:56:56 -0800 (PST)
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com.
	[209.85.220.49])
	by smtp.gmail.com with ESMTPSA id w8sm4350659pfi.41.2015.12.02.04.56.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Dec 2015 04:56:54 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pacej9 with SMTP id ej9so40491163pac.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Dec 2015 04:56:54 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.66.124.135 with SMTP id mi7mr4361602pab.102.1449061014406;
	Wed, 02 Dec 2015 04:56:54 -0800 (PST)
Received: by 10.66.197.129 with HTTP; Wed, 2 Dec 2015 04:56:54 -0800 (PST)
In-Reply-To: <1449042969-24132-1-git-send-email-maxin.john@intel.com>
References: <1449042969-24132-1-git-send-email-maxin.john@intel.com>
Date: Wed, 2 Dec 2015 10:56:54 -0200
X-Gmail-Original-Message-ID: <CAP9ODKopbd5EhoyWnjg_Luj_ySB-ufSMXiH1wikOTuMD12aK8g@mail.gmail.com>
Message-ID: <CAP9ODKopbd5EhoyWnjg_Luj_ySB-ufSMXiH1wikOTuMD12aK8g@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] libjpeg: Replace libjpeg with libjpeg-turbo
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
X-List-Received-Date: Wed, 02 Dec 2015 12:56:59 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 2, 2015 at 5:56 AM, Maxin B. John <maxin.john@intel.com> wrote:
> Moving libjpeg-turbo from meta-oe as a replacement for libjpeg
> package. libjpeg-turbo has same API/ABI as libjpeg. It is
> relatively faster in JPEG compression/decompression than libjpeg.
>
> Changes in v2:
> a) Squash the two libjpeg related commits into one
>
> Changes in v3:
> a) Use libjpeg-turbo version 1.4.2
> b) Build libjpeg-turbo with libjpeg v6b ABI which is commonly used
> by other major distributions.
>
> [YOCTO #8628]
>
> Signed-off-by: Maxin B. John <maxin.john@intel.com>

Please move the Changes out of the commit log; you should send it
adding it after --- so it is not applied.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


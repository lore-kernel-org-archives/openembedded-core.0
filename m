Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 37DD26067D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 14:10:54 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id x130so9104442vkc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 07:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=3Q0Ovd0QVFNrULsDE6ufr+csvNqGD/TIBoyWOgITfKc=;
	b=fhl7xCk5X69sjcXGIauLMc51qlC6WbrsGwMG//e49CyNzQ2RI67uMKRNTK5BHOgv5x
	XYlp9MTqhSgcmX1TWXJLYq055901MoZqgCO7Tju4dkCS62UI9kPju1e+i95wFxeWZ46E
	DCxej5qwxteXqFarZxX6VS+HHUBprvDlkvaiv20M1FQs7LzYV9JMeyG9PLy//TUpNlod
	HPeMWf/ByZEJA08ylZbQpWpdFl7gHU02l4Np/PIR0idkX+i6E+9kD/iWBD4RPHCed8A8
	pHfsrFWFIr8FkeoBCiu96lzwEGMzXos8kzpqrYCIwFhaAQBQvXlT/4cqg764q4uIPPBA
	lL2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=3Q0Ovd0QVFNrULsDE6ufr+csvNqGD/TIBoyWOgITfKc=;
	b=OvsOfVwWYeyRX6SN73Md1iOhnVmHnqLhl0f0kHUuFe76uI0/xgvkRHRIyjucGBD6AV
	twYcMihmZTLfWFYXim7MgbieXOR1pcHOHzaHiB7xbmUsvkMTchLOnUDXywtdAr6zFSGj
	3tUxS066FfmpJ0OyFZ/1PCX+oXBUuics5Kjwb3pUSZM0GAtebxB4OM/YipUQWtC3PqAI
	6mfivLOr23B+vXK2KJBprefdU5tsDupqy84S2QoMgnsh84ogBoOXYsEUQB9mzszCZ3vM
	bYsbYEBHEyqPImZ2ORO0j5NJR9uOkEhvtzbS+IOuanRW3nVSnLR43+w8fuPSiIJm3gV+
	Psng==
X-Gm-Message-State: AEkoout3iZg0cFa8QZxCztjO8BePeNBeuoNJQN3dhJv26AgtmSlpoFAHQBHGIssN17VEYA==
X-Received: by 10.176.64.194 with SMTP id i60mr1919066uad.98.1469196654855;
	Fri, 22 Jul 2016 07:10:54 -0700 (PDT)
Received: from mail-vk0-f47.google.com (mail-vk0-f47.google.com.
	[209.85.213.47]) by smtp.gmail.com with ESMTPSA id
	s124sm2173015vka.15.2016.07.22.07.10.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jul 2016 07:10:53 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f47.google.com with SMTP id n129so113134999vke.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 07:10:53 -0700 (PDT)
X-Received: by 10.159.35.143 with SMTP id 15mr2014252uao.39.1469196653444;
	Fri, 22 Jul 2016 07:10:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.138.78 with HTTP; Fri, 22 Jul 2016 07:10:52 -0700 (PDT)
In-Reply-To: <20160715163633.6854-1-eu@felipetonello.com>
References: <20160715163633.6854-1-eu@felipetonello.com>
Date: Fri, 22 Jul 2016 11:10:52 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoOyQiXa8qPBBi4Vk7LLnbCOzt1G=oWx_S4pmrCGOcnFA@mail.gmail.com>
Message-ID: <CAP9ODKoOyQiXa8qPBBi4Vk7LLnbCOzt1G=oWx_S4pmrCGOcnFA@mail.gmail.com>
To: "Felipe F. Tonello" <eu@felipetonello.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] JUCE Framework support for OE
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
X-List-Received-Date: Fri, 22 Jul 2016 14:10:55 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 15, 2016 at 1:36 PM, Felipe F. Tonello <eu@felipetonello.com> wrote:
> This patchset contains the needed infrastructure needed in order to easily
> support JUCE applications on OpenEmbedded.
>
> For more information about JUCE, check the patch #2.

Meta-OE please.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


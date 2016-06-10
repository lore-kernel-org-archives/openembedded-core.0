Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 02E4B6E668
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 13:48:45 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id t7so11278161vkf.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 06:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=fpPOfp7EWobvLTGpwnFvWXM+z1iWFSkBAX9RVVvUONk=;
	b=ceIhMDze/FTUvsKkswX29M2h8smn8zLF3X7FloqMxzI0YkptM5Oq9C2GdQqqh5+THO
	9Xf+kyj9W7QWlA1//GqhX/eDMbGGdCclEPvug3kDKSZhENb3v72el1x6eKlKZWsQ9P3D
	xUKPuvD309SftKk0BhW0JauIgMHguIzh3cEltn1hoMIMFj6zAx7sQDyE82qQ8KupHKAU
	gW2c9rT82i3gidFEg1dKNiRWpWK9Yq1uq+mcpCr75Nl7SeRjaiDH2aqz7z6Z1uVJWDE9
	gG7HvYE90JUuwrYPrSoSPA8bBuMzLpy0ct1hmwuuM2unCGHjKiosE4kb1KNtSkzk45Hm
	f0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=fpPOfp7EWobvLTGpwnFvWXM+z1iWFSkBAX9RVVvUONk=;
	b=kHy5/LCal1G1Q3n1HZ4TEQvk4U0DVwBk5nKYG8atz9nQWzDc6w2uuauov7QKy/Zqtv
	+KJV0PUZpKE1xh4L4n5LIoK/f+7JfXoGGyU6iZaP9BA8HQqoFTQJUqNPfLd7NnYL0THa
	MhS5koMPaWMwfM/eH1gnrtlN8MVOT/XDbZ1u0xiwcKP1HvXuOS3jNNV/lOWsg+QbdVlM
	YTX+/6bWMVPfthE+nIPXeTtsXCG9DNdCMz9gV9duNCB4wQWYYo6GplmCKFWzgKfD/AGC
	MmJQyxTg5DpCd/pxLZIocG/4IGb5AYXMONAf6V26rjkxuQ1Ny/HnexDAz/oeDSN5is1p
	0BTA==
X-Gm-Message-State: ALyK8tJlVnLcTgv+geTy1VO8LRAzCobGXvrcQ00AtXZicOHl1o8Zsn3r6deDkAA75QI7pA==
X-Received: by 10.31.61.86 with SMTP id k83mr857014vka.66.1465566526224;
	Fri, 10 Jun 2016 06:48:46 -0700 (PDT)
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com.
	[209.85.213.48])
	by smtp.gmail.com with ESMTPSA id x9sm1838296vkx.27.2016.06.10.06.48.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Jun 2016 06:48:44 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f48.google.com with SMTP id e4so98059373vkb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 06:48:44 -0700 (PDT)
X-Received: by 10.31.163.140 with SMTP id m134mr876526vke.72.1465566524422;
	Fri, 10 Jun 2016 06:48:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.189.21 with HTTP; Fri, 10 Jun 2016 06:48:43 -0700 (PDT)
In-Reply-To: <1465500426-27684-2-git-send-email-tom.hochstein@nxp.com>
References: <1465500426-27684-1-git-send-email-tom.hochstein@nxp.com>
	<1465500426-27684-2-git-send-email-tom.hochstein@nxp.com>
Date: Fri, 10 Jun 2016 10:48:43 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrewK9N4Zw5HFJKxE5jzB+4j6Ji26H6TdxG4TEhge=hZA@mail.gmail.com>
Message-ID: <CAP9ODKrewK9N4Zw5HFJKxE5jzB+4j6Ji26H6TdxG4TEhge=hZA@mail.gmail.com>
To: Tom Hochstein <tom.hochstein@nxp.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] weston-init: Use bitbake path variable
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
X-List-Received-Date: Fri, 10 Jun 2016 13:48:46 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 9, 2016 at 4:27 PM, Tom Hochstein <tom.hochstein@nxp.com> wrote:
> Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>


Acked-by: Otavio Salvador <otavio@ossystems.com.br>



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6C6DF789EB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jul 2018 13:21:08 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id n84-v6so16769085oib.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2018 06:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=s/saVit/t3i6AXp9KPA8U35erqqrtLvxe8/xe5V/tOI=;
	b=zDvaAIjpfHvXEHq3N7mwCb6m1y0a0dmwge5e/wCbwkSl+Kq/cYTxAlfSUXNrLcbhQc
	HVy0NoSq8HUrq+woyOfEy+9eVCv9NF3y3frAwFb4mEGCMmqjiE4CkyeCSdKtjJsXsS/l
	aojd1IyRjjRDsfxynlJiSer3tO3jn1gFMkNq5dTp/LNgYCs1aBIMNym6E29yffa5Rk4k
	PLtxgVo4gQmzzHcVTqNfaV4ATQ/7DD+77JL3g/snlgvJa7fRgHuc4hVL3K6G9OI6Espd
	pMkTV9kWOq0QNKU5L2BbIhZkXjK0qIPYvpqwPJp0z3UIITqgK+A63PdUKbi/7KvCzCy+
	iSiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=s/saVit/t3i6AXp9KPA8U35erqqrtLvxe8/xe5V/tOI=;
	b=GqmQPnP0jwwgrfB5abDl56+4HOHvqG3PMgzTYSWhtcOeOLiq91zxup6K9eGDyCq8Ax
	A4wnZjG85AYqpCmx88OSQ9zQav/BHBIM8KllPQeGXIesPc8oxFpxQEr4YghbA37X1Yrt
	a01rAXfnBKZG+IcfUoGyB3SgOhP02E5FO5UDzQPcjaPw38UuqfObay0MNvUxrDUDWfY2
	0lvGCcUG3ejI1ULQLFL1YgErGw0tFz7Q5YVj05hwklDxBAr38PezEp/1IHo/eOncXUaK
	RWS40vs3E9Y7tgbs6rR9uSYOTrQ+gq9GzGEph7GveHBbbZnuopNPKcZmfF8XHJW6cefm
	BmxQ==
X-Gm-Message-State: APt69E1H7Yu00x72NDnZnQLCACQYhPeD5YKGJhlvSJ4VGDw5F9beiFyf
	L7A236ehXCyp6UsbV7a4km0Bl5mj
X-Google-Smtp-Source: AAOMgpfepEI8KaXocqJQaOHCfqvnqQrN6B4KepW2qqs659/LPuYayVWqrx0g82Vjam8mksBGNYo7Qg==
X-Received: by 2002:aca:698c:: with SMTP id
	e134-v6mr7308803oic.302.1530796868920; 
	Thu, 05 Jul 2018 06:21:08 -0700 (PDT)
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com.
	[209.85.218.50]) by smtp.gmail.com with ESMTPSA id
	4-v6sm3889599oif.34.2018.07.05.06.21.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Jul 2018 06:21:07 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f50.google.com with SMTP id d189-v6so16787315oib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2018 06:21:07 -0700 (PDT)
X-Received: by 2002:aca:eb0d:: with SMTP id
	j13-v6mr7115163oih.304.1530796867242; 
	Thu, 05 Jul 2018 06:21:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:58c5:0:0:0:0:0 with HTTP;
	Thu, 5 Jul 2018 06:21:06 -0700 (PDT)
In-Reply-To: <20180705104501.4166-1-ross.burton@intel.com>
References: <20180705104501.4166-1-ross.burton@intel.com>
Date: Thu, 5 Jul 2018 10:21:06 -0300
X-Gmail-Original-Message-ID: <CAP9ODKowfBC_p=XsqBaVkFDbBxQfXEL1Kr097wcuC5dMzJHJHA@mail.gmail.com>
Message-ID: <CAP9ODKowfBC_p=XsqBaVkFDbBxQfXEL1Kr097wcuC5dMzJHJHA@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: patch cleanup
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
X-List-Received-Date: Thu, 05 Jul 2018 13:21:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 5, 2018 at 7:45 AM, Ross Burton <ross.burton@intel.com> wrote:
> 0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch was fixed a
> different way upstream so remove.
>
> 0007-dri-i965-Add-missing-time.h-include.patch is now accepted upstream so mark
> as backport.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750


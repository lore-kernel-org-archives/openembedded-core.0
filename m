Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3FDE177805
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 15:12:07 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id m84so6011045ita.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jul 2017 08:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=qqxqpXa7KmvBEsQGmNmkHbyIOpijWCo4Bp0A31pOEpQ=;
	b=f0uZzSME22jiDTY74HCGZH0z6e8JoXfZqbdCT2kKDgcQr2qT14pOyxcrgEOBTJk16W
	xX2bQehdL9TJsqwJlvhma4s6oZI3NMF70mbJDzmHdEK+y4hAOfabld2Ji+0ut6ZjUkZ8
	wPD0P0SWcpGwm7U41CjkDoZv8HuC8QG6nVasbYVQwVL2rL0ZXTF5RDrIf7PwO7tGjld+
	3PPzQegs6XsOi2nBb/Y2Nl14kPIVnnwQP6NIvwrL5hyfODx5vRpzOv7D57CIjraJ6qWJ
	E/bGpBtQsYBW8NBophK8pIjwcbjLvzthS4sFxePNHggFiYkDUap0aGmkRpL0DCUt7/uX
	nZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=qqxqpXa7KmvBEsQGmNmkHbyIOpijWCo4Bp0A31pOEpQ=;
	b=nr7zB5f1jm0jDn850xIbgPRNrX/il87txPtVJOk6IwLA9PmCYAwMboj0eFIWTfoAip
	pv4VSC5DGSiaMcoEw/4VQmyTaiHjzIucT/zb4tVtc82q0XogtySKG6EliJzquFhbV5AZ
	wWhp+f6z5cQfDTkT7QcWfiHmg0CnRmAsGzxqIwajOFQ5GTTvJ9BZNdiYn5mYZAk0lDg2
	vgm+pr5eS1qf0eIHEIuEdgT9Xla5kImpwZSEdYxfZb/0U3iDGb8Z8T6j8cgDgi6nxtUN
	3iFDsIUscRpPPcnP9ETtdU4WoBhGqGCiZAtpZ1vnmMaAT9g0nNJEeN5yBjhvvvituvyj
	z64Q==
X-Gm-Message-State: AKS2vOxPgCA6m4Tgrd4Utd4s7GbRV3mQWQZCSZf0ZADIvAjYoa/c28Ot
	A7El4mJdAhMfsZ6P
X-Received: by 10.36.200.5 with SMTP id w5mr46323027itf.118.1499353929004;
	Thu, 06 Jul 2017 08:12:09 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8ECEE.dip0.t-ipconnect.de. [93.232.236.238])
	by smtp.gmail.com with ESMTPSA id 16sm251901itm.14.2017.07.06.08.12.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jul 2017 08:12:07 -0700 (PDT)
Message-ID: <1499353925.5278.21.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: "Maxin B. John" <maxin.john@intel.com>
Date: Thu, 06 Jul 2017 17:12:05 +0200
In-Reply-To: <1497280222-11549-2-git-send-email-maxin.john@intel.com>
References: <1497280222-11549-1-git-send-email-maxin.john@intel.com>
	<1497280222-11549-2-git-send-email-maxin.john@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] systemd: enable resolved and networkd
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
X-List-Received-Date: Thu, 06 Jul 2017 15:12:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-06-12 at 18:10 +0300, Maxin B. John wrote:
> Enable systemd-resolved and systemd-networkd by default.
> Make it co-exist with connman and  Fix associated problems
> in read-only rootfs.
> 
> Fixes [YOCTO #11331]

Let me come back to this, because I think it is not quite working as
intended yet.

The goal is that the "right" resolver is chosen via alternative
priorities, right? So during build time, we set /etc/resolv.conf to what
is the desired resolver.

However, there's still a L+ entry for /etc/resolv.conf
in /usr/lib/tmpfiles.d/connman_resolvconf.conf:

L+	/etc/resolv.conf	- - - -	/var/run/connman/resolv.conf

As a result, when systemd is used and the rootfs is read/write, then
systemd overwrites /etc/resolv.conf, leading to:

# ls -l /etc/resolv.conf 
lrwxrwxrwx    1 root     root            28 Jul  6 14:44 /etc/resolv.conf -> /var/run/connman/resolv.conf

That happens even if systemd-resolved has a higher priority and should
be used.

Maxin, do you agree? Can you finish this work and patch the ConnMan
recipe so that it behaves as expected?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.





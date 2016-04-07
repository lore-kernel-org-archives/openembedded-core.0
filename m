Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id C1583731D6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Apr 2016 12:27:16 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id e128so55040894pfe.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Apr 2016 05:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=nFCqkqvTq72vSZX2ETDK7PtCwRJhYuEUvrD48VNR/3o=;
	b=ppT/O91MLBvKNDaVXbr/Qb9j1748lBipwOLzexSNYD8vNbEN4KBjHJD5aNVeE636CQ
	U+1DptoVY75WPqPCLjBF+82OegidFvw6qk4vz1v23jEIiZI2azSmLOd4a8P7jD8v8AA4
	NzQJMdURZxKNNhhJwzYU4Z7zB/lIUqaxJBMk+4p+iUBjTcFkbfpXX6zIUr6uJ+soyXs4
	KKDSH3rlWZPiAVwTaxjGyj0SeJFOlx8v1rLEAavO+cmt9fIYBnjKI5EcT1ncoW08bCeV
	h9esFg4qxYoQTTnp6Gy6pDyGz4GOVZcSKppJCDQxaDasSsGiS7Y7GnKgP1fUXOWECBLq
	MKxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=nFCqkqvTq72vSZX2ETDK7PtCwRJhYuEUvrD48VNR/3o=;
	b=dNxNtz0udVFd+FuhhEr5/xrFUbdwFYLIkWIDeplXYZJ/KtUl9GtM3PxWBiix1/Ah1g
	2rNyP80X3z92gSL2Ewq+kejnKkBms+QvnpgRiCd6596wUhxfpNX5wss6DqvUDHvHu0IK
	BX9/fcvTJhjjcTxS9PwFwaokG1EfJndker0ke/LO0SQcl6K+ln+b0TmvQfilzn88pGWc
	jLKCa0RoY9l0W1tqVQ9Rd4AehNHa7m6XheBdS/wuyZvAszrgbi/A4l+zKuLBZFn1JR7k
	LL38br144scMWBJZKwIFYgFTeCVt4P6cSAG+rdDIi9YF01YkIREGwjlmuWRjKvRP65lO
	ZlPA==
X-Gm-Message-State: AD7BkJIxVaO9naD35d7IqgRHuPdTb0p5xabdvV4gFlX6GrJ8RfJlT2Gzw50DceIUqsMbxQ==
X-Received: by 10.98.13.130 with SMTP id 2mr4410317pfn.97.1460032037163;
	Thu, 07 Apr 2016 05:27:17 -0700 (PDT)
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com.
	[209.85.192.182]) by smtp.gmail.com with ESMTPSA id
	85sm12027570pfl.18.2016.04.07.05.27.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Apr 2016 05:27:15 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f182.google.com with SMTP id n1so55090917pfn.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Apr 2016 05:27:15 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.98.31.218 with SMTP id l87mr4427125pfj.101.1460032035340;
	Thu, 07 Apr 2016 05:27:15 -0700 (PDT)
Received: by 10.67.3.163 with HTTP; Thu, 7 Apr 2016 05:27:15 -0700 (PDT)
In-Reply-To: <1460029784-11035-1-git-send-email-jussi.kukkonen@intel.com>
References: <1459950176-29324-1-git-send-email-jussi.kukkonen@intel.com>
	<1460029784-11035-1-git-send-email-jussi.kukkonen@intel.com>
Date: Thu, 7 Apr 2016 09:27:15 -0300
X-Gmail-Original-Message-ID: <CAP9ODKptwkB5XXdLoVg2qypjvhs=nUFtzdobkim0LPU3wfFFrA@mail.gmail.com>
Message-ID: <CAP9ODKptwkB5XXdLoVg2qypjvhs=nUFtzdobkim0LPU3wfFFrA@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] x11-common: Add PACKAGECONFIG for screen blanking
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
X-List-Received-Date: Thu, 07 Apr 2016 12:27:17 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 7, 2016 at 8:49 AM, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
> when "blank" is not in PACKAGECONFIG, explicitly set dpms and
> screensaver off. The intention here is to make it easier to
> create builds that should not blank the screen (just remove
> "blank" from x11-common PACKAGECONFIG).
>
> Also remove a unneeded "find -exec rm" from do_install.
>
> Partly fixes [YOCTO #7278].
>
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


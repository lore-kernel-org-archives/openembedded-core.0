Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id 58AF86AC37
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Apr 2017 17:52:37 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id b187so135225883oif.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Apr 2017 10:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=ir7s7t6Eu+p/etWI3AItc5aR3u3RNVYlQfVNXBLSCZQ=;
	b=KuslLRuGWsg4kvXKmVrUgaGiM+4KdnYLRnwoyxhNKWMmOp/GSIIaWa7h5P9dFrU0E0
	3UuaFw7UbDjfjIJdOsQU9tBPD57+QcyqG78mC8AowGRFu8XjKO4YaAw0AkjSOVYzf8JB
	U7Wqbk43KB/7PDQ/DEzd8FtN5OKbeZIC0/txJS+rH74Gcf/R2QgV/6x5fvDvyshDhfeL
	4LgqSDb84FEPy3u9HlAFMv5nwwdDhORHw80SZM51fqeQu65CAHHfbenbXjpJTp5c2COo
	qGPV6PJojyvxY6pb0rqeHAevFUxoyNtp5rXW9RTof/kiJulQU+shDnSerR5LbmVu/eAl
	zq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=ir7s7t6Eu+p/etWI3AItc5aR3u3RNVYlQfVNXBLSCZQ=;
	b=lmZVfIzEs0b2sbHfKYwOUtoYCHQKMST1JjfVd6IvBlZVMSYHTVpd/B/IgWRwW3JEPv
	gO9F/na1pilhRo2lkf9SCWlOuaTTSnRKHYyesJuFPV9OmtGArlKFhY9UXEvRULXTS4gL
	ZbAbMBL/7BE8Uw8tTNovVFFZtYTiy7P0PsAQZeHV7PRZD3LmUauY+S8Z+uSIIxvBBWTr
	TAL3R+NYBjgsfb2wKPPOpVwuCtR7Si30OBvKeogltWhQwbwxWE3Ivj6mEV3dvVeJdWv1
	M4dxbC8is1CpP/tq+5C9K326ix43CJ12Wxm1fxVAJEmT1CvfO9/A57NMjHx+luvsZuGd
	OWTg==
X-Gm-Message-State: AFeK/H3qbgUBCh+HpWTJR/tLKHr6D5aGIrdCDbaXZdYoY764izfH4f/SZJgGQBEn+b2v3A==
X-Received: by 10.157.40.69 with SMTP id h5mr5445149otd.12.1491241958979;
	Mon, 03 Apr 2017 10:52:38 -0700 (PDT)
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com.
	[209.85.218.44]) by smtp.gmail.com with ESMTPSA id
	r195sm7087893oie.15.2017.04.03.10.52.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Apr 2017 10:52:38 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f44.google.com with SMTP id f193so135224167oib.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Apr 2017 10:52:37 -0700 (PDT)
X-Received: by 10.157.16.1 with SMTP id h1mr7821375ote.205.1491241957378; Mon,
	03 Apr 2017 10:52:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.74.79.203 with HTTP; Mon, 3 Apr 2017 10:52:36 -0700 (PDT)
In-Reply-To: <20170403071346.9980-1-romain.perier@collabora.com>
References: <20170403071346.9980-1-romain.perier@collabora.com>
Date: Mon, 3 Apr 2017 14:52:36 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqCCDTvJMEhCPBUira9xE59VDpwWd7uXDEycCrL9ffF_Q@mail.gmail.com>
Message-ID: <CAP9ODKqCCDTvJMEhCPBUira9xE59VDpwWd7uXDEycCrL9ffF_Q@mail.gmail.com>
To: Romain Perier <romain.perier@collabora.com>
Cc: yocto <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] busybox: make SYSLOGD optionnal
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
X-List-Received-Date: Mon, 03 Apr 2017 17:52:38 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 3, 2017 at 4:13 AM, Romain Perier
<romain.perier@collabora.com> wrote:
> Some distros might choose another syslogd provider like rsyslogd.
> update-alternative will update the link from syslogd to the right
> provider. However the syslogd feature is still present and enabled
> in busybox.
>
> This commit adds a new configuration fragment to make syslogd
> optionnal in busybox.
>
> Signed-off-by: Romain Perier <romain.perier@collabora.com>
> ---


Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f172.google.com (mail-yw0-f172.google.com
	[209.85.161.172])
	by mail.openembedded.org (Postfix) with ESMTP id 04CDF77D08
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 18:04:05 +0000 (UTC)
Received: by mail-yw0-f172.google.com with SMTP id r85so7656962ywg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 11:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=jG+OiChoO2JMYuAd6mlxwqBke6RVbVZp9PNn7MoQpOc=;
	b=q2jjHUrrg5yGU2q6/BZC2NRp+vkoG2g7mh3kpWD8JOTCs5ptzdglE73Kl05m5j1YwD
	qdi+F2JrBNttPcZFPvhr5W1+hjtz5UE5Ahjr6oH28ZGCfKk4WJ6wTpDTOB+MN+y+xie9
	7TXn2qaNyDpn1v4yLs4bvl0u/aNApHdI4OcX0QxlRPoYWJUFai8L1s+Uiz6wCcU956GM
	D3xWkD08zapn/Uh55i/JlJvlGI+7pjkbPpaM9RgZBX+ArEPYO+7emtfAfpGPBY6a6dOF
	pZynGDUxTQeKUmhjSMsneCKsniouTnjAreSUQwQlV1+7oasQWgnciFlOGYZqsor5fifL
	hGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=jG+OiChoO2JMYuAd6mlxwqBke6RVbVZp9PNn7MoQpOc=;
	b=ERXkVvCsN60Mg7oAqo+dcScH3GelV8mKDdk03RKPSlb/ahAFbVQ9oo9h4dUOOJzjw3
	IdAOviYq0/NHXZ7K8VExPVtwb2Zm+94Dyi639AhkcuPpudi9IpMM0gwTNSNC51HFdvL8
	Lyf6mUzjXpL9WA1r4qr1h3nETSOX+qYImAyXO6n9udc7JMq27EnBtJCY0gVtZEbVvUn5
	WmwTl8jXlpP+OgnC5SAEdrGThSAgMUIOHLEB/0NWlNPftRc0MjKSW0opMdMzvpl/4DK5
	XJ6u53MCmMtX6SDl5rSUJiWquzlVVNQ3Z4CmnyWU+P4a0RWIwf+qdT9L1Ruhzj9dL51x
	DYdg==
X-Gm-Message-State: AHPjjUiixoDZBy31mu/a9uLqOEtPFKeEV67Mj4BKazNLrX+PaWkCNJOM
	kWQ9J1bkDtq7V/ZipDUujgE58yhs
X-Received: by 10.129.222.10 with SMTP id k10mr6680947ywj.426.1506449046986;
	Tue, 26 Sep 2017 11:04:06 -0700 (PDT)
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com.
	[209.85.218.44]) by smtp.gmail.com with ESMTPSA id
	o126sm2345352ywb.8.2017.09.26.11.04.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Sep 2017 11:04:05 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f44.google.com with SMTP id w65so13131460oia.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 11:04:05 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QB8dQW3vk05SnOZQlDg3uq0IetHnh08fuFsLfBbLQeAqHJyiBfYv57tFg7UtDXHp8HijpCQA9XGn1/oMO+aCQE=
X-Received: by 10.157.22.245 with SMTP id s50mr2826394ots.364.1506449044698;
	Tue, 26 Sep 2017 11:04:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.66.149 with HTTP; Tue, 26 Sep 2017 11:04:04 -0700 (PDT)
In-Reply-To: <CAJTo0LYMQ9NAvK+zNegmtbPQnPao1rx6wQM1q48TRP6FDUopHg@mail.gmail.com>
References: <20170922110243.10454-1-fabien.lahoudere@collabora.co.uk>
	<20170922110243.10454-2-fabien.lahoudere@collabora.co.uk>
	<CAJTo0LYMQ9NAvK+zNegmtbPQnPao1rx6wQM1q48TRP6FDUopHg@mail.gmail.com>
Date: Tue, 26 Sep 2017 15:04:04 -0300
X-Gmail-Original-Message-ID: <CAP9ODKp6tsZd34jS1QzDnEpi=0ALSs8GaHFPC9iVO-5wjkUD7A@mail.gmail.com>
Message-ID: <CAP9ODKp6tsZd34jS1QzDnEpi=0ALSs8GaHFPC9iVO-5wjkUD7A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/4] wayland-protocols: Fix installation patch issue
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
X-List-Received-Date: Tue, 26 Sep 2017 18:04:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 26, 2017 at 12:29 PM, Burton, Ross <ross.burton@intel.com> wrote:
> Does this depend on the upgrades, or should it work standalone?

This works standalone. I've been using it.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


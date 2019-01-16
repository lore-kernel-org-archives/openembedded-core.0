Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f43.google.com (mail-yw1-f43.google.com
	[209.85.161.43])
	by mail.openembedded.org (Postfix) with ESMTP id DA874605BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 12:00:54 +0000 (UTC)
Received: by mail-yw1-f43.google.com with SMTP id n21so2345773ywd.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 04:00:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=jBe6282wQUiSJwv4J1hFxSbfLFjLmV4acDJDzTMy9+s=;
	b=Mpgd4v4Gh5k+KprVCTN2CeTJcElDu+PkvdJXXvtYs3t8br7WSDNhe1Pualnrp1sfc4
	11e36/yunRAAFlOyz7O3CS5abbnyFe7Om0qMJ41nZVe3Y4iZ8fLPOeE2wMT/UDI3lenW
	f3vFWqJVXIiG+H6bukA8AcQ9fUrIpHTEmTW0B4sT89ylNfEtKQvuRdjzOgQop/C2yVFI
	qHGvrGcc1tRooyJgd3n9GZ3xbDpiE9SBo6ArmNo/ZrZYRplsbmoLFSD5DcCcF5B8bh4O
	4ebyGK0EjESd4/4ZqtwUkHLCg9S8zi8fRjNvHJEi/JjkrzEiPmVSjve0jQM1p5iR0FVm
	GvPw==
X-Gm-Message-State: AJcUukd2f8l39jXQhIOZmauMEtQCV9xvapdNfvEKis5C7sOK0nTKrmVk
	pZBnUot9GcpMhi6k/4tRgBiNA7eK
X-Google-Smtp-Source: ALg8bN7nM86Fz1ig3kKYYcuj9JdY1WknpI+KVWl7N1jEyFcp7RXUZ/aErdINASgDiLoOXYRSLpkH/w==
X-Received: by 2002:a81:3247:: with SMTP id y68mr6975732ywy.328.1547640055505; 
	Wed, 16 Jan 2019 04:00:55 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	o124sm2169655ywe.75.2019.01.16.04.00.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Jan 2019 04:00:54 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jan 2019 12:00:36 +0000
Message-Id: <20190116120051.12182-1-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190114125632.4780-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v3 00/12] util-linux: one package per binary
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
X-List-Received-Date: Wed, 16 Jan 2019 12:00:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

v3:
* update 12/15 util-linux: simplify meta-package RDEPENDS / RRECOMMENDS
  commit message
* replace patch
    06/15 update-alternatives: allow hooks before renaming files
  with
    06/15 update-alternatives: convert file renames to PACKAGE_PREPROCESS_FUNCS
* update follow-up patches 7 8 9 10 accordingly
  
As per Richard's request / suggestion

[YOCTO #13058]

Cheers,
Andre'




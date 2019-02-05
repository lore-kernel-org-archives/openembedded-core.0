Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
	[209.85.208.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7CDD371BB9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2019 02:32:44 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id x30so1690167edx.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2019 18:32:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=VRuEVv9DEcTxipi/DVjgTANhi1vR1UlYEGL9YGGhOcw=;
	b=q+dJ8k9GTj1vAplP4z3WRNVGZiQ9y5hNO7lFnzH3Sr/x/kxVFeSeuhCEbDeytoGMqt
	0ZNua7W/V/haOzIJmIUDKRZXMtXK+T5BwsPol3EA9ZEtuz+U7zefjfLjwzW+2fi4E8kU
	IqYL2Y7eGyiz4QzRf/q5Qomp45mv4nSY/hlsx4xl1QMmQb7S+JoUrkS5NFIn8yL9/i/S
	hexhOoOtnbP+EQdl4MZaz9DdxvE00JIbhlVrQVKNidmrvw0+Qz0XjmQ3XfYcKEmOCLfJ
	LMDjEwz36GYRMpdhDe92XUnVI+fz0ey9LsS4l5JWEhLLJuUcL9oRW/AjaKGDG4+8JK96
	zX5w==
X-Gm-Message-State: AHQUAuYQRoWey+Zlf+KsTqPKYuUk+S5pkeltjRMkoFSH7pBkgbNZLOax
	WbTbPfgwmJoPPBlS0ORsaZ7pPfPh
X-Google-Smtp-Source: AHgI3IZqe6NeLszwVM0eMI54yIXxCDdkrxsSVAyX1cG1M9qLsu7UrlrgaokWdNpo7KzgemrqY61h+g==
X-Received: by 2002:a50:852b:: with SMTP id 40mr1884043edr.166.1549333964797; 
	Mon, 04 Feb 2019 18:32:44 -0800 (PST)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	d7-v6sm2703682ejd.13.2019.02.04.18.32.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Feb 2019 18:32:43 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2019 02:32:28 +0000
Message-Id: <20190205023241.29707-1-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190114125632.4780-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v6 00/13] util-linux: one package per binary
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
X-List-Received-Date: Tue, 05 Feb 2019 02:32:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

v6:

This version now also builds nativesdk-util-linux fine for me.

* introduce patch 04: util-linux: fix packaging nativesdk-util-linux-lib*
  - this is to fix nativesdk build failures triggered by later patches
* update patch 10: util-linux: simplify meta-package RDEPENDS / RRECOMMENDS
  - make sure to walk each bindir only once, to better
    support nativesdk and usrmerge builds
* update patch 13: util-linux: final cleanup
  - commit message updated

Cheers,
André




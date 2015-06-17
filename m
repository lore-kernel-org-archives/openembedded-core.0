Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 66D7260557
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 16:52:22 +0000 (UTC)
Received: by pdjm12 with SMTP id m12so44134091pdj.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 09:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:message-id:subject:from:to:cc:content-type; 
	bh=EifYh0XotCfRGL80NCX2mEV87xt2o2u2bOfqaZyM9iM=;
	b=ux7vGLdtpJ4tfWn5A7PPxUVyxU8lSuTzj8kvtjvw+4pCEuiph5TYyWP37kFv4t6y+k
	CXham4uSzm5RotRwNb6mJ5eb112DZ/wFrieo/ta97/GixA9Md+sC6B5k6573tQRPzpZy
	GXVANHYjeZ6h3DqCXIQeUNmBBeXoIH/Qb8vrUopqt0BIJJW3Rcc3FVCDxn3ClJsgaJRo
	MmR4NgYbYFJJw/E6OiEEskCV27AnQ6oN9Ac3tb+Wt8TcwRyyKx+ohwzv/5Y3rEM7PQIN
	pp3qIsbVLd+CCUUyRMHMYypeMEoY0nUgTqNTLjPHPkh9cXTno8PqKv469QoKJdhlJ+va
	KELw==
MIME-Version: 1.0
X-Received: by 10.66.141.12 with SMTP id rk12mr12434415pab.97.1434559944135;
	Wed, 17 Jun 2015 09:52:24 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.70.34.109 with HTTP; Wed, 17 Jun 2015 09:52:24 -0700 (PDT)
Date: Wed, 17 Jun 2015 13:52:24 -0300
X-Google-Sender-Auth: VeX5frYTWPru_uDD3_aTltUYYG4
Message-ID: <CAP9ODKos=R6O6XtwYtUL+_KZaJz+WxD0YxGRHU5+Qqs1VOP-9A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: "Lock, Joshua" <joshua.lock@intel.com>,
	Daiane Angolini <daiane.angolini@freescale.com>,
	Randy Krakora <randy.krakora@freescale.com>
Subject: [for-fido] Valgrind fixes backporting
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
X-List-Received-Date: Wed, 17 Jun 2015 16:52:25 -0000
Content-Type: text/plain; charset=UTF-8

Hello folks,

There are two patches which should be backported for fido:

OE-Core: 53afa26655d0b5f75ef2dd6bccef76281a14655c
OE-Core: 2fb0edcb47a14e47780d545f60885b36e71fca71

This fixes the build issues some customers has been experiencing in
Valgrind build.

The issue has been reported by Randy Krakora and Daiane Angolini, both
from Freescale.

Best Regards,

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


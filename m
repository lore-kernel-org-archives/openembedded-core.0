Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 68BFC6ABF7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 03:37:27 +0000 (UTC)
Received: by pdbnk13 with SMTP id nk13so194256488pdb.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Apr 2015 20:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=bAmC0KZqniisZ0dPQrPUiSy+PhxnW/TzH3BLBnDWNOU=;
	b=EbOOSqe+eL82fX5qmwzMN3q1WAyWlTQ4qm14q3gQHACvrlne5eO4Vqgb7jHHvNOyqi
	XbTSmhkSmjKpMjSVvqxPc9KIynBjaSUXtkV7Uejb0NnZZdWQofKoUsdEMImVTTwVpI7G
	bxUc50rBzz2Qfgy7LhzuqUZltQYa/sbPak51a1ggzqtHKVwb2s2zkheToiswwXkYdpKB
	5IDshvpBdFWr6L4dkOGlRlMZBtCKfQPxFpj4CIMxjKcIjlYjH/Lr8aK7rtRXgZmybau7
	N5ht4BQ9rG99gAEZu7Y5ZZDHe4fbgi+DbpUdVkROAT+TVomDUu5nEe/eVpYMcoIgAxWj
	4W8Q==
X-Received: by 10.66.154.162 with SMTP id vp2mr24096590pab.73.1429501048849;
	Sun, 19 Apr 2015 20:37:28 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:8591:8b1b:a4f1:71e4?
	([2601:9:3580:84c:8591:8b1b:a4f1:71e4])
	by mx.google.com with ESMTPSA id iw1sm16501187pbd.8.2015.04.19.20.37.27
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 19 Apr 2015 20:37:28 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <552CA285.9070909@windriver.com>
Date: Sun, 19 Apr 2015 20:37:27 -0700
Message-Id: <E8C21342-58AA-4E1D-9790-7465AFAF6ECF@gmail.com>
References: <552CA285.9070909@windriver.com>
To: Robert Yang <liezhi.yang@windriver.com>
X-Mailer: Apple Mail (2.2098)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: failed to build libunwind when qemuarm64
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
X-List-Received-Date: Mon, 20 Apr 2015 03:37:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Apr 13, 2015, at 10:15 PM, Robert Yang <liezhi.yang@windriver.com> =
wrote:
>=20
> | =
/buildarea/lyang1/test_uni/tmp/sysroots/x86_64-linux/usr/libexec/aarch64-p=
oky-linux/gcc/aarch64-poky-linux/4.9.2/ld: copy reloc against protected =
`_Uaarch64_local_addr_space' is invalid
> | =
/buildarea/lyang1/test_uni/tmp/sysroots/x86_64-linux/usr/libexec/aarch64-p=
oky-linux/gcc/aarch64-poky-linux/4.9.2/ld: failed to set dynamic section =
sizes: Bad value
> | =
/buildarea/lyang1/test_uni/tmp/sysroots/x86_64-linux/usr/libexec/aarch64-p=
oky-linux/gcc/aarch64-poky-linux/4.9.2/ld: copy reloc against protected =
`_Uaarch64_local_addr_space' is invalid
> | =
/buildarea/lyang1/test_uni/tmp/sysroots/x86_64-linux/usr/libexec/aarch64-p=
oky-linux/gcc/aarch64-poky-linux/4.9.2/ld: failed to set dynamic section =
sizes: Bad value
> | collect2: error: ld returned 1 exit status

these copy relocations are probably not supported by ld on aarch64=


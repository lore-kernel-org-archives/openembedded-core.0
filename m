Received: from mail-vb0-f52.google.com ([209.85.212.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1URgXH-0000ko-AN
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 12:21:22 +0200
Received: by mail-vb0-f52.google.com with SMTP id w8so3656003vbf.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 03:03:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=P/hFNYlrzA6EHE62XuQx/rgexLl7ZrNdPjMTY7gJn10=;
	b=mZVRCPXbGrVDZUNsiu+VJRoZWFwo8MTSzKLTBqouGtPLjZkKBM4qruNSrjwGP9CUiW
	ml+9UE/BJutPqqVqqFqIYKdsbSeDKJfGKPUvwMyMvWN6YB9Hu61efSWH1VSurG+ScuNf
	VbGcCBZEXKLh3p/IXyX12wjIIn7j/efQOwiB7zpo1wlKQ1ZJQ4rKaFthaKcrEqhh7Qis
	FEHgALjVBWRjYMXhKKghWcb+ZSYIMa7pAPnVNhP8vOTaauB6BvE16wvYrwR3EmvvqR16
	Zrs2bUSSo4XAZEoPbXQ+aEJZ40f6aw9+hzy8sJWiOiNB+Dy0jfsnwqL6lVT3doastrFI
	Asgw==
X-Received: by 10.58.15.193 with SMTP id z1mr15528146vec.40.1366020230032;
	Mon, 15 Apr 2013 03:03:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Mon, 15 Apr 2013 03:03:28 -0700 (PDT)
In-Reply-To: <1365947722-16267-1-git-send-email-koen@dominion.thruhere.net>
References: <1365947722-16267-1-git-send-email-koen@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Apr 2013 11:03:28 +0100
Message-ID: <CAJTo0LZ7xQbg_5kKyNpir4CL53Xo5EfrhebuzpMMu-+wE1EVzQ@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnm1jQJONDZu5WqmKtb6r96kj0c9UwbbANORBwo7jxlHfmLZ+7BkP24zJtAAA8nOEsGf5SY
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] systemd: remove udev-extraconf from RRECOMMENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Apr 2013 10:21:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 14 April 2013 14:55, Koen Kooi <koen@dominion.thruhere.net> wrote:
> In the original udev and systemd updates these extra conf rules and scrip=
ts where removed and moved to a different recipe to avoid pulling them in b=
y default, making them opt-in. The systemd merge into oe-core regressed thi=
s into making it impossible to opt out of it when using package feeds for u=
pgrades.


If this is a concern then you should do it for udev too, as udev.inc has:

RRECOMMENDS_${PN} +=3D "udev-extraconf usbutils-ids pciutils-ids"

Ross



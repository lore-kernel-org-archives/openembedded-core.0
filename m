Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SS2kb-000403-HV
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 11:00:01 +0200
Received: by werb13 with SMTP id b13so21264wer.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2012 01:50:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=+7CViPe7KLv+yqsb4V6JKLfJeCIgPnUrj2dxiRHEcio=;
	b=A+a+AYfrG62UTFKjfVrrOS7C2T7cFnQteXyrOyDxTgpmP1baInuUne+KmaVbeigUQa
	BSlb/Lj+oUl28JZlUoEvgczzWbKhxy+75nJBd5SNB6P7zoamIr6ZagJFL7EiZUPFaYgm
	Rp2H0bu+SopJch03FEjGhX81NlWN0wm6Pl26uar8nl+oBXqm9RTpx6hp3rNPz+Ig9IpN
	JeE6l5mptWRVBIbe1j8R5pB9dajULvozc9z9aD3ATuOWzAoHcDUegzzXNzXcW8xaajzw
	WJJpvReR9gyO8vs3JKvEFxSTLgPN0KHSsNRWkzk6chkuM0zMPXvxKOFK/lmGBB4YV9Ea
	dixA==
Received: by 10.180.98.137 with SMTP id ei9mr7781067wib.0.1336553408237;
	Wed, 09 May 2012 01:50:08 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id 6sm35184635wiz.1.2012.05.09.01.50.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 May 2012 01:50:07 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <03d9cdca29477f34348a0f97138504441c5804fa.1336547713.git.liezhi.yang@windriver.com>
Date: Wed, 9 May 2012 10:50:03 +0200
Message-Id: <23E51582-C3C4-4673-B646-F29E74FEB428@dominion.thruhere.net>
References: <cover.1336547713.git.liezhi.yang@windriver.com>
	<03d9cdca29477f34348a0f97138504441c5804fa.1336547713.git.liezhi.yang@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmiyUzhVU7Gl4Fb2yRRh9ihugKoybsFm0eG3UxI+v8XZgSL5bhPEiOjzBx1YCq/rzs+zcEo
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 2/2] rootfs_rpm.bbclass: don't remove rpmlib when INC_RPM_IMAGE_GEN=1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 May 2012 09:00:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 9 mei 2012, om 10:20 heeft Robert Yang het volgende geschreven:

> Don't remove rpmlib when INC_RPM_IMAGE_GEN=3D1, otherwise the
> list_installed_packages would get nothing in the second build.

What happens when I do a build, enable INC_RPM_IMAGE_GEN and do another =
build?=



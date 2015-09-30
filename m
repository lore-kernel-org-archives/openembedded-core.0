Return-Path: <armccurdy@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id A7C8075CF1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 22:04:07 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so2949108wic.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 15:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=UBXMKEjKITQ670LcvazS4eCorn6syqNy+abpOgwLg5A=;
	b=zcgaEkiloKQ56VSCTBSe1ien/hMchQuz9vJkR8rgxhRSXwRtUPLDO4RTGnT2DL2UE7
	ohD5ewY4N88UX4vKE5gC8NFwezfZ52tAD9lO6QVRBZqhW7Y19i069IZD0+nzFKr4bbMs
	Ytx0ITMQKd0/IUL4qoQ4aleyJUX99c9ZxutBA34V4pyAIF6SyeAbrRxiLRu9qZ84LWs8
	UoG5rAsnky1YQYFhoRb7XIvECCopnnzf09EzQdz5ImRnlsquTy+BIumyhdwLNfWD33AA
	fVeuRlTC0H7+TIJhLvojor388fDbXq1hHXgfJS398dU+Lrwxsbh2I2cwmveWjekirG+j
	2jkA==
MIME-Version: 1.0
X-Received: by 10.180.104.40 with SMTP id gb8mr34567337wib.17.1443650647814;
	Wed, 30 Sep 2015 15:04:07 -0700 (PDT)
Received: by 10.194.169.6 with HTTP; Wed, 30 Sep 2015 15:03:58 -0700 (PDT)
Date: Wed, 30 Sep 2015 15:03:58 -0700
Message-ID: <CAJ86T=Xkpa=hO1kizYrsSOTpeMOfbnZeniEWdMgCNhXae2W_5Q@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Sorting rootfs manifest with .ipk packaging
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
X-List-Received-Date: Wed, 30 Sep 2015 22:04:08 -0000
Content-Type: text/plain; charset=UTF-8

I'd like the rootfs manifest to be sorted when using .ipk packaging.
Would a patch to sort the result of OpkgPkgsList().list be acceptable?
Or would the sorting be better done elsewhere?


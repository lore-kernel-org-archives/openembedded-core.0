Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 9771460125
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Nov 2015 18:16:34 +0000 (UTC)
Received: by wmll128 with SMTP id l128so121449881wml.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Nov 2015 10:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=Kdqr34YLUipKnPbJcPv4UQgrRIClKVvkcQaOPmrCuvo=;
	b=SDjxrdHzQppee0qBGfezUNnVbAxSCb7mZnh7dUYK8dKNjv86IDODvMy604suLnRAmh
	S8MnSAo4rRb3TleJKzAUM9deajJvFhg6Qo6qTWNQZR+mOMBQ1YtbX27PpIya89coTtve
	TVWGEs6t19fl6/PAG7CS+ozfWMPztFvkqh2Kse4u1j0Zd9f08QO/iz2ZCBye66ZAysGJ
	8vqykpdTQiv4yHpzQPjB/QZNBnG/vZr1SREasUnYbxSKLOboYHy96VsW/24I/2Y7bi2g
	/WM2fD2avXs8JShNFWXZxKojLnu9EQyQoTheQ8mJd1K9YoFXDCYbj5NUO2MaD+xuEDSi
	e7mg==
MIME-Version: 1.0
X-Received: by 10.28.87.67 with SMTP id l64mr25928986wmb.72.1446660994545;
	Wed, 04 Nov 2015 10:16:34 -0800 (PST)
Received: by 10.194.140.38 with HTTP; Wed, 4 Nov 2015 10:16:34 -0800 (PST)
Date: Wed, 4 Nov 2015 10:16:34 -0800
Message-ID: <CAJ86T=W-yx=peF_w-g4U7hkZN2u+RR2wbY7eACDEKADLQ-r2jw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>, 
	Joshua Lock <joshua.lock@collabora.co.uk>
Subject: fido backports to support SH4 + uclibc
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
X-List-Received-Date: Wed, 04 Nov 2015 18:16:37 -0000
Content-Type: text/plain; charset=UTF-8

Hi Joshua,

Could you please consider backporting the following fixes to fido.
They are required in order to successfully build for SH4 + uclibc +
blacklist GPLv3.

  aa20c3d uclibc: backport upstream fix for SH4
  898e9d7 libiconv_1.11.1: merge build and packaging fixes from libiconv_1.14
  7d2da0e libiconv_1.11.1: fix LICENSE declaration, LGPL -> LGPLv2.0
  d46333d gettext_0.16.1: add -lrt and -lpthread to LDFLAGS for uclibc builds
  d95d92a gettext_0.16.1: remove obsolete uclibc specific patch

Thanks.


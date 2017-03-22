Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 300E477A3B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 21:42:21 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id n11so47334517wma.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 14:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=POk+sJEhG1dn4crn03jKHHec0xtEJYNihRhMVbjPJr0=;
	b=EbAckxKGji1UMdwpfFCWIRwL/aXq1X8W7zj8td6cLb++Pfo36XIoDd+C1sOphEgEzJ
	JmZ8XgT98L6spUnm2fuuR+3GQXcqeKQwEErr7JTL89amRAkH7BRJcd6rK20UAJvjN3pG
	vrfAFesCFh6bY039nI6Ua6l+HwjBy7xXHw5kdDYQtKL+g+LKuG/IVFke4Nuhlevoh/jS
	LBRj0nEMA/N+u+hd+JUDlOS4hR1ZGqEMxRVZ2T/I18ZV8QNouGtQ3OtwRNhe0pdxsJ7U
	csDf58Rxo3OhOsHw2UuVHI5rRpV3PRlIZLsZGacXudb+TvZ4Y3KBZDPHWl0lX2TGlT5S
	4DFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=POk+sJEhG1dn4crn03jKHHec0xtEJYNihRhMVbjPJr0=;
	b=eEixhWwxSZ9xfbX4Ow0kr7IIlDfIJ1Zc+UGvVpy714FBEmh4WQeCqp0UIAKERNBJH8
	59n9+v4OFoQ9LyE7SYHLA0VahJWip0ufdD3d5TwZWnSahl88O3FD0Erjs+LT/qDqhU27
	9xKo05rNLb3P/OJKtdofiHzjzpCCJuG1UzWMj9vNxATyGaOfRYQ9wkwU1+Ft6FP8dF8h
	GhOlZWPcxJ4GQUKzZoErtuXOBEkcH6aN984COh/ar5TqJYA9IWalZjzLVxxbIz5To63B
	YhG1AGV/ytRXxZvHQuAL92fEakxqFAkAF+LfumyEcdr2sTMwLxQLlJpInuutgg9pffHe
	7IjA==
X-Gm-Message-State: AFeK/H2r5ciTqrC87ldOoGclMgf3rRHc9lzNx6bJ3X3/HeWaUHmNRRFmnMR9JDRPR8lHWotRQNOeR9gUjOSyUA==
X-Received: by 10.28.215.18 with SMTP id o18mr10292380wmg.98.1490218942585;
	Wed, 22 Mar 2017 14:42:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.179.24 with HTTP; Wed, 22 Mar 2017 14:42:22 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 22 Mar 2017 14:42:22 -0700
Message-ID: <CAJ86T=WhxRaQ42=2bsFVZpeLhrZo2XwZBYoWp=f42tyebo2=2A@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Using MACHINE_FEATURES in a native recipe
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
X-List-Received-Date: Wed, 22 Mar 2017 21:42:22 -0000
Content-Type: text/plain; charset=UTF-8

Currently native.bbclass clears MACHINEOVERRIDES but leaves
MACHINE_FEATURES alone. Is that an oversight? Or is there ever a
legitimate reason for a native recipe to have a dependency on
MACHINE_FEATURES?


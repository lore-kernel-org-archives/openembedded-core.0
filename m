Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
	[209.85.210.46])
	by mail.openembedded.org (Postfix) with ESMTP id D01897D06F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 14:50:20 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id e80so8825586ote.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 07:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1YH8PS60NgTaIKYXedieqsfZmImRDsjghVB+FLD+uuI=;
	b=fJgtvcSjXrV0R4ITnwFQaibSRCVEPQMSpeL/s0gt1Xh5cHSRCxAn02TJRyHDSRpcg2
	4Yc5NtZrtFp0cvCTb+PpzyuYu6XeP30l1zLRg2413HUW8lLXyHLgJ8JpK7U3Zvw61Z7D
	UUGEkdwyysUprQ2n1oMgQGVQswY6rPKpp3c0mOlnueoorg/hEDW95M1sFWxcH1wT5vrN
	iZJOnyCXEXw7wSFodvJ6b+tViAV/7X4u0OmkJH4bEdQM5uwc51umXirn8fZOfpi/HFT2
	cEeI6aefzqEGVIUSg1j4BcVgzM0gpQG0HL6D9nFo9nKo8g1atRm3owqddr0vCzfj78Y2
	8qTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1YH8PS60NgTaIKYXedieqsfZmImRDsjghVB+FLD+uuI=;
	b=Ntcv1181SVHr/nzGLws0R93PhAzkZRCedkk7MQYXR6xdlTMR/HaM/Vjj/Dc6DiBL+U
	BI1hwzwa25tN077XzyKth6E/yFrDXjJdVP+ATyEsFYDg7FXAlim0u6+xW6s+Jpqj0ccA
	El8lkUE94MDVXAiUcyFsJMx8Tsn5DxDJQtz4L41xXKLoiqwlJxLqYFrxJqQFqlh636Jc
	PoxM9Hf5dTsuGKdTdnqnW0IFuRoi+udDit2g8ose9isB+3tgOGL6lrzMRo8QFYzGb3zW
	hmY/Wo3vFQNp5u5SG09WHzp3P72ievbP8FfGED3KL1MABigqFmQKmcH0EIKkv2hmNCGK
	/obw==
X-Gm-Message-State: APjAAAUtiNpgjO6XoSN7UvwxuKZb68uhuwX3b9ONMlxDP1WdnEo+JGB3
	Rmt/m9f0cpyUruRF+rDHijq+oxgeCHG7NziwHRw=
X-Google-Smtp-Source: APXvYqzFbAtGV2xkloob9gFEQG6cNRbclb6uOH3bIBSethj12d2JNmkz2YL20kGrKY+GoBdoTVClivLkIjn4f59y5pM=
X-Received: by 2002:a9d:4a9c:: with SMTP id i28mr30124534otf.326.1554130221856;
	Mon, 01 Apr 2019 07:50:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1554106752.git.xavier.berger@bio-logic.net>
In-Reply-To: <cover.1554106752.git.xavier.berger@bio-logic.net>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 1 Apr 2019 16:50:10 +0200
Message-ID: <CANNYZj_CKFRAg9WByRfD56tOiV8FW-VfS4KyEN2YAniAxhaAtA@mail.gmail.com>
To: Xavier Berger <xavier.berger@bio-logic.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PULL][PATCH 0/2] Implement debian packages GPG signing
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
X-List-Received-Date: Mon, 01 Apr 2019 14:50:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 1 Apr 2019 at 15:57, Xavier Berger <xavier.berger@bio-logic.net> wrote:
> Xavier Berger (2):
>   gpg-sign: Add parameters to gpg signature function
>   package_manager: sign DEB package feeds
>
>  meta/lib/oe/gpg_sign.py        |  6 +++++-
>  meta/lib/oe/package_manager.py | 19 ++++++++++++++++---

How do we make sure this does not regress? Can you add a test case
similar to one for rpm feed signing?

Alex


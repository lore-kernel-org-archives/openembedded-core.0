Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f175.google.com (mail-it1-f175.google.com
	[209.85.166.175])
	by mail.openembedded.org (Postfix) with ESMTP id 5E04D7D577
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 08:58:39 +0000 (UTC)
Received: by mail-it1-f175.google.com with SMTP id w15so4975862itc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 01:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=M6uEtenezvEHe42p8qk+gcHHDT1digN1/2bcgetHtMo=;
	b=ILufvUw4Q46t9Yiwo3Pd2v6YrXG75UylCq1xI69iZk4NmqY2T49uMvPZ31va2jUh+w
	RJEJKjQa+ZCMfBTgd56JoRznzowHQqOkYsTx55TVCSx5IxYZXyDG/hnbS7mNcUxzW7ei
	nFHRODboxvbBhpbfyJoBq1ZnM6MiN/ETKe2oCJNKnsrFzByJyBbbaLOh4YKsc/2KUQIZ
	b4sPgSIFvnd2wGfUSYbL8yUla9C1wC7i0hafsGXovAVerBh6rxu99uAfJA2/GZJsWTUw
	D4aL3iNGk+CrlbC5mOtm6rL7qL2jrdR4vpTPpp0TnKRIk37QL1BUr53paQ87qYpFQiFf
	/rew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=M6uEtenezvEHe42p8qk+gcHHDT1digN1/2bcgetHtMo=;
	b=NUITNcyRte5Kq8cNNpa/zf19XJTP2AVrsp/qWNhzjLsFc1vuOwP6FKb7/IlZwHqjCo
	y5RBiV6BCWEWohutzccl3YwwVqZt8JQapsGV8o3DCfGNitumACUt0Pd+MR3SARN8T7Gc
	r19w8ZgrutWMEO+Dd/Y6jiUpnuieLm2sBQxAzL1+7WJtyPalJg18NDtsuFkkHEm86lwj
	tEUuMnuQQiuDq1KHhXE/Ilpi4cas6MrtTb2GOhNedXZRuHlPYaHgA6U1Vu3wh+JTTU+z
	wo1whxtqxRX95VM7VkgV1yca4hu0EbQ+vHolZ2d9Retrcx7f7VqpBesr4Hx/8VZNklZR
	PmzQ==
X-Gm-Message-State: APjAAAUckpyCk/mW9HbC91rhy3YugEHl85CWWHbyvoumMrxcplOvje2K
	Eew18PF8yW2GnB9URtVbreZJIRnlU5L2Cy502IHAiA==
X-Google-Smtp-Source: APXvYqzmSq1mCEdfGB+J/RTRoew6Ok8Gw/KH/41XrUVgVfhAJE1aoKEJDg1LM6wy2ArGtvyeE0msJZWS2DWoT4WLq1g=
X-Received: by 2002:a24:78c8:: with SMTP id p191mr5747115itc.58.1556096320214; 
	Wed, 24 Apr 2019 01:58:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190424011500.9830-1-schnitzeltony@gmail.com>
In-Reply-To: <20190424011500.9830-1-schnitzeltony@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 24 Apr 2019 10:58:28 +0200
Message-ID: <CALbNGRTxioQZkp-AxmSS-bX88p_3FBCGTw99X=0tgxju+2VumQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] vte: upgrade 0.52.2 -> 0.56.1
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
X-List-Received-Date: Wed, 24 Apr 2019 08:58:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2019 at 3:15 AM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> * license: COPYING was replaced by COPYING.LGPL2/COPYING.LGPL3/COPYING.GP=
L3
> * pretify recipe a bit
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../vte/{vte_0.52.2.bb =3D> vte_0.56.1.bb}       | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
>  rename meta/recipes-support/vte/{vte_0.52.2.bb =3D> vte_0.56.1.bb} (78%)
Sent out too early: Does not yet build for musl

Andreas


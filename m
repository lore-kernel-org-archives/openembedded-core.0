Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
	[209.85.167.174])
	by mail.openembedded.org (Postfix) with ESMTP id F33E97C083
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 13:46:01 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id t204so2119954oie.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 05:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Zk3HHqXYpxSpbRUnzepWo/EYl4hGKRNdU79pCJ7RvAs=;
	b=e6v74+H+kPfOqQWpOGmLy262Iu/00kHafpOpdHC9/C+ArYfRcs46YPzVz3EgTOQdCH
	DhJ+E+LvkHJNaSgkjkMb0GGKYF7dSNDnQ3qLTP1s3LMafnxOpNZQyq8zinHTC7wkHqVz
	Zns+mjMM43MKSeHh6+TGglUdhLDRr1upKmEskX38IbUCho9z++vKXGXBysmTHwj0inhk
	bkcQrt4s2yTuG/NGcoLPjVIrkzl8hoDkqO+aqbUKK/QnZe2b+QZ6To4okaUVex02go3D
	zF9QVqox9wX8KrtJMgVTayMjeorOtg+CrA3reOMP2wePuCOHo/25ND08PgJKfn68Gp63
	dCQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Zk3HHqXYpxSpbRUnzepWo/EYl4hGKRNdU79pCJ7RvAs=;
	b=pGEuJbTaP44VYgy7KPvD2aW/NBNVWCuVEuceAM9DXtN/QhydgkRt8zKxmDrHMwr9Yt
	LgwcUHswx/Jd/LTU/athXsaWWeKSSJLCqS1cCS/h7FkyrJOvct9nBJHNXlH0Oj2qfG6/
	+fwRFnoBqVcjIW8n3vFmAFgxBcNS4/x0NVeJ2ZroP7CHdeyCbNTohC/X12oUoDoOzqEN
	GQ4kM7a0ntV3cWMl5dZWFkGJShVaq+0XN6q3rqaXj67dD9JBUUrxnlZSMV4ONkdUUuDB
	IYlBpzGfepoS7rnDp0i2U1/xLNX4NtvTg5zm0PMDFHeHRp+wLlCKYuxmZCZ26JRaqZu9
	RFdA==
X-Gm-Message-State: AJcUukceXVgoH+U5hZvNxG+6pJ/3ZJVLtpsKF9/Bhn2Wh+wpEEOIk9Vg
	4NTrxy0xffXy6nvdc/aPNH74CF2iFbnSlhSRwZBzYA==
X-Google-Smtp-Source: ALg8bN4lZkiGJuyak75bkKyhXKawD9dVjo69nlxu9/QUCwH+ZryEHVm4dr+070gBm+n5XKjBmyg9BgA8sXB5OomSDWs=
X-Received: by 2002:aca:d78b:: with SMTP id o133mr296959oig.232.1547558762764; 
	Tue, 15 Jan 2019 05:26:02 -0800 (PST)
MIME-Version: 1.0
References: <cover.1547477793.git.alex.kanavin@gmail.com>
	<3a7a4903e87c0cd564e7652c463cbc6baead9cc6.1547477793.git.alex.kanavin@gmail.com>
	<3d19369484a84d2c879b580dc121a718@XBOX04.axis.com>
In-Reply-To: <3d19369484a84d2c879b580dc121a718@XBOX04.axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 15 Jan 2019 14:25:51 +0100
Message-ID: <CANNYZj-VhR68DJ1Zf+SqPr+q0uU0Zr9OaoxMTokCYuC2wkZ9dg@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 07/23] libepoxy: enable native/nativesdk variants
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
X-List-Received-Date: Tue, 15 Jan 2019 13:46:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Jan 2019 at 16:50, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
> Shouldn't this only be done for native/nativesdk? I.e.:
>
> do_install_append_class-native() {
>         chrpath --delete ${D}${libdir}/*.so
> }
>
> do_install_append_class-nativesdk() {
>         chrpath --delete ${D}${libdir}/*.so
> }
>
> (I also changed the indentation to tabs as I believe that is still
> the official OE-Core standard for shell code in recipes.)

Thanks, I have fixed this now. I'll resend the patchset.

Alex


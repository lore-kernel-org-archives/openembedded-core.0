Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f52.google.com (mail-vb0-f52.google.com
	[209.85.212.52])
	by mail.openembedded.org (Postfix) with ESMTP id B50296BF6F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Sep 2013 17:10:53 +0000 (UTC)
Received: by mail-vb0-f52.google.com with SMTP id f12so3077194vbg.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Sep 2013 10:10:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=jtkShjEoDanW0cLxMcvrnoQUo4+hkdzFUc3bTG7bGe0=;
	b=h1rm1MPHBDvK3j3uxBj1ZIG9i9zkY7tHKW405Rh3NvlJ7JeD43HGjZZTADA10LlPeP
	7RnEFWBLMc3xOiyZ/l5e3+n5S8Ys88ikl7/kN/nAaN0Wy7SctMAfd6ch2i37FTDjGcey
	sdSndGg3lYm3qh+sVfgtGoLU5i2G7+F22tuSOGo04hl6FbIEN7EQUeE1gMRRyc2vQL39
	aSMC8xyE3omHeUHgj5j4808cNsk8GDg5eva8xZS0vNNJmjgbN/KADieimsCByMMxNa3p
	eFZQ7o7fna2FD09I51fYAzT1g2SiA+v49/DV5nc619Nl2f/myDNb/w9gsad4c2bFNAuj
	2R/A==
X-Gm-Message-State: ALoCoQl9cnsFqdDg+quSZV4Y7c2M/FgwWoAZzuLB1Rbu9vUW+bdioz8sKdbcJ5GITF6DjzpMd/jU
X-Received: by 10.52.187.65 with SMTP id fq1mr19454558vdc.13.1378141854031;
	Mon, 02 Sep 2013 10:10:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 2 Sep 2013 10:10:33 -0700 (PDT)
In-Reply-To: <ec8f1bdec56b09ad884f0c19fb5e4eea256e846e.1377792006.git.Martin.Jansa@gmail.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
	<ec8f1bdec56b09ad884f0c19fb5e4eea256e846e.1377792006.git.Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 2 Sep 2013 18:10:33 +0100
Message-ID: <CAJTo0LYV_0=7A93hdVnKK=hOm8BQJ_oNh7K0thEQZusPaDw1XQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [WIP][PATCH 08/20] telepathy-mission-control: Add PACKAGECONFIG for upower and connectivity
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
X-List-Received-Date: Mon, 02 Sep 2013 17:10:54 -0000
Content-Type: text/plain; charset=UTF-8

On 29 August 2013 17:02, Martin Jansa <martin.jansa@gmail.com> wrote:
> +PACKAGECONFIG[connman] = "--with-connectivity=connman,,connman"
> +PACKAGECONFIG[nm] = "--with-connectivity=nm,,networkmanager"

Were those meant to be runtime dependencies?  At least for connman a
build dependency doesn't make any sense (no headers).

Ross


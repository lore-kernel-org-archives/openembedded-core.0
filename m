Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f54.google.com (mail-vb0-f54.google.com
	[209.85.212.54])
	by mail.openembedded.org (Postfix) with ESMTP id DE7B162062
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 10:39:43 +0000 (UTC)
Received: by mail-vb0-f54.google.com with SMTP id q12so4391482vbe.41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jul 2013 03:39:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=AhbN9729QJXObM/0cWevypTQxZZmLn+5bopfEfVxrKY=;
	b=mgaNFONrn9KJUcx8alSAc9/OLwLsZ0PLvZ72WWFUC/oMGXY2yHbp20CKAAAfTDRFCT
	gGWrq1W3Ko8BP9sJk7KU04tJCFVu3eldYMNZxGGildr2cRIHkd5gjIP9BtflEbfELfGw
	lQlLVaH4zGGgp225bqAid0+WBjEb5esNyD/rhyN+mP2DsrfJN6PvpowZ0JrG2wrwLbh7
	v1wJ49Q3ATxvNgTqr2g4rBSv5i2g1z8sFB1rWaztXdyean0cAyWmT7bNW/fPgsg8+3br
	xbbXyJXcm7zE8oW0/OwCCDvs/IWRrUOYxypcEPGsXTBOtuMlzRR8arUT97ARudc+mIBb
	BpQg==
X-Received: by 10.220.58.195 with SMTP id i3mr11057295vch.38.1372761584949;
	Tue, 02 Jul 2013 03:39:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Tue, 2 Jul 2013 03:39:24 -0700 (PDT)
In-Reply-To: <5fe62449a23d73dcdae54d7e8f37f2a178ad0751.1372707180.git.Martin.Jansa@gmail.com>
References: <cover.1372707180.git.Martin.Jansa@gmail.com>
	<5fe62449a23d73dcdae54d7e8f37f2a178ad0751.1372707180.git.Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Jul 2013 11:39:24 +0100
Message-ID: <CAJTo0Lah0em7+be56wFOAHP+eCZy7NJqN=BY+T1SN47bXdKbwQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQmia9P5Pa0lG2oKFlZi4JBVJqkR2YnYhQq7bQ/UF+7D7HLYruDz+3z7T7csjHP8bmFnHeG2
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] mesa: bump SRCREV in git recipe, refresh patches
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
X-List-Received-Date: Tue, 02 Jul 2013 10:39:44 -0000
Content-Type: text/plain; charset=UTF-8

On 1 July 2013 20:36, Martin Jansa <martin.jansa@gmail.com> wrote:
> * 0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
>   needs to be rebased so move old version for 9.1.3 to
>   mesa-9.1.3/ and update the version in meta/

Typo "meta/".

> -# 9.1.3 commit
> -SRCREV = "f32ec82a8cfcabc5b7596796f36afe7986651f02"
> +SRCREV = "5a925cc5504575c22dbb7d29842d7fc5babcb5c7"
>  PV = "9.1.3+git${SRCPV}"

git describe doesn't call this a descendent of 9.1.x so I presume this
is a master commit.  Can you change PV to reflect that somehow?

That said I've discovered that our rpm doesn't support ~, so calling
it "9.2.0~git" isn't going to work.

Ross


Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 32DB96013D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Apr 2015 16:07:09 +0000 (UTC)
Received: by ierf6 with SMTP id f6so107616103ier.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Apr 2015 09:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=CXh03kfn947Osn/9EdxbGBHTcMH/nMIOOVkIw2vC/Ks=;
	b=vaVn51DQhAR60yfdVxkMr6n9QrKY/Jiw5ykxhJ2ShlIl6H/VDoDcOYCFctJlX3epiT
	VPHXsRr7Sg0Q/bECMbmjENz6DKFB4GhFs2hmWIHa2sJu2P0oiKx/I6nSbgOHUSnZej7x
	KWky4F2hFzJh/sJ6GG1iKAxbl9tPO9dGETOBB/pm6nqzPPjWSYzcBNYXYwKiQ2iMRsdx
	OheCHS2c8QniWjPgEkILvVSrdw206lgw4RUGJducnIseT+j93hTSDTauhvKifgvfSSSp
	hgDWnSYZVmain0rdPipCEk9UMbS127G8aNv+YNBJCPx325yJtFz+7uv8qPJtczgUH1NN
	A36Q==
X-Received: by 10.50.29.52 with SMTP id g20mr13374482igh.27.1428163629630;
	Sat, 04 Apr 2015 09:07:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.117.7 with HTTP; Sat, 4 Apr 2015 09:06:39 -0700 (PDT)
In-Reply-To: <1428158165.4354.25.camel@workhorse.madison.systems>
References: <1428158165.4354.25.camel@workhorse.madison.systems>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 4 Apr 2015 09:06:39 -0700
Message-ID: <CAMKF1soS=iFeHu1Frzt+j2hs-fLBRZYYNZV2o=U1+rLty7ovfA@mail.gmail.com>
To: Matt Madison <matt@madison.systems>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Removing shadow breaks PAM logins
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
X-List-Received-Date: Sat, 04 Apr 2015 16:07:10 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Apr 4, 2015 at 7:36 AM, Matt Madison <matt@madison.systems> wrote:
> I worked around the issue by repackaging shadow so the programs and
> config files that aren't related to changing the passwd and group files
> ended up in a separate package that remained in the rootfs.  That seemed
> to be the cleanest way to deal with the problem, and it did the trick
> for me.  If there's interest, I can submit a patch.

yes please


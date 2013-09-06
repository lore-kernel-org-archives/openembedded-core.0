Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 167696C819
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 23:52:45 +0000 (UTC)
Received: by mail-ob0-f171.google.com with SMTP id tb18so4194366obb.30
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2013 16:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=0Dz6uN80AqL4qX+wOsfu0PXquEMYHceXoohWfg+rDHY=;
	b=HBiEWOhzjGp0mxqqZL92JTHuOTPkSFa4f/x8MwRI8z+cQSOIIjCpDwv/j5cy3pmvVv
	Ydx2pIL9C8t4tbKUo2yW2J+K8uHMr3iFAVC94yNKQwgbPBc5oDsGqGexAhFzyHFcHKvu
	4MFBsgK24639XybIaLKDrfKySM8aglcUjIq0BV9rUg7whTiCHgIKflFJWrmbGH/sCrBN
	hXSTIVEQqZVLZki3KXF58nBz5EEiV1/3T1aPNZRD1ZdhFN1V/he3DJBljo1z3SngGJRG
	CYZ1Iq7ZvdHbNFzPSxgo45riqPuYilNXoN43NH5UGL5kV8NZhfgI24MJGZhViwPVWp2R
	iqIw==
MIME-Version: 1.0
X-Received: by 10.60.44.240 with SMTP id h16mr3807788oem.2.1378511566277; Fri,
	06 Sep 2013 16:52:46 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Fri, 6 Sep 2013 16:52:46 -0700 (PDT)
In-Reply-To: <e5bd7a223ff269bbd33766b5e6bd866cc2fa4dbb.1378498892.git.dvhart@linux.intel.com>
References: <cover.1378498892.git.dvhart@linux.intel.com>
	<e5bd7a223ff269bbd33766b5e6bd866cc2fa4dbb.1378498892.git.dvhart@linux.intel.com>
Date: Fri, 6 Sep 2013 20:52:46 -0300
X-Google-Sender-Auth: JWDd0rxpeF-GS95iOlyTtqBjxHk
Message-ID: <CAP9ODKr4+1gh=W_bA3Oi_F3mOBUTWvLkiOzJURy2D7z4mZ4DZw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Poky <poky@yoctoproject.org>, yunguo.wei@windriver.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] linux-firmware: Update SRCREV, pull in iwlwifi-7260 support
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
X-List-Received-Date: Fri, 06 Sep 2013 23:52:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Sep 6, 2013 at 5:30 PM, Darren Hart <dvhart@linux.intel.com> wrote:
> Fixes [YOCTO #5110]
>
> Add support for the iwlwifi 7260 adapters. This creates a new package
> and includes support in the default linux-firmware (everything) package.
>
> Update the iwlwifi and radeon license checksums. Extensions to the
> copyright date ranges were the only change to the LICENSE files.
>
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> Cc: yunguo.wei@windriver.com
> Cc: Otavio Salvador <otavio@ossystems.com.br>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


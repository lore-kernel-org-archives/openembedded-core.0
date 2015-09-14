Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9406F73CBD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 11:49:09 +0000 (UTC)
Received: by ioii196 with SMTP id i196so162508565ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 04:49:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=Fac/WTmtYJ9SwHCzWORNPLHy1OI8PL5+0pt3XB1my5Y=;
	b=e8Oo9qdBGp4qbOm8JITr2CrxSqQsrzXq9HYxSdrQf3CK3P0t76vr0PZjIFBrIdALA4
	Gtl58Gz+EYBXcX2nw/EiHC0WZyg4RcoY79zf+ECNf024drzzbopDwGFRc5aYzyXKWepR
	WLjUheW99+0S/5/V30Thm4mcy2nJH8UM8TM9g8UzKobgEncN6AxToW88bJMs8s/1vtB1
	DzIfjbaTQaskiR6QkNIEX//LtPvf8LRFWolJ2jlLb0MFLQPWyZ1ZqYTIZNjyK73X3LxZ
	fgXQpSAHdcxZQKutv1kmE6ewWUyLCN0hJ1cIiIUioUACzd0KCthhWAZ444HDeFVps80s
	CSHQ==
X-Gm-Message-State: ALoCoQksetK3KnZ5gNIin/RwJ6jJun9aVuDoYI6oyFgdQx088VGDvN7tZPRKP2o+8O9XLLCJOuFc
X-Received: by 10.107.46.158 with SMTP id u30mr26148715iou.56.1442231349222;
	Mon, 14 Sep 2015 04:49:09 -0700 (PDT)
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com.
	[209.85.213.173])
	by smtp.gmail.com with ESMTPSA id u99sm5787610ioi.0.2015.09.14.04.49.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Sep 2015 04:49:07 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igbkq10 with SMTP id kq10so84684058igb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 04:49:07 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.17.67 with SMTP id m3mr18005709igd.5.1442231347163; Mon,
	14 Sep 2015 04:49:07 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Mon, 14 Sep 2015 04:49:07 -0700 (PDT)
In-Reply-To: <CA+aJhH0B8WM-TOM_aL-7cPOA3z8H5y7KyT1DYq9AhizR2VydMg@mail.gmail.com>
References: <1441880652-12645-1-git-send-email-nathan@nathanrossi.com>
	<CAP9ODKr=Sg2Gq8AghfQD-SFWWr2vF=wOo0VqStfjsjkYW2WDRw@mail.gmail.com>
	<CA+aJhH0B8WM-TOM_aL-7cPOA3z8H5y7KyT1DYq9AhizR2VydMg@mail.gmail.com>
Date: Mon, 14 Sep 2015 08:49:07 -0300
Message-ID: <CAP9ODKpa9iFBdDfcRhkQbQFSAFqkkoojNRRvdvePNXO3EsBOoA@mail.gmail.com>
To: Nathan Rossi <nathan@nathanrossi.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] u-boot.inc: Add host compiler flags and openssl-native dependency
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
X-List-Received-Date: Mon, 14 Sep 2015 11:49:11 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 14, 2015 at 6:29 AM, Nathan Rossi <nathan@nathanrossi.com> wrote:
> On Fri, Sep 11, 2015 at 3:50 AM, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>> On Thu, Sep 10, 2015 at 7:24 AM, Nathan Rossi <nathan@nathanrossi.com> wrote:
>>> U-Boot will compile its own tools during the build, with specific
>>> configurations (aka when CONFIG_FIT_SIGNATURE is enabled) the host tools
>>> require openssl. This patch adds 'openssl' as a PACKAGECONFIG that
>>> enables the use of openssl-native as a dependency and also adds the
>>> HOSTCC flags that U-Boot uses when compiling the host tools.
>>>
>>> Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
>>
>> Ideally we ought to ensure U-Boot stops to build the native part when
>> doing the target one.
>
> Are you suggesting that the compile step (of the recipe) should build
> the "tools"/native make target first, then execute the make target for
> the rest afterwards as two separate steps?

Two separated _recipes_.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


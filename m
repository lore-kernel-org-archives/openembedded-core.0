Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f179.google.com (mail-yk0-f179.google.com
	[209.85.160.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9B04A712FD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 03:17:35 +0000 (UTC)
Received: by mail-yk0-f179.google.com with SMTP id 142so3783298ykq.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Sep 2014 20:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=PCCtAJmBtWgqu5LKKvprlBmRZ+JAmiEgB0fHJApwIkw=;
	b=ocj88fbdmtXynEkbFI9gIPUrsuPf51ZnXZoco0LDivQuBb9ewNrP9IYAxps2Bsa7Yv
	tzNUb/NK6jBguUwDMH/4h52opzDmSa3SfX9EOcXUxOBZU/Oh5HR2NHpTD/Oi+ZPTTTmX
	q7ckVmnQOGNJao8NqztobvLkSGWu+r9505FAZLqgqBSVXg1gxteyxL43iHZDs+ahkOPV
	hXb63omwMNUnM9LCND2F9SgZH/gAXsfw9jT1X9LeocXRJSMg2MIa1/+QST4mBdFdo+Oa
	IOmS0YHJpJvBK4ym1TkBt1RmTHsXTYvS2bJpetaD97wttXiI39aaimtplWwM88h4DIc+
	kp/Q==
MIME-Version: 1.0
X-Received: by 10.236.131.109 with SMTP id l73mr10569488yhi.96.1409627856432; 
	Mon, 01 Sep 2014 20:17:36 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Mon, 1 Sep 2014 20:17:36 -0700 (PDT)
In-Reply-To: <540530B8.8040107@windriver.com>
References: <CAP9ODKpWHy4XW6OVs34=-p+GRK6iOLvgsAqr22obSAaj9_2SDQ@mail.gmail.com>
	<540530B8.8040107@windriver.com>
Date: Tue, 2 Sep 2014 00:17:36 -0300
X-Google-Sender-Auth: 58VtA-Jd7omq9aE8To3xqlIEw74
Message-ID: <CAP9ODKrxFsbVs7xNQ1tOW2xmrQ4-omTZCTVQ04aO8ms--Lu9Qw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Error while building qemu without X11 support.
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
X-List-Received-Date: Tue, 02 Sep 2014 03:17:35 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 1, 2014 at 11:51 PM, Robert Yang <liezhi.yang@windriver.com> wrote:
>
> On 09/02/2014 10:30 AM, Otavio Salvador wrote:
>>
>> Hello,
>>
>> During our regression tests we found the following error:
>>
>> directfb fsl-image-machine-test@imx6qsabresd (1/4) consider defining a
>> PREFERRED_PROVIDER entry to match jpeg
>> directfb fsl-image-machine-test@imx6qsabresd (1/4) ERROR: Nothing
>> PROVIDES 'libxext-native' (but
>
>
> Did you use meta/recipes-graphics/xorg-lib/libxext_git.bb ? This one
> doesn't provide native, but libxext_1.3.2.bb does.
>
> Seems that we need remove the git version since it is older:
>
> PV = "1.0.99.1+gitr${SRCPV}"
>
> And doesn't see a license issue.

This has been reproduced in our autobuilder.

It removes:

x11 and wayland

and adds:

directfb

Can you try to reproduce it?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


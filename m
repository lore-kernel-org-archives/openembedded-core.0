Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f178.google.com (mail-qc0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 8CDDB71427
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 20:29:20 +0000 (UTC)
Received: by mail-qc0-f178.google.com with SMTP id c9so2856118qcz.37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 13:29:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=7kFhzXMiWuJszksP/oCtxahj0j3PS+27cIhkAv0ZHSQ=;
	b=NFMIEd6T1HSfBOgNUCUIxX+DiaveGuZ1j6H4I8uKNg3jvBbVDctm0eYl95EYS5xk/V
	jACg8ZFrAsdLFgcAwzYvkZKarXTFEGaz/C91oeECZ0yMT1DZPdwMd28KVio50Q1tvAfS
	uOsIkzIGi9IlvSLMbegwhE216+J3nFLHCGKhKNuv/L2vhH6OqECWPySAGyxeaIgtqvn/
	D/2fYwn9i35yD6IXmIiDUrwR3czD9J4CiETSEB/hkGGmrNgOGlO8nbNJv690iiTerQFL
	A80jbiDJVVNmDWsTcyoLjlrihN3QPFWDIgwtmvLaHR0y2V81jqrPgac659jVaMa7Xrx1
	ppHA==
X-Gm-Message-State: ALoCoQmYXzdGJd6jESOfli8nPDtbxakVgSFaVTJmsfj14Izp5ljWOTBXWSLKazfb3QLyQ0AFW910
X-Received: by 10.140.97.247 with SMTP id m110mr41067251qge.80.1410812959799; 
	Mon, 15 Sep 2014 13:29:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Mon, 15 Sep 2014 13:28:59 -0700 (PDT)
In-Reply-To: <CACS+7ZQUcknvEU6M1ioMQKRFHa4k7PO_rRGqEH7KWLU4Jn5f_w@mail.gmail.com>
References: <CACS+7ZTGK6duNi6GQ6tqhmrk3_bNnEbSj=LeEzr60vRP3Dw=OQ@mail.gmail.com>
	<CAJTo0LZewZ17aYpXao81LrmuPdgWho8WEYmYhzQ5=pP-AO-QQQ@mail.gmail.com>
	<CACS+7ZQUcknvEU6M1ioMQKRFHa4k7PO_rRGqEH7KWLU4Jn5f_w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Sep 2014 21:28:59 +0100
Message-ID: <CAJTo0LZtwOuer0QnH5=gLFzjZknBtauSbjhGt2-F5QT4f=tF7A@mail.gmail.com>
To: Dan McGregor <danismostlikely@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] libsanitizer: Enable GCC sanitizers
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
X-List-Received-Date: Mon, 15 Sep 2014 20:29:23 -0000
Content-Type: text/plain; charset=UTF-8

On 15 September 2014 21:20, Dan McGregor <danismostlikely@gmail.com> wrote:
>> git-am is not happy with this patch, claiming that it's malformed.
>> Can you try re-sending or pushing to a branch somewhere?
>
> Sure: http://bitbucket.org/dankm/openembedded-core.git, branch "sanitizers".
>
> It has unrelated changes in it, but this one should be cherry-pickable.

Thanks, I've pulled this into my unfreeze branch for when the 1.8 is
open.  Post updates if there are new patches and I'll rebase.

Ross


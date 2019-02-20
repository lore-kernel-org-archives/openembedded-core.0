Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 388427CACF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 21:44:28 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id z84so7914611wmg.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 13:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=4BBNzhrPcc2+dMdPjt1Ru1sJYiuXzDIcewBD1iwss88=;
	b=cQDGIJe/dkTrCYjcYdmmAiTIU1Kqd282xaqa0HurrgpOdfevxEEfT5SRx1MHhfDIgW
	H6f2ogG1LHx1WMS95XI1vsGzIulvenbLUGlVPXWXfF3TTOUZWbFR8dyzSkRe9T/1jYrC
	NpzErgQdMjCvldPlGI5uCiGZoInNLCvAd6RfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=4BBNzhrPcc2+dMdPjt1Ru1sJYiuXzDIcewBD1iwss88=;
	b=hXPsNX9gr6FwuKuBZKXi9kzaibTHgZmvmkESJUg2hhnqtLHN3nIuTvtSIUtuNb+zBW
	ECxkO4XsNd4tjIp4cbwKnR2tQqbF9YWaZASF+3ZWeyBwq1Vc3C1m2jWyJI/3eTAUVxwn
	j9c1IS/f+LIdYWy3uIiQx5XBBKKxCCk/m3J2uztfo3bd7lCRc2XocbCxtAzJkNqWEyhf
	d1Jdom6XYGVkoCN1s9LJeRa4yt7eIMRf9nDMztItmsyW5lR32GXgRrxXQukETflNflYY
	mPM+ZGmTgAmNp3bSft+Xop3QGdGOjzjEmyTpx/4FIqKwLVzSm1j+L73jhOWFkcnfbLBA
	wNlA==
X-Gm-Message-State: AHQUAuafKnzlRQKSxY5EXZlmEq1FRBSGYtSG93vz6cBOqpIFgZj39j1o
	HCw/xPDjZekhUPhcUPmdcncrmg==
X-Google-Smtp-Source: AHgI3IZkdfy/tZD4qPdOMavuRvWP7E1lDgF/d14pZFz0q91TceFwMQq5mHlOMJivCcD5R/KbVMlZjg==
X-Received: by 2002:a1c:ed17:: with SMTP id l23mr8131652wmh.51.1550699068934; 
	Wed, 20 Feb 2019 13:44:28 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id o5sm7534624wmh.12.2019.02.20.13.44.27
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 20 Feb 2019 13:44:28 -0800 (PST)
Message-ID: <1df4a2505898ca691f430d96f4391f18133d357e.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 20 Feb 2019 21:44:27 +0000
In-Reply-To: <9DDD2658D1FE414E99172D2DB1E4D04348186FF8@PGSMSX109.gar.corp.intel.com>
References: <1550123438-37723-1-git-send-email-ee.peng.yeoh@intel.com>
	<f26f1ce6b9b79817950b93f9aa0e38d32671e78f.camel@linuxfoundation.org>
	<8f788c03bb214b6b23dacec18b9efbc32d6bf81c.camel@linuxfoundation.org>
	<8f156c0c1b0cc7fe18bd25a03a8f5f0cdc4f422d.camel@linuxfoundation.org>
	<9DDD2658D1FE414E99172D2DB1E4D04348186FF8@PGSMSX109.gar.corp.intel.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: "Eggleton, Paul" <paul.eggleton@intel.com>
Subject: Re: [PATCH 0/2 v7] test-case-mgmt
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
X-List-Received-Date: Wed, 20 Feb 2019 21:44:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Ee Peng,

On Wed, 2019-02-20 at 06:27 +0000, Yeoh, Ee Peng wrote:
> Thank you very much for all your help and inputs! 
> Would you like us to take all the improvements from your branch to
> merge or squash with the base patchset and move forward with the one
> remaining improvement below? 

I've done some further work on this today and the good news is I was
able to sort out the git repo handling pieces and fix the test cases.
With two of the test cases I ended up removing them as I've changed the
functionality enough that they'd need to be rewritten.

I've sent out a patch on top of your original work as well as a second
patch to move some functionality into library functions to allow us to
use it from the new code. I think this combination of patches should
now be ready to merge.

There will be fixes and improvements on top of this, e.g. I'd love to
get some html reports and graphs but those are things that come later.

The next step once this is merged is to start storing autobuilder test
result data, generating reports and regression reports automatically
from each test run.

Its great to see this all coming together!

Cheers,

Richard



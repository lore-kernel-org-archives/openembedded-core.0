Return-Path: <tylerwhall@gmail.com>
Received: from mail-ob0-f169.google.com (mail-ob0-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id D15846AC36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 17:43:28 +0000 (UTC)
Received: by obdfc2 with SMTP id fc2so25503081obd.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 10:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=bmOh5cUsWRnHLr2JqjuP7twiTbb9Nt5byyXP+ewK+/w=;
	b=tRC3239dybHWiw73ZvJf58lCKntW2/rT2n/bmS5+M2aBz/glkxW2t7wZhi75Clvfqt
	2oVlMSsdK6igl0kbuP7WUbTpfcVo9o1w+z4AMS9SERUum4A+kKhne/FdqtiNjUWLggJ2
	xzPMW8CGX9Irvt7VhcoSRp9Abm48B6fXV6/w/S1ek+ZWUKU/2oV8T7DZCPd1HItVMhnR
	6SVUv/PTdoGORsupOxLZcwN3RWpcSdLkDhXTx2Xm548G/q87gHgUzFvQwhyeQv42MtbK
	/nj6u1sVMV2JG0BaBFUVoB1FSts9GHUlixSQC9ZgXfSTIgDXIYOQNzlnV039cirH0kid
	gwyA==
X-Received: by 10.202.189.132 with SMTP id n126mr8001933oif.127.1427305408998; 
	Wed, 25 Mar 2015 10:43:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.60.70 with HTTP; Wed, 25 Mar 2015 10:43:08 -0700 (PDT)
In-Reply-To: <1427304931-29872-1-git-send-email-tylerwhall@gmail.com>
References: <1427235430-20299-1-git-send-email-tylerwhall@gmail.com>
	<1427304931-29872-1-git-send-email-tylerwhall@gmail.com>
From: Tyler Hall <tylerwhall@gmail.com>
Date: Wed, 25 Mar 2015 13:43:08 -0400
Message-ID: <CAOjnSCaiL9cKg=qJXg007eHuPXxZPscbRsA5ZUG5CcAvHGDKJg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Randy Witt <randy.e.witt@linux.intel.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH v2] uninative-tarball: fix dependency on patchelf
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
X-List-Received-Date: Wed, 25 Mar 2015 17:43:34 -0000
Content-Type: text/plain; charset=UTF-8

Randy, Richard,

Disregard. Looks like we raced with each other. Thanks for applying v1.

-Tyler


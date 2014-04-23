Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id C558565D75
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Apr 2014 16:24:56 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id f51so1210750qge.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Apr 2014 09:24:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=35vaMvIEWhQGmgJckSlNoaVXMQR/MAMPKMm1uXJGd6E=;
	b=T4XGG8e8JOUaGYpk0IXbs0VQmNMaYG1cvGqq1Q6kMHRKjq2WEu3s2z5dsPhdMl0TUY
	zJGSlAVNCc8O82ovJS+KwyE1ajTdU/Ixc7k9lOvNd7hpEqDT1z/DXBPqXORRrCZVwHyN
	vQR6cIJ0Is64mhl/7JmvOi9uO1l9FnXcM+++AZO/zz/ZVjhrZPr6pB/1nR6VlJyGGsyx
	DmO45bTekJMyDf5zwXNtKrmiLTh1yHaceOXe5TbCYRwh8/wcNb96JPcUSGX1/X6jGYXT
	9twZZ6Iv8VMYHUOgZMiQmesiAOmLpEtwy8nt6S5tch0vB8NkW5XzVEyCiTsCtAWAnr7y
	Eh/Q==
X-Gm-Message-State: ALoCoQkKfBhtdMBLDPyoj5r/SYi6fQ0Yl48XB2zETMksqOyEqmhITzhYOS7ANyTsHtKldGyHe9Oz
X-Received: by 10.140.81.112 with SMTP id e103mr21145808qgd.99.1398270296696; 
	Wed, 23 Apr 2014 09:24:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.19.136 with HTTP; Wed, 23 Apr 2014 09:24:36 -0700 (PDT)
In-Reply-To: <CACS+7ZR9BMcn=_cRVswCUSRWuY-QYH-LWXy1aUF-ORK-9HLQYw@mail.gmail.com>
References: <CACS+7ZR=mA9+=NzxF=XLXvxxgypsjzcftZQ0UVWG-0rBLk202A@mail.gmail.com>
	<CAJTo0LaOkcf=EJz9fPWxBBhw+yif2aSJgvWaeiWY0bSSMtNGaA@mail.gmail.com>
	<CACS+7ZR9BMcn=_cRVswCUSRWuY-QYH-LWXy1aUF-ORK-9HLQYw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 23 Apr 2014 17:24:36 +0100
Message-ID: <CAJTo0La_W6n793OfROq237ig_G4KGisyvPJW5AtWPPcUL1GCCg@mail.gmail.com>
To: Dan McGregor <danismostlikely@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] systemd: fix tests when not using gold
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
X-List-Received-Date: Wed, 23 Apr 2014 16:24:57 -0000
Content-Type: text/plain; charset=UTF-8

(re-adding the list)

On 23 April 2014 17:19, Dan McGregor <danismostlikely@gmail.com> wrote:
> Sorry, I should have been more specific. It breaks with Linaro GCC from
> meta-linaro, not the one in oe-core. It works fine with oe-core's gcc.

So arguably this should be in meta-linaro, as it's to fix a problem
with their (presumably, old) toolchain?

Ross


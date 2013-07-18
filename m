Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f177.google.com (mail-ve0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id 868F56B19D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 10:52:42 +0000 (UTC)
Received: by mail-ve0-f177.google.com with SMTP id cz10so2328076veb.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 03:52:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=dcc+nMye3fZ9OECYYhyJIlJLv85f0OZUp9L4eZUbpDs=;
	b=GzEvuPQJetOIMFLA5yfzVHzkEL1CK+ALRsaJ0avanEfO1OihnlEAzizL2lBJdAsiU2
	whdLej0nC0FB+NZyVkIXgRO705lW8gTvN/D4MSeaHeK2D11cMSQRiJqQbvDHHpovVOXh
	pSdLiNt1w4xzNBKNU+ivDdrMLVp42iOf6gxjXxbWs2xtrPA/W/cBznLuwj0UBOe9XhWu
	3k/VkVsS/O3NHSAkikTY+W7xTJjUv9QPkmTtk6rdVN7KIosnctkfAl72xno8ZA9wNnNu
	QR9YEfA2/z5qYeAB1F4Vxd0zz8yVfMW/OVMLtzOiOOVGFQoy2LF8DhOcch0ZYqezFLfx
	aK8g==
X-Received: by 10.58.171.4 with SMTP id aq4mr3734885vec.26.1374144762683; Thu,
	18 Jul 2013 03:52:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 18 Jul 2013 03:52:22 -0700 (PDT)
In-Reply-To: <cover.1374128654.git.sgw@linux.intel.com>
References: <cover.1374128654.git.sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 18 Jul 2013 11:52:22 +0100
Message-ID: <CAJTo0LbSnT2ejbJCjCBUoxVEhjoCPtKMrzt8NMHFEVYb9LGHYw@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQkK3pCSPOxFwA6lxd1ZhmBb0L7hGWh59QNHtYjyVXwd3kF/3dTaD7aEjHZRP+awh98P2h2G
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/40] Review and ACK
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
X-List-Received-Date: Thu, 18 Jul 2013 10:52:43 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

What Paul said, I can't see any other issues.

On 18 July 2013 07:34, Saul Wold <sgw@linux.intel.com> wrote:
>   valgrind: added perl dependency

I presume the situation here is that a target perl wasn't actually
built, so adding an explicit runtime dependency causes it to be built
and therefore available in the feed for rpm to find.

To me this says that the #!-to-dependency magic from rpmdeps isn't
really useful, as we then have to go and put explicit dependencies
back in to ensure the requirements are actually built.

Ross


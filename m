Received: from mail-vb0-f44.google.com ([209.85.212.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UFofu-0006yU-BY
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Mar 2013 17:37:58 +0100
Received: by mail-vb0-f44.google.com with SMTP id fr13so592987vbb.31
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2013 09:20:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=QYVPK+/Kh0NUwyRSa9Oc7E17QZBQAtQ43SPjJQDi448=;
	b=ja6+YALZtLGZUSzVnHIVk72xj0MHIog2urRONAy5Hmk3DAZXzUL9ZzskV4kLrlESHL
	hWOmkWukY3Uq7tZfYHuFnZszDoeNeXPCAJUq7cyp3QEGJK2TtlYYwdKlHHuI5BNOGVI4
	Avt4WKohqwpuDC5kh2xd6TWdexP/B3no35I8HI2AcDYRfb09bE9RSQRULJQC/2/ghXYJ
	lF+umYilbKy5v+NBemPO36HSsTIuQcLO4aICDFYG2K8jmk9o50WozUMLM9fsAvPfF9Bj
	IWK/+B61ILssKdlOsoesuuOLSrlFSpKRVCcwFfkaP4EcfN37zYzFUgALvhUtrKUX9e5y
	8XVQ==
X-Received: by 10.221.2.71 with SMTP id nt7mr6379927vcb.71.1363191628903; Wed,
	13 Mar 2013 09:20:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.232.226 with HTTP; Wed, 13 Mar 2013 09:20:07 -0700 (PDT)
In-Reply-To: <923A8385-1063-4C78-92ED-9441F19E338B@dominion.thruhere.net>
References: <1363010209-18220-1-git-send-email-cristian.iorga@intel.com>
	<1363010209-18220-3-git-send-email-cristian.iorga@intel.com>
	<20130312070053.GE9724@jama.dyndns-home.com>
	<CAJTo0LZtUg+fUrLd6sVfSk1gQrauyq60ukMg5jh-_kcgeaK0Lg@mail.gmail.com>
	<20130312100713.GJ9724@jama.dyndns-home.com>
	<CAJTo0LZdYx9RLJ9an7LnALUOL5PkeUapnrMA5GyiDROcgwXbKw@mail.gmail.com>
	<923A8385-1063-4C78-92ED-9441F19E338B@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 13 Mar 2013 09:20:07 -0700
Message-ID: <CAJTo0Las40Ezm=3St_tJVsVrPP4Aa4+ZLP+wd7ssAAMxGgqVeQ@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnwJOYK1ioBAwUNoFeyeWrd4tOwSJfltXy2FKMZsyYl4gti8QD43NzYe00VjCIYVULMYyrK
Cc: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] bluez5: new package for v5.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Mar 2013 16:38:03 -0000
Content-Type: text/plain; charset=UTF-8

On 13 March 2013 02:14, Koen Kooi <koen@dominion.thruhere.net> wrote:
> At the risk of sounding snarky while making a real recommendation: Why not do it oe-core > style and completely remove bluez 4.x at the start of the 1.5 cycle and work through the
> breakage?  I guess that means I volunteer to help with that :)

Is the world going to migrate to the bluez5 API in six months?  I was
expecting to have to carry bluez4 and 5 for at least one or two
cycles.  We have a similar issue with GStreamer 0.10 and 1.0 - we
could drop 0.10 and port what ships in oe-core, but the subsequent
breakage would cause a riot.

Ross



Received: from mail-vc0-f171.google.com ([209.85.220.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UBOBr-0007GC-4u
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 12:31:51 +0100
Received: by mail-vc0-f171.google.com with SMTP id fy7so1904174vcb.30
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Mar 2013 03:15:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=uLNL/yaU4KKPFVKFcAMtcI6TUL+ommiOpYqgsVZjBm0=;
	b=UdJiP5gDRBAqAtn712c52PCHsDA/Qi1CbHI2TghLQTUiGJmWEzbD/weZvzuvT3SRt7
	b3bVQYvATces2triXpJSJZ2ATlfxxlwSusFouDMSH8Nfj7Q1R8QpPsg0sOS2HuHAcNuG
	htSQ4btnzIQAA9gR6ZmxIIizCu0/X5jGIRjvtaa4qi5LWohPcEDxuednVkvNfX40v/zV
	3skb951ICVKXKHOrxLNTCvn6nlP4Ii0ZRxco/E1a+cLvNEa+j+mDKEdWHGXnGCWjfMac
	9/kl2Aaq7CDqSBJxWtK+mFuUrTqhSzj5Va2vbivhYk3B3X+0QzPTRKOSN3h5fOANiN3M
	/uvQ==
X-Received: by 10.220.149.147 with SMTP id t19mr3848231vcv.36.1362136527492;
	Fri, 01 Mar 2013 03:15:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.219.195 with HTTP; Fri, 1 Mar 2013 03:15:06 -0800 (PST)
In-Reply-To: <512F76E7.9030700@digi.com>
References: <cover.1361427542.git.hongxu.jia@windriver.com>
	<5d8b955ad3645fb9690823db5f16d5b093cfd343.1361427542.git.hongxu.jia@windriver.com>
	<512F76E7.9030700@digi.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 1 Mar 2013 11:15:06 +0000
Message-ID: <CAJTo0La0J2ESEiB0KLbMjiRhxP-i=RwmFwmvPb6wwnf3n4GukA@mail.gmail.com>
To: Javier Viguera <javier.viguera@digi.com>
X-Gm-Message-State: ALoCoQkpASOBGP2vNcx+S0hF+gYW+1xGNG8EJGf2hpAIilnFRIpgN7JNhfFuM/HhzlmtfqkcjUzh
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] base-passwd.preinst:fix creating passwd and group error
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
X-List-Received-Date: Fri, 01 Mar 2013 11:31:51 -0000
Content-Type: text/plain; charset=UTF-8

On 28 February 2013 15:25, Javier Viguera <javier.viguera@digi.com> wrote:
> I was bite by this one [YOCTO #3917] in *danny* branch not allowing me to
> create a rootfs based in DEB packages. Sometimes happens, sometimes not,
> depending on whether 'base-files' is installed in the rootfs before or after
> 'base-passwd'.
>
> Cherry-picking this commit from master fixes the problem.
>
> So could it be also considered for backporting to 'danny' in oe-core and
> poky?

Merged to danny-next, so will be in 1.3.1.

Ross



Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T85F3-00023F-S0
	for openembedded-core@lists.openembedded.org;
	Sun, 02 Sep 2012 10:09:14 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 02 Sep 2012 00:56:53 -0700
Received: by obblz20 with SMTP id lz20so7926638obb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Sep 2012 00:56:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=3Fr70cULgHnUQctSh5/yQVwegHdldbKVDGG2XlX26EU=;
	b=TaL2iHgNlTBqCpWw2Sc00Cq+VJj9Lqmp1HNJmMsuKtD8XbjFKM6U+TEX3dph0Xhej5
	LmVKaoR2Hx4gLzQb7xqniWnz8mthF8S83v46iG9iHfsDoiifKe7kMsVArxlznzVsHfqS
	XjcLGoOtmkmfzNHQBz6xObg5+FxG0t1hNukBeKTfNmth1PyyBSe6l2HnfkXuXve49OUc
	NmimUw34k+UKn8ZKl84AfeeL7l9sD/3ccf+KzDk4HR77K2jYmqeXGhQvgsIbHyaanr0I
	wd6MTFnTYjadxxVS5K+grlvXrVGDBauFd6upVs9fbUVa5GEs931ZdDzgPnD/FDWOT99m
	rsEg==
Received: by 10.60.29.72 with SMTP id i8mr11450816oeh.26.1346572612444; Sun,
	02 Sep 2012 00:56:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Sun, 2 Sep 2012 00:56:32 -0700 (PDT)
In-Reply-To: <5042ABBC.60502@gmail.com>
References: <5037C7E3.9080000@linux.intel.com> <5042ABBC.60502@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 2 Sep 2012 08:56:32 +0100
Message-ID: <CAJTo0LYYFvwD75PsXu2WtC+CvQ2ep0i5bDKZFcNKFyQXwDDGTQ@mail.gmail.com>
To: Zoltan Gaal <z.p.gaal@gmail.com>
X-Gm-Message-State: ALoCoQmSOIXvEAzt/DguTULMX5pp3hqDv2VMqCZPw9PQ58dNiHxUq9PlSTiw9sX5OwKQcdr/0wuo
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mesa: clean up PACKAGECONFIG
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
X-List-Received-Date: Sun, 02 Sep 2012 08:09:14 -0000
Content-Type: text/plain; charset=UTF-8

On 2 September 2012 01:43, Zoltan Gaal <z.p.gaal@gmail.com> wrote:
> I'm new to oe, and I've seen there was quite a big discussion about the gles
> support in mesa.
> Now libgles-omap3 has the mentioned conflict with the mesa-dri as both
> provides virtual/egl. I think a patch like this would solve the issue:

Can't you just set PREFERRED_PROVIDER?  meta-intel has the same
problem with the EMGD and psb drivers also conflicting with mesa-dri.

Ross



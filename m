Received: from mail-wg0-f42.google.com ([74.125.82.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1ULZSv-00086b-Be
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Mar 2013 14:35:33 +0100
Received: by mail-wg0-f42.google.com with SMTP id k13so453449wgh.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2013 06:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=KVImcF84IxkbTtH6dHYe5CaTlze6G9iVdObMW49MOxU=;
	b=emP8+yPwLFbwX2UcZs2ck+PzfCxP/kJqfSb+SiD0OdDQ1/wsOJjn9R2hL4LXL4TTdT
	kAmzDlXiYYbqNYOk2LC4xir8LRTfRMhvHzl3hNiX3yheb4tkDs1Sp4wN2UE1WFR2NOoF
	AreTscyKv5JEK9vjk9ffgvhmUXk+W50EN5/dHQo6NsS/MSS0EreMXG3xiMWGUjFnvLhw
	vwzEW+gDP2tnmLBRfs8sXvm+e0KJHB/UAIJDijGkNy+nMdFD4e0ixg2ZdcYzZNbLWSnB
	LPw2iBqaOKC3HxBP4v0rvTv1nA6RxOnxvhfCSxEULVYeEhkGXZ/Ie5IrQEiqP3NHeg6q
	7WMw==
MIME-Version: 1.0
X-Received: by 10.194.58.202 with SMTP id t10mr3667753wjq.4.1364563109389;
	Fri, 29 Mar 2013 06:18:29 -0700 (PDT)
Received: by 10.194.45.100 with HTTP; Fri, 29 Mar 2013 06:18:29 -0700 (PDT)
In-Reply-To: <CABMQnVKVnoMH1B1Ri-Qmjec30BFX1TaosGq0b1Hc641m3490hA@mail.gmail.com>
References: <1363140541-13440-1-git-send-email-nobuhiro.iwamatsu.yj@renesas.com>
	<969F26A8BAB325438E7EB80D3C3134FB16216497@IRSMSX102.ger.corp.intel.com>
	<CABMQnVKVnoMH1B1Ri-Qmjec30BFX1TaosGq0b1Hc641m3490hA@mail.gmail.com>
Date: Fri, 29 Mar 2013 09:18:29 -0400
Message-ID: <CAHUNapSwkvRWD13RK_x2cu-1Q9CdYSKhw9OQFcek7vYjR0UFfA@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
Cc: Saul Wold <saul.wold@intel.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] alsa-tools: Update autotools.patch
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
X-List-Received-Date: Fri, 29 Mar 2013 13:35:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

I'm seeing this exact same error when I perform a "bitbake world", and
have been for the last couple days

On Wed, Mar 13, 2013 at 9:43 PM, Nobuhiro Iwamatsu
<nobuhiro.iwamatsu.yj@renesas.com> wrote:
> ----
> checking for i586-oe-linux-pkg-config... no
> checking for pkg-config...
> /home/iwamatsu/yocto/alsa/tmp-eglibc/sysroots/x86_64-linux/usr/bin/pkg-config
> configure: WARNING: using cross tools not prefixed with host triplet
> checking pkg-config is at least version 0.9.0... yes
> checking for ENVY24CONTROL... no
> configure: error: Package requirements (gtk+-2.0 alsa >= 0.9.0) were not met:
>
> No package 'gtk+-2.0' found
>
> Consider adjusting the PKG_CONFIG_PATH environment variable if you
> installed software in a non-standard prefix.
>
> Alternatively, you may set the environment variables ENVY24CONTROL_CFLAGS
> and ENVY24CONTROL_LIBS to avoid the need to call pkg-config.
> See the pkg-config man page for more details.
> make: *** [all] Error 1

Is the proposed patch from this email suitable for merging to master?
It allows my build of alsa-tools to complete without error.



Received: from mail-vc0-f180.google.com ([209.85.220.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UPrIK-00066A-Le
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Apr 2013 11:26:24 +0200
Received: by mail-vc0-f180.google.com with SMTP id m16so178296vca.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2013 02:08:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=uAJeG56gox2yCZbArmKPui4JmqnKMpfbWECW6KRnW/M=;
	b=dRERlGQabGn7ZPPPW2vJDsc8sv8r/N1fNpfm+Hc+5mvUBnTNfXZWI0iXTJPwzKGmKy
	j3vBOgSO9LTv6Fd/bxluB5Uiey9k3bjtJqI6v7EVxhlWZDSfZVc9tkdfJxble4ykaEBl
	b+8C87vKnXQRyDDPzgma1V/vtE/CCzIzItR98bJCeoYWcfjU9vZxLSJZvf3NlrH8pcJa
	sTEWL30hd1PJOfiBTccf12mtGJVxYBcutok7zYp4782mzd9CZlaKNIMQlvUnjINEm0Ic
	RBChutigwls68b09MU0LdylE0JNnO6LD40C0TjzetF+ZeY7WB24ueDCGaoYleUfCjO64
	rUEw==
X-Received: by 10.220.155.8 with SMTP id q8mr769856vcw.42.1365584939024; Wed,
	10 Apr 2013 02:08:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Wed, 10 Apr 2013 02:08:38 -0700 (PDT)
In-Reply-To: <B8613191-4B51-4494-8AF8-1ED589E1F54F@dominion.thruhere.net>
References: <1365522501-7439-1-git-send-email-ross.burton@intel.com>
	<B8613191-4B51-4494-8AF8-1ED589E1F54F@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 10 Apr 2013 10:08:38 +0100
Message-ID: <CAJTo0LY-kAChLre8QmMNmHd5t4_-e4En+epTANqQEkeGKHzUmA@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnHM1N81zEg4G0D+gd7ilcW1mCXgotX2vT7CKar6Fbs9xhkWsLBphWWyip8/wwoVxdJvpbH
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd.bbclass: restart service in postinst, not start
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
X-List-Received-Date: Wed, 10 Apr 2013 09:26:25 -0000
Content-Type: text/plain; charset=UTF-8

On 10 April 2013 06:46, Koen Kooi <koen@dominion.thruhere.net> wrote:
> In the specific case of upgrades you'll need to add a
>
>         systemctl --system daemon-reload
>
> to catch changed unit files as well.

Good catch, thanks.

I'm not entirely optimistic about opkg postinsts being able to tell
the difference between upgrades and fresh installs, so I suspect we'll
just have to always do this.

Ross



Received: from mail-vc0-f173.google.com ([209.85.220.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UNSHd-0002mq-3F
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 20:19:41 +0200
Received: by mail-vc0-f173.google.com with SMTP id gd11so1695247vcb.18
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2013 11:02:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=+PMEJAhn8pEsmf+8+qljOzz9lk5zzcMEPD45FXgzfkM=;
	b=anax7GNeMrUXCpfVWXPHSnDOcYSMIFHvsQRQ7r6+qEa2ILkaLFuGTZPSG7jnlw5KXh
	+JjqT1zYDfb0lmaJqDNaoWlvVM/neh1Pr9I68PmVtYaOlPoKcQEC/wOI5RQBlM1UFdvj
	4Ss5uoto0ASNdITwVx6gHlB2vac8M+JzZzz5lZszXRBN5vT5QbaTa8n3wyOro1WduCFB
	cMVHRB6uMEwlJKtwig2S5YWSVwG89hn/2JDKkacACUWRa6GC1rPpeY/2vacUUp3Qz5+r
	HvX+zTHlvfPy/7StBPNNeULPi5gFZozIXDSLYZ/lGs4erp1xxxv+CX3sgRbfc+aXejiS
	UNAg==
X-Received: by 10.52.25.99 with SMTP id b3mr1750036vdg.99.1365012149224; Wed,
	03 Apr 2013 11:02:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.134.74 with HTTP; Wed, 3 Apr 2013 11:02:09 -0700 (PDT)
In-Reply-To: <825B3AFA-0F5B-45F2-B4DE-D359A1E4414B@dominion.thruhere.net>
References: <1365006329-20964-1-git-send-email-radu.moisan@intel.com>
	<1365006329-20964-3-git-send-email-radu.moisan@intel.com>
	<825B3AFA-0F5B-45F2-B4DE-D359A1E4414B@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Apr 2013 19:02:09 +0100
Message-ID: <CAJTo0LbiXC_qKszpNNy5crnpXeGx99Ff9vGzpcXNk4otXgp8GQ@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkwbGOvwKVNKYEY84uN5Bp6ghzZ0+8YG6C0si5Q+lW7YtV4ydCI+8DN8Gs7vaulWY5bAzyM
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] udev: enable multilib support
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
X-List-Received-Date: Wed, 03 Apr 2013 18:19:41 -0000
Content-Type: text/plain; charset=UTF-8

On 3 April 2013 18:58, Koen Kooi <koen@dominion.thruhere.net> wrote:
> NACK! The udev maintainers have been clear that it is always /lib/udev, even on 64 bit systems, so you're not fixing a problem, you're creating an extra one.

Radu, can you do a multilib udev build and see what continues to fall
into /lib64, so we can fix it?  (and the same with systemd)

Ross



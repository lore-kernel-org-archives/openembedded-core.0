Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TgGwB-000782-Mh
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 16:31:03 +0100
Received: from mail-ia0-f197.google.com ([209.85.210.197])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 05 Dec 2012 07:16:38 -0800
Received: by mail-ia0-f197.google.com with SMTP id x26so9788165iak.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Dec 2012 07:16:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=j00DLDcsw29ASBunIJYAukxCnNFPwYIIrEKkXiqQLdg=;
	b=Lpm15WU7LtqdewZL9mv13f5+rLR2bZKjsgSaSzh3aw2anENfUdkX/yN3rjWLURmjzX
	1BKJFcRD0hb1cnNGoWJ7H+Ak9z0jockYVHZ0CsBMheD4Xx4oAGX4Dr4nPfyA9X7fgsQI
	bk8QDHzrONUNS1tmJ/XlaJNxxXdypQ34adIn/oaP6HH7ovCEhb/brw4A/xNLBOxE5xWZ
	6TUrqUd0uM3Vo3gkPI4uzakwNL3k/i5B9ffMxie9ut/kRC2+vaPhWv1BS8gpa9X0vyeF
	5mkXBTvm13BI1H15LN4rspR1uoJqDLCkxgroz9/wF9xzD9BzNW1YZWEqfBehm2+NYQTp
	BABA==
Received: by 10.60.4.226 with SMTP id n2mr14259410oen.63.1354720597548;
	Wed, 05 Dec 2012 07:16:37 -0800 (PST)
Received: by 10.60.4.226 with SMTP id n2mr14259395oen.63.1354720597355; Wed,
	05 Dec 2012 07:16:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Wed, 5 Dec 2012 07:16:17 -0800 (PST)
In-Reply-To: <CAP9ODKr0TG3LRah3rCjwwUCkka=kHW3Ed4LXNpWA+81Eb2t=GA@mail.gmail.com>
References: <1354654683-16793-1-git-send-email-ross.burton@intel.com>
	<CAP9ODKr0TG3LRah3rCjwwUCkka=kHW3Ed4LXNpWA+81Eb2t=GA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 5 Dec 2012 15:16:17 +0000
Message-ID: <CAJTo0LatQogGTmc41DMtyJi3mjtNRqWgX65Xw4AfwNra+37bGw@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Gm-Message-State: ALoCoQl2v6lFYbL+RwuRtdlmlOdYtIjzJvEvz19og5wZNnfN3Cy320Ydo/HLoXADBvEgktBPMp4HxfUvIWwyHZUp88oGvMGaoF+az6OfplXp5Cs8XboZzqMuaR0Ipw+VnkdrE07NTsS5EfOoeyuPX+oplx/zvefk6m6/JbM2usFz1qOd0NzonnvHUYajM4g57u5cSKiLA/29
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gst-meta-base: pull in X11 plugins when using X11
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
X-List-Received-Date: Wed, 05 Dec 2012 15:31:03 -0000
Content-Type: text/plain; charset=UTF-8

On 4 December 2012 21:38, Otavio Salvador <otavio@ossystems.com.br> wrote:
> Would be better to use a RRECOMMENDS on xvimagesink? It makes more sense.

None of the other dependencies are recommends, so are you suggesting
they all become recommends or just that xvimagesink in particular?

Ross



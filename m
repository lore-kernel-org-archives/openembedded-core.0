Received: from mail-ve0-f181.google.com ([209.85.128.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UHtzp-000389-9A
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Mar 2013 11:44:02 +0100
Received: by mail-ve0-f181.google.com with SMTP id d10so226460vea.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2013 03:25:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=LWAXNSgAX59YBanlg14u0DpN3mjOgRmYz7QWocpzNhE=;
	b=bvj6D7FRSHXR0LHU++Ifxb0QjeZir5c1xJc2Bftq6iCJdbE7A/twV7PaXgmAJk9RMY
	W9C8K05A6SxgJVJCTzAI6PY/NNfMfxzjwMNA+erfwh1QjhUukwLKih/i5fJpL+Ss33uG
	H60DZgn/ynsRoSoda1ZxZi0OF64+yUIf4RYZPTnJln2yQfXZ6WsuS9yz+O+zefZLoR8R
	lxEUguYq5aSCiebviX83diT5yi4Cqo4oeH0LqMuZch4RZygkTpQ7m42CEHy2JTA4PWLQ
	JyLo8g2g2p/yQ2nkOMN3SS1bHUVY8dAOojQsTrNz4xbR15EZU1XSd7tMx48Tz18BeodD
	PILA==
X-Received: by 10.220.141.132 with SMTP id m4mr1776834vcu.17.1363688731642;
	Tue, 19 Mar 2013 03:25:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.125.102 with HTTP; Tue, 19 Mar 2013 03:25:11 -0700 (PDT)
In-Reply-To: <007BD92917A2324FA403BCF9A464CF8436F75A5F@ALA-MBB.corp.ad.wrs.com>
References: <1363639611-21822-1-git-send-email-jslater@windriver.com>
	<1363639611-21822-2-git-send-email-jslater@windriver.com>
	<CAP9ODKrk0S1g6TcLxs=iVuv3eBRgZgfhtwSDVaYzJawnAH7rRg@mail.gmail.com>
	<007BD92917A2324FA403BCF9A464CF8436F75A5F@ALA-MBB.corp.ad.wrs.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 Mar 2013 10:25:11 +0000
Message-ID: <CAJTo0Laf2ZxBE34ncKE3rBPhBwGpYmFgwrKzt1WFOC7MHTZepw@mail.gmail.com>
To: "Slater, Joseph" <joe.slater@windriver.com>
X-Gm-Message-State: ALoCoQkkDJIxNPjGEoQjmFbUeDgwPDPl2B/isv1EwTrpUY+rMDeJAN6zqrop5b+Lrj1Lx/znV9X/
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH [v3] 1/1] tzcode & tzdata: update to 2013b versions
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
X-List-Received-Date: Tue, 19 Mar 2013 10:44:08 -0000
Content-Type: text/plain; charset=UTF-8

On 18 March 2013 22:14, Slater, Joseph <joe.slater@windriver.com> wrote:
> Do we not use PR anymore?   Joe

Correct - oe-core assumes a PR Service is being used if required.

Ross



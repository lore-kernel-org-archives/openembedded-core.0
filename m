Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 2A4D5607A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 05:00:42 +0000 (UTC)
Received: by ietj16 with SMTP id j16so54671921iet.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jul 2015 22:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=/ejqWOvCg9olYrXMzV02KrcvVUubt+UBbmzgPQ+lihU=;
	b=qkQciUYwZyr3EGvBwuF10hJkkQ0yLLIcXbCn2r9mWB0xzdW5I7ZkcLqLA7f8Wct4+A
	sCqomocU7CX7sYHGSMG5Gx3tll+DURiAd7FTetlBTppTktn6fitB2gUCerMteFhw4jFJ
	Aia2CNss92Ri16CMExjzHDMktw86T4yZ3oWQqFImuUvKIS+ikDhT/K5oV6B3+2azbyk3
	5GRG+7SSpkSspssoDtvN7PFL5AAu4xp9sucJD+lY7fCIBDKnMfuD3G2iEDCgjIdPs3IC
	ktjrHKIMASY5Ud3xAjAbdZBD38H3oyoGJUqeCiQYC6pHX3OvcmenXNoniWOAJlpPSqgo
	qAEA==
X-Received: by 10.107.4.6 with SMTP id 6mr19102701ioe.49.1436763642719; Sun,
	12 Jul 2015 22:00:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.20.83 with HTTP; Sun, 12 Jul 2015 22:00:13 -0700 (PDT)
In-Reply-To: <1435641416-2577-1-git-send-email-rongqing.li@windriver.com>
References: <1435641416-2577-1-git-send-email-rongqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 Jul 2015 22:00:13 -0700
Message-ID: <CAMKF1sqH-54HT9t7VoRX_0AkRw6CQN2CHG-pHCfnqY0YXQYhbw@mail.gmail.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: fix systemd-udev-hwdb-update service
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
X-List-Received-Date: Mon, 13 Jul 2015 05:00:43 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 29, 2015 at 10:16 PM,  <rongqing.li@windriver.com> wrote:
> This patch achieves the above goal by setting CondistonNeedsUpdate to
> "/etc/udev" in the service file, and creating /etc/udev/.updated file if the
> postinst succeeds.

will  /etc/udev/.updated get packaged automatically in case of r/o rootfs ?


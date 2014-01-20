Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f174.google.com (mail-vc0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 1246E6D14A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 16:49:48 +0000 (UTC)
Received: by mail-vc0-f174.google.com with SMTP id im17so2889074vcb.19
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 08:49:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=0ya9mHvLXRJZIo2+CFMtj/btRfZ9OY6/iY/gHxUpt+E=;
	b=hDdTZxsE31cD69xof5IwHOnDwmlRcPqVOCib4ucaZb1HiAC22qMWFT6Ja+i5Hg2Oq8
	cVu8IHlKBnytpYVf7lexFC8i8+AnVnBoXIsOp+udc8fNFI0WqdpWVv/Nl1xkFWEDJ4V1
	e1gx9WrH6JMrpyU9sktOgyahFn3zy6IHQYsJ6fXku3GBNNFra9J6zY+CGoEJzveijHne
	Duc3eiGvqQN+ZJpYB6cWTapM4KoVwhj8TKSrmqagQ5b7Kws/4+yYS4GiBrnJXhZQr5Ft
	BrTRsbbl8lmRzTbXJHnBfbAg/J5huQr71uVXGSOnXtv73xW152jAdfL2yar1wPYyk+Jx
	xbcg==
X-Gm-Message-State: ALoCoQksrVIccXQ3iW12EMjSZIZb+uq0S8n/nw8r8CyVnYZbaotXWiZiHqvzifd8Z/JOKMdpPC4W
X-Received: by 10.58.4.138 with SMTP id k10mr11211536vek.8.1390236589774; Mon,
	20 Jan 2014 08:49:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.96.84 with HTTP; Mon, 20 Jan 2014 08:49:29 -0800 (PST)
In-Reply-To: <1390236004-18570-1-git-send-email-koen@dominion.thruhere.net>
References: <1390236004-18570-1-git-send-email-koen@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 20 Jan 2014 16:49:29 +0000
Message-ID: <CAJTo0LZ2HFJ1QAyRYW9XXOrkttW5UOenkuFK29Z_R9si4sJCRA@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH] kdbus: add git version
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
X-List-Received-Date: Mon, 20 Jan 2014 16:49:50 -0000
Content-Type: text/plain; charset=UTF-8

On 20 January 2014 16:40, Koen Kooi <koen@dominion.thruhere.net> wrote:
> This builds the kernel portion of the kdbus implementation. Userspace support needs systemd git and/or a special glib-2.0 branch.

As awesome as kdbus could be it's very much fresh code, can this live
outside of oe-core for now?

Great to see it though, presumably you'll be making recipes for
systemd/glib?  For what it's worth you might find
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=ross/gtk3git&id=fc7c87f1f038f7b816318e2102ecb1c67ec50065
useful for the glib part after changing SRCREV (been meaning to send
that in for ages).

Ross


Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f51.google.com (mail-pb0-f51.google.com
	[209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id 507596A5B4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 02:06:18 +0000 (UTC)
Received: by mail-pb0-f51.google.com with SMTP id um15so7887372pbc.38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 19:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=ffnfHZLaUK4fpHT1UuZK/Pvi0dQAZl1OKPpQNPZCphs=;
	b=daAUCekS2DqXSqEQu0w+Zdyyd/gCw7QqtwV8Yu6O9PfKexxvwRhkBkZg6nlbRRYq35
	/Bv/DIt3g8rdwDwf4dAVKUa7qUeSYqRTHzGKxy7XCx93KkiadRgGHcrVkwcaYNlloDTG
	L0UqspcaWQk6IzMlh+fIqEzjoHKszu81irOOED8dIzJPT1ePNBlGKor1S/Yzv+tZdIpU
	8vhssgGQACobAg49fWcYtN0aG60ZWCKz8mSh9HlJHsTniXUASo0KiHBCPxGYbWoc+AFn
	8P8N9MDlsbn0WjvzkmUy5oc14fnnWf9Q2MIhB2ym9cQBmk4E6ON0zy9ENhxNDBdiKWsA
	YNyQ==
X-Received: by 10.68.101.34 with SMTP id fd2mr1335272pbb.137.1370916379238;
	Mon, 10 Jun 2013 19:06:19 -0700 (PDT)
Received: from [10.32.109.148] ([12.250.97.26])
	by mx.google.com with ESMTPSA id v7sm12379495pbq.32.2013.06.10.19.06.18
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 19:06:18 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1370009480-32681-1-git-send-email-marcin@juszkiewicz.com.pl>
Date: Mon, 10 Jun 2013 19:06:17 -0700
Message-Id: <E947360C-AE06-42E4-AD51-2DA926D1448D@gmail.com>
References: <1370009480-32681-1-git-send-email-marcin@juszkiewicz.com.pl>
To: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC] get minimal rootfs to be even smaller
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
X-List-Received-Date: Tue, 11 Jun 2013 02:06:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On May 31, 2013, at 7:11 AM, Marcin Juszkiewicz =
<marcin@juszkiewicz.com.pl> wrote:

> First hit: pci.ids.gz and usb.ids.gz ~350KB in total.

udev just RRECOMMENDS  usbutils-ids pciutils-ids so how did it get into =
build time dependencies to begin with ?




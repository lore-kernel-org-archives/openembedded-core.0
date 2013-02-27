Received: from mail-oa0-f46.google.com ([209.85.219.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UAiRG-0004K2-6g
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 15:57:08 +0100
Received: by mail-oa0-f46.google.com with SMTP id k1so1262090oag.33
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2013 06:40:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:message-id:subject:from:to:cc:date:in-reply-to
	:references:content-type:x-mailer:mime-version
	:content-transfer-encoding:x-gm-message-state;
	bh=MZFt0eg3mtf9AQ1N9BFCvyM03XqnZ7GgjKI4mv5s02U=;
	b=BD3sf79ixqo9uwMaDoUOvoMnsfIPBnkZT2HOgEsv8IPGPHVHcrYwW2HlqyScONy5gs
	TPsyj5Hy0gAlbfCJaonRANfJLbhWM5Y8OzZqpbU+5C6p02kiIkpDg6JGhdwURviYreyW
	7IEGor4Exol4fTKSPbIPwiSnzkhRjWCLS9Km40toLhetxVTnAqH3dqei2sPz3EQuRQT5
	d33Evnj8CBo5M5HsjOJmsUQPw2e/Zz37ZMoz87qPZYgg8U/zX6aXPxqLKYxUoPRgpq7+
	msBd0JGShT1n0/V8V2WOoe/m7Q+kyZlGn1CCak0y47fQBmHa2qnqmAMtKq99USZkia+D
	W6rw==
X-Received: by 10.182.2.132 with SMTP id 4mr2361780obu.42.1361976036683;
	Wed, 27 Feb 2013 06:40:36 -0800 (PST)
Received: from [10.0.1.95] (adsl-68-88-197-100.dsl.rcsntx.swbell.net.
	[68.88.197.100])
	by mx.google.com with ESMTPS id v8sm8303046oea.4.2013.02.27.06.40.35
	(version=SSLv3 cipher=RC4-SHA bits=128/128);
	Wed, 27 Feb 2013 06:40:36 -0800 (PST)
Message-ID: <1361976034.1809.4.camel@rrMBP>
From: Koen Kooi <koen@dominion.thruhere.net>
To: Ross Burton <ross.burton@intel.com>
Date: Wed, 27 Feb 2013 15:40:34 +0100
In-Reply-To: <a4ec8dc8fcdaa379c4abe77debb003ad49f1115d.1361974597.git.ross.burton@intel.com>
References: <cover.1361974597.git.ross.burton@intel.com>
	<a4ec8dc8fcdaa379c4abe77debb003ad49f1115d.1361974597.git.ross.burton@intel.com>
X-Mailer: Evolution 3.6.3 (3.6.3-2.fc18) 
Mime-Version: 1.0
X-Gm-Message-State: ALoCoQm9Gve9gC4eb+z8ZoXvLzaGKGYhCDkfTVQd8LZJSTMATUiieP03fm0hra15gcFagFv8QQVq
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/7] systemd: don't recommend IPv6 kernel module
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
X-List-Received-Date: Wed, 27 Feb 2013 14:57:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-02-27 at 14:17 +0000, Ross Burton wrote:
> systemd doesn't need ipv6 support directly, so don't pull it.

It will trigger an error on startup, which seems to scare most of my
users :(




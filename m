Received: from mail-wg0-f46.google.com ([74.125.82.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1U61X6-00049d-6A
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Feb 2013 17:19:44 +0100
Received: by mail-wg0-f46.google.com with SMTP id fg15so1986630wgb.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2013 08:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=GFUxEM1cge5WeZu+hd4BfJ7NYDu+wHMgiw/PdQfuWmU=;
	b=O2N06vVm1B01UhGifqU4dq4S49cd93n81/LcbIaeySfB7Eq/WLxIx+E6ik6Ros4U4V
	FC861Cv2BNcDZr2MqvitNg93dDiWhhzajRvVGv9wSINzdKn4K5mGz8t2XcKJqxzJ6570
	B77n6D9T3HuCCGvMqEdgkUnVrAYT7D15EfQYaynW3wnapvJJ/kxK6H/bKGHMPpsawJ6G
	hsAY7OrYgyjxoBD4wCx5ryz2bmiZ3Ud0ZT8X3RUB2bJbW1L1vqj2TUMBjil7P/zXdO2b
	HMdbeVW9q41csWJaNfw8MUx1XFx+EB206TxpbJ/x0isMOjsmMe1ypnsdEKXen9k6m//t
	APoQ==
MIME-Version: 1.0
X-Received: by 10.181.13.175 with SMTP id ez15mr329262wid.8.1360857794530;
	Thu, 14 Feb 2013 08:03:14 -0800 (PST)
Received: by 10.194.36.228 with HTTP; Thu, 14 Feb 2013 08:03:14 -0800 (PST)
In-Reply-To: <CAJTo0LYfTJh0XrEi94s4AAyXVFa6X9SPdBiEh4H7VZHr1ZVVPg@mail.gmail.com>
References: <B57A220D1EE1644685BA9AD5C790D20526BE046387@SOUTHSIDE.devonintlgroup.com>
	<CAJTo0LYfTJh0XrEi94s4AAyXVFa6X9SPdBiEh4H7VZHr1ZVVPg@mail.gmail.com>
Date: Thu, 14 Feb 2013 11:03:14 -0500
Message-ID: <CAHUNapR_kFzEK04GVk5J3+BRZhyU3hMBxOUTiFrDHZ1iypshVQ@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: state of systemd in oe
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
X-List-Received-Date: Thu, 14 Feb 2013 16:19:56 -0000
X-List-Received-Date: Thu, 14 Feb 2013 16:19:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

Just out of curiosity:
- will systemd be the default?
- will it be possible to still use/choose sysvinit (i.e. is sysvinit
going away)?

How does systemd fit in with busybox? My understanding is that busybox
has its own init system. If someone enables/chooses systemd, does it
disable busybox's init from being built?



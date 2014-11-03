Return-Path: <lpapp@archlinux.us>
Received: from mail-vc0-f170.google.com (mail-vc0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id E7A2165DEB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Nov 2014 17:29:15 +0000 (UTC)
Received: by mail-vc0-f170.google.com with SMTP id la4so4970983vcb.15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Nov 2014 09:29:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:date:message-id:subject:from
	:to:content-type;
	bh=IZBN4TYS7GgRXM4NvL2XYmTALOFX14zT6b3Mle6pTnQ=;
	b=DjYNUp3XELjCKLejk7eFBefmkt8fP7nOWxYP/pImJjJ8vlEvGHW+uPW7N7aZ8UUdAx
	7VmbLcE1t4jvquhLfpHIkQiEKviHkn/SEo9Qn8h+JeCiZIz1nAX5kI0CVEoKTs37t6f4
	V3kgi8KLB0C1NDvEh+fbsiTiZ4k0pAkwnT9wtiSv7O6ZsjsFw0utpTeEav8cw8OAoHAw
	btgTFfycgB3OuFtlaG0l8P6aqKSZQpjRKKz4e2spqtlwh5r3A9DcQ/1N4VV7BeeGh7NU
	/CydD67viUP8trMClmN0xtq/erxoHS9IlMjSKBe5fzM/10RtFO5sQvn5b22Lkgfhh3GZ
	rMhw==
X-Gm-Message-State: ALoCoQnEX6jWVj8n3wDTzQtIGF1LQ9d+aqt1OzBR/XiBu9smYX3Eq9quVQY+LShxNVA6SeyZ9jEE
MIME-Version: 1.0
X-Received: by 10.220.138.81 with SMTP id z17mr532918vct.72.1415035756183;
	Mon, 03 Nov 2014 09:29:16 -0800 (PST)
Sender: lpapp@archlinux.us
Received: by 10.31.188.132 with HTTP; Mon, 3 Nov 2014 09:29:16 -0800 (PST)
Date: Mon, 3 Nov 2014 17:29:16 +0000
X-Google-Sender-Auth: -HF4Kw4Aoou9vcnL5M16ED30ab0
Message-ID: <CAOMwXhPbXCQ7ui+J0a8ryekeq5Yy5EXdgt-Qr26Z9w74=vyD5w@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Specifying 32 bit dependency for 64 bit software
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
X-List-Received-Date: Mon, 03 Nov 2014 17:29:19 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

we have a tool that we run during our make run, but this tool is
hard-coded for 32 bit. It depends on software like ncurses. I could
add ncurses-native in an ideal world; no problem.

The problem is that my host environment is 64 bit currently and it is
not possible to migrate the whole environment to 32 bit. I am happy to
explain the details if needed, but I would love you to trust me about
that. =)

So, is it possible to say more than just DEPENDS = ncurses-native,
something like DEPENDS = ncurses-native:x86 or something?

Cheers, L.


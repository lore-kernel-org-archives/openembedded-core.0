Received: from mail-ee0-f45.google.com ([74.125.83.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1URmhk-00006m-B6
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 18:56:40 +0200
Received: by mail-ee0-f45.google.com with SMTP id c50so2292718eek.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 09:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=FUkvGfQxAcgIAesORyFxpGp9lCGnJ+sAkNCtQnoBZmU=;
	b=WkRtfoW86k6jb/dwobP02PWBpK1aacM5WWQTPPTZbj0XczL92Z7OGUArZ+cZDZl2fg
	jZjmvE/8RuCStvsfg65UhovOptKNRdvX11DuWhpfFLOblQBeHS4fHIzKwnUbhRm4wlX9
	qbTG8u63Oqmh0mDl8k1nddDeOn2bcYHEyxBQbdMwYGc/pkJquqbItdqqB/+IhHgQKL3X
	W9ZzW9LbSyrSPkR253R9DabcxJTo9SdTNoAmT4lEM3ekyl+i/iydJgQlk/619RJP0cyM
	E3ePyAYszDqqNki/tf5Fb+TwhQPW12Xmwq/CawkKkOa0/VSJ7pCiG5rmu4xxHwbFQt9R
	IiPA==
X-Received: by 10.14.5.137 with SMTP id 9mr59209980eel.30.1366043943522;
	Mon, 15 Apr 2013 09:39:03 -0700 (PDT)
Received: from [172.20.0.100] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id b5sm27641938eew.16.2013.04.15.09.39.01
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 15 Apr 2013 09:39:02 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LYOO8c25RRhX-qpOjJCuyJiALqc1tt=SXq5kg=t0QQPQA@mail.gmail.com>
Date: Mon, 15 Apr 2013 18:39:03 +0200
Message-Id: <164CF406-7A27-47B1-8ABA-D4789B3BEB9C@dominion.thruhere.net>
References: <CADV-EXHFSOppcEJezD_OEUFF_Xo=c9J=560ssn5J=WKAj2x_+w@mail.gmail.com>
	<CAJTo0LYOO8c25RRhX-qpOjJCuyJiALqc1tt=SXq5kg=t0QQPQA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQmwn6S+a4QPDxNrhu0qLdHoNm1uA1RUpgKCS0qW71fnfKb804hAjNZE8bjEIq63f7gJdFrn
Cc: Yevhen Kyriukha <kirgene@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: psplash and systemd
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
X-List-Received-Date: Mon, 15 Apr 2013 16:56:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 15 apr. 2013, om 18:24 heeft "Burton, Ross" <ross.burton@intel.com> =
het volgende geschreven:

> On 15 April 2013 17:16, Yevhen Kyriukha <kirgene@gmail.com> wrote:
>> Is there a way to display image with progress bar during boot (using
>> psplash) with systemd?
>=20
> Theoretically yes, but this is one place where there isn't any
> integration yet.  Systemd has native support for the plymouth splash,
> so abstracting that would be the way forward.

There's also 'dietsplash' in meta-oe, haven't tried it in a while, but =
it has native systemd support.




Received: from mail-vc0-f181.google.com ([209.85.220.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U3m5S-0004yl-GS
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 12:25:46 +0100
Received: by mail-vc0-f181.google.com with SMTP id d16so2258247vcd.40
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2013 03:09:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=+coMpL0cLKXAOVNPOhE8SEu0dbA6uloe2KsLtSuDY0I=;
	b=Fp9xg+EGW4IoV2WucqzcrjHvJkOvwBK0Y33Gb3VrqCjLSARk2O5uEV2c6PxtJo7lzV
	0o5gP2YCokxOubssb2MyrG17m4qRST31vThqASk0iAgMF2yJ/b+6uyOsSlkAdhaJrNDf
	s3Eud+uHI6SPqCrUbUfpQuafmZ9wBgJejqzKi/ypvKghMTJria+SsgEwBHFXgU3iuNa7
	K0B5rrbFoNEKvaDtQIZKbZHM8I+lplE7kzbvu3p0KvqTEMk7AnY7g/xJrKhpMSbooYz9
	JE0fqkTiRKMwyss4tCbCRKNck1qoasy2haAsdlhEuUyoIb7RovrC17XDiOMjKIJd1Yab
	OY/A==
X-Received: by 10.220.116.5 with SMTP id k5mr5952912vcq.55.1360321792476; Fri,
	08 Feb 2013 03:09:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.66.193.225 with HTTP; Fri, 8 Feb 2013 03:09:32 -0800 (PST)
In-Reply-To: <20130207193943.GO27288@xiaoyu.lan>
References: <20130207193943.GO27288@xiaoyu.lan>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 Feb 2013 11:09:32 +0000
Message-ID: <CAJTo0LaDwgAyG0AjCWC4G3634KEV6rbHBZLsAcemYvB9UK=agQ@mail.gmail.com>
To: Holger Hans Peter Freyther <holger@moiji-mobile.com>
X-Gm-Message-State: ALoCoQn9eRzwM4ih6D1GYrfHxKfJ95rAR+/N/TLhq5Qm3O8iZ7fcd36Eez2ERIuBD26Qw0CtVuqw
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd_197.bb: Point to the place where we keep the /etc/rcN.d files
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
X-List-Received-Date: Fri, 08 Feb 2013 11:25:46 -0000
Content-Type: text/plain; charset=UTF-8

On 7 February 2013 19:39, Holger Hans Peter Freyther
<holger@moiji-mobile.com> wrote:
> By default /etc/rc.d is searched by systemd but we will keep rcN.d directories
> inside /etc.

Acked.  I just noticed this was the simple reason why -sato doesn't just work.

> -PR = "r2"
> +PR = "r4"

Drop or r3, please.

Ross



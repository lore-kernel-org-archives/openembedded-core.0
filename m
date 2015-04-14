Return-Path: <anders@chargestorm.se>
Received: from mail-la0-f44.google.com (mail-la0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 4933673505
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 06:21:04 +0000 (UTC)
Received: by laat2 with SMTP id t2so126803laa.1
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 23:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:organization:user-agent;
	bh=CLBzHbxLxyZJz7uC1dkiZUAkdL6dZkLnyI6XJL7xENw=;
	b=Z8IuTLgbg+rt+WKVADvKueG/R1k4sfDSYJy5cN7c4GKk1KQLTFmccOcThbHCASZIdQ
	n9X/liNxqm14jHyfmkEXYQw/U+6rEnnB1OkoyF5O775yTpqYAoKkm+48w/hsoljCHD7Y
	75bXTkWm5OTuLB99RsJMWRaPEnaKO8Zn0LsamXlcT+FPLF74SG8oBmizU9mP5YqIN7lb
	MEnfN5MOOXFfu4d17b43FxOnlIN9KBuYQBD5VjEs8cUo4wdlx/Cczd/ox0Ipl3jXUtrV
	5qv8q4dUEf9tAEVYgNynYi6czlJ2IJr6aKdEKiUSxy9TmQv3AmBaAAKeTwl8Di0U/8le
	oQEg==
X-Gm-Message-State: ALoCoQni+gYIBPRCLE79raZ0DPHY1x6qLrxRHtK6XjcETQQPug//fdYz1sj+eJmFRTCBC4XKQjfI
X-Received: by 10.112.199.195 with SMTP id jm3mr1602858lbc.38.1428992464108;
	Mon, 13 Apr 2015 23:21:04 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-219-84-no126.business.telia.com.
	[213.64.219.84])
	by mx.google.com with ESMTPSA id sv2sm1387lbb.22.2015.04.13.23.21.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Apr 2015 23:21:03 -0700 (PDT)
Date: Tue, 14 Apr 2015 08:21:01 +0200
From: Anders Darander <anders@chargestorm.se>
To: Janne Karhunen <janne.karhunen@gmail.com>
Message-ID: <20150414062101.GA11904@ad.chargestorm.se>
Mail-Followup-To: Janne Karhunen <janne.karhunen@gmail.com>,
	Openembedded-core@lists.openembedded.org
References: <CAE=NcrY2Y3dmF5qmfS1=QXcE0k1OOX8GdWMo7PDZ+W348ZSxaA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAE=NcrY2Y3dmF5qmfS1=QXcE0k1OOX8GdWMo7PDZ+W348ZSxaA@mail.gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: compiling the host tools natively for the host Linux?
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
X-List-Received-Date: Tue, 14 Apr 2015 06:21:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Janne Karhunen <janne.karhunen@gmail.com> [150413 17:44]:
> Is there a way to compile the host tools (primarily interested in the
> compiler) for the host Linux rather than for the own distro? 

Could you explain what you're trying to achieve a little bit more?

Which computer do you call host Linux and which one is "own distro"?

Is the build-machine the host? Is the target "own distro"? If so, you
need to look at generateing an SDK. (Prefebly, `bitbake <image-name> -c
populate_sdk`).

> I'm comping the toolchains & sysroots as RPMs and the relocation of
> the toolchain from $RPM_BUILD_ROOT is a bit painful due to the own
> distro being used to run them. I'm doing that in RPM %post with
> patchelf & chrpath, but it is getting hairy.

I'm not really following what you're trying to achieve...

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB


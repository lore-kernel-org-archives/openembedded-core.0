Received: from mail-vc0-f182.google.com ([209.85.220.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UBZCv-00015o-TY
	for openembedded-core@lists.openembedded.org;
	Sat, 02 Mar 2013 00:17:42 +0100
Received: by mail-vc0-f182.google.com with SMTP id fl17so2305139vcb.41
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Mar 2013 15:01:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=oX6Wt6EOcDrcMzzUTlkbgioytA1tT0W9qeEfRruAhyA=;
	b=GIJMEhyrwdOZbUZUHo/Hxw4Dl5S1EQxz4YBHNKbU9zFhvKDO/gMCaScBLpVUY4BBmj
	JVyM4Mph3oifUESO0vagJuhSvdjk/EXQ5IzbnHl+UKIAo53bMdCxTcMMQvBGqt6WW8f/
	EZK/hvChP3Zpdcq+y1PA0U3WQLc3i22qcVg65gw8iNZSF8ASrKC3qzJAowtt/5qpvmKv
	GoDtmjuBPqNqHNsuRZTEP4zHqMLv0nfe0hfqVTw+6mIn1QNvlm45hK0cp+UNZUMTS4Ac
	nkqJvYAPNwaNUQwOmuz+qlrsMRj8iprgs3JlYqRkbSarR2R4YWV1IjjT6jLohHBUvbg8
	oybA==
X-Received: by 10.52.69.74 with SMTP id c10mr4140048vdu.3.1362178877034; Fri,
	01 Mar 2013 15:01:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.219.195 with HTTP; Fri, 1 Mar 2013 15:00:56 -0800 (PST)
In-Reply-To: <1362086096.2588.77.camel@empanada>
References: <cover.1361976853.git.tom.zanussi@linux.intel.com>
	<4a4c5cf843e4c4ff22843b8e6097786e88a06bd1.1361976853.git.tom.zanussi@linux.intel.com>
	<512EDDE0.2060907@linux.intel.com> <1362026705.2588.33.camel@empanada>
	<512FA8B6.4030909@linux.intel.com> <1362080697.2588.75.camel@empanada>
	<1362085289.5119.119.camel@ted> <1362086096.2588.77.camel@empanada>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 1 Mar 2013 23:00:56 +0000
Message-ID: <CAJTo0LZ+5_sGwBZ=Ki8KHyp9J_RH9_PBKnVVU5exT3stO3Wqrw@mail.gmail.com>
To: Tom Zanussi <tom.zanussi@linux.intel.com>
X-Gm-Message-State: ALoCoQm74k4180+pUsgLQL7+ee0XMr6hnW2iKuElS1qnHfYOmW6fYsOzwynkc/723EogFL3kqllQ
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] libaudit: new package
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
X-List-Received-Date: Fri, 01 Mar 2013 23:17:43 -0000
Content-Type: text/plain; charset=UTF-8

On 28 February 2013 21:14, Tom Zanussi <tom.zanussi@linux.intel.com> wrote:
> OK, thanks for that info.  I think I have enough to go on to try to turn
> this into something upstreamable now...

Interestingly it appears that if you can mandate a new-enough automake
you can actually override CC per-target these days, which does make
things a lot easier.

Ross



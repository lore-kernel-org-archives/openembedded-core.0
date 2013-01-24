Received: from mail-ia0-f170.google.com ([209.85.210.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TyVJk-0005KG-Bc
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 23:30:44 +0100
Received: by mail-ia0-f170.google.com with SMTP id k20so5576544iak.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 14:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=VRcdURS+bPvdnlLCucEmAmIEo8pZhj9OeTNaU8HzjnA=;
	b=Cbc3IRRBwArXFBaNYPVE4O374zUK64VWufXZor54gQ/lp7DUZWDO39gqbiYuQ7JAdF
	1FoK2AwFAyuvktRjvHupuSMWWbwBLQlRKwo1sMjyPjBu8e9senqTqiwfdUllT4IeMFr0
	0XiJnQHRkeFT16n81SNahuygJhzBTUFjSZ07yKs+wUG2pWp6sVwX2dHt1cClg+D+4Gnj
	p0/0ESbl8+fLNX3KX7qYc5O+UTIwu+TxyMLzRERJjQawqyMQpDLzIImJ5Vsr8j8f1XCv
	VfvY+w4odo3NBzfTAM3kVncdzfkY630I6yJ8sz9d03jFwbKHuofHjvuOyTVhRK1UU7ce
	005Q==
X-Received: by 10.50.151.211 with SMTP id us19mr2558768igb.84.1359065710096;
	Thu, 24 Jan 2013 14:15:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.18.169 with HTTP; Thu, 24 Jan 2013 14:14:39 -0800 (PST)
In-Reply-To: <1359064215.3616.20.camel@ted>
References: <cover.1359061155.git.raj.khem@gmail.com>
	<2ba0f6007c1a72e2ee249a47610003031f6c1079.1359061155.git.raj.khem@gmail.com>
	<1359064215.3616.20.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Jan 2013 14:14:39 -0800
Message-ID: <CAMKF1spCF8ZQ86skFu_V0PHy7_r4n=h3d_6cNF5t3-x36dkoRA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/11] libpcap: Add missing libusb dependency
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
X-List-Received-Date: Thu, 24 Jan 2013 22:30:44 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 24, 2013 at 1:50 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Do we need libusb support in libpcap? What does this dependency buy us
> and couldn't we force it off instead?

its needed to support canusb in libpcap, I would say yes we should
support it but disabling it would be ok too although all my builds
were silently using libusb so I think unknowingly may be but we are
already shipping with canusb support.



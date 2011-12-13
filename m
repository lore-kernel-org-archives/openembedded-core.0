Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1RaQds-0007IT-Sa
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 12:35:28 +0100
Received: by faaa20 with SMTP id a20so49658faa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 03:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=2Cm5v0fz+RC3ZFg2BqryMhRoRQ/ziMZNlAeI1pLwc/Y=;
	b=O/XwDBVeJ7kF5CHihX8ZvJmTMCF3iUnE9/3qF2ZV3ePQ7etLsy1cuxEW1aZm8gWRFZ
	F7KgfM+Fws8eoKhDvT+Sgt2WKJCLK4JBcUnftBQA5LzcaFRWCHT5sjVRbxWD4kFMF2IE
	738vTYa9kVfgtN0sJGyHZtfxj5LF8XjWkpf/o=
MIME-Version: 1.0
Received: by 10.180.104.41 with SMTP id gb9mr33410884wib.9.1323775713638; Tue,
	13 Dec 2011 03:28:33 -0800 (PST)
Received: by 10.223.69.133 with HTTP; Tue, 13 Dec 2011 03:28:33 -0800 (PST)
In-Reply-To: <1323771701.2731.43.camel@ted>
References: <CAGiJk9cfqfhg6DqY4hMBVXnABaCw1Ff9Gbojoa1B=+TvWvU9DA@mail.gmail.com>
	<1323771701.2731.43.camel@ted>
Date: Tue, 13 Dec 2011 12:28:33 +0100
Message-ID: <CAGiJk9eeFGqwtTmbasesoZ5NP_kv2QR6pZJ4xQTqWm4O7X_QOw@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Dependency resolving ignores changed sstate-cache?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Dec 2011 11:35:28 -0000
Content-Type: text/plain; charset=UTF-8

2011/12/13 Richard Purdie <richard.purdie@linuxfoundation.org>:
[snip]
> Usually the above is a sign of a dependency bitbake has not been aware
> of. Could you see which .ipk has the dependency on fbset?

It looks like this is the ipk:
| Installing qt4-x11-free (4.7.4-r33.3) to root...
| Downloading file:/work/oe-core/tmp-eglibc/deploy/ipk/armv7a/qt4-x11-free_4.7.4-r33.3_armv7a.ipk.


This article may be related?
http://labs.qt.nokia.com/2009/11/20/building-qt-to-make-use-of-the-beagle-boards-sgx-gpu/

--
Regards
Samuel



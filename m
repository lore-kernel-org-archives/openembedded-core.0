Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 04D7C724A8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Dec 2014 07:43:39 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id em10so722024wid.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Dec 2014 23:43:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=TUkXvkRCh1f8P6XCdsr+sYTB7OVGBYtp/RLt4fvOl/E=;
	b=RvVvXUYgYnpj721zRJDgBFpPBGfxjJOzIbXXd0xfTT22kg+4ZyvBx19tymEaHXNJMU
	un5/ykED7ePwFh9b7btwvSlUqZ8L2cVnXJRbPI+pGl6eQ0Y3GlnzqVU5hDvveSoiPTCV
	enAl6BzoI9he1DsogdKATd+JycVbW3tX1ve2bbxaZMwi5RiBCDEbr5mNm4vCmujivyLu
	soHYAxQheYHDbyYX2JAXtl1nLnYtyhVyWMTFD2maHYBme5sOmb62JNXPUTsYqwT7ZWvC
	w9TBFgE7063Q4LsCNE2uxOLKDzvgEWxcV8dCpcsfnTJk6ab+odJqfGqevtDjF/9qUYlU
	2NIA==
X-Gm-Message-State: ALoCoQltJE1G0x2g83adqUqcPE8/3yRqboDti7Bf/FG+qY58Fzv/nF8Sm53vPwgNOu6qnGGYACJp
X-Received: by 10.180.126.37 with SMTP id mv5mr29473445wib.2.1418111019548;
	Mon, 08 Dec 2014 23:43:39 -0800 (PST)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id w10sm611655wje.10.2014.12.08.23.43.37
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 08 Dec 2014 23:43:38 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <5485E88E.6060500@linux.intel.com>
Date: Tue, 9 Dec 2014 08:43:36 +0100
Message-Id: <130725CD-9861-409F-9E1D-19F0B1D9FEFC@dominion.thruhere.net>
References: <1417851531-3540-1-git-send-email-sgw@linux.intel.com>
	<FB5AD677-B717-4E86-A600-524D77A13F09@dominion.thruhere.net>
	<CAJTo0LbKLrmVNiMs4oBvq1rbVhjCCdzR0CHgy2sJjRrb5uRj8A@mail.gmail.com>
	<5485E88E.6060500@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1993)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHi v3] procps: Upgrade to 3.3.10
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
X-List-Received-Date: Tue, 09 Dec 2014 07:43:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 8 dec. 2014, om 19:06 heeft Saul Wold <sgw@linux.intel.com> het =
volgende geschreven:
>=20
> On 12/08/2014 05:46 AM, Burton, Ross wrote:
>> On 6 December 2014 at 14:37, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>>=20
>>> If you feel bored, there's a stray backslash in DESCRIPTION and the =
'+=3D'
>>> for EXTRA_OECONF can be a regular '=3D'. Next time I'll try to catch
>>> everything in one go :)
>>=20
>>=20
>> I thought a v4 was getting silly so fixed these as I merged it... =
but:
>>=20
>> ERROR: Function failed: Fetcher failure for URL:
>> 'file://fix-configure.patch'. Unable to fetch URL from any source.
>>=20
>> Sorry Saul!
>>=20
> Wow!  I just can't seem to get this one right, thought I all the bits, =
but I guess I did not commit that patch.
>=20
> Anything else?  Koen?

Not that I can see right now :)=


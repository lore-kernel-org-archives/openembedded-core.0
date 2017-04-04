Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id D1E3A71B99
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Apr 2017 08:08:41 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id z13so90855934iof.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Apr 2017 01:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=AcQjWgQci8FBbs7bY2kZ55f20manTb5ZjoMqkA4uut0=;
	b=wodKGYMzHFC/9R8pYOSR9XPDfje+PIpsUc4GRI+hLsJREqaWhiT0i630IZdWk85nna
	5+kXY9J1KP7sJwD/GX8OxMpeRbvNnzOUydAIA5WtDirvTCf4I914mjHDcNY2Ks4yJnGJ
	7QzhwWUjj9HCxT1V2ugbdrz9t/yOHhR4rv1lQTDlk8j1qMEdSHAR5me8ZK8Z/HXQLBQ/
	F5SbEyaR4M36DUPRZF0at/2QxltESL/uOCtmXDt4rLs6tZUJV0QDbMFTv9uz09hwlAfa
	04Abtvm1o5eED/UWilAP/cLwkFga7tWgzmN6KS0pLE30bh8bFyGj9kMOLs++vPXmquip
	BZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=AcQjWgQci8FBbs7bY2kZ55f20manTb5ZjoMqkA4uut0=;
	b=LKM/l7uNnKgXqqU0fDkyqdCx5KXUFgcdc2CXyCm5ayuo5Z5a3mRFuSgrRYw2zsB7cU
	X2wmANR2rNNU2jVG4EtINsAevznrl60LeTTXREXWUQGupvRLmmZFEdOpuzGQYp2JYUlC
	jNyWOK2kXm8J6x7iczHS4PuX3IKZH2Y8jeY/25yEU0tIZS1ytCWm+zFRON+SCVLrVAzL
	/Yg67/DMFMsrEvMYAB57CSrCGlfDe+nQTT4rcWr/acLgSzK+bKvYqgqsNjKmhqwMpFK+
	CjAyM84BaF+RTKE3l4H0LJvRk7QsV/j+spDGnKKwUQWzIatLPiULOpqOZ+/Xnr5L735C
	Mlbw==
X-Gm-Message-State: AFeK/H1FzW4vm5v2Pp7PbhW4tZw+HbUJwFiAhd5fmEPoyedcJ/LjSJBN01exnNlNS8UVvOgQ
X-Received: by 10.107.131.22 with SMTP id f22mr20409391iod.40.1491293322578;
	Tue, 04 Apr 2017 01:08:42 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8DF78.dip0.t-ipconnect.de. [93.232.223.120])
	by smtp.gmail.com with ESMTPSA id 89sm8815415ioj.17.2017.04.04.01.08.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Apr 2017 01:08:41 -0700 (PDT)
Message-ID: <1491293318.10884.19.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 04 Apr 2017 10:08:38 +0200
In-Reply-To: <CAJTo0LZW1_=jroQsTQ5E+hz0LpCz3tOaWvVH-pB6X9Bj4gzPyg@mail.gmail.com>
References: <1491221074-30437-1-git-send-email-ross.burton@intel.com>
	<CAJ86T=WFKTpB=ZAffa0_zttrh3uEjuKV+1gLcvmxcgkxPhTb-Q@mail.gmail.com>
	<CAJTo0LZW1_=jroQsTQ5E+hz0LpCz3tOaWvVH-pB6X9Bj4gzPyg@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] libjpeg-turbo: don't depend on NASM for non-x86 targets
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
X-List-Received-Date: Tue, 04 Apr 2017 08:08:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-04-03 at 18:25 +0100, Burton, Ross wrote:
> 
> On 3 April 2017 at 18:03, Andre McCurdy <armccurdy@gmail.com> wrote:
>         > +EXTRA_OECONF_append_class-native = "--without-simd"
>         
>         
>         Missing space?
> 
> 
> Argh.  V3 incoming.

I'm so glad that this can happen even to the best of us and not just
me ;-}

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.





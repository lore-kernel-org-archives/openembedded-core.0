Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f182.google.com (mail-vc0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 320346C745
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 16:42:04 +0000 (UTC)
Received: by mail-vc0-f182.google.com with SMTP id lc6so4863482vcb.27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 08:42:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=3iA5IODXyYlpXZgxYnuBtXINdmi3Zg7xCSr9aHkeRzo=;
	b=JQKL4n8cNjydTlKWDc9Yiw2JNqqHJO6BjkJrdeT/K3byPKGR9qQDSz0GOOtpskf9EH
	U8RZg3k7vvQbavu73EMQK2q4hxWrDPrHKA2dgTfDGVZDkRmUcl/oZvh8uw4ynEE5Wj6g
	bB5jAF+X+ohjHIN4eCBp66rM/+lLfDIx751mgKMRLpOGfVin5WJ7BRnxi+iPH1j+Ia51
	S4krk7Jgi6FLir7fucR2jz7eeSdd8uTShBQIklZgnqMAjH5OVb8gpx4YVNwYyPoyFkR6
	0e34I8mnp+yz9+cHvnEYVgPKsxFYNUYlMyM4kK15Ckb8WPLadSfFk4iAf1mGt5M9tFR6
	B4XQ==
X-Gm-Message-State: ALoCoQlwC7tzyUg5vlNLJIyuSpzlVetJlK9AAV+kQIV9Zecwj2bhxeWD5DOssp+/jYF6F+UpTypz
X-Received: by 10.221.16.200 with SMTP id pz8mr212573vcb.53.1386693723001;
	Tue, 10 Dec 2013 08:42:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 10 Dec 2013 08:41:42 -0800 (PST)
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C4FD9BB97@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C4FD9BB97@post.tritech.se>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 Dec 2013 16:41:42 +0000
Message-ID: <CAJTo0LZ7jfC7UJtYvVCywVGnSkfvHsUcc+1Z7ZW1NNyKYHHXUg@mail.gmail.com>
To: =?UTF-8?Q?Mats_K=C3=A4rrman?= <Mats.Karrman@tritech.se>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Can OE build it's own make?
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
X-List-Received-Date: Tue, 10 Dec 2013 16:42:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 10 December 2013 16:36, Mats K=C3=A4rrman <Mats.Karrman@tritech.se> wrot=
e:
> It would be nice, however, if I didn't have to write detailed instruction=
s for everyone on how to patch
> their machines in order to get their builds to work. Is it possible that =
OE could build it's own make
> to use the same way it compiles a new compiler using the existing one? (b=
uilding make v3.82 using
> make v3.81 works fine;)

"bitbake make-native" should be sufficient instructions to build a
replacement make.

Ross


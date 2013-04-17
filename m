Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1USOah-0000fT-Ez
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 11:23:47 +0200
Received: by mail-vc0-f175.google.com with SMTP id ib11so1123767vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2013 02:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=LAKZcZ71YQCD5uSECAGD7AmzV4iVAF8nuian7OT2R80=;
	b=WxgPgCsOELh9i3gXYqlijjAkxTdBh9mbPK6qxEKNk/WpwHWm8yL4VCl058Xxk9v4Js
	AIVfOK3TlXgaZ7cYyQ4yHG0RGC/KLzsPS6FR9m0UuQ8H73O53kowrfyQ3CPSw3qbNJaE
	YaO1kE78R/0DjaVXc1m7c8u/3KnR/OmGV9iZHqwDgEvhZ7x4EZI4zdjl/KE9ETFG1RN5
	3YInNknQB/Iweo2eE8LS0Dpk/hOKH1LqUdQdiVEEWHLy+xA4lhiJsod/Yv7wYbngjvN8
	zSpr/NsbZ1BLNgjDO0WBxYRDoWBcQr4PToLkTgLc8gwcuKLkSxNmlPM7VQtNCmPfWF82
	3Hbw==
MIME-Version: 1.0
X-Received: by 10.220.65.1 with SMTP id g1mr4175066vci.63.1366189575790; Wed,
	17 Apr 2013 02:06:15 -0700 (PDT)
Received: by 10.52.185.168 with HTTP; Wed, 17 Apr 2013 02:06:15 -0700 (PDT)
In-Reply-To: <1366186370.25282.20.camel@ted>
References: <cover.1364456659.git.raj.khem@gmail.com>
	<ddbbb594a0a4c3ff64bb5e4ce0be895a5e2f0193.1364456659.git.raj.khem@gmail.com>
	<20130328122110.GA5105@jama>
	<35803143-FAED-48CC-9FD1-1E216B3A575C@gmail.com>
	<A54391FA-3CD5-4290-A92B-EE3477A2EEAE@dominion.thruhere.net>
	<D8B28775-1426-427F-B7CB-E10164FAF197@gmail.com>
	<CALbNGRSs_t4EbStjw4S6djPiL3xJDRQ0U0MvS820f1OkC7Q6cQ@mail.gmail.com>
	<1364824441.24754.20.camel@localhost>
	<CALbNGRSqEdebP4WsrH9xrW30k+MuxfaXousVfNfjdufS4yCfSw@mail.gmail.com>
	<CAJTo0LZGADsne_bKyDDTX2Vt4QX=pfv+Vr27Xi93B8C_S3WJkg@mail.gmail.com>
	<CALbNGRRCFyiD+6eY1xMe6o8dqtpuyf6YAEa7xKZ=f8wBv262uA@mail.gmail.com>
	<CAJTo0Ladru_hAgyL32SX8bDet3euSFz9Jf=jiJxBJqiNv8eseQ@mail.gmail.com>
	<CALbNGRQ+BqGarZWxmtj50S4rJbDtNPGqB=eWvotBVdVAcviedQ@mail.gmail.com>
	<CALbNGRTMUkavk8669XUPf+YMEBTibUPhpnHh35xYG4eENO-ktw@mail.gmail.com>
	<1366186370.25282.20.camel@ted>
Date: Wed, 17 Apr 2013 11:06:15 +0200
Message-ID: <CALbNGRR33CYQqytNj4eGBrk8CHJoGj-yWAYjV4MoqSL9QJBSbw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] systemd: Upgrade to 199
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
X-List-Received-Date: Wed, 17 Apr 2013 09:23:47 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 17, 2013 at 10:12 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>> What other options do I have to force build of make-native. Why I
>> insist: On both of my machines (Fedora 14 / 15) build of systemd
>> fails.
>
> In local.conf do something like:
>
> DEPENDS_append_pn-systemd = " make-native"

to ensure that all recipes get 'parallel-make-safe' (I know of
problems with systemd and webkit-gtk - there might be others) I added
to my local.conf

DEPENDS_append_pn-gettext-native = " make-native"
PREFERRED_PROVIDER_make-native = "make-native"

It is dirty but I can live with it.
>
> By adding make-native to the base dependencies you've introduced
> circular dependencies and the circular dependency handling code in
> bitbake is breaking for unknown reasons. That code is fairly broken at
> this point unfortunately (someone should file a bug) but its beyond what
> we can fix in 1.4 at this point.
hard times - I know :)
>
> Cheers,
>
> Richard
>
Andreas



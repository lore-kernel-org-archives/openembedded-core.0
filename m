Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5C5BE606CA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 22:51:33 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id h28so153624pfh.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 15:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AMHLrnRPM932BNRW0SGixeV6WdlNKoYEHca51tCag8c=;
	b=PxADT7LgIxealr6yf6fg9SAJRtZYy43KADZdz3uZGiguL8Sjb5w4SlsTiw7ykSZ7n9
	1GYns85auy5m7is6qlZA+fRTV3AtgdYSWNI7vAogkiUpKBnVvo5l8qUo+nXRdDcJV6pn
	ej8La1YPydl8Jz0wdLOa6Aik2X8RPlkduqDUHFjVOkKPSiQAEJPiqLm6vbQJ3+RW1He6
	+OJWggs9RNRi91euxWkDtnFdoDnvHOY/MmLeQe/V8LDwX8aMLPKrmOTWyv+185OzSexa
	Vxi7kTPP9L9xY495g1jmPKzGH46lXayFw/QSlebK4R3hvGbKkJQmiU1o/kgcp8kEZF4a
	bOWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AMHLrnRPM932BNRW0SGixeV6WdlNKoYEHca51tCag8c=;
	b=eFLp9XvscGGx7/l6dFVkz2oVtH9Ivne58TwNa1rbrMakM0eqCpdLRgNoOrO1AOIoGC
	YVR3ic9x0+rWturZOnUJPwfvLb1x1hD9KXgRDPIccLBNrwokuVuzzB8RW6uMteSVeu4V
	M5VEyVjlSZYFW3ksjTsacU8+QFj+TA4ufc9wMx2BP3/4vJCw0i9uNEJlit/yOwrf5Y63
	eFW/lSnDLCbSw7Zs1OfjnLpiWnf9AIZdAoVC4hC5Tx0spx/bCJM7gd4r9hgMs0s10uYU
	m3jO0MeBltr0KOe0qbVzP7APAwqeortuW3nC3u6hq7eUOBWbjGg9293hNyK4jFfAl6sx
	B5VQ==
X-Gm-Message-State: AMCzsaXfI1eLzPk82vtT2dSE+Xzuw1iSMp9pyZYj/fVvYeLzllXu0cD5
	h8VvY7qIw3kj3wvUVWxxV/jviJIaeVXXnsYtEE8=
X-Google-Smtp-Source: AOwi7QBPMasJAAbt9IW3Fjv6IqhBUznozLqDCdr8OlALatfdopb44GC45JfC2l3kr5Th8vqQNDL5dQOjo2gEFzWJadE=
X-Received: by 10.84.138.1 with SMTP id 1mr13487352plo.404.1507675894618; Tue,
	10 Oct 2017 15:51:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Tue, 10 Oct 2017 15:51:04 -0700 (PDT)
In-Reply-To: <CAP9ODKpv2Gh1_Kcm0c=fHMTeZxePni5ztfPtBDPR-Ya_NOX0EA@mail.gmail.com>
References: <20171007172923.36429-1-raj.khem@gmail.com>
	<CAJ86T=X78ockUQ_9tVizxo4JZwbDQu9s0B2dG2ud50Xg6q=28A@mail.gmail.com>
	<CAMKF1sobsTEyLA+8ade5ti8dZ5QeH-87qWw1Ot6fwb0Cw8oSRQ@mail.gmail.com>
	<CAJ86T=Xw2VTOFKODCXR+UpMmUuTT-TaT75h4i9LiVz7mNiRt1Q@mail.gmail.com>
	<CAMKF1sr-L-pescBejaL7hYOrXMr4ryb-p892QZ7QcnxdUhw-FQ@mail.gmail.com>
	<CAP9ODKpv2Gh1_Kcm0c=fHMTeZxePni5ztfPtBDPR-Ya_NOX0EA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Oct 2017 15:51:04 -0700
Message-ID: <CAMKF1soJ_zLEX_FFkPn70L3i_gMA-epQYpeJFe3ftK34Zsu3bw@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-6.3: Backport patch to fix ICE on ARM
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
X-List-Received-Date: Tue, 10 Oct 2017 22:51:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 10, 2017 at 1:31 PM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> On Tue, Oct 10, 2017 at 5:13 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Tue, Oct 10, 2017 at 12:55 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>> Just having the upgrade available to the community is useful, even if
>>> there are no guarantees or testing. I've backporting gcc 6.3 into my
>>> morty branch as it fixes build issues with musl. Morty with gcc 6.3 is
>>> not a combination which was ever officially supported or tested
>>> upstream, but I very much appreciate the fact that upgrading gcc 6.2
>>> to 6.3 in morty only requires a few cherry-picks :-)
>>
>> I am open for if there are more like minded folks who think this will be a good
>> thing to have. so all listening please chime in
>
> I'd prefer for 2.5 time frame to drop gcc 6 as 2.4 can be seen as an
> upgrade path to it.

I think it probably it a fine idea to update it so it can be
cherry-picked for backport
to prior releases, if we do that cherry-pick officially or not can be
discussed later
then we can delete it. Usually we keep two versions of gcc available
to keep migration tail
if gcc8 comes out with in 2.5 release timeframe we might drop 6.x

Now on clang, I think thats a fine idea. We need some upvotes on
https://bugzilla.yoctoproject.org/show_bug.cgi?id=9417

>
> If possible I'd prefer to add clang to oe-core than support multiple
> versions of gcc.
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


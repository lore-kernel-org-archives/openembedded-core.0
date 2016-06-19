Return-Path: <koen.kooi@linaro.org>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id B08F06E630
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jun 2016 17:27:04 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id f6so24993870lfg.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jun 2016 10:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ZfiiCwlggZw18M5Ct3QgVsMFVjMxNdFZ1hsHpP/c0Vg=;
	b=Ag90CtflBPVVSVsPn7QRvJRslnEnWC/fkeWppFqpeiwf7wrVQiy6h81mImDp19KheE
	kkW3sEZ1jlqiPNd2luW69AwGlivPK72yYwCYybImRM8vo9W1hT49t8BKgd1dBiX+9cxp
	TXMSAeogzsi6rxrFpAjDb2ndJnVpmQONKSgc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ZfiiCwlggZw18M5Ct3QgVsMFVjMxNdFZ1hsHpP/c0Vg=;
	b=ZMtGIyA5xiYzdd6LFKsrwRz0rGyGzraCfRZIoeaIQ+HAOGlim5+ABcosVIoyCIqEGy
	CHThefNNwwqLlvoZqPkR5ga9Xd8yTQyxjqZaBgnscKIadIsxKLQh59jYzkYzKn2LpE7z
	RHysJ/ce8ZS/QkKiNRDW/PK2ftWKrbG0V3NJWBkU6sex7sZzS0HQsoMHqCigmtquGotm
	6PjyE7kiBpn76BZpQcXR5C+RS1VwQaPj7LKDmg/JjTRZDkmoLJd6Knj0Lh1ZEUN6xbwg
	ienXeb5wO8dQeeFXwfz5Xd/jtv05Yj5lY5E+9seIzSrm2HjTq2DEGgKGUS17vCs0BZ9e
	dWgw==
X-Gm-Message-State: ALyK8tLNHkBtWES/AHwDsErLOlWP8+CP58pyWDSUiRSDdjkbb34GRVgkMvGYKNnzvvUWHURHyGmcK1SEQjsMYhlk
X-Received: by 10.25.20.213 with SMTP id 82mr3152696lfu.90.1466357224267; Sun,
	19 Jun 2016 10:27:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.77.146 with HTTP; Sun, 19 Jun 2016 10:27:03 -0700 (PDT)
In-Reply-To: <1466322626.3319.86.camel@linuxfoundation.org>
References: <1464025857-23995-1-git-send-email-koen.kooi@linaro.org>
	<0FCEA83D-C569-48F0-AFAA-2E9D5BD96820@dominion.thruhere.net>
	<32A5DABC-B911-4C2E-B9CD-A520BCA395EC@dominion.thruhere.net>
	<1465045799.13979.33.camel@linuxfoundation.org>
	<F5F5FC08-7E44-4648-A769-EC4D8F4D9EB7@dominion.thruhere.net>
	<1466274078.3319.0.camel@linuxfoundation.org>
	<24C09066-C7EA-47A6-8771-02E59FC60525@linaro.org>
	<1466322626.3319.86.camel@linuxfoundation.org>
From: Koen Kooi <koen.kooi@linaro.org>
Date: Sun, 19 Jun 2016 19:27:03 +0200
Message-ID: <CAP0W-R=Ht6VmGGCLNnQH8LJkv5UkmCmGzePwQhiFkvMRGT4tdA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "image.bbclass: don't execute compression commands multiple times"
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
X-List-Received-Date: Sun, 19 Jun 2016 17:27:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 19 June 2016 at 09:50, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sun, 2016-06-19 at 09:46 +0200, Koen Kooi wrote:
>>
>>
>> > Op 18 jun. 2016, om 20:21 heeft Richard Purdie <
>> > richard.purdie@linuxfoundation.org> het volgende geschreven:
>> >
>> > On Sat, 2016-06-18 at 15:08 +0200, Koen Kooi wrote:
>> > > > Op 4 jun. 2016, om 15:09 heeft Richard Purdie <
>> > > > richard.purdie@linuxfoundation.org> het volgende geschreven:
>> > > >
>> > > > On Sat, 2016-06-04 at 10:41 +0200, Koen Kooi wrote:
>> > > > > ping 2
>> > > >
>> > > > It would be helpful if you'd cc'd the person who's patch you
>> > > > were
>> > > > suggesting we revert. I added Sasha to cc.
>> > >
>> > > Since the original committer has shown zero interest in
>> > > responding
>> > > here or fixing the problem in the past month, can you please
>> > > commit
>> > > this? This fixes a clear regression, which alone should have been
>> > > reason enough to commit this.
>> >
>> > Did
>> > http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3D7028192246552f
>> > d9e4aa3674da9c30670fd4ec86 fix this?
>>
>> Don=E2=80=99t know since I use OE, not poky.
>
> Ok. Let me paste the hash in "From OE-Core rev: 46bc438374de74af76d288520=
c6252c9b7840767"
> into a new url. I obviously have nothing better to do with my time.
>
> Did http://git.openembedded.org/openembedded-core/commit/?id=3D46bc438374=
de74af76d288520c6252c9b7840767
> fix this?
>
> Or in case you also don't have a web browser, did revision in the
> openembedded-core repository with hash
> 46bc438374de74af76d288520c6252c9b7840767 fix this issue?

With that included and the overlayed image.bbclass dropped the build
succeeds. So the revert isn't needed anymore.

--=20
Koen Kooi

Builds and Baselines | Release Manager
Linaro.org | Open source software for ARM SoCs


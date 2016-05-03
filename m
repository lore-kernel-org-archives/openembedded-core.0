Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f194.google.com (mail-ig0-f194.google.com
	[209.85.213.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5986C62135
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 16:07:51 +0000 (UTC)
Received: by mail-ig0-f194.google.com with SMTP id c3so2718984igl.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 May 2016 09:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to; bh=PYAX+h+p8g8yUivt0AiRQKphqFtIwaEGuOk2E6wWum4=;
	b=VWSyOd36tyentNFgRbOiv/zdLfVCDWScEp35860dYFhSsnxTUgE3+5uhs8AnttWeHR
	HF+WuEtPKXXu5LbUvcZpDnaEuRPEpq9CeitTAYl2ai47DkB3JdPR9VicJ9oLZP16Ai+D
	+q9R6TquaTKPEQ4P38hVP5bdVA1BEO4tVDM5c2kExg+6DOeRw19wvmMrextaW/D6K/YC
	7NO50RwPFwlUuJjUjYjLfyA6MsoR9ISMPmrmO9A2HiaCF6+FS36Ie+0XEpc1xgw3MjcS
	pBGg+K34YZOu5eDHmJOqhFxAua/kXFkmFFjMNBZTVj7rryvk+7ZVjg324yApII6wvhwB
	W0iw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to; bh=PYAX+h+p8g8yUivt0AiRQKphqFtIwaEGuOk2E6wWum4=;
	b=e1GJ4iidl/fAGrcydwPC4ZofjW77Sp8YuFlCN212fIF2sTMheS7DY9Y4HHntEYe0y1
	BEAmTaURUVHEfpDraiV5j42rrBELX2Jj3p3JaeZUx947AKlhbkmV9TIEdPYy0fzRGjnd
	ClNPHFtYB5dlXpMgPE0x3KxYPENbtRSpPe4qDbFxuILZR6jz/wdrPlAzlY6sZHNeNJIB
	D2WNzcRMh6osSvM7zkNCBnavZmJVTJo6rGLNa4run9jdoq91DcSzmbMb/IoY/M0FLfH3
	fC9Nq4NhhOGk4dWnJ7Y1xc5TTIQFooTg3PBrKIIs9/1sLL79LSjxDYfy90erMeNEUAcM
	NWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to;
	bh=PYAX+h+p8g8yUivt0AiRQKphqFtIwaEGuOk2E6wWum4=;
	b=C3WMQJgAkOXeR/kpVJ4z86qbRNik5ssSH2uQohK/nt1Z2vPMZK3qXYu+PRhSMb4F+6
	Nvb5g5ynIhywlrcMSz1tQZzB+GJh+mVOZOwjUfOfnZCVxkiaXEyiwQurcoSyGH38NH7t
	VCGEZAvEAo6I78iUCGbcQaYfUBEto8TQcUdAZfw9L1pdrlg+bpjlx4YfZDYzPLGqhpXj
	W293ljAhqAZtZuz4QexYhsw+SCYLpgOo6ri+tzQVND8xBJRHMbcMvqflJIDn4Gx2YvQR
	LHurB5e4+IQPBZ56SQezL901n9W2U+NWjHHcyVAvu/EEEa38X1LRUDQHR1FA/nHgIxc2
	xxaw==
X-Gm-Message-State: AOPr4FUviLtKk2zYCd8f1KI1nLO3r6+Q2uU29uGEwopB8TxAL/0z+mYsDy7qjYn/niB9I9HkThGKhabA02sVeg==
X-Received: by 10.50.221.169 with SMTP id qf9mr4464164igc.13.1462291672265;
	Tue, 03 May 2016 09:07:52 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.134.70 with HTTP; Tue, 3 May 2016 09:07:32 -0700 (PDT)
In-Reply-To: <20160503091142.GA4828@ad.chargestorm.se>
References: <1462219765-18957-1-git-send-email-kergoth@gmail.com>
	<B873B241-2AB0-4CDA-B4CF-7AEA166BEE68@gmail.com>
	<CABcZAN=ECJ15QzuHx-a2aovhS3hagRJuo3u-kazjZ4xnHjt=zA@mail.gmail.com>
	<A4EC8338-0993-408B-9D4C-2E388348B3B0@gmail.com>
	<20160503080913.GA2851@jama>
	<20160503091142.GA4828@ad.chargestorm.se>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 3 May 2016 16:07:32 +0000
X-Google-Sender-Auth: jO0hdznZ7uAjvl_wyqW3eM5KeyI
Message-ID: <CABcZANnFt8Ko5G8i5DJjk4iVOb5VuZbiyrgSkAqKsW4kqQUUaw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [master][PATCH] gcc-cross{, -canadian}: remove --with-linker-hash-style
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
X-List-Received-Date: Tue, 03 May 2016 16:07:54 -0000
Content-Type: multipart/alternative; boundary=f46d042ac020af15950531f24f9a

--f46d042ac020af15950531f24f9a
Content-Type: text/plain; charset=UTF-8

On Tue, May 3, 2016 at 9:11 AM, Anders Darander <anders@chargestorm.se>
wrote:

> * Martin Jansa <martin.jansa@gmail.com> [160503 10:08]:
>
> > It would be nice to really poison the value if possible
> > --with-linker-hash-style=YOU_NEED_TO_RESPECT_LDFLAGS
> > to cause linker call to fail when someone is using oe-core toolchain
> > outside OE itself (so might ignore LDFLAGS, but without running the
> > QA check).
>
> This sounds like a nice idea; making it comparible to how the sysroot is
> poisoned.
>

Doesn't look like that's allowed, the argument only allows specific styles.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--f46d042ac020af15950531f24f9a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, May 3, 2016 at 9:11 AM, Anders Darander <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:anders@chargestorm.se" target=3D"_blank">anders@chargestorm.se=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2lg" c=
lass=3D"a3s aXjCH">* Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.=
com">martin.jansa@gmail.com</a>&gt; [160503 <span class=3D"aBn" tabindex=3D=
"0"><span class=3D"aQJ">10:08</span></span>]:<br>
<span class=3D""><br>
&gt; It would be nice to really poison the value if possible<br>
&gt; --with-linker-hash-style=3DYOU_NEED_TO_RESPECT_LDFLAGS<br>
&gt; to cause linker call to fail when someone is using oe-core toolchain<b=
r>
&gt; outside OE itself (so might ignore LDFLAGS, but without running the<br=
>
&gt; QA check).<br>
<br>
</span>This sounds like a nice idea; making it comparible to how the sysroo=
t is<br>
poisoned.</div></blockquote></div><br>Doesn&#39;t look like that&#39;s allo=
wed, the argument only allows specific styles.<br>-- <br><div class=3D"gmai=
l_signature">Christopher Larson<br>clarson at kergoth dot com<br>Founder - =
BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software =
Engineer, Mentor Graphics</div>
</div></div>

--f46d042ac020af15950531f24f9a--

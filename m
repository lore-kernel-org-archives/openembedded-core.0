Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1C64960720
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2020 12:45:37 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id v4so10927854wrs.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2020 05:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=uOtJHknR8rtS/aqOaTa4U7o79taYMKXS+4DltW1rQEU=;
	b=KaVok4xy9dxsQUm71VoPA6jgFY5w1OU76yR3UtDnPN5TGh1TX138G1UTKkOgjzEAet
	4teZQQZlY7oI7S1UJfqbA1ooewaUoEHbxUyPLK/EZ9Dfp5SDEpAw8RKukJNXvj2ShoI+
	f8G+d75nn8XuLkoaNYmTM4woJDiP7Vjiu4S/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=uOtJHknR8rtS/aqOaTa4U7o79taYMKXS+4DltW1rQEU=;
	b=RjyrZPHywhz2mtAeQIIjKtepEyrMdhBUANT1ToXbC3q32btagVD5htWs4l5OIjUr7c
	rXKEwdqAgabBQCR1IWav00ASNJCTHHnWMv/Y3mAW9QM8LchB5tXeVybskCmEARMi1Q+c
	EwiQ4qs6n84yBahN5C2BVZzNZd2zEVEUdL9VxcoylyCvvYj8HKM110OA1YmjhYRZklna
	FFDxUP4OUzvZOy09sT9dDFbN2gsR1petwPSkKq5vgn4x5tIkENbPNi1akjIUYrVNsXGB
	9JfHIDMvXbKmeJ1EIxm4AeK8BD9LtYGxQQykonYJTffq4h8NBUQ1/oz2WAdLNyVttZja
	c1fQ==
X-Gm-Message-State: ANhLgQ0uc+FbfzOhHmCT173Wvotfg+oy7Ed9M7WacINjkKQXUlfkTqKH
	8yGF6yoXRdO5i3bq7jtlsMJC6ocFrCg=
X-Google-Smtp-Source: ADFU+vt4Y6yiQNR4RXLTYb5p/FjNnlbt+plvZvLj6zucCtS0+vmPEGs8TH+tfoB84sxw3ksk20kgRQ==
X-Received: by 2002:adf:fa4a:: with SMTP id y10mr20799312wrr.322.1583757938631;
	Mon, 09 Mar 2020 05:45:38 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r12sm6076340wrx.26.2020.03.09.05.45.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Mar 2020 05:45:38 -0700 (PDT)
Message-ID: <7146d504e980757c2aea543626defbbd0e5037d1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ayoub Zaki <ayoub.zaki@embexus.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 09 Mar 2020 12:45:36 +0000
In-Reply-To: <f99fbcc5-bb47-a177-f1e9-815d3cf4e5c0@embexus.com>
References: <20200304113217.GB7923@localhost>
	<CANNYZj8wnuNLrw6s=y0cgg5uoMTjA+fMEXW_TsmtKWZ4UDzwOA@mail.gmail.com>
	<20200304140109.GC7923@localhost>
	<CANNYZj8ciqgR7eed+B+WwfMRHKc3u_XHrT3vo004=TEX9cCmhA@mail.gmail.com>
	<20200304172415.GA29456@localhost>
	<01b3bb37-f65f-8048-1a27-b859b62d7f98@gmail.com>
	<20200306100422.GA17785@localhost>
	<877e317932176664bc7b0120439c56d4dda791af.camel@linuxfoundation.org>
	<20200308214610.GB1425@localhost>
	<CANNYZj_4sTc9vjhm1+S1GbjN=8SjChWt+gksxxKLXEZXeK9nPQ@mail.gmail.com>
	<20200309002308.GD1425@localhost>
	<f99fbcc5-bb47-a177-f1e9-815d3cf4e5c0@embexus.com>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Subject: Re: [Openembedded-architecture] Does YP provide security support for stable and LTS branches?
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
X-List-Received-Date: Mon, 09 Mar 2020 12:45:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-03-09 at 08:29 +0100, Ayoub Zaki wrote:
> On 09.03.20 01:23, Adrian Bunk wrote:
> > On Sun, Mar 08, 2020 at 11:08:08PM +0100, Alexander Kanavin wrote:
> > > On Sun, 8 Mar 2020 at 22:46, Adrian Bunk <bunk@stusta.de> wrote:
> > https://www.yoctoproject.org/is-yocto-project-for-you/
> > 13. Yocto Project follows a strict release schedule incorporating
> > security patches in all supported releases. This predictability is
> > crucial for projects that are based on Yocto Project and allows the
> > development teams to plan their activities. Developers can choose
> > which
> > Yocto Project branch on which to base their activities as a
> > function of
> > their needs. The development branch will ensure access to the
> > latest
> > features while the stable branches will reduce the pace of changes.
> > CVEs
> > (common vulnerabilities and exposures) issues are supported for the
> > latest 2 releases.
> 
> Adrian is making a point here, The Yocto Project by claiming that it 
> supports security patches for Stable releases is misleading the
> Users!
> 
> I work with different customers and some of them think that by using
> and pulling the latest releases they will get the CVEs automatically
> fixed!

If you use our latest codebase then you get the latest usptream
versions and hence, yes, you get the fixes. It does depend what
"latest" means in the contents of your comments above.

For the stable series we're putting in a commitment to review and
include CVE fixes which are submitted to us. We have a pretty good
track record of having them submitted and included.

That said, we cannot write a guarantee than all CVE fixes will be
included, we're an open source project, not a company with an
engineering team or a project with the scale of say Debian.

> YP should state that CLEARLY! Of course it will impact the choice of 
> going with Yocto or Not ( probably NOT in this case).

I agree we have to set realistic expectations, not entirely sure how to
do that but hope the above clarifies whilst we try and update the
docs/web pages and so on.

Cheers,

Richard





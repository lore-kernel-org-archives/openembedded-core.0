Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0AF8F72E8C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2019 22:01:38 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id q1so9256658ion.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2019 15:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=SZKlpwHHJcSxbnpR19bgRI56TngyH6nIwF11/KwpIA8=;
	b=BkESjC7Nw7glY0Mj9G6i21sl1Jr8KpBp8JIgBVn9BqH2w+vigaBK9XsuzNmAk9bnZw
	nBoubeVVMyw1ieOU9XFut+Xys5s6R2eWxjcyizGGBa0j43UjZRojqAfKmu2lXKiKp8Kh
	XShm2xOJzle/lLRzogcYAE+IO+VPfZK9SgI7Js+G2osvYXy2M3WomQ8EGmrvrKEizD83
	roo3O5Kh9OFQSVp+Zb2Vo1re89wwy57I36pq8cN8kTWLx4XDImaqxlVK3bHldqYv4Gfn
	gxC1M5Y5cF7tAe2+QynBd8hij1J8nqQHMRVpjYHxgklsiv5dFk7WpECv8bQNXs6EGOGn
	ksMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=SZKlpwHHJcSxbnpR19bgRI56TngyH6nIwF11/KwpIA8=;
	b=SQqP6yoDxY/uLS3m6eX/07CmAxwfvhdgzO4tj0mAdaJzcnGjLhSWNe393B7OPmOJeo
	Da9xlpSg+gr2xRfhZENYPEoTokTdFWAs17/cZYfygxFn2FC6sPPVjeyoulKIiGWa0GSd
	hd/vLr5U4hXExwpf8hROIqVOjy4X+IrkLgJjGYKB0IPINkh/2ch22aL7cKSBP61J2RgU
	cZj9bD7IKrDXUizAHnAtTihcqvRHNzC321dEHR8ACStNJx3trMPiUAm7BccriimJ1NAk
	jpAoTizTkM9DYeOeWxRZvgXwso/Da92OEaaFwQ0CHYRwlshsTIK1ZwuC4gbMjbz7mvYj
	SOBQ==
X-Gm-Message-State: APjAAAWB8Pv1AaUs8nGj0i8yhN3EybAA+6+KyYvwtpK/E9HrEBj2oTqp
	BlLHxv1xd4mZuHZNMrwNzjqaQtpRGq40/oDJlr0=
X-Google-Smtp-Source: APXvYqwR8YJNaqESvSFPJJAiWY/FNnX4bvC/DUqY0PO4qgZducsosSP9SK4HGaxT7+H5L6qCgLDVI52mpjCkQ6Opv0I=
X-Received: by 2002:a5d:884f:: with SMTP id t15mr654030ios.224.1571436099844; 
	Fri, 18 Oct 2019 15:01:39 -0700 (PDT)
MIME-Version: 1.0
References: <20191011114754.91740-1-alex.kanavin@gmail.com>
	<20191011114754.91740-16-alex.kanavin@gmail.com>
	<dbf128cd95ea3d8017274ea57dda52a72ad727cb.camel@gmail.com>
	<CAMKF1srnabEcWqWYa80uoCe1H=iw-wDPNut4hu4eRwuSQ1HaoQ@mail.gmail.com>
	<CANNYZj8J-wr1V1+aNfbRGyQ+Lk+sofRX4rT1xudaCm67gVev3Q@mail.gmail.com>
In-Reply-To: <CANNYZj8J-wr1V1+aNfbRGyQ+Lk+sofRX4rT1xudaCm67gVev3Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sat, 19 Oct 2019 00:01:28 +0200
Message-ID: <CALbNGRRujaOdX+9NP-CXphK0xuioC3-+Zowo9YLiJhcCYL-3kg@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 16/19] meson: update to 0.52.0
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
X-List-Received-Date: Fri, 18 Oct 2019 22:01:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 18, 2019 at 8:50 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> I certainly don't mean to ignore those reports, it's just that due to my =
ongoing health problems, and having to dedicate most of my energy to the da=
y job (https://mbition.io/en/home/), I am not currently able to work on the=
 upstream issues in a timely manner the way I used to when maintaining core=
 was actually my day job (at Intel).
>
> The question of how much effort people who update things in core should a=
llocate to fixing 'other' layers has been a conflict point for a long time.=
 I'd prefer to see more aggressive blacklisting/removal of recipes that no =
one has an interest in fixing and updating.
>
> Alex
>
First and most important: Wish you the very best to get back full health
Second: If I read meson github issues correctly, there are chances
that meson 0.52.1 fixes (works around) static library fallout as seen
on dconf
Third: Taking this in was sub-optimal but: We are close to release
which is btw the most smooth I've ever seen since I follow this
project.

We're back to dirty master where sh*t happens...

Andreas


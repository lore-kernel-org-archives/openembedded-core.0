Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5B71B7F30C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 12:57:06 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id c7so1406678vse.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 05:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3aEZWmCISqQTFLQTEAXrmnRDre5sZJ5HKejpOAEQ3Yw=;
	b=KmMmDX/li698n12oKyBexhBU85BX73P+JKTAwsJ7FC0neqnhhNT5eadL+T4aENio5g
	6HIzwzqi2tFKmu9/WMFfBIZRwM3WdE/JkCduysUodLwsMi++LcLsqjfX16hb0awm//K2
	jYEdw0NayU+/L7YWPz8HQ/2OY2dfZAXeIspqnvfvow2JkbwxExuz5w0X839I/tkkpkZi
	QM5SNnXPGO4sCCTQBMZwN43C8wE0qW9d1m0AURTt0S+8JTAKT4RqQGh/ddKiOEnXqgjT
	bS2nneDniPsNL9V3E5Idk7WP+9PqDK6AFk6r677YbBdCHE94xAS0OgoCkBUvONSqeHOW
	1Trw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3aEZWmCISqQTFLQTEAXrmnRDre5sZJ5HKejpOAEQ3Yw=;
	b=LObwJOMP0T3elKeLU1NvAxAVb5Z2HGrj/UhcLRh8a9bWu667Pz2VJ5VDIKeZX0MKwi
	dVQGwxYtYXI1urC5BPmlJpMDacUMWiTx0Zqk3tjHZFfIAlQHXTasXWhYclqtnnPYUSTT
	/BkAf7CoiZhDZ68IEEMhhJH7kWmvIcwHR5fiwWID3fyYVbN/BfvaiFh9Eu0SPz3MegQn
	NL2xz2ye4x03XS73Yo8h3ugPFpxLkB+KDi0BVmJTzwJxZdsRZSwiP7TvBBLPqc48v3g5
	Po/L1YNt0RmtXd1HZl0P1gxzRTxZ5vuvMs54SJeAOQi0LQR2uGGy4S44R8tHz0zrv3ML
	wW2A==
X-Gm-Message-State: APjAAAUZMsNZrKgpjLURIciqWdh6zshUHtvIC394pFY3FRcN1buwt77b
	wDFrXwWItWjLDHDkeKlL0vDztj8qg6hxCfvdKFQ=
X-Google-Smtp-Source: APXvYqxFvVzsw3a+VPBkM062DUy6SqmReAdiYWgYpjeUaygeTbmZ6wcYdydgvwDcID6db9DuEgmZKvM++YuLY+udglQ=
X-Received: by 2002:a67:fd66:: with SMTP id h6mr3078954vsa.83.1565873827159;
	Thu, 15 Aug 2019 05:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <fcc15178e58e4ef0a8e2cf3047109bd5@xbox06.axis.com>
	<33bca828a78daaefc32fe497e7f244e3208bc968.camel@linuxfoundation.org>
	<2a106fcffc331009abdb6498ffe8c4f3c99ee80b.camel@linuxfoundation.org>
	<CANNYZj9HHxJa5NKWU9r09NXgBy8aD0RTkugQ-k6esVNCTVOa6w@mail.gmail.com>
	<6551fb5303bcc8dbf3a9d55a1aa6a9ecd2baeb13.camel@linuxfoundation.org>
	<CANNYZj_7t+dB0FOUjGocHLzACtLquqqGV3R1awiQe=27JwQa3Q@mail.gmail.com>
	<123708bfcd4646571a59f2d2ddde7a90267833ef.camel@linuxfoundation.org>
	<CANNYZj_XzB3g55qEe4hYGGCBwPPkg9kwydWQ0jGwRbi8UkJNGw@mail.gmail.com>
	<f30af5bfdca30721a345f656c6f3762dbb947d25.camel@linuxfoundation.org>
In-Reply-To: <f30af5bfdca30721a345f656c6f3762dbb947d25.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 15 Aug 2019 14:56:56 +0200
Message-ID: <CANNYZj_2GJt9=YaSJ8VG4gdEzxgtA+WRaNgknvQWmi6fHvQVBw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Long delays with latest bitbake (was: [PATCH 1/7] insane.bbclass: in file-rdeps do not look into RDEPENDS recursively)
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
X-List-Received-Date: Thu, 15 Aug 2019 12:57:06 -0000
Content-Type: multipart/alternative; boundary="0000000000003b21830590276949"

--0000000000003b21830590276949
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Aug 2019 at 23:25, <richard.purdie@linuxfoundation.org> wrote:

> Right, it still definitely needs work. Its a balancing act between
> sorting out the execution bugs in the code and figuring out the
> performance problem.
>
> If anyone wants to experiment, the way I'd debug this is to run the
> before and after cases with the -P option to bitbake. If you want to
> exit early just make the code return where it prints "Executing tasks"
> or whatever makes sense as Ctrl+C won't write the profile data.
>
> You want the profile.log.processed file.
>
> So save that file with the "before" commit, then save it afterwards and
> look at those files and see where its spending more time.
>
> If someone generates those two files I'll happily take a look, I'm kind
> of used to reading them. There are four sets of output in there, same
> data but different sorting/types, each has its uses.
>

And here they are (with task spinning included this time):
http://sensi.org/~ak/tmp/profile.log.processed.before
http://sensi.org/~ak/tmp/profile.log.processed.after

Hope you find it useful!

Alex

--0000000000003b21830590276949
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 14 Aug 2019 at 23:25, &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
Right, it still definitely needs work. Its a balancing act between<br>
sorting out the execution bugs in the code and figuring out the<br>
performance problem.<br>
<br>
If anyone wants to experiment, the way I&#39;d debug this is to run the<br>
before and after cases with the -P option to bitbake. If you want to<br>
exit early just make the code return where it prints &quot;Executing tasks&=
quot;<br>
or whatever makes sense as Ctrl+C won&#39;t write the profile data.<br>
<br>
You want the profile.log.processed file.<br>
<br>
So save that file with the &quot;before&quot; commit, then save it afterwar=
ds and<br>
look at those files and see where its spending more time.<br>
<br>
If someone generates those two files I&#39;ll happily take a look, I&#39;m =
kind<br>
of used to reading them. There are four sets of output in there, same<br>
data but different sorting/types, each has its uses.<br></blockquote><div><=
br></div><div>And here they are (with task spinning included this time):</d=
iv><div><a href=3D"http://sensi.org/~ak/tmp/profile.log.processed.before">h=
ttp://sensi.org/~ak/tmp/profile.log.processed.before</a></div><div><a href=
=3D"http://sensi.org/~ak/tmp/profile.log.processed.after">http://sensi.org/=
~ak/tmp/profile.log.processed.after</a></div><div><br></div><div>Hope you f=
ind it useful!</div><div><br></div><div>Alex<br> </div></div></div>

--0000000000003b21830590276949--

Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id EE02F783D7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 22:03:39 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id d16so35642909ioj.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 15:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wzI1E/kzKDhcXglhwOzXmUTTVZp+AouhCJdG6z++ht8=;
	b=AmiJvtQbEym+2QBu43kkIRVBRADOknXk3vlw1AIDQ2CYfrUGszXyHLViGYOV4TInDU
	2C4tS9xoTwvTwt69RM6emNMf2+D5P+SbhpKaE5erFGl50Shj8F6C5cpTVaAIzjRoTBJv
	jVafrMtJIkoZl5EeRvVku8Fk8myONGDgN1ExfdbmZTWk6A6SGyBF3nBPzBXtW0SUNimn
	ES/vd6somcTTErQgYLH/jH72oA7QtshxrEcDra/ziM+4TiBGsCwEZwHXEOuT69zte0lu
	qKsUpOIaNd9ZS/mVJ1TqTETu84X75yQdL+0R6jtkpy9TR3CtBd9rTrH0q40v+HH+RKnf
	9IEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wzI1E/kzKDhcXglhwOzXmUTTVZp+AouhCJdG6z++ht8=;
	b=Jbo74FdDVbT7hVMCRPp0BzueLNED9bvLc7AZfeP53kT02y1i2wuB6u/M07MtVclgSB
	ctfDGyJ1LrtzLWcZPwRPhsAdZe0byt4AJee/2lgP+Ghekt/yWXaIvS1GqOhI6+7fQ3Lc
	EP0DnIZT/zfq7fl+CseVGm3r1cqG7G1tDun88KwuLAEyySp9O2oB+BpadBUzyLNYrEh3
	Ba13ONZdZ6aSD639Mh/TUf9EePiMWvXqLT2uPLFxz3BlR6D+Bfu97sdwELTHlDrIWkPx
	Y9I9zqVhI7Ik/8s+n39+qb9IbWg3CfdQ8jPpS8xJxSfMI6R8Xpz9XXBYQvoiPWrALt1h
	VjfA==
X-Gm-Message-State: AHPjjUgvg+9WQCzQqjeZgP3MsO8U7M5otKUUW7vA+g2sYcX4sB4vRP2g
	g2l3bIQOJngslZ5YL3Sbhv4yG5LDpAzx
X-Google-Smtp-Source: AOwi7QAoeNzOcx9bez3nmPh1QXr1Abr9HGmz5wlbwLMZkkrZfZr395pCB6PnZREeDFdYdPRmB3+B/5mNWs4LnBYm3eg=
X-Received: by 10.107.41.18 with SMTP id p18mr16914145iop.142.1505167421095;
	Mon, 11 Sep 2017 15:03:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Mon, 11 Sep 2017 15:03:20 -0700 (PDT)
In-Reply-To: <CAP9ODKqN7nj2esxkVR08jYSaRj-SrybTqbOYManDvC566no_qQ@mail.gmail.com>
References: <20170911213326.3480-1-california.l.sullivan@intel.com>
	<CAJTo0LZgBgWL0c9ZaDRFvvKxfULKeDkvGOhAiczGWMXWNrL=Yg@mail.gmail.com>
	<CAP9ODKpmxcObf-re-298t_uLu2HNCnByi+ic_b8EEJDJ-227iQ@mail.gmail.com>
	<CAJTo0Lb42b-PT3_u-1vS-apadje4+ZYpP=8jB4q9oc2jmzjgPw@mail.gmail.com>
	<CAP9ODKqN7nj2esxkVR08jYSaRj-SrybTqbOYManDvC566no_qQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Sep 2017 23:03:20 +0100
Message-ID: <CAJTo0LbQKuJhVBVTCh1ay2i95egZxbvfhLC=Cgh__OQRS01i+w@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] initramfs-framework: bump PR and fix install-efi and setup-live modules
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
X-List-Received-Date: Mon, 11 Sep 2017 22:03:40 -0000
Content-Type: multipart/alternative; boundary="001a1141d8a2765c690558f11933"

--001a1141d8a2765c690558f11933
Content-Type: text/plain; charset="UTF-8"

On 11 September 2017 at 23:01, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> On Mon, Sep 11, 2017 at 6:59 PM, Burton, Ross <ross.burton@intel.com>
> wrote:
> > On 11 September 2017 at 22:58, Otavio Salvador
> > <otavio.salvador@ossystems.com.br> wrote:
> >>
> >> On Mon, Sep 11, 2017 at 6:49 PM, Burton, Ross <ross.burton@intel.com>
> >> wrote:
> >> > On 11 September 2017 at 22:33, California Sullivan
> >> > <california.l.sullivan@intel.com> wrote:
> >> >>
> >> >> Bump initramfs-framework PR, as it was missed in the previous
> >> >> initramfs-framework patch.
> >> >
> >> >
> >> > There's no need to bump PR.  In the ideal world, the PR isn't assigned
> >> > at
> >> > all.
> >>
> >> there is, the package moved across arches so adding the PR makes sure
> >> it is upgraded.
> >
> >
> > Surely the PR service handles this if you're running a feed.  If you're
> not
> > running a feed then this isn't a problem.
>
> It does not; it goes back to r0.


Changing arch on a package resets the incrementing PR?  Isn't that a bug?

Ross

--001a1141d8a2765c690558f11933
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 11 September 2017 at 23:01, Otavio Salvador <span dir=
=3D"ltr">&lt;<a href=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"=
_blank">otavio.salvador@ossystems.com.br</a>&gt;</span> wrote:<br><div clas=
s=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><span class=3D"">On Mon, Sep 11, 2017 at 6:59 PM, Burton, Ross &lt;<a href=
=3D"mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt; On 11 September 2017 at 22:58, Otavio Salvador<br>
&gt; &lt;<a href=3D"mailto:otavio.salvador@ossystems.com.br">otavio.salvado=
r@ossystems.<wbr>com.br</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Mon, Sep 11, 2017 at 6:49 PM, Burton, Ross &lt;<a href=3D"mailt=
o:ross.burton@intel.com">ross.burton@intel.com</a>&gt;<br>
&gt;&gt; wrote:<br>
&gt;&gt; &gt; On 11 September 2017 at 22:33, California Sullivan<br>
&gt;&gt; &gt; &lt;<a href=3D"mailto:california.l.sullivan@intel.com">califo=
rnia.l.sullivan@intel.<wbr>com</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Bump initramfs-framework PR, as it was missed in the prev=
ious<br>
&gt;&gt; &gt;&gt; initramfs-framework patch.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; There&#39;s no need to bump PR.=C2=A0 In the ideal world, the=
 PR isn&#39;t assigned<br>
&gt;&gt; &gt; at<br>
&gt;&gt; &gt; all.<br>
&gt;&gt;<br>
&gt;&gt; there is, the package moved across arches so adding the PR makes s=
ure<br>
&gt;&gt; it is upgraded.<br>
&gt;<br>
&gt;<br>
&gt; Surely the PR service handles this if you&#39;re running a feed.=C2=A0=
 If you&#39;re not<br>
&gt; running a feed then this isn&#39;t a problem.<br>
<br>
</span>It does not; it goes back to r0.</blockquote><div><br></div><div>Cha=
nging arch on a package resets the incrementing PR?=C2=A0 Isn&#39;t that a =
bug?</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a1141d8a2765c690558f11933--

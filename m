Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6899C7316D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 01:57:08 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id g8so60407082igr.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Apr 2016 18:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EjwtaeKwEu3xNm4Q0ynxE+1tvqVJzBCbO7J9Wcmgfh4=;
	b=PETgU5ixNRH7f6+/PeM7ZExGXKuyzhrDVxrPWqpbp+TbFCYoVrdaD+jVVPXiPrIhYF
	Az84HEuox5j6XYxYzeyNGLDfxDm9r6Fw7mX/kSyy1+tiUozzqW8LNtGxtW6qFQQybDg2
	z9lKwB81/wjShhKXRj7PQDTtW4zgBoG9xqNcY9w9vgAhaYSnUyjqbSyu5x3h2G97ZHoE
	kNnzBLaEDbbNZlfVHoAEER3O4DBdXD0qp462WkKhm15kNJs5RP9cblQTnLzqaZ6+j5l7
	JKVoeVzAKvuRLri7acvHOsT7AduQobYazuCT0XBoXR3FhLYeVHBrqH0WjsW51Gelidkb
	Lehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EjwtaeKwEu3xNm4Q0ynxE+1tvqVJzBCbO7J9Wcmgfh4=;
	b=RAhcrIXnLYIpF+ZKSGcvh/jtvvHznjp8uCsSQLkEy1UsBeGX3hyjJAhVxoRBzeOv9H
	W2wx3w0V4ohwvV+n9e6TBhzx3E+M2fOcoyDY1iTIOCTvSwPk+fC5R2TezKak7qr+mztx
	S2K1sUpmD79W8wyP8YuZFlbngNmRSiUxvYXW93wQwcbQGh1jvcZb+QNiuJuU1K76CwqM
	dKNuriiZi2Ng2QdhTEdfhMP7zZmJwkv/JleGsa3c0OkKMEdTwZnz+5mOlJBzKC5tE3Vg
	JHCjRKshdKlFMWmRUB1a7I1u8Bu0nyXNDP5KGw0Zs5CtrKD6xqqWDmLE/7kElq3Qzh/d
	6f+A==
X-Gm-Message-State: AD7BkJJz5sabg0XEh5/jEAIj/xCMjV+KiZVjvlDuCT7VHIrpesAb0C9RP01DstFBatfKJH8QmWlc+CWh0m+EjA==
X-Received: by 10.50.61.234 with SMTP id t10mr16489559igr.20.1460339828856;
	Sun, 10 Apr 2016 18:57:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1460297667.git.liezhi.yang@windriver.com>
	<86645b1cea4e8cd70156e0fd5f4fb2480933b81d.1460297667.git.liezhi.yang@windriver.com>
	<20160410190630.GI16135@denix.org> <570AFB23.9070507@windriver.com>
In-Reply-To: <570AFB23.9070507@windriver.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Mon, 11 Apr 2016 01:56:59 +0000
Message-ID: <CABcZANk80jGAHW4uUFqoF2DkMqh7wL2TpOVvQbo4-w+XXmMQwQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>,
	Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] base.bbclass: fix COMPATIBLE_MACHINE
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
X-List-Received-Date: Mon, 11 Apr 2016 01:57:09 -0000
Content-Type: multipart/alternative; boundary=047d7bdc07e2c01e6105302bdc6c

--047d7bdc07e2c01e6105302bdc6c
Content-Type: text/plain; charset=UTF-8

On Sun, Apr 10, 2016 at 6:17 PM Robert Yang <liezhi.yang@windriver.com>
wrote:

>
>
> On 04/11/2016 03:06 AM, Denys Dmytriyenko wrote:
> > On Sun, Apr 10, 2016 at 07:14:56AM -0700, Robert Yang wrote:
> >> It mismatched such as qemux86 and qemux86-64 which was incorrect, for
> >> example:
> >> COMPATIBLE_MACHINE = "(qemux86)"
> >
> > That will match qemux86 and qemux86-64 and is by design! It's a regular
>
> I'm afraid no, please see my last reply, for others such as
> MACHINE_OVERRIDES, they never design to work in such a way, so I don't
> think that COMPATIBLE_MACHINE should work in this way. If you really
> want to match more, I think that you can set it as "(qemux86.*)" or
> something familiar.
>

That's an apples and oranges comparison. MACHINEOVERRIDES is part of
OVERRIDES, which has *completely* different semantics than COMPATIBLE_*.
COMPATIBLE_MACHINE is a regex variable more like BBMASK than anything else,
and it's been that way since we introduced it. OVERRIDES has nothing to do
with regular expressions.

--047d7bdc07e2c01e6105302bdc6c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr">On Sun, Apr 10=
, 2016 at 6:17 PM Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.c=
om">liezhi.yang@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex"><br>
<br>
On 04/11/2016 03:06 AM, Denys Dmytriyenko wrote:<br>
&gt; On Sun, Apr 10, 2016 at 07:14:56AM -0700, Robert Yang wrote:<br>
&gt;&gt; It mismatched such as qemux86 and qemux86-64 which was incorrect, =
for<br>
&gt;&gt; example:<br>
&gt;&gt; COMPATIBLE_MACHINE =3D &quot;(qemux86)&quot;<br>
&gt;<br>
&gt; That will match qemux86 and qemux86-64 and is by design! It&#39;s a re=
gular<br>
<br>
I&#39;m afraid no, please see my last reply, for others such as<br>
MACHINE_OVERRIDES, they never design to work in such a way, so I don&#39;t<=
br>
think that COMPATIBLE_MACHINE should work in this way. If you really<br>
want to match more, I think that you can set it as &quot;(qemux86.*)&quot; =
or<br>
something familiar.<br></blockquote><div><br></div><div>That&#39;s an apple=
s and oranges comparison. MACHINEOVERRIDES is part of OVERRIDES, which has =
*completely* different semantics than COMPATIBLE_*. COMPATIBLE_MACHINE is a=
 regex variable more like BBMASK than anything else, and it&#39;s been that=
 way since we introduced it. OVERRIDES has nothing to do with regular expre=
ssions.</div></div></div>

--047d7bdc07e2c01e6105302bdc6c--

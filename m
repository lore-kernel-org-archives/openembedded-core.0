Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T526h-0007kF-EY
	for openembedded-core@lists.openembedded.org;
	Sat, 25 Aug 2012 00:11:59 +0200
Received: by eaad12 with SMTP id d12so565974eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2012 14:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=5Nh0oIe43fakvJB+xeAexN/HqD9VDJC/J8L2zpEJe4E=;
	b=Cem96GP4CVmwrB1C3KmhwmzJJ36vdlgQfy4xJlE9uP7NhLs1uSoURchVHXHfDmRomo
	a37fnrQVAcSDUob1+FOT54BnFfglNYUmQFx90dvaQ3yohz9/6yOe4H0wTWMho+oMs9r5
	Iz+LZgkuY+LtP489DejKjazX/3J+xWqLFv1AAT64sAPRUgqA2H3PFndnYkO7C76yYRcV
	pk9PTaEHvLBEfoVTCu0wd7WP6Vd5ECBQV+A5nIWYgTEJ/fud298fAsnaXZGZgzqcy8Py
	Zv2V2R0EfGJhNNeqUivSg810wpVrFJ99XPnu71nz6alY8ucNqedad1OrHJiK7Mc7SUcw
	qD2g==
MIME-Version: 1.0
Received: by 10.14.198.129 with SMTP id v1mr8840283een.42.1345845591549; Fri,
	24 Aug 2012 14:59:51 -0700 (PDT)
Received: by 10.14.2.5 with HTTP; Fri, 24 Aug 2012 14:59:51 -0700 (PDT)
In-Reply-To: <C309CEF1-33E5-4DD0-BA0E-8414EB53802C@gmail.com>
References: <7dacdb4ffd32fe781e4cd0c54b428cf86b96b693.1345518098.git.raj.khem@gmail.com>
	<8a3cf0ce40dbc72a43f08bfed56e61569fe7a910.1345518098.git.raj.khem@gmail.com>
	<48919519-8CA2-41A8-96EA-F5D7F91DE33F@gmail.com>
	<CAMKF1sou8jjkoktbC4J1O+b-KbxZ43MyF3aPq68S74p8wC_qwQ@mail.gmail.com>
	<C309CEF1-33E5-4DD0-BA0E-8414EB53802C@gmail.com>
Date: Fri, 24 Aug 2012 14:59:51 -0700
Message-ID: <CAMKF1srk7SJSGiCDztiyx71NJZUgG530=QbhYCMm88t6ndgSbw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Elvis Dowson <elvis.dowson@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/9] gcc-cross: Make gcc-cross-initial as the only intermediate gcc stage
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
X-List-Received-Date: Fri, 24 Aug 2012 22:11:59 -0000
Content-Type: multipart/alternative; boundary=047d7b34373868264f04c80a18fc

--047d7b34373868264f04c80a18fc
Content-Type: text/plain; charset=UTF-8

On Friday, August 24, 2012, Elvis Dowson <elvis.dowson@gmail.com> wrote:
>
> On Aug 25, 2012, at 1:10 AM, Khem Raj wrote:
>
>> On Fri, Aug 24, 2012 at 2:08 PM, Elvis Dowson <elvis.dowson@gmail.com>
wrote:
>>>
>>> I'm adapting my earlier gcc-4.5 recipes, to try and get them to build
with
>>> the latest poky master.
>>>
>>> I'm using eglibc-2.13, so it is possible for this version to drop the
>>> gcc-cross-intermediate stage, or is it only with newer eglibc versions?
>>>
>>
>> well it wont work with anything older than eglibc 2.16
>
> What should I do to get the gcc-4.5 recipes to continue to build, with
eglib-2.13,
> against the poky master branch? Should I retain the gcc-intermediate
recipes?

Back port some patches I did for eglibc 2.16 and drop intermediate recipes
> Best regards,
>
> Elvis

--047d7b34373868264f04c80a18fc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Friday, August 24, 2012, Elvis Dowson &lt;<a href=3D"mailto:elvi=
s.dowson@gmail.com">elvis.dowson@gmail.com</a>&gt; wrote:<br>&gt;<br>&gt; O=
n Aug 25, 2012, at 1:10 AM, Khem Raj wrote:<br>&gt;<br>&gt;&gt; On Fri, Aug=
 24, 2012 at 2:08 PM, Elvis Dowson &lt;<a href=3D"mailto:elvis.dowson@gmail=
.com">elvis.dowson@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>&gt;&gt;&gt; I&#39;m adapting my earlier gcc-4.5 recipes, t=
o try and get them to build with<br>&gt;&gt;&gt; the latest poky master.<br=
>&gt;&gt;&gt;<br>&gt;&gt;&gt; I&#39;m using eglibc-2.13, so it is possible =
for this version to drop the<br>
&gt;&gt;&gt; gcc-cross-intermediate stage, or is it only with newer eglibc =
versions?<br>&gt;&gt;&gt;<br>&gt;&gt;<br>&gt;&gt; well it wont work with an=
ything older than eglibc 2.16<br>&gt;<br>&gt; What should I do to get the g=
cc-4.5 recipes to continue to build, with eglib-2.13,<br>
&gt; against the poky master branch? Should I retain the gcc-intermediate r=
ecipes?<br><br>Back port some patches I did for eglibc 2.16 and drop interm=
ediate recipes<br>&gt; Best regards,<br>&gt;<br>&gt; Elvis

--047d7b34373868264f04c80a18fc--

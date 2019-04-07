Return-Path: <just.another.mariano@gmail.com>
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
	[209.85.160.178])
	by mail.openembedded.org (Postfix) with ESMTP id A31A07D311
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Apr 2019 17:22:57 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id p20so12827732qtc.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Apr 2019 10:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Tm0djKz1w4A/mg7dJmoqA+mRRGwYx9sUhtUo3ArdPL8=;
	b=f+i/2lw5TYaXSCUvAfMq/Mxm5uXwC8OTn5l4ig8y2xkN1/uaqRy19HBFCWL8moKajo
	bOI75FKBhcSn3DKlwu8RzjBbo1RoQXnQlUNiSkD6vQuIRNzdHU1NO+lG+pUWM4aXTAFJ
	wAxeHrLL3j/gOZdx7BN5dl389QpsHFXPhLN+pcjUGnIMMwMRtuV4rR5HaqKcnlkwyPWa
	pXZV4yZnEvrdxtKRRj+J8LxfkqslkOQdma/P3eQ1aORxsXgjLm5J+cPqwGinxHNRBrSR
	RIaE81mSMF8N9YyQWnaZgQZ9UK6ifS87uVTQ55a58GrJ0DuWFVeLX1Y2T4vQPJT0daZe
	d3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Tm0djKz1w4A/mg7dJmoqA+mRRGwYx9sUhtUo3ArdPL8=;
	b=l8ore0EpQJWRVH9CHQqWl+KvzBy50GNyPh9ZUt4roRU2YtpQ1sG9phkdAiXkVglhfL
	3JxeBINF99HeOTCy3RihQW7yt+W9hrCFk4Lol5JSTh+f1WYY8DsT/Bc3PBdD3INIqU2C
	7Zop7p0rU5hLQ+L7aWtfurTn3+ukYQyG5V4/CGFNR9/0Y8LQutFq9vXSGwFC6+QYNjat
	G+6vhfF7BAZp4r2IyagD22Pne/WbJlvxtzA+ScpflEgYuBdxIHqB33AmWwyNg85mi6Bs
	1AuQxhDfNoPoHz70k2rEsfhjolwQ23/wmUWMcfDgdMGB/vCumbkUgimGa2PB/dumhrGk
	ruDg==
X-Gm-Message-State: APjAAAVUvPLcJMkVRbmpD5Mya8QMhYzBLYPPVPzu82Pk5Wy5jT7Y4n0T
	Vg4JN5ApTQXi4SUN2I9WsN6+fqJeJWnSXf+Er0CdSd1Z
X-Google-Smtp-Source: APXvYqyuDkmjdkK3k82k5ngJUx9pvUudjy0rxwpRGWjD+MRQI/7uUK0mRbDDLLqwH5w6OjnADyVSlSPopTtlR0S9wUA=
X-Received: by 2002:a0c:9246:: with SMTP id 6mr20163623qvz.194.1554657778622; 
	Sun, 07 Apr 2019 10:22:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1554391453.git.just.another.mariano@gmail.com>
	<CAJTo0LYVNgEkkhmv9j=hOE8bzn5KCzWZLSdrngG4UVrNBfaf+g@mail.gmail.com>
	<CA+TmX=OWwJxVcrGoCaBHEJCj1QtEMHiZrUu=gudw86hwn-WMxg@mail.gmail.com>
In-Reply-To: <CA+TmX=OWwJxVcrGoCaBHEJCj1QtEMHiZrUu=gudw86hwn-WMxg@mail.gmail.com>
From: Mariano Lopez <just.another.mariano@gmail.com>
Date: Sun, 7 Apr 2019 12:22:47 -0500
Message-ID: <CA+TmX=M9mj=46NJKipXL8r1hYu3e5ic5b=G==gjtAfV4niO8tQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Feature to use symbolic links to binaries for ptest
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
X-List-Received-Date: Sun, 07 Apr 2019 17:22:57 -0000
Content-Type: multipart/alternative; boundary="000000000000a466b00585f3f879"

--000000000000a466b00585f3f879
Content-Type: text/plain; charset="UTF-8"

Thanks for pointing that out! The busybox recipe provided me
insight on how to implement this series in a cleaner way.
I refactor the code and the v2 of the series can be found here:
http://lists.openembedded.org/pipermail/openembedded-core/2019-April/280981.html

Please do not integrate this series

Thanks again Ross!

On Fri, Apr 5, 2019 at 1:49 PM Mariano Lopez <just.another.mariano@gmail.com>
wrote:

> Sure, can you integrate this in the while I work on the busybox one? I'll
> do it as part of bug 12597 that is also assigned to me
>
> Mariano
>
> On Fri, Apr 5, 2019 at 9:37 AM Burton, Ross <ross.burton@intel.com> wrote:
>
>> Can you also port busybox to this instead of its own hand-coded logic?
>>
>> Ross
>>
>> On Fri, 5 Apr 2019 at 15:27, Mariano Lopez
>> <just.another.mariano@gmail.com> wrote:
>> >
>> > Some binaries are renamed by update-alternatives class at build time
>> > and some ptest run against a binary belonging to another package. Take
>> > for example busybox or util-linux.
>> >
>> > This series adds a directory within the ptest path with symlinks to the
>> > binaries produced by the package, so just adding this directory to the
>> > PATH will test the correct binaries.
>> >
>> > To use this feature just add PTEST_BINDIR = "1" to the recipe.
>> >
>> > This will help to solve bug 13238.
>> >
>> > [YOCTO #13238]
>> >
>> > The following changes since commit
>> ffa5a1bda6741f5dc9f1b8db1bb37b0c6f103c99:
>> >
>> >   asciidoc: specify XML catalogue to use (2019-04-03 14:56:27 +0100)
>> >
>> > are available in the Git repository at:
>> >
>> >   git://github.com/justanotherboy/poky bug12597
>> >   https://github.com/justanotherboy/poky/tree/bug12597
>> >
>> > Mariano Lopez (3):
>> >   update-alternatives.bbclass: Add function to get renamed binaries
>> >   ptest.bbclass: Add feature to populate a binary directory
>> >   util-linux: Use PTEST binary directory
>> >
>> >
>> > --
>> > 2.19.2
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>

--000000000000a466b00585f3f879
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Thanks for pointing that out! The busybox=
 recipe provided me</div><div dir=3D"ltr">insight on how to implement this =
series in a cleaner way.<br>I refactor the code and the v2 of the series ca=
n be found here:<br><a href=3D"http://lists.openembedded.org/pipermail/open=
embedded-core/2019-April/280981.html">http://lists.openembedded.org/piperma=
il/openembedded-core/2019-April/280981.html</a><br><br></div><div>Please do=
 not integrate this series</div><div><br></div><div>Thanks again Ross!<br><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Fri, Apr 5, 2019 at 1:49 PM Mariano Lopez &lt;<a href=3D"mailto:jus=
t.another.mariano@gmail.com">just.another.mariano@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"=
><div>Sure, can you integrate this in the while I work on the busybox one? =
I&#39;ll do it as part of bug 12597 that is also assigned to me<br> </div><=
div><br></div><div>Mariano<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Apr 5, 2019 at 9:37 AM Burton, Ross &=
lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@i=
ntel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Can you also port busybox to this instead of its own hand-coded log=
ic?<br>
<br>
Ross<br>
<br>
On Fri, 5 Apr 2019 at 15:27, Mariano Lopez<br>
&lt;<a href=3D"mailto:just.another.mariano@gmail.com" target=3D"_blank">jus=
t.another.mariano@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Some binaries are renamed by update-alternatives class at build time<b=
r>
&gt; and some ptest run against a binary belonging to another package. Take=
<br>
&gt; for example busybox or util-linux.<br>
&gt;<br>
&gt; This series adds a directory within the ptest path with symlinks to th=
e<br>
&gt; binaries produced by the package, so just adding this directory to the=
<br>
&gt; PATH will test the correct binaries.<br>
&gt;<br>
&gt; To use this feature just add PTEST_BINDIR =3D &quot;1&quot; to the rec=
ipe.<br>
&gt;<br>
&gt; This will help to solve bug 13238.<br>
&gt;<br>
&gt; [YOCTO #13238]<br>
&gt;<br>
&gt; The following changes since commit ffa5a1bda6741f5dc9f1b8db1bb37b0c6f1=
03c99:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0asciidoc: specify XML catalogue to use (2019-04-03 14:56:2=
7 +0100)<br>
&gt;<br>
&gt; are available in the Git repository at:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0git://<a href=3D"http://github.com/justanotherboy/poky" re=
l=3D"noreferrer" target=3D"_blank">github.com/justanotherboy/poky</a> bug12=
597<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://github.com/justanotherboy/poky/tree/bug=
12597" rel=3D"noreferrer" target=3D"_blank">https://github.com/justanotherb=
oy/poky/tree/bug12597</a><br>
&gt;<br>
&gt; Mariano Lopez (3):<br>
&gt;=C2=A0 =C2=A0update-alternatives.bbclass: Add function to get renamed b=
inaries<br>
&gt;=C2=A0 =C2=A0ptest.bbclass: Add feature to populate a binary directory<=
br>
&gt;=C2=A0 =C2=A0util-linux: Use PTEST binary directory<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; 2.19.2<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
</blockquote></div></div>
</blockquote></div>

--000000000000a466b00585f3f879--

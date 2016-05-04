Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id 1D8116FF4E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 12:13:57 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id x201so62306676oif.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 May 2016 05:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=BJBI5HxxKnz1P4EHFWl8v//Qs/Ba3+inUdvpY9A3knk=;
	b=Xs8qM1Kvb1pWD3Q1176V1oKLx5kfd26FtdfjC9Y8sXNtZ6LJyvmf1JcIblI4DtPBH4
	X1+Yij8HtVs5HfwjyNrYdHJTGeVULdYCiRXZI6GPx+Zf9/a2DJyVJS1aG1c7nx4F7sUm
	Eq2f3Hf63kGUOqj0Zcdch374iSRYTdnxt+V18/fke2U98OLssi53TBIIbIQe0mdmU5bF
	1hVETd5i5w+nhimrgp2EH7/THi5D13DDBIUOqtFK95lzY5ZrkzGlezHuyT7lZQ4zaSyl
	rNc/zT09t9YSzgormvQDm5LfWctI5oumPNhJdK7sV2rvrDicypwQ9qE/Qp84CzdmtpCj
	L1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=BJBI5HxxKnz1P4EHFWl8v//Qs/Ba3+inUdvpY9A3knk=;
	b=S7wwXej7EzAl8NygVvfBk1DJIXooXasV4zJER1V38Uk74NJ/3aqN7OVFOl/PRcDetY
	ci2iM5tU4jzRvvJ6cIXaPEEkk4gOyBOS2BXGFVE73AcR6uBAZXrif+R9/J5/YPJv9zJC
	+dN/FDbi6Wqwle46coRe4ZXIR8Xc8du12f46Y31YWWG3s8aJQVeDpZlXOnKT6MxDt8SQ
	8SNKWiWlFwRrJqkQZNHbifdzRJidtBZ6FvCR50+0CAuwVZpvREMsjXaTIXJbJOAPd62D
	cJZeusDW8nsRmwzyOcU2D6jiIf2hBzozLrOWwBrqcdb/smkIDFSRgvs+HfBgNga0QylX
	zU2w==
X-Gm-Message-State: AOPr4FXoIIGThONBaVxFDKfXTGFAEntfFwB70XThQ8Vhik6Z9rd2PMCfGJo5IURTIKOPdIK9gtrNjALtjs9/zw==
MIME-Version: 1.0
X-Received: by 10.202.170.65 with SMTP id t62mr3759042oie.60.1462364038145;
	Wed, 04 May 2016 05:13:58 -0700 (PDT)
Received: by 10.157.32.135 with HTTP; Wed, 4 May 2016 05:13:58 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1605040637480.12063@localhost.localdomain>
References: <alpine.LFD.2.20.1605031245360.6672@localhost.localdomain>
	<CADkTA4PPYfetBymZ1mii_sc7f71za-V0dBbcgApHyhDHwxKyVw@mail.gmail.com>
	<alpine.LFD.2.20.1605031421460.12750@localhost.localdomain>
	<CADkTA4Ocu2L9GoBM4YadkGZJq+2Pd8UFA2acSeX4MSibEo-ZtA@mail.gmail.com>
	<alpine.LFD.2.20.1605040637480.12063@localhost.localdomain>
Date: Wed, 4 May 2016 08:13:58 -0400
Message-ID: <CADkTA4MHDcPatUBzXLMV92xFb5vWFbO+Zy--XyB-32AQLdNUgw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: clarifying details about "is not set" lines in kernel config fragment files
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
X-List-Received-Date: Wed, 04 May 2016 12:14:00 -0000
Content-Type: multipart/alternative; boundary=001a113c352c06b5cb0532032973

--001a113c352c06b5cb0532032973
Content-Type: text/plain; charset=UTF-8

On Wed, May 4, 2016 at 6:41 AM, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>
>   one more question about fragments which i'm fairly sure i know the
> answer to, but will be embarrassed about if i'm wrong.
>
>   if i want to set a kernel option in a fragment, i'm fairly certain i
> need to *explicitly* set all options it depends on, correct?
> otherwise, that option is left unselected.
>

Correct.


>
>   is there any warning in a log file that mentions that happening?
>
>
The kconfig audit will indicate that the value didn't make it into the
final .config, and
if the option has been tagged "hardware", then that warning is dumped to
the screen
for the developer to see.

More audit information is available within the kernel build itself, and
IIRC that is
covered in the more detailed guides.

Right now, it can't tell you what was missing .. but there's no a library
that I can
potentially use to get that information, and I've raised an enhancement bug
for 2.2
to not only output why an option didn't make they final .config .. but why
it was
dropped.


> rday
>
> p.s. oh, and i think someone mentioned this earlier ... what happens
> if i explicitly set one option, then explicitly "not set" another
> option that is "select"ed by that first option? who wins?
>
>
Last through the gate. Ordering matters. But the "redefinition" of the value
is logged in the audit output

Bruce


>   ok, back to work ...
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a113c352c06b5cb0532032973
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, May 4, 2016 at 6:41 AM, Robert P. J. Day <span dir=3D"ltr">&lt;=
<a href=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcour=
se.ca</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
=C2=A0 one more question about fragments which i&#39;m fairly sure i know t=
he<br>
answer to, but will be embarrassed about if i&#39;m wrong.<br>
<br>
=C2=A0 if i want to set a kernel option in a fragment, i&#39;m fairly certa=
in i<br>
need to *explicitly* set all options it depends on, correct?<br>
otherwise, that option is left unselected.<br></blockquote><div><br></div><=
div>Correct.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
=C2=A0 is there any warning in a log file that mentions that happening?<br>
<br></blockquote><div><br></div><div>The kconfig audit will indicate that t=
he value didn&#39;t make it into the final .config, and</div><div>if the op=
tion has been tagged &quot;hardware&quot;, then that warning is dumped to t=
he screen</div><div>for the developer to see.</div><div><br></div><div>More=
 audit information is available within the kernel build itself, and IIRC th=
at is</div><div>covered in the more detailed guides.</div><div><br></div><d=
iv>Right now, it can&#39;t tell you what was missing .. but there&#39;s no =
a library that I can</div><div>potentially use to get that information, and=
 I&#39;ve raised an enhancement bug for 2.2</div><div>to not only output wh=
y an option didn&#39;t make they final .config .. but why it was</div><div>=
dropped.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
rday<br>
<br>
p.s. oh, and i think someone mentioned this earlier ... what happens<br>
if i explicitly set one option, then explicitly &quot;not set&quot; another=
<br>
option that is &quot;select&quot;ed by that first option? who wins?<br>
<br></blockquote><div><br></div><div>Last through the gate. Ordering matter=
s. But the &quot;redefinition&quot; of the value</div><div>is logged in the=
 audit output</div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">
=C2=A0 ok, back to work ...<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
--<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
Robert P. J. Day=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Ottawa, Ontario,=
 CANADA<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 <a href=3D"http://crashcourse.ca" rel=3D"noreferrer" target=3D"_=
blank">http://crashcourse.ca</a><br>
<br>
Twitter:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a=
 href=3D"http://twitter.com/rpjday" rel=3D"noreferrer" target=3D"_blank">ht=
tp://twitter.com/rpjday</a><br>
LinkedIn:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://ca.linkedin.=
com/in/rpjday" rel=3D"noreferrer" target=3D"_blank">http://ca.linkedin.com/=
in/rpjday</a><br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
<br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer=
, for chaos and madness await thee at its end&quot;</div>
</div></div>

--001a113c352c06b5cb0532032973--

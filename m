Return-Path: <giuseppe.condorelli@gmail.com>
Received: from mail-ob0-f172.google.com (mail-ob0-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id B68E96FE5C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Aug 2014 14:51:58 +0000 (UTC)
Received: by mail-ob0-f172.google.com with SMTP id wn1so2969323obc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Aug 2014 07:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=GC8ZrMXgBke0w7WMhYztk1KGYFOg7WWLg4gFX2Ito0A=;
	b=qvXFm+jJJSYoIf0RrO2dc5QGsuGigmsf4BelZHqFHm3uc1weNtGrLmkWE/+8fDnD61
	CWcz8bvuppaCDUmIn4DZHh5W4Bxq6ct6PuzmfZe1RYNCziRlURzSNKy15B4PshhD/T/s
	3WkMdjlT+tiB0SeHNekWuw6AgI+Ck2afzAjmtrziWTcZXi0edj8MZxsJGncIFU56xGEf
	SVLjBzGA3Dp4KouDc6nddiRef/kg7R15Ml61cyI56W4N40Y7amEQh79WxWZc1CCsOKNy
	vjqBMhTFModjQHPmH4IJbD2UZnKD/b1f1aLcPUsZ0nXNriB4+upRC/IFU2LNXjBCrn0S
	XLDw==
MIME-Version: 1.0
X-Received: by 10.182.27.5 with SMTP id p5mr23832372obg.42.1407423119716; Thu,
	07 Aug 2014 07:51:59 -0700 (PDT)
Received: by 10.182.92.137 with HTTP; Thu, 7 Aug 2014 07:51:59 -0700 (PDT)
In-Reply-To: <CAOLEWZV=ifTbkm+0owRh404z5aakvGEqwPzjWo_i8pLYNy7qiw@mail.gmail.com>
References: <CAOHjBZt0MW329iM2UNFUs3bZuAR61tA1Y9k4dt--hDoy3fh=AQ@mail.gmail.com>
	<CAOLEWZV=ifTbkm+0owRh404z5aakvGEqwPzjWo_i8pLYNy7qiw@mail.gmail.com>
Date: Thu, 7 Aug 2014 16:51:59 +0200
Message-ID: <CAOHjBZsd65LB=5amgg-dkSMe1K1zBnAP5rNuwATivvYd-_ir0A@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Stephen Arnold <stephen.arnold42@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: How to force patch application
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
X-List-Received-Date: Thu, 07 Aug 2014 14:52:06 -0000
Content-Type: multipart/alternative; boundary=089e0115f6cc1b166205000b3b07

--089e0115f6cc1b166205000b3b07
Content-Type: text/plain; charset=UTF-8

Hi Steve,

thanks for the reply.

The problem is that I need to force a patch application (like patch --force
option) at my own risk.
Do you see any solution?
Giuseppe


2014-08-07 16:43 GMT+02:00 Stephen Arnold <stephen.arnold42@gmail.com>:

> Not sure if there's an easy way with quilt (check the quilt options) but a
> relatively easy way would be to use your own patch routine (essentially
> anything you want).  One thing you could do is disable the normal patch
> application (add ";patch=0" to the end of the patch line in SRC_URI) and
> then use your own do_patch to force it (if that's really what you want to
> do).  I guess I would ask "why?" and if it were me I'd just reroll the
> patch and fix it.  But I don't know what the real problem is, so...
>
> Steve
>
>
>
> On Thu, Aug 7, 2014 at 6:14 AM, Giuseppe Condorelli <
> giuseppe.condorelli@gmail.com> wrote:
>
>> Hi All,
>>
>> please can I know if is it possible, using the do_patch routine,
>> to force the application of a given patch?
>> I mean, like the patch --force command.
>>
>> Please let me know, I tried w/o good result.
>>
>> Best Regards,
>> Giuseppe
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--089e0115f6cc1b166205000b3b07
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Steve,</div><div>=C2=A0</div><div>thanks for the r=
eply.</div><div>=C2=A0</div><div>The problem is that I need to force a patc=
h application (like patch --force option) at my own risk.</div><div>Do you =
see any solution?</div>
<div>Giuseppe</div></div><div class=3D"gmail_extra"><br><br><div class=3D"g=
mail_quote">2014-08-07 16:43 GMT+02:00 Stephen Arnold <span dir=3D"ltr">&lt=
;<a href=3D"mailto:stephen.arnold42@gmail.com" target=3D"_blank">stephen.ar=
nold42@gmail.com</a>&gt;</span>:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>Not sure if there&#39;=
s an easy way with quilt (check the quilt options) but a relatively easy wa=
y would be to use your own patch routine (essentially anything you want).=
=C2=A0 One thing you could do is disable the normal patch application (add =
&quot;;patch=3D0&quot; to the end of the patch line in SRC_URI) and then us=
e your own do_patch to force it (if that&#39;s really what you want to do).=
=C2=A0 I guess I would ask &quot;why?&quot; and if it were me I&#39;d just =
reroll the patch and fix it.=C2=A0 But I don&#39;t know what the real probl=
em is, so...<br>

<br></div>Steve<br><br></div><div class=3D"gmail_extra"><br><br><div class=
=3D"gmail_quote"><div><div class=3D"h5">On Thu, Aug 7, 2014 at 6:14 AM, Giu=
seppe Condorelli <span dir=3D"ltr">&lt;<a href=3D"mailto:giuseppe.condorell=
i@gmail.com" target=3D"_blank">giuseppe.condorelli@gmail.com</a>&gt;</span>=
 wrote:<br>

</div></div><blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;=
border-left-color:rgb(204,204,204);border-left-width:1px;border-left-style:=
solid" class=3D"gmail_quote"><div><div class=3D"h5"><div dir=3D"ltr"><div>H=
i All,</div>
<div>=C2=A0</div><div>please can I know if is it possible, using the do_pat=
ch routine,</div>
<div>to force the application of a given patch?</div><div>I mean, like the =
patch --force command.</div>
<div>=C2=A0</div><div>Please let me know, I tried w/o good result.</div><di=
v>=C2=A0</div><div>Best Regards,</div><div>Giuseppe</div></div>
<br></div></div><span class=3D"HOEnZb"><font color=3D"#888888">--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
<br></font></span></blockquote></div><br></div>
<br>--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
<br></blockquote></div><br></div>

--089e0115f6cc1b166205000b3b07--

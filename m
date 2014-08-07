Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 898436A362
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Aug 2014 22:25:24 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id l18so4668903wgh.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Aug 2014 15:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ZxdrQ00MLonNRK1UKn0yRSTnxhH/k9H+82ou15mSUKM=;
	b=hY1F37EosSCe2GltHlxnu6AlpbA6jcpgQ2PHIgo5q5voUEaUSxSGm00cErjwI6a1fl
	91wLidbSqmXRPLdf38zH58Mfw9TaQZrfg9p9DIsnGs24oYF5M2Rrg0EsbBsP+0IV4Nq2
	eUj+WHM9pOFEvOM+sOKXNJQJeYLZcpymbUTzn4Hntq/f5k82DpFbrVpO6gaLQQRrUaz3
	4SQPI+x3I4r+sSnd4sqFmTFfpq9JPd1mrOiE2TLXHQfjSjzJ0b2uYzJbMRxN5NCzcKQr
	KhI3vsGJZXdI0XmgSATv9BKbcngiGXMZVZ6wxKfE4rPRCYNckDjWNidYiKQizgpLfRk4
	73Lw==
MIME-Version: 1.0
X-Received: by 10.194.238.195 with SMTP id vm3mr1531802wjc.91.1407450325616;
	Thu, 07 Aug 2014 15:25:25 -0700 (PDT)
Received: by 10.194.164.165 with HTTP; Thu, 7 Aug 2014 15:25:25 -0700 (PDT)
In-Reply-To: <CAOHjBZsd65LB=5amgg-dkSMe1K1zBnAP5rNuwATivvYd-_ir0A@mail.gmail.com>
References: <CAOHjBZt0MW329iM2UNFUs3bZuAR61tA1Y9k4dt--hDoy3fh=AQ@mail.gmail.com>
	<CAOLEWZV=ifTbkm+0owRh404z5aakvGEqwPzjWo_i8pLYNy7qiw@mail.gmail.com>
	<CAOHjBZsd65LB=5amgg-dkSMe1K1zBnAP5rNuwATivvYd-_ir0A@mail.gmail.com>
Date: Thu, 7 Aug 2014 15:25:25 -0700
Message-ID: <CAOLEWZVFTKYkRScGg1P3TX5YbL9Yvj0gfUHBKuoMYsipEPK46w@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
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
X-List-Received-Date: Thu, 07 Aug 2014 22:25:30 -0000
Content-Type: multipart/alternative; boundary=089e013d14bcb290b40500119091

--089e013d14bcb290b40500119091
Content-Type: text/plain; charset=UTF-8

Yes, what I said previously:

1) disable current patch: add ";patch=0" to the end of the patch line in
SRC_URI
2a) add your patch to SRC_URI (if different than patch above)
2b) make your own do_patch() to apply the patch
2c) try this example for a way to supplement do_patch with your own
function:
meta-openembedded/meta-networking/recipes-support/netcat/
netcat-openbsd_1.105.bb
3) test it

Steve


On Thu, Aug 7, 2014 at 7:51 AM, Giuseppe Condorelli <
giuseppe.condorelli@gmail.com> wrote:

> Hi Steve,
>
> thanks for the reply.
>
> The problem is that I need to force a patch application (like patch
> --force option) at my own risk.
> Do you see any solution?
> Giuseppe
>
>
> 2014-08-07 16:43 GMT+02:00 Stephen Arnold <stephen.arnold42@gmail.com>:
>
> Not sure if there's an easy way with quilt (check the quilt options) but a
>> relatively easy way would be to use your own patch routine (essentially
>> anything you want).  One thing you could do is disable the normal patch
>> application (add ";patch=0" to the end of the patch line in SRC_URI) and
>> then use your own do_patch to force it (if that's really what you want to
>> do).  I guess I would ask "why?" and if it were me I'd just reroll the
>> patch and fix it.  But I don't know what the real problem is, so...
>>
>> Steve
>>
>>
>>
>> On Thu, Aug 7, 2014 at 6:14 AM, Giuseppe Condorelli <
>> giuseppe.condorelli@gmail.com> wrote:
>>
>>> Hi All,
>>>
>>> please can I know if is it possible, using the do_patch routine,
>>> to force the application of a given patch?
>>> I mean, like the patch --force command.
>>>
>>> Please let me know, I tried w/o good result.
>>>
>>> Best Regards,
>>> Giuseppe
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>

--089e013d14bcb290b40500119091
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div>Yes, what I said previously:<br><br></=
div>1) disable current patch: add &quot;;patch=3D0&quot; to the end of the =
patch line in SRC_URI<br></div><div>2a) add your patch to SRC_URI (if diffe=
rent than patch above)<br>
</div>2b) make your own do_patch() to apply the patch<br></div><div>2c) try=
 this example for a way to supplement do_patch with your own function:<br>m=
eta-openembedded/meta-networking/recipes-support/netcat/<a href=3D"http://n=
etcat-openbsd_1.105.bb">netcat-openbsd_1.105.bb</a><br>
</div>3) test it<br><br></div>Steve<br></div><div class=3D"gmail_extra"><br=
><br><div class=3D"gmail_quote">On Thu, Aug 7, 2014 at 7:51 AM, Giuseppe Co=
ndorelli <span dir=3D"ltr">&lt;<a href=3D"mailto:giuseppe.condorelli@gmail.=
com" target=3D"_blank">giuseppe.condorelli@gmail.com</a>&gt;</span> wrote:<=
br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>Hi Steve,</div><div>=
=C2=A0</div><div>thanks for the reply.</div><div>=C2=A0</div><div>The probl=
em is that I need to force a patch application (like patch --force option) =
at my own risk.</div>
<div>Do you see any solution?</div>
<div>Giuseppe</div></div><div class=3D"gmail_extra"><br><br><div class=3D"g=
mail_quote">2014-08-07 16:43 GMT+02:00 Stephen Arnold <span dir=3D"ltr">&lt=
;<a href=3D"mailto:stephen.arnold42@gmail.com" target=3D"_blank">stephen.ar=
nold42@gmail.com</a>&gt;</span>:<div>
<div class=3D"h5"><br>
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
=3D"gmail_quote"><div><div>On Thu, Aug 7, 2014 at 6:14 AM, Giuseppe Condore=
lli <span dir=3D"ltr">&lt;<a href=3D"mailto:giuseppe.condorelli@gmail.com" =
target=3D"_blank">giuseppe.condorelli@gmail.com</a>&gt;</span> wrote:<br>


</div></div><blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;=
border-left-color:rgb(204,204,204);border-left-width:1px;border-left-style:=
solid" class=3D"gmail_quote"><div><div><div dir=3D"ltr"><div>Hi All,</div>
<div>=C2=A0</div><div>please can I know if is it possible, using the do_pat=
ch routine,</div>
<div>to force the application of a given patch?</div><div>I mean, like the =
patch --force command.</div>
<div>=C2=A0</div><div>Please let me know, I tried w/o good result.</div><di=
v>=C2=A0</div><div>Best Regards,</div><div>Giuseppe</div></div>
<br></div></div><span><font color=3D"#888888">--<br>
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
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
<br></blockquote></div></div></div><br></div>
</blockquote></div><br></div>

--089e013d14bcb290b40500119091--

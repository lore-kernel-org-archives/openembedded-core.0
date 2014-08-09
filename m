Return-Path: <giuseppe.condorelli@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 0DB6761FE4
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Aug 2014 12:35:32 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id b13so6612494wgh.34
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Aug 2014 05:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=references:mime-version:in-reply-to:content-type
	:content-transfer-encoding:message-id:cc:from:subject:date:to;
	bh=QMgwYHhyqrcAfFjNdZYLEq1/Ut1bwB5zb7zjtSiWwds=;
	b=jdfThvFjZ9eM/WsOVxZMIzlRYVq9tnjEYRyqlon4/g+4Ew2k8Ua8DMdmPiwuufN8WO
	Mc77qR7yAXFEYoqvoWMmimC1dTfxwnzNack61QsD4XLki1hvywWgUC6wFIasmCAf/Lia
	S7/Fh5qGBLvPOtib9vk47Rttlcp0FzEuXhRwHt/ROozaItMmH6mOk+NwHAe4TVwK29V9
	Tw6a4edOemwbnc2jtRYs7PFB5Uxy5v3hMBVZKzvkV49WHgFcH7ud6iPhjI4UBOVtWEbu
	qp6UdM8DXRZvdlrpYyG3QWHebnSA3m4P3+VQUHIdqNl/Vpw63iLgvz9nQsg1G1N9fTCF
	cFTw==
X-Received: by 10.194.77.233 with SMTP id v9mr1736672wjw.129.1407587733365;
	Sat, 09 Aug 2014 05:35:33 -0700 (PDT)
Received: from [1.161.204.92] ([91.253.151.88])
	by mx.google.com with ESMTPSA id p3sm24388717wjw.13.2014.08.09.05.35.30
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 09 Aug 2014 05:35:32 -0700 (PDT)
References: <CAOHjBZt0MW329iM2UNFUs3bZuAR61tA1Y9k4dt--hDoy3fh=AQ@mail.gmail.com>
	<CAOLEWZV=ifTbkm+0owRh404z5aakvGEqwPzjWo_i8pLYNy7qiw@mail.gmail.com>
	<CAOHjBZsd65LB=5amgg-dkSMe1K1zBnAP5rNuwATivvYd-_ir0A@mail.gmail.com>
	<CAOLEWZVFTKYkRScGg1P3TX5YbL9Yvj0gfUHBKuoMYsipEPK46w@mail.gmail.com>
Mime-Version: 1.0 (1.0)
In-Reply-To: <CAOLEWZVFTKYkRScGg1P3TX5YbL9Yvj0gfUHBKuoMYsipEPK46w@mail.gmail.com>
Message-Id: <869F60C4-5D21-4006-B3DA-7DC789DBBB44@gmail.com>
X-Mailer: iPhone Mail (11D169)
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
Date: Sat, 9 Aug 2014 14:35:29 +0200
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
X-List-Received-Date: Sat, 09 Aug 2014 12:35:37 -0000
Content-Type: multipart/alternative;
	boundary=Apple-Mail-26461426-CC7C-4101-91B6-D354AC6DFA19
Content-Transfer-Encoding: 7bit

--Apple-Mail-26461426-CC7C-4101-91B6-D354AC6DFA19
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Many thanks Steve, I'll test it when possible.=20
Enjoy your time.=20
Giuseppe

> Il giorno 08/ago/2014, alle ore 00:25, Stephen Arnold <stephen.arnold42@gm=
ail.com> ha scritto:
>=20
> Yes, what I said previously:
>=20
> 1) disable current patch: add ";patch=3D0" to the end of the patch line in=
 SRC_URI
> 2a) add your patch to SRC_URI (if different than patch above)
> 2b) make your own do_patch() to apply the patch
> 2c) try this example for a way to supplement do_patch with your own functi=
on:
> meta-openembedded/meta-networking/recipes-support/netcat/netcat-openbsd_1.=
105.bb
> 3) test it
>=20
> Steve
>=20
>=20
>> On Thu, Aug 7, 2014 at 7:51 AM, Giuseppe Condorelli <giuseppe.condorelli@=
gmail.com> wrote:
>> Hi Steve,
>> =20
>> thanks for the reply.
>> =20
>> The problem is that I need to force a patch application (like patch --for=
ce option) at my own risk.
>> Do you see any solution?
>> Giuseppe
>>=20
>>=20
>> 2014-08-07 16:43 GMT+02:00 Stephen Arnold <stephen.arnold42@gmail.com>:
>>=20
>>> Not sure if there's an easy way with quilt (check the quilt options) but=
 a relatively easy way would be to use your own patch routine (essentially a=
nything you want).  One thing you could do is disable the normal patch appli=
cation (add ";patch=3D0" to the end of the patch line in SRC_URI) and then u=
se your own do_patch to force it (if that's really what you want to do).  I g=
uess I would ask "why?" and if it were me I'd just reroll the patch and fix i=
t.  But I don't know what the real problem is, so...
>>>=20
>>> Steve
>>>=20
>>>=20
>>>=20
>>>> On Thu, Aug 7, 2014 at 6:14 AM, Giuseppe Condorelli <giuseppe.condorell=
i@gmail.com> wrote:
>>>> Hi All,
>>>> =20
>>>> please can I know if is it possible, using the do_patch routine,
>>>> to force the application of a given patch?
>>>> I mean, like the patch --force command.
>>>> =20
>>>> Please let me know, I tried w/o good result.
>>>> =20
>>>> Best Regards,
>>>> Giuseppe
>>>>=20
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>=20
>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20

--Apple-Mail-26461426-CC7C-4101-91B6-D354AC6DFA19
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head><meta http-equiv="content-type" content="text/html; charset=utf-8"></head><body dir="auto"><div>Many thanks Steve, I'll test it when possible.&nbsp;</div><div>Enjoy your time.&nbsp;</div><div>Giuseppe</div><div><br>Il giorno 08/ago/2014, alle ore 00:25, Stephen Arnold &lt;<a href="mailto:stephen.arnold42@gmail.com">stephen.arnold42@gmail.com</a>&gt; ha scritto:<br><br></div><blockquote type="cite"><div><div dir="ltr"><div><div><div><div>Yes, what I said previously:<br><br></div>1) disable current patch: add ";patch=0" to the end of the patch line in SRC_URI<br></div><div>2a) add your patch to SRC_URI (if different than patch above)<br>
</div>2b) make your own do_patch() to apply the patch<br></div><div>2c) try this example for a way to supplement do_patch with your own function:<br>meta-openembedded/meta-networking/recipes-support/netcat/<a href="http://netcat-openbsd_1.105.bb">netcat-openbsd_1.105.bb</a><br>
</div>3) test it<br><br></div>Steve<br></div><div class="gmail_extra"><br><br><div class="gmail_quote">On Thu, Aug 7, 2014 at 7:51 AM, Giuseppe Condorelli <span dir="ltr">&lt;<a href="mailto:giuseppe.condorelli@gmail.com" target="_blank">giuseppe.condorelli@gmail.com</a>&gt;</span> wrote:<br>
<blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir="ltr"><div>Hi Steve,</div><div>&nbsp;</div><div>thanks for the reply.</div><div>&nbsp;</div><div>The problem is that I need to force a patch application (like patch --force option) at my own risk.</div>
<div>Do you see any solution?</div>
<div>Giuseppe</div></div><div class="gmail_extra"><br><br><div class="gmail_quote">2014-08-07 16:43 GMT+02:00 Stephen Arnold <span dir="ltr">&lt;<a href="mailto:stephen.arnold42@gmail.com" target="_blank">stephen.arnold42@gmail.com</a>&gt;</span>:<div>
<div class="h5"><br>
<blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir="ltr"><div>Not sure if there's an easy way with quilt (check the quilt options) but a relatively easy way would be to use your own patch routine (essentially anything you want).&nbsp; One thing you could do is disable the normal patch application (add ";patch=0" to the end of the patch line in SRC_URI) and then use your own do_patch to force it (if that's really what you want to do).&nbsp; I guess I would ask "why?" and if it were me I'd just reroll the patch and fix it.&nbsp; But I don't know what the real problem is, so...<br>


<br></div>Steve<br><br></div><div class="gmail_extra"><br><br><div class="gmail_quote"><div><div>On Thu, Aug 7, 2014 at 6:14 AM, Giuseppe Condorelli <span dir="ltr">&lt;<a href="mailto:giuseppe.condorelli@gmail.com" target="_blank">giuseppe.condorelli@gmail.com</a>&gt;</span> wrote:<br>


</div></div><blockquote style="margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-color:rgb(204,204,204);border-left-width:1px;border-left-style:solid" class="gmail_quote"><div><div><div dir="ltr"><div>Hi All,</div>
<div>&nbsp;</div><div>please can I know if is it possible, using the do_patch routine,</div>
<div>to force the application of a given patch?</div><div>I mean, like the patch --force command.</div>
<div>&nbsp;</div><div>Please let me know, I tried w/o good result.</div><div>&nbsp;</div><div>Best Regards,</div><div>Giuseppe</div></div>
<br></div></div><span><font color="#888888">--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href="mailto:Openembedded-core@lists.openembedded.org" target="_blank">Openembedded-core@lists.openembedded.org</a><br>
<a href="http://lists.openembedded.org/mailman/listinfo/openembedded-core" target="_blank">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
<br></font></span></blockquote></div><br></div>
<br>--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href="mailto:Openembedded-core@lists.openembedded.org" target="_blank">Openembedded-core@lists.openembedded.org</a><br>
<a href="http://lists.openembedded.org/mailman/listinfo/openembedded-core" target="_blank">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
<br></blockquote></div></div></div><br></div>
</blockquote></div><br></div>
</div></blockquote></body></html>

--Apple-Mail-26461426-CC7C-4101-91B6-D354AC6DFA19--

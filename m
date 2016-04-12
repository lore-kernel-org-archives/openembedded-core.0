Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id B04D265CB5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 22:33:48 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id f52so28989367qga.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 15:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=d0VQup85IdPm8a8izpCcyBvyjIlXk7d2MRBue2SZzKo=;
	b=z9oTO3KSnY9vqT5T72KxTPPBCy/+o7IxxO/5T2nJuKZf2US72KCDDpkXrs1xgJ8MuW
	hs32d9/4jSPChYQyS9cfatRhYxaRmKcD22HqLsL9DF8eI9GZ0RncNEKp2lOzhTOJREsa
	uTwiVcn/ZZvgz2+JBYP6kCKcfDI9WEYaVzckAJEcwl2T/jo6yga4bSLzmMmd+FBTjcsu
	6YRgICmffmlSertaZq8lOrq7oVTiKi4WGTC7eS2dQGJB6vczSi3LrZI6bzPGgGSxtrxv
	xYhLUaHNWR7aLDeK76UVQrBh2d46WXBHMSSnTLPpHqaaLn4lEbHiDBHkgtvIl68KNRej
	Ce2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=d0VQup85IdPm8a8izpCcyBvyjIlXk7d2MRBue2SZzKo=;
	b=hQjMPn7IXxYLZOyFgIx3ZNIncYeO0pJBxz+O4BnAG0E0EbQAMuZOWvmjtogCQIZilF
	zUe+tBSsstvgGtpO1l+sVXfMEtdhaess130l8DC/dBplrGYZ0vKSDPPoKwfTAsZ1S8HK
	iv0/zX+mwKa3q8zMoAArWNkxgoOkOd1PIJa+c5YB2EIGH34aDYpCx5Kyb4PU1ARB1v9g
	Qw7a65f5CmdpxxglXCpGPjIrwoGI+4RAkN8lg0zU51wZisIX28NM3Tj9FTMqvp0IBQTj
	bzvVWB95Xfn6T09YOsZhuxaRbeq5m3xUlrH+o5yU3uTRTgs6eX83IFf/UraRM/UJ8B/1
	zb7A==
X-Gm-Message-State: AOPr4FURP3mjSZZKpVC1oe6NXrPSHDzCd3LrUXZhDtHNmrAeusyB2Vmz7AwpDXRmJFnUFYLlPz/vwjNN1PRW9Q==
MIME-Version: 1.0
X-Received: by 10.140.176.23 with SMTP id w23mr7524792qhw.76.1460500429356;
	Tue, 12 Apr 2016 15:33:49 -0700 (PDT)
Received: by 10.55.130.196 with HTTP; Tue, 12 Apr 2016 15:33:49 -0700 (PDT)
Received: by 10.55.130.196 with HTTP; Tue, 12 Apr 2016 15:33:49 -0700 (PDT)
In-Reply-To: <CAMKF1sqBwbkHWQBBzX8jbK0SoZtcMr6MO2ZSZ9dcMJJns6x+eQ@mail.gmail.com>
References: <1458077979-23303-1-git-send-email-raj.khem@gmail.com>
	<56E91CC8.9060907@dest-unreach.org>
	<CAMKF1sp7C3zCHQBiJ=i5YYsHcXfkBX74qYXgZxYX-tqcwqrD+A@mail.gmail.com>
	<570D631F.5020503@windriver.com>
	<CAMKF1srjaNz1dnZCHFkWn6=PyQ+w6Vb1FoF1rbDVCGaTCe3FrA@mail.gmail.com>
	<CAMKF1srQ5ayOr3ha=YTTGBS-ovX8Ht41ODoNaSEHBGW9EfjFGA@mail.gmail.com>
	<CAMKF1sqBwbkHWQBBzX8jbK0SoZtcMr6MO2ZSZ9dcMJJns6x+eQ@mail.gmail.com>
Date: Tue, 12 Apr 2016 18:33:49 -0400
Message-ID: <CAMKF1sq1kqM7iair34+2ZoxZh24=wszYniJ4cyoBc2M9_XzEQw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Access c_ispeed and c_ospeed via APIs
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
X-List-Received-Date: Tue, 12 Apr 2016 22:33:50 -0000
Content-Type: multipart/alternative; boundary=001a113abdd4494ab10530514115

--001a113abdd4494ab10530514115
Content-Type: text/plain; charset=UTF-8

I think I see the problem now. The constant should be converted to use Bnn
values. When calling the baudrate apis. I will send a patch for you to test
once I am close to computer
On Apr 12, 2016 6:20 PM, "Khem Raj" <raj.khem@gmail.com> wrote:

Since you have it reproduced. Can you check which of the api call is
failing?
On Apr 12, 2016 5:05 PM, "Bruce Ashfield" <bruce.ashfield@windriver.com>
wrote:

> On 2016-04-12 1:53 PM, Khem Raj wrote:
>
>> FYI
>>
>
> Thanks. I can also confirm that when I dropped the patch, I'm
> back up and running assertion free.
>
> Bruce
>
>
>> ---------- Forwarded message ----------
>> From: Gerhard Rieger <gerhard@dest-unreach.org>
>> Date: Wed, Mar 16, 2016 at 4:43 AM
>> Subject: Re: [PATCH] Access c_ispeed and c_ospeed via APIs
>> To: Khem Raj <raj.khem@gmail.com>
>>
>>
>> Thank you, I will check this patch!
>> - Gerhard
>>
>>
>> Am 15.03.2016 um 22:39 schrieb Khem Raj:
>>
>>> Use cfsetispeed(), cfsetospeed(), cfgetispeed, and cfgetospeed()
>>> instead of operating on c_ispeed and c_ospeed termios structure
>>> members directly because they are not guaranteed to exist on all
>>> libc implementations
>>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>>   xioinitialize.c | 8 ++++----
>>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/xioinitialize.c b/xioinitialize.c
>>> index 9f50155..632ca4c 100644
>>> --- a/xioinitialize.c
>>> +++ b/xioinitialize.c
>>> @@ -65,10 +65,10 @@ int xioinitialize(void) {
>>>   #if HAVE_TERMIOS_ISPEED && (ISPEED_OFFSET != -1) && (OSPEED_OFFSET !=
>>> -1)
>>>   #if defined(ISPEED_OFFSET) && (ISPEED_OFFSET != -1)
>>>   #if defined(OSPEED_OFFSET) && (OSPEED_OFFSET != -1)
>>> -      tdata.termarg.c_ispeed = 0x56789abc;
>>> -      tdata.termarg.c_ospeed = 0x6789abcd;
>>> -      assert(tdata.termarg.c_ispeed == tdata.speeds[ISPEED_OFFSET]);
>>> -      assert(tdata.termarg.c_ospeed == tdata.speeds[OSPEED_OFFSET]);
>>> +      cfsetispeed(&tdata.termarg, 0x56789abc);
>>> +      cfsetospeed(&tdata.termarg, 0x6789abcd);
>>> +      assert(cfgetispeed(&tdata.termarg) ==
>>> tdata.speeds[ISPEED_OFFSET]);
>>> +      assert(cfgetospeed(&tdata.termarg) ==
>>> tdata.speeds[OSPEED_OFFSET]);
>>>   #endif
>>>   #endif
>>>   #endif
>>>
>>>
>

--001a113abdd4494ab10530514115
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">I think I see the problem now. The constant should be conver=
ted to use Bnn values. When calling the baudrate apis. I will send a patch =
for you to test once I am close to computer </p>
<div class=3D"gmail_quote">On Apr 12, 2016 6:20 PM, &quot;Khem Raj&quot; &l=
t;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<b=
r type=3D"attribution"><blockquote class=3D"quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><p dir=3D"ltr">Since you ha=
ve it reproduced. Can you check which of the api call is failing?</p><div c=
lass=3D"elided-text">
<div class=3D"gmail_quote">On Apr 12, 2016 5:05 PM, &quot;Bruce Ashfield&qu=
ot; &lt;<a href=3D"mailto:bruce.ashfield@windriver.com" target=3D"_blank">b=
ruce.ashfield@windriver.com</a>&gt; wrote:<br type=3D"attribution"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">On 2016-04-12 1:53 PM, Khem Raj wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
FYI<br>
</blockquote>
<br>
Thanks. I can also confirm that when I dropped the patch, I&#39;m<br>
back up and running assertion free.<br>
<br>
Bruce<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
---------- Forwarded message ----------<br>
From: Gerhard Rieger &lt;<a href=3D"mailto:gerhard@dest-unreach.org" target=
=3D"_blank">gerhard@dest-unreach.org</a>&gt;<br>
Date: Wed, Mar 16, 2016 at 4:43 AM<br>
Subject: Re: [PATCH] Access c_ispeed and c_ospeed via APIs<br>
To: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">ra=
j.khem@gmail.com</a>&gt;<br>
<br>
<br>
Thank you, I will check this patch!<br>
- Gerhard<br>
<br>
<br>
Am 15.03.2016 um 22:39 schrieb Khem Raj:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Use cfsetispeed(), cfsetospeed(), cfgetispeed, and cfgetospeed()<br>
instead of operating on c_ispeed and c_ospeed termios structure<br>
members directly because they are not guaranteed to exist on all<br>
libc implementations<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0 xioinitialize.c | 8 ++++----<br>
=C2=A0 1 file changed, 4 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/xioinitialize.c b/xioinitialize.c<br>
index 9f50155..632ca4c 100644<br>
--- a/xioinitialize.c<br>
+++ b/xioinitialize.c<br>
@@ -65,10 +65,10 @@ int xioinitialize(void) {<br>
=C2=A0 #if HAVE_TERMIOS_ISPEED &amp;&amp; (ISPEED_OFFSET !=3D -1) &amp;&amp=
; (OSPEED_OFFSET !=3D -1)<br>
=C2=A0 #if defined(ISPEED_OFFSET) &amp;&amp; (ISPEED_OFFSET !=3D -1)<br>
=C2=A0 #if defined(OSPEED_OFFSET) &amp;&amp; (OSPEED_OFFSET !=3D -1)<br>
-=C2=A0 =C2=A0 =C2=A0 tdata.termarg.c_ispeed =3D 0x56789abc;<br>
-=C2=A0 =C2=A0 =C2=A0 tdata.termarg.c_ospeed =3D 0x6789abcd;<br>
-=C2=A0 =C2=A0 =C2=A0 assert(tdata.termarg.c_ispeed =3D=3D tdata.speeds[ISP=
EED_OFFSET]);<br>
-=C2=A0 =C2=A0 =C2=A0 assert(tdata.termarg.c_ospeed =3D=3D tdata.speeds[OSP=
EED_OFFSET]);<br>
+=C2=A0 =C2=A0 =C2=A0 cfsetispeed(&amp;tdata.termarg, 0x56789abc);<br>
+=C2=A0 =C2=A0 =C2=A0 cfsetospeed(&amp;tdata.termarg, 0x6789abcd);<br>
+=C2=A0 =C2=A0 =C2=A0 assert(cfgetispeed(&amp;tdata.termarg) =3D=3D tdata.s=
peeds[ISPEED_OFFSET]);<br>
+=C2=A0 =C2=A0 =C2=A0 assert(cfgetospeed(&amp;tdata.termarg) =3D=3D tdata.s=
peeds[OSPEED_OFFSET]);<br>
=C2=A0 #endif<br>
=C2=A0 #endif<br>
=C2=A0 #endif<br>
<br>
</blockquote></blockquote>
<br>
</blockquote></div>
</div></blockquote></div>

--001a113abdd4494ab10530514115--

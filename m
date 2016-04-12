Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 44C0F6FF9D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 22:20:46 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id n63so1351958qkf.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 15:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=OVZ3QADU78EGPiXweOX/M3aNB8F4qI1QLGFUGvjGwMA=;
	b=xfKHu7wyQOeQnd8oD010wIewlIuI/FgaaYszTJXwTU94QeMemU7q6VIi2wTG74h4yG
	vVK+IZEMg6HgnGVLg+2O19vVj/mnkGObd67t1WfoY5wnlXAMHN0laYsHro0zsRhUFpbu
	bpsI8jX6JIwoLGUXepaim0HgauAHPxANZbdmEzuJHQdvEkLniZSBZthGgTI5xn2ldmKa
	P/Zya2sEns3T5H+Mlrx/OT/Rk9viiXFb6zvIT7aM71y7WG0dt2/4YEu91uUTVy4AEf+3
	pm2zqKsTjAKJfBqZAWcz5fTU0sIK6TE59HWcCIJyNsyQ84gPekVlvJvd9cV/tVUPWuTP
	1SjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=OVZ3QADU78EGPiXweOX/M3aNB8F4qI1QLGFUGvjGwMA=;
	b=LTWVJSefJq/d4yd0FgirJ8NxSsL0EoofeG+XmOylugLQxPOErab1yMTwZe7e02sYJu
	uSGs0EAZSc4H5oRQTBhWdsI2TF1AmbbPJcWXvadJ8S/fw6IqIOeRBb/GlmIhvcJ4IkIo
	YUoCtTtCr+sXKm3qas/Jci7P+Eqa5xGCFXgeoNuCSeSpSSFNyWxbLV9FYUnMSiTTxHX7
	rqJNgU8/0enRLeec03XBe2sJ7Nc6eDDy95eN49p0EZtV7wFSgLOCFj/JKP6YJCAlPJmu
	9djo3gOfmLBf0EZOLycUzs5Rzr8QX9leJTV+HlKq9nSAudo8JslLs5zDdwLLnHAwBItO
	LdDQ==
X-Gm-Message-State: AOPr4FV9NHy4mFXrXTI2zass5sywl69bRFy8GAzEUiujdV1V2ZBLtZ9mlScg7cG5Ci0O/qgw6gupflJlvPRQQQ==
MIME-Version: 1.0
X-Received: by 10.55.71.135 with SMTP id u129mr7000300qka.26.1460499647303;
	Tue, 12 Apr 2016 15:20:47 -0700 (PDT)
Received: by 10.55.130.196 with HTTP; Tue, 12 Apr 2016 15:20:47 -0700 (PDT)
Received: by 10.55.130.196 with HTTP; Tue, 12 Apr 2016 15:20:47 -0700 (PDT)
In-Reply-To: <570D631F.5020503@windriver.com>
References: <1458077979-23303-1-git-send-email-raj.khem@gmail.com>
	<56E91CC8.9060907@dest-unreach.org>
	<CAMKF1sp7C3zCHQBiJ=i5YYsHcXfkBX74qYXgZxYX-tqcwqrD+A@mail.gmail.com>
	<570D631F.5020503@windriver.com>
Date: Tue, 12 Apr 2016 18:20:47 -0400
Message-ID: <CAMKF1srjaNz1dnZCHFkWn6=PyQ+w6Vb1FoF1rbDVCGaTCe3FrA@mail.gmail.com>
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
X-List-Received-Date: Tue, 12 Apr 2016 22:20:48 -0000
Content-Type: multipart/alternative; boundary=001a114a7d20ac1862053051124f

--001a114a7d20ac1862053051124f
Content-Type: text/plain; charset=UTF-8

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

--001a114a7d20ac1862053051124f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Since you have it reproduced. Can you check which of the api=
 call is failing?</p>
<div class=3D"gmail_quote">On Apr 12, 2016 5:05 PM, &quot;Bruce Ashfield&qu=
ot; &lt;<a href=3D"mailto:bruce.ashfield@windriver.com">bruce.ashfield@wind=
river.com</a>&gt; wrote:<br type=3D"attribution"><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">On 2016-04-12 1:53 PM, Khem Raj wrote:<br>
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

--001a114a7d20ac1862053051124f--

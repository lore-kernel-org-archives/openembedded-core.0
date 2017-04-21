Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3362777AA3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 12:39:32 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id d80so7168085qke.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 05:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EEn88YdJ2087psLMiNDFgYb9VpXqsfKdG7FsY54LiAs=;
	b=IAQvHPkzcRruTt+59DDKwpm6tlDye7E9nt6Rcbx6mzR+3KW3Gll450pO25KkS10FzF
	6YJ+3VowYwhFFkM9qfXc/19tVZ6tZDizzMm69vkBzLuSE6Upu4+kMKc64X9e++fg0eNC
	qUEB0URxAk2QxQ0tJOW4/HxMDPcVPxHAzCjIhd0jdGAhhhqvCATNjBvdC8nU9+3qMLWb
	IyS2R3YiHTcDwukLYxUg07cXfSyX32JL8rHvCqucxdQUbSi6IZc/A66lAgiTVDPc7zAt
	kc0Yh8Hb784KOdsO/EytanyhhKqS8fU8fhdx9IsMc92Wsjtzen2bEFQWNI9tLI35VZdc
	xe2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EEn88YdJ2087psLMiNDFgYb9VpXqsfKdG7FsY54LiAs=;
	b=jfeLYjChjxQZaM4A7YAzxCAKwMaBfJO5FcJgujwMuCBjB6WRmT6ZUTf0btO6JwsHnA
	u/2WCAofIr0JC6Lboz+hO0JNFD009RAmEYme7hHzGW/W8bdBgedaJIny9ceAgznON6Y+
	xJAzF0X1y7l65UMYpKwy48U8RUFvQcIHWlUrb0JBHeVA9rD9u+vIJgQhnnDi72BgrysN
	OD/vxOf8KEx4+SC9NuiH/0Fr3EHMk+fVTXpmru2oDKD0rslth43IcBiF+E9Z1iI+Xf8V
	Pr+KeKii4s5u5FgG9vzSUb6GeT/D5JB6CRNAQMD2y6OnbeuhiYIlxfuiB2d69XI8+Fq2
	qGOA==
X-Gm-Message-State: AN3rC/6R1COdQeArYAKzW1OegB/rott7nKCS50buB+bkgftReu2dV7bT
	CBcHMlrjCh/YIoYA+NqYAVgqiqA7zA==
X-Received: by 10.55.21.154 with SMTP id 26mr6411551qkv.287.1492778373977;
	Fri, 21 Apr 2017 05:39:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.163.69 with HTTP; Fri, 21 Apr 2017 05:39:33 -0700 (PDT)
In-Reply-To: <64a94df4-970f-b80c-3e43-0f6d75c52ba4@linux.intel.com>
References: <CA+chaQdQz3==KgsjLby6Bx1NgnzhXKXQcvCY5pufr5gLeqMqtQ@mail.gmail.com>
	<CADkTA4Pi7SWq_PrYYJZiJa0CQUU-EN+ZVxPTPZV0Z8SvAYjcaA@mail.gmail.com>
	<64a94df4-970f-b80c-3e43-0f6d75c52ba4@linux.intel.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 21 Apr 2017 08:39:33 -0400
Message-ID: <CADkTA4PzffD=HdOQ3KQe7NTjTx-=GwJfUNmC3G0ZDvY738TeAw@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: linux-yocto.do_validate_branches failing since last oe-core update
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
X-List-Received-Date: Fri, 21 Apr 2017 12:39:33 -0000
Content-Type: multipart/alternative; boundary=001a1147b35cb5d5b4054dac8c24

--001a1147b35cb5d5b4054dac8c24
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 21, 2017 at 8:36 AM, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 04/21/2017 03:26 PM, Bruce Ashfield wrote:
>
>     Anyone else seeing this as well?
>>
>>
>>
>> Richard saw this once last week, and we weren't able to reproduce it.
>> I've just updated
>> and am doing builds now.
>>
>> If anyone has info on their config, build steps, etc, I'm interested to
>> hear so I can figure
>> out what is going on.
>>
>
> I saw this once as well today. I nuked tmp/ and it was gone.
>

Interesting. I'm updating my existing build (I only ever have one that I
constantly update and re-use), so maybe it'll show up in that existing tmp
dir.

If there's a clean/rebuild cycle that was in play, let me know as well,
since I'll try that as well.

I've been carrying a config like Richard was using since last week and
in all my builds it has never happened.

Bruce


>
> Alex
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1147b35cb5d5b4054dac8c24
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Apr 21, 2017 at 8:36 AM, Alexander Kanavin <span dir=3D"ltr">&l=
t;<a href=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">al=
exander.kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><span class=3D"">On 04/21/2017 03:26 PM, Bruce Ashfield wrote=
:<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
=C2=A0 =C2=A0 Anyone else seeing this as well?<br>
<br>
<br>
<br>
Richard saw this once last week, and we weren&#39;t able to reproduce it.<b=
r>
I&#39;ve just updated<br>
and am doing builds now.<br>
<br>
If anyone has info on their config, build steps, etc, I&#39;m interested to=
<br>
hear so I can figure<br>
out what is going on.<br>
</blockquote>
<br></span>
I saw this once as well today. I nuked tmp/ and it was gone.<br></blockquot=
e><div><br></div><div>Interesting. I&#39;m updating my existing build (I on=
ly ever have one that I</div><div>constantly update and re-use), so maybe i=
t&#39;ll show up in that existing tmp</div><div>dir.</div><div><br></div><d=
iv>If there&#39;s a clean/rebuild cycle that was in play, let me know as we=
ll,</div><div>since I&#39;ll try that as well.</div><div><br></div><div>I&#=
39;ve been carrying a config like Richard was using since last week and</di=
v><div>in all my builds it has never happened.</div><div><br></div><div>Bru=
ce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Alex<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Tho=
u shalt not follow the NULL pointer, for chaos and madness await thee at it=
s end&quot;</div>
</div></div>

--001a1147b35cb5d5b4054dac8c24--

Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-vk0-f50.google.com (mail-vk0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id 1BE0D73171
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 17:48:35 +0000 (UTC)
Received: by mail-vk0-f50.google.com with SMTP id f2so43159600vkb.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 09:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=bv8jBxQDw9xMpFS73ZCtPDDGYDnCaZJyGSHtiPpGwc0=;
	b=nisrKATR17/Q6bXuAm8faqed7Ea8x1RUCS2wdtNabBlloD085CEl3+CAcbXXI6eM06
	Uvxa6UUEF8pCO6Tu/BjXuCNMaUmB7IiVUC9gV410Y5SVCpJOMf2+s0lvUeeitMCEC/sF
	WJ8/7GfQAGDT7yEBgzYt7kioctXpGVC0uc1PT4nOFZq2Ms1HL7bnZgrEbdDgiLRcqLsY
	05gA1gIYHW/Ofk1jm9VwJdcBFRuklJe2cvdpyGORwIwKQ+hgyuA9K+wkc+bCYMJxPsCA
	NPxDrp1hAb+nLykf1tLzbhTLisz3bpfDBXfflG1cFRRqtOvG1VBnRv2Ouhkv7nv5Veb9
	a0Og==
MIME-Version: 1.0
X-Received: by 10.31.10.199 with SMTP id 190mr6616112vkk.51.1450547316242;
	Sat, 19 Dec 2015 09:48:36 -0800 (PST)
Received: by 10.31.202.196 with HTTP; Sat, 19 Dec 2015 09:48:36 -0800 (PST)
In-Reply-To: <CADkTA4OLTmiDHTwHec+Pnyhs_p-kLZp=yD2k4GOpc-LB-7sEUA@mail.gmail.com>
References: <cover.1450471022.git.bruce.ashfield@windriver.com>
	<0aa694bda5500aef7d326fa880c77b726c8c2779.1450471022.git.bruce.ashfield@windriver.com>
	<CAP9ODKqJyZq29L7=mFzCVo2=oAX3O8WtyiJ498inW5d2fJrBBQ@mail.gmail.com>
	<CADkTA4OLTmiDHTwHec+Pnyhs_p-kLZp=yD2k4GOpc-LB-7sEUA@mail.gmail.com>
Date: Sat, 19 Dec 2015 12:48:36 -0500
Message-ID: <CADkTA4PpkeA29W6EugnEd5WecRY2bJybF6Ajm9O25soAwTFfKQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] lttng-modules: fix build issue against kernel 4.4
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
X-List-Received-Date: Sat, 19 Dec 2015 17:48:38 -0000
Content-Type: multipart/alternative; boundary=001a1144017683bfb2052743dd50

--001a1144017683bfb2052743dd50
Content-Type: text/plain; charset=UTF-8

On Sat, Dec 19, 2015 at 12:44 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

>
>
> On Sat, Dec 19, 2015 at 5:05 AM, Otavio Salvador <
> otavio.salvador@ossystems.com.br> wrote:
>
>> On Fri, Dec 18, 2015 at 6:44 PM, Bruce Ashfield
>> <bruce.ashfield@windriver.com> wrote:
>> > f4b27072
>>
>>
>> Use this revision on commit log; latest is not accurate as it moves
>> during time.
>>
>>
> We'll disagree on that. The patch has the commit hash, repeating it in the
> commit message is not necessary. It's like patches saying "this patch", or
> explaining what is obvious from the patch. Both are not necessary.
>
> If Ross wants to change the commit during merge, I won't complain, but
> I'm happy with it, as is.
>

That and I'm now far away from my development machines until mid next week,
so
I can't easily rebase to change the log until then .. and this would be
better under
test, since without it, I can't bump to 4.4-rcX.

(and yes, I can at least use a date versus "latest" in any future updates).

Cheers,

Bruce


>
> Bruce
>
>
>> --
>> Otavio Salvador                             O.S. Systems
>> http://www.ossystems.com.br        http://code.ossystems.com.br
>> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1144017683bfb2052743dd50
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Sat, Dec 19, 2015 at 12:44 PM, Bruce Ashfield <span dir=3D"ltr">&lt;=
<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfiel=
d@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div di=
r=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><sp=
an class=3D"">On Sat, Dec 19, 2015 at 5:05 AM, Otavio Salvador <span dir=3D=
"ltr">&lt;<a href=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"_bl=
ank">otavio.salvador@ossystems.com.br</a>&gt;</span> wrote:<br><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">On Fri, Dec 18, 2015 at 6:44 PM, Bruce Ashfield<br>
&lt;<a href=3D"mailto:bruce.ashfield@windriver.com" target=3D"_blank">bruce=
.ashfield@windriver.com</a>&gt; wrote:<br>
&gt; f4b27072<br>
<br>
<br>
Use this revision on commit log; latest is not accurate as it moves during =
time.<br>
<span><font color=3D"#888888"><br></font></span></blockquote><div><br></div=
></span><div>We&#39;ll disagree on that. The patch has the commit hash, rep=
eating it in the</div><div>commit message is not necessary. It&#39;s like p=
atches saying &quot;this patch&quot;, or</div><div>explaining what is obvio=
us from the patch. Both are not necessary.</div><div><br></div><div>If Ross=
 wants to change the commit during merge, I won&#39;t complain, but</div><d=
iv>I&#39;m happy with it, as is.</div></div></div></div></blockquote><div><=
br></div><div>That and I&#39;m now far away from my development machines un=
til mid next week, so=C2=A0</div><div>I can&#39;t easily rebase to change t=
he log until then .. and this would be better under</div><div>test, since w=
ithout it, I can&#39;t bump to 4.4-rcX.</div><div><br></div><div>(and yes, =
I can at least use a date versus &quot;latest&quot; in any future updates).=
</div><div><br></div><div>Cheers,</div><div><br></div><div>Bruce</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"g=
mail_extra"><div class=3D"gmail_quote"><div><br></div><div>Bruce</div><span=
 class=3D""><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span><font col=
or=3D"#888888">
--<br>
Otavio Salvador=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O.S. Systems<br>
<a href=3D"http://www.ossystems.com.br" rel=3D"noreferrer" target=3D"_blank=
">http://www.ossystems.com.br</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"htt=
p://code.ossystems.com.br" rel=3D"noreferrer" target=3D"_blank">http://code=
.ossystems.com.br</a><br>
Mobile: <a href=3D"tel:%2B55%20%2853%29%209981-7854" value=3D"+555399817854=
" target=3D"_blank">+55 (53) 9981-7854</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Mobile: <a href=3D"tel:%2B1%20%28347%29%20903-9750" value=3D"+13=
479039750" target=3D"_blank">+1 (347) 903-9750</a><br>
</font></span><div><div>--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</div></div></blockquote></span></div><span class=3D"HOEnZb"><font color=3D=
"#888888"><br><br clear=3D"all"><div><br></div>-- <br><div>&quot;Thou shalt=
 not follow the NULL pointer, for chaos and madness await thee at its end&q=
uot;</div>
</font></span></div></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for chao=
s and madness await thee at its end&quot;</div>
</div></div>

--001a1144017683bfb2052743dd50--

Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1RlcQU-00028r-SI
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2012 09:23:54 +0100
Received: by wgbdt11 with SMTP id dt11so2708389wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2012 00:16:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.84.163 with SMTP id a3mr2605647wiz.3.1326442582871; Fri,
	13 Jan 2012 00:16:22 -0800 (PST)
Received: by 10.227.100.82 with HTTP; Fri, 13 Jan 2012 00:16:21 -0800 (PST)
X-Originating-IP: [79.117.107.173]
Received: by 10.227.100.82 with HTTP; Fri, 13 Jan 2012 00:16:21 -0800 (PST)
In-Reply-To: <4F0FD82D.80405@bluegiga.com>
References: <1326067422-30771-1-git-send-email-andrei@gherzan.ro>
	<4F0FD82D.80405@bluegiga.com>
Date: Fri, 13 Jan 2012 10:16:21 +0200
Message-ID: <CAK18fxHmd-pLX_nXcP1OZ7yQKnBFgyq6qqZ4wB38rabMEKPQ0Q@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
To: Lauri Hintsala <lauri.hintsala@bluegiga.com>
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>,
	openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: defconfig modified in order to activate CONFIG_EXPR_MATH_SUPPORT_64
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Jan 2012 08:23:54 -0000
Content-Type: multipart/alternative; boundary=f46d043c06e0f7904004b6647a43

--f46d043c06e0f7904004b6647a43
Content-Type: text/plain; charset=ISO-8859-1

As i could see that patch has nothing in common with this bug. Yes, it uses
expr from busybox... but that is all. No fix for 64bit numbers support.

@g
On Jan 13, 2012 9:07 AM, "Lauri Hintsala" <lauri.hintsala@bluegiga.com>
wrote:

> Hello Andrei
>
> On 01/09/2012 02:03 AM, Andrei Gherzan wrote:
>
>> From: Andrei Gherzan<andrei.gherzan@**windriver.com<andrei.gherzan@windriver.com>
>> >
>>
>> Enable 64-bit math support in the expr applet. This will make
>> the applet slightly larger, but will allow computation with very
>> large numbers.
>>
>> [YOCTO #1767]
>>
>
> This bug should be fixed already:
> http://lists.linuxtogo.org/**pipermail/openembedded-core/**
> 2011-December/014487.html<http://lists.linuxtogo.org/pipermail/openembedded-core/2011-December/014487.html>
>
> Please inform if my fix doesn't work.
>
> BR,
> Lauri
>

--f46d043c06e0f7904004b6647a43
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p>As i could see that patch has nothing in common with this bug. Yes, it u=
ses expr from busybox... but that is all. No fix for 64bit numbers support.=
</p>
<p>@g</p>
<div class=3D"gmail_quote">On Jan 13, 2012 9:07 AM, &quot;Lauri Hintsala&qu=
ot; &lt;<a href=3D"mailto:lauri.hintsala@bluegiga.com">lauri.hintsala@blueg=
iga.com</a>&gt; wrote:<br type=3D"attribution"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">
Hello Andrei<br>
<br>
On 01/09/2012 02:03 AM, Andrei Gherzan wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
From: Andrei Gherzan&lt;<a href=3D"mailto:andrei.gherzan@windriver.com" tar=
get=3D"_blank">andrei.gherzan@<u></u>windriver.com</a>&gt;<br>
<br>
Enable 64-bit math support in the expr applet. This will make<br>
the applet slightly larger, but will allow computation with very<br>
large numbers.<br>
<br>
[YOCTO #1767]<br>
</blockquote>
<br>
This bug should be fixed already:<br>
<a href=3D"http://lists.linuxtogo.org/pipermail/openembedded-core/2011-Dece=
mber/014487.html" target=3D"_blank">http://lists.linuxtogo.org/<u></u>piper=
mail/openembedded-core/<u></u>2011-December/014487.html</a><br>
<br>
Please inform if my fix doesn&#39;t work.<br>
<br>
BR,<br>
Lauri<br>
</blockquote></div>

--f46d043c06e0f7904004b6647a43--

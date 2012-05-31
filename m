Received: from mail-gh0-f178.google.com ([209.85.160.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1Sa4lY-0004ju-J1
	for openembedded-core@lists.openembedded.org;
	Thu, 31 May 2012 14:46:12 +0200
Received: by ghbf1 with SMTP id f1so940140ghb.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2012 05:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=lkvUoLZ7ZSZRtk3vcx9nWMO6hJO8QsfjUJaSHCjm9ws=;
	b=eq52Ri6dEJtPQfWoVPN0xXvorosrsPFw/yjRwzNDyN7xhx2smYcvsOdrFPlX7Gfyh1
	sg8d9YM0kG0rAJgMzfa15lu2nge9ode8I4spFbWLLFv4/IfxXz5QAtXqOoc/75frqKcI
	FsRb7e3ePnuUI06791G1GmGEIgaZa+AlOGedfk0NXQdDBVZeRW+BvfvbOeH3jj3iGkHP
	BGUrX0LCMBMfo0QN8hCXagxY50EbWgZJDYFs6Ks3FeYPvuyo1o0tVJ6PmrbVKnn3YzPA
	YC7Cb2AfXTgFAtuxSJrH1oMxOgUgFYRIlYC+XY7ZaFNy+tXZH5Ui4VFyEes5FrPJuZQw
	UrkQ==
MIME-Version: 1.0
Received: by 10.50.207.38 with SMTP id lt6mr13671798igc.55.1338467751937; Thu,
	31 May 2012 05:35:51 -0700 (PDT)
Received: by 10.231.233.196 with HTTP; Thu, 31 May 2012 05:35:51 -0700 (PDT)
In-Reply-To: <CAOHjBZv9jC9pVwxS9CCjvY0wFo8_9sOaFeUQwMxPEuF8EJDuiA@mail.gmail.com>
References: <CAOHjBZsptjefvQA3od1HV4s_fVcoHidWs5qUm-2A5+Fr9ZrRLg@mail.gmail.com>
	<CAMKF1spunqV3__K7_jEt5oQwg=J0v+TwZSUtGOv=DeipCPkzSA@mail.gmail.com>
	<CAOHjBZv9jC9pVwxS9CCjvY0wFo8_9sOaFeUQwMxPEuF8EJDuiA@mail.gmail.com>
Date: Thu, 31 May 2012 14:35:51 +0200
Message-ID: <CAOHjBZvGY9BWkyS+9V4OtGFcQpCC2SdzKwG9pQ0wq_oeqU=uTw@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: target rpm build failure
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
X-List-Received-Date: Thu, 31 May 2012 12:46:12 -0000
Content-Type: multipart/alternative; boundary=14dae9340e69e5c62004c1544e21

--14dae9340e69e5c62004c1544e21
Content-Type: text/plain; charset=ISO-8859-1

2012/5/31 Giuseppe Condorelli <giuseppe.condorelli@gmail.com>

> Hi Khem,
>
> 2012/5/30 Khem Raj <raj.khem@gmail.com>
>
>> On Wed, May 30, 2012 at 8:18 AM, Giuseppe Condorelli
>> <giuseppe.condorelli@gmail.com> wrote:
>> > It fails on undefined reference to xmalloc, xcalloc, etc... that
>> however are
>> > internally defined and used as wrapper for real malloc, etc...
>> > Please, can somebody try to build this package for me?
>>
>> are you using  uclibc for system C library ?
>>
> Yes, I do!
>
>

Is there some difference for uclibc? Please let me know.
Cheers,
Giuseppe

>
>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
>

--14dae9340e69e5c62004c1544e21
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">2012/5/31 Giuseppe Condorelli <span dir=
=3D"ltr">&lt;<a href=3D"mailto:giuseppe.condorelli@gmail.com" target=3D"_bl=
ank">giuseppe.condorelli@gmail.com</a>&gt;</span><br><blockquote style=3D"m=
argin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-color:rgb(204,204,204)=
;border-left-width:1px;border-left-style:solid" class=3D"gmail_quote">
Hi Khem,<br><br><div class=3D"gmail_quote"><div class=3D"im">2012/5/30 Khem=
 Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"=
_blank">raj.khem@gmail.com</a>&gt;</span><br><blockquote style=3D"margin:0p=
x 0px 0px 0.8ex;padding-left:1ex;border-left-color:rgb(204,204,204);border-=
left-width:1px;border-left-style:solid" class=3D"gmail_quote">

<div>On Wed, May 30, 2012 at 8:18 AM, Giuseppe Condorelli<br>
&lt;<a href=3D"mailto:giuseppe.condorelli@gmail.com" target=3D"_blank">gius=
eppe.condorelli@gmail.com</a>&gt; wrote:<br>
&gt; It fails on undefined reference to xmalloc, xcalloc, etc... that howev=
er are<br>
&gt; internally defined and used as wrapper for real malloc, etc...<br>
&gt; Please, can somebody try to build this package for me?<br>
<br>
</div>are you using =A0uclibc for system C library ?<br></blockquote></div>=
<div>Yes, I do!=A0</div><div>=A0</div></div></blockquote><div>=A0</div><div=
>Is there=A0some=A0difference for uclibc? Please let me know.</div><div>Che=
ers,</div>
<div>Giuseppe=A0</div><blockquote style=3D"margin:0px 0px 0px 0.8ex;padding=
-left:1ex;border-left-color:rgb(204,204,204);border-left-width:1px;border-l=
eft-style:solid" class=3D"gmail_quote"><div class=3D"gmail_quote"><div>=A0<=
/div><div class=3D"im">
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-=
color:rgb(204,204,204);border-left-width:1px;border-left-style:solid" class=
=3D"gmail_quote">

<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</blockquote></div></div><br>
</blockquote></div><br>

--14dae9340e69e5c62004c1544e21--

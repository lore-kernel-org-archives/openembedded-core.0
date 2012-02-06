Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sidebranch.openembedded@gmail.com>)
	id 1RuWPz-0005a3-MB for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 22:48:11 +0100
Received: by bke17 with SMTP id 17so5337530bke.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Feb 2012 13:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=6f4qOFcCt+2K2fL0XYHbg0MLcpmt41pDD098XggVoYc=;
	b=wqe9MW9NtSHm89xz7cyr8XXiulHN75Eoyftjl+/RJkFxdYFpcn7N/hrBSrSLOQonNQ
	AuDrOiSgsJ5GGfEdKxyoOBHS8AmnA+FtyNfpI1ZjoVw7t/b3z+asF+upddcIlIJR/I+w
	TIUW0WzcCYc+2qY0nRVZlE+QQ1GXKvlNU8g24=
MIME-Version: 1.0
Received: by 10.204.129.8 with SMTP id m8mr1831402bks.69.1328564410401; Mon,
	06 Feb 2012 13:40:10 -0800 (PST)
Received: by 10.205.122.135 with HTTP; Mon, 6 Feb 2012 13:40:10 -0800 (PST)
In-Reply-To: <4F3044B1.1000705@windriver.com>
References: <CAMvUbCz0Lts7dUOWWvJeivm9nUb3nuhEqS-QY4+nOYOgmDzEkw@mail.gmail.com>
	<2025C8A2-8B17-4F99-B4B3-3A0C8EC2C322@dominion.thruhere.net>
	<4F3044B1.1000705@windriver.com>
Date: Mon, 6 Feb 2012 22:40:10 +0100
Message-ID: <CAMvUbCxrWssgAi4EW4k3MUqZu+9uz_zcFPFn-XJMfF29iE=ApQ@mail.gmail.com>
From: Leon Woestenberg <sidebranch.openembedded@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: armhf support in OpenEmbedded?
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
X-List-Received-Date: Mon, 06 Feb 2012 21:48:11 -0000
Content-Type: multipart/alternative; boundary=0015173fe4debe447104b8528144

--0015173fe4debe447104b8528144
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Mon, Feb 6, 2012 at 10:22 PM, Mark Hatle <mark.hatle@windriver.com>wrote:

> On 2/6/12 3:17 PM, Koen Kooi wrote:
>
>>
>> Op 6 feb. 2012, om 22:01 heeft Leon Woestenberg het volgende geschreven:
>>
>>  do we already have support for the ARM "armhf" ABI in OpenEmbedded?  (A
>>> quick search on the ML didn't get me hits).
>>> Basically,"armhf" is built with -mfloat-abi=hard, and tuned for armv7-a
>>> CPUs.
>>>
>>
>> Yes, we've had it for ages in OE-classic and Marks tune overhaul made it
>> easy to use in OE-core as well. Also note that armhf has practically no
>> adavantage over softfp in real world applications. The only things getting
>> a decent speedup in proper benchmarks was povray.
>>
>
> I strongly discourage people from using it.  If you don't care about ABI
> compatibility it might be a few cycles faster.. but it does limit your
> ability to draw from existing EABI software.  (Be it commercial or open
> source.)
>

Can someone please lift that large rock I have been under for ages?

Thanks!

Leon


/me climbing back into the OE trenches

--0015173fe4debe447104b8528144
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,<br><br><div class=3D"gmail_quote">On Mon, Feb 6, 2012 at 10:22 PM, M=
ark Hatle <span dir=3D"ltr">&lt;<a href=3D"mailto:mark.hatle@windriver.com"=
>mark.hatle@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">
<div class=3D"im">On 2/6/12 3:17 PM, Koen Kooi wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
Op 6 feb. 2012, om 22:01 heeft Leon Woestenberg het volgende geschreven:<br=
>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
do we already have support for the ARM &quot;armhf&quot; ABI in OpenEmbedde=
d? =A0(A quick search on the ML didn&#39;t get me hits).<br>

Basically,&quot;armhf&quot; is built with -mfloat-abi=3Dhard, and tuned for=
 armv7-a CPUs.<br>
</blockquote>
<br>
Yes, we&#39;ve had it for ages in OE-classic and Marks tune overhaul made i=
t easy to use in OE-core as well. Also note that armhf has practically no a=
davantage over softfp in real world applications. The only things getting a=
 decent speedup in proper benchmarks was povray.<br>

</blockquote>
<br></div>
I strongly discourage people from using it. =A0If you don&#39;t care about =
ABI compatibility it might be a few cycles faster.. but it does limit your =
ability to draw from existing EABI software. =A0(Be it commercial or open s=
ource.)<br>
</blockquote><div><br>Can someone please lift that large rock I have been u=
nder for ages?<br><br>Thanks!<br><br>Leon<br><br><br>/me climbing back into=
 the OE trenches<br></div></div>

--0015173fe4debe447104b8528144--

Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f195.google.com (mail-ig0-f195.google.com
	[209.85.213.195])
	by mail.openembedded.org (Postfix) with ESMTP id 015B960116
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 18:43:17 +0000 (UTC)
Received: by mail-ig0-f195.google.com with SMTP id nt3so11144512igb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 11:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=fbzZ+eSFviefdfL13f0q1NkpEzCO+B9wdSAUBWbL5lI=;
	b=Rxjy2DjNeGl1uqWqkprM95OFxOOxM9MiP9Nny0a1CZQNeIVW2BT6e4RWW8L/Ep2ziX
	mKSR1OetAm3SdVMv9ce1stkQVmSprUdqitwzz/Py3ZNw/14n70Jok5mmLJPdxQMKwvtm
	Uf/L2ish6mTblg0VSTTWgcZCAUuHotSpEc+A0pzzRCWYdVAhCpqVqZS1Vy6ogxJ067Wx
	l4njnFBOcCmol+iClWCoUKzV9deAcUlEwIrUhFWOxC8FqSY3UomnA0yBqAJ4bjaVyAt9
	rCDp01H43xwg5yeKcTkoooBEqGIt2tDOUkq9wY+xjPNcWfrdVK/HQ3S7/hRsU2AH0o/r
	1XlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=fbzZ+eSFviefdfL13f0q1NkpEzCO+B9wdSAUBWbL5lI=;
	b=erIu4lpye5412fxvzJJi0yJmEnTl3iNgvdu5XVn7p+TnYQAetSPdYJ1qgAW7mplQBe
	/2KD+dXzwd4xnDyCh94Pf4OHbA/j8FPA5Df5gVckph4rytN4FFXyExacLXzl/ZtUOmHf
	Lg8lYpALq2bu59hQ4wMGQjXA0ZooYgqoVrM3Twb4dCi9+bd8Y1svzlPY1n5d+KpkmI0x
	rY6Nyz7nlEaLQHT6jGc5SiVRS9ysemOVIVy3X+0BbBjZgK3dG6Io5cw9c0KJ6LYQgnlW
	2ooD8es2yBaQRMPCfBFMTjm3+WSVeolBajk5FIAhsvsBhdNZlXQovdy2DyZVPbUYnt4p
	58ZQ==
X-Gm-Message-State: AD7BkJLJAECHrSH54vsl9rLOhPEz/Cot7WdB9kLmOzdqj/aPE5jXQ1TJlYo9GhZBr47B008QPXRSx3SMPNb7SA==
X-Received: by 10.50.138.233 with SMTP id qt9mr11492481igb.13.1459190597864;
	Mon, 28 Mar 2016 11:43:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1458803813.git.mariano.lopez@linux.intel.com>
	<34e4b28e8c8e665b38fd82d59ecaf8d486de6193.1458803813.git.mariano.lopez@linux.intel.com>
	<CABcZANkt+zzsRKL7ao2aP81Cu7Easc5rmmGHQzBdy0jwRNTDQg@mail.gmail.com>
	<56F97344.9040204@linux.intel.com>
In-Reply-To: <56F97344.9040204@linux.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 28 Mar 2016 18:43:08 +0000
Message-ID: <CABcZAN==+94v=j6knPg5Ap7ov17h6S-Yb=tjz7-7E6jsZSN2vg@mail.gmail.com>
To: Mariano Lopez <mariano.lopez@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] archiver.bbclass: Just archive gcc-source for all gcc recipes
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
X-List-Received-Date: Mon, 28 Mar 2016 18:43:22 -0000
Content-Type: multipart/alternative; boundary=089e013c6a983ed3ae052f2049a6

--089e013c6a983ed3ae052f2049a6
Content-Type: text/plain; charset=UTF-8

Fair enough, thanks for the clarification!

On Mon, Mar 28, 2016 at 11:08 AM Mariano Lopez <
mariano.lopez@linux.intel.com> wrote:

>
>
> On 03/24/2016 12:04 PM, Christopher Larson wrote:
>
> On Thu, Mar 24, 2016 at 8:26 AM <mariano.lopez@linux.intel.com> wrote:
>
> From: Mariano Lopez <mariano.lopez@linux.intel.com>
>
>
>> +    # We just archive gcc-source for all the gcc related recipes
>> +    if d.getVar('BPN', True) in ['gcc', 'libgcc'] \
>> +            and not pn.startswith('gcc-source'):
>> +        bb.debug(1, 'archiver: %s is excluded, covered by gcc-source' %
>> pn)
>> +        return
>>
>
> Hmm, I wonder if it'd be possible to make this more generic, check for
> work-shared or something.
>
>
> I was thinking the same when writing the patch, but it seems gcc is more
> of a corner case. The only two recipes that use work-shared are gcc and the
> kernel, the kernel case it's already covered checking for the class
> "kernel-yocto". In case of gcc we can't check for a class, we would need
> for work-shared and gcc, and that would be the almost the same comparison
> as is in the patch.
>
>
> Mariano
>

--089e013c6a983ed3ae052f2049a6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Fair enough, thanks for the clarification!</div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr">On Mon, Mar 28, 2016 at 11:08 AM Mari=
ano Lopez &lt;<a href=3D"mailto:mariano.lopez@linux.intel.com">mariano.lope=
z@linux.intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv text=3D"#000000" bgcolor=3D"#FFFFFF">
    <br>
    <br>
    <div>On 03/24/2016 12:04 PM, Christopher
      Larson wrote:<br>
    </div>
    </div><div text=3D"#000000" bgcolor=3D"#FFFFFF"><blockquote type=3D"cit=
e"><div dir=3D"ltr"><div class=3D"gmail_quote">
          <div dir=3D"ltr">On Thu, Mar 24, 2016 at 8:26 AM &lt;<a href=3D"m=
ailto:mariano.lopez@linux.intel.com" target=3D"_blank"><a href=3D"mailto:ma=
riano.lopez@linux.intel.com" target=3D"_blank">mariano.lopez@linux.intel.co=
m</a></a>&gt;
            wrote:<br>
          </div>
          </div></div></blockquote></div><div text=3D"#000000" bgcolor=3D"#=
FFFFFF"><blockquote type=3D"cite"><div dir=3D"ltr"><div class=3D"gmail_quot=
e"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">From:
            Mariano Lopez &lt;<a href=3D"mailto:mariano.lopez@linux.intel.c=
om" target=3D"_blank">mariano.lopez@linux.intel.com</a>&gt;</blockquote></d=
iv></div></blockquote></div><div text=3D"#000000" bgcolor=3D"#FFFFFF"><bloc=
kquote type=3D"cite"><div dir=3D"ltr"><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex"><br>
            +=C2=A0 =C2=A0 # We just archive gcc-source for all the gcc rel=
ated
            recipes<br>
            +=C2=A0 =C2=A0 if d.getVar(&#39;BPN&#39;, True) in [&#39;gcc&#3=
9;, &#39;libgcc&#39;] \<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 and not pn.startswit=
h(&#39;gcc-source&#39;):<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(1, &#39;archiver: %s is e=
xcluded, covered by
            gcc-source&#39; % pn)<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
          </blockquote></div></div></blockquote></div><div text=3D"#000000"=
 bgcolor=3D"#FFFFFF"><blockquote type=3D"cite"><div dir=3D"ltr"><div class=
=3D"gmail_quote">
          <div><br>
          </div>
          <div>Hmm, I wonder if it&#39;d be possible to make this more
            generic, check for work-shared or something. <br>
          </div>
        </div></div></blockquote></div><div text=3D"#000000" bgcolor=3D"#FF=
FFFF"><blockquote type=3D"cite"><div dir=3D"ltr"><div class=3D"gmail_quote"=
></div>
      </div>
    </blockquote>
    <br>
    I was thinking the same when writing the patch, but it seems gcc is
    more of a corner case. The only two recipes that use work-shared are
    gcc and the kernel, the kernel case it&#39;s already covered checking
    for the class &quot;kernel-yocto&quot;. In case of gcc we can&#39;t che=
ck for a
    class, we would need for work-shared and gcc, and that would be the
    almost the same comparison as is in the patch.</div><div text=3D"#00000=
0" bgcolor=3D"#FFFFFF"><br>
    <br>
    <div>Mariano<br>
    </div>
  </div></blockquote></div>

--089e013c6a983ed3ae052f2049a6--

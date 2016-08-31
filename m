Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id EFD5D6010B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 12:38:08 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id 93so24344493qtg.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 05:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=56KxsZ8+Ht0Rjiq/p57FJJ/39hVofXp6ajejtnHqEHo=;
	b=bnEG5o4A33Y0eOPSKmnRDCDJAZ5fHzHy6aPeKLodiCnb1aU61P/cYfi6lHc4oGv7eg
	J1DTX9bakl7FQmDUp4Yd3bmRzDKHfFHWdyShlnh3v/X2IMNmwUQN1a46y0VaX/zfTmEY
	VQcP8xRsBx08BFD+SfPo5Dr1UKSVMpX61d7FAaj9l1Q8lU+FpVpHlXw8CKEZBK3pvEIx
	gkha5CTDX2DzK8CO1If/tYs08do5C++bYHOy9eSMkDeo95DPwD6/lH6NSuQaDfOYJcEI
	sLNhtciV6Ae9ZjM1E12QMIvkX3ps8B6dDAy/144oSB1QnWl0WhCTrGXW4r6WSBSrpjwM
	UGRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=56KxsZ8+Ht0Rjiq/p57FJJ/39hVofXp6ajejtnHqEHo=;
	b=EFtJttV/6ZUmUe7dIc4vc0GCrSCuFtdCeFhZ0X7nXsulLlJnHxAtK800yHeSXKccMF
	V7Jk9xfQfK4Pa/nMhRP7FyZHr6NqTyvINdcfPwG9uslQeBgwSqjW5k/Z9sb609tKr73w
	EW6AQ76hw2GQZhvJdxrGwQGhHOf5PdsOvVwhMb3q4D967M/GIcxfU7G4djy+ej2JF11p
	fNNXVWaAcqTgqJHlznehQXYoHBEgUBk/Bw8w0JHAL1JNy71L91uFiOC24JysdM5Ul27T
	h7pOurXm44Pv+8hHvjRabrt1yytqKaJA8BNzA06mwuLne0Zl9hCc1sXSLvvwbDU7VrvF
	OlBg==
X-Gm-Message-State: AE9vXwON0mwBoa23ZaJNmr3Lbf+1FN4wPEAigBdzii6euZUEZo+8snIX1pT3KvqQv49oBCNK6I9dqljOCVWXPQ==
X-Received: by 10.200.47.164 with SMTP id l33mr10499492qta.19.1472647088905;
	Wed, 31 Aug 2016 05:38:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.53.83 with HTTP; Wed, 31 Aug 2016 05:38:08 -0700 (PDT)
In-Reply-To: <1472627972.29583.62.camel@linuxfoundation.org>
References: <cover.1472574514.git.bruce.ashfield@windriver.com>
	<89463ec6e33f6ba793867711eb18d82ee58bc85b.1472574514.git.bruce.ashfield@windriver.com>
	<1472627972.29583.62.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 31 Aug 2016 08:38:08 -0400
Message-ID: <CADkTA4NJTcO9T2Ji69v-RTcgS7ryXG4QkFTpJh=S5pOe+W3Qyg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Saul Wold <saul.wold@intel.com>
Subject: Re: [PATCH 5/9] libc-headers: update to v4.8
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
X-List-Received-Date: Wed, 31 Aug 2016 12:38:09 -0000
Content-Type: multipart/alternative; boundary=001a11378e1a9d4cad053b5d5e98

--001a11378e1a9d4cad053b5d5e98
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 31, 2016 at 3:19 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2016-08-30 at 12:49 -0400, Bruce Ashfield wrote:
> > Updating the libc-headers to use the 4.8 kernel as the default.
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> > ---
> >  meta/conf/distro/include/tcmode-default.inc                 |  2 +-
> >  .../linux-libc-headers/linux-libc-headers_4.8.bb            | 13
> > +++++++++++++
> >  2 files changed, 14 insertions(+), 1 deletion(-)
> >  create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc
> > -headers_4.8.bb
>
> The musl patches fail to apply on the new version:
>
> https://autobuilder.yoctoproject.org/main/builders/poky-tiny/builds/928
> /steps/BuildImages/logs/stdio


I can drop those patches, but that's all that I can really offer, since
even if
I ported them, I don't build or test with musl.

What's the preference ? I do a "they apply" port, or just drop them until
someone
else who knows musl can do the port ?

Bruce


>
>
> Cheers,
>
> Richard
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11378e1a9d4cad053b5d5e98
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Aug 31, 2016 at 3:19 AM, Richard Purdie <span dir=3D"ltr">&lt;<=
a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">rich=
ard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><span class=3D"">On Tue, 2016-08-30 at 12:49 -0400, Bruce Ash=
field wrote:<br>
&gt; Updating the libc-headers to use the 4.8 kernel as the default.<br>
&gt;<br>
&gt; Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@win=
driver.com">bruce.ashfield@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/distro/include/<wbr>tcmode-default.inc=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 .../linux-libc-headers/<a href=3D"http://linux-libc-headers_4.8.=
bb" rel=3D"noreferrer" target=3D"_blank">linux-<wbr>libc-headers_4.8.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 13<br>
&gt; +++++++++++++<br>
&gt;=C2=A0 2 files changed, 14 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-kernel/linux-<wbr>libc-headers/l=
inux-libc<br>
&gt; -<a href=3D"http://headers_4.8.bb" rel=3D"noreferrer" target=3D"_blank=
">headers_4.8.bb</a><br>
<br>
</span>The musl patches fail to apply on the new version:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/main/builders/poky-tiny/bui=
lds/928
/steps/BuildImages/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https:/=
/autobuilder.<wbr>yoctoproject.org/main/<wbr>builders/poky-tiny/builds/928<=
br>
/steps/BuildImages/logs/stdio</a></blockquote><br></div><div class=3D"gmail=
_quote">I can drop those patches, but that&#39;s all that I can really offe=
r, since even if<br></div><div class=3D"gmail_quote">I ported them, I don&#=
39;t build or test with musl.<br><br></div><div class=3D"gmail_quote">What&=
#39;s the preference ? I do a &quot;they apply&quot; port, or just drop the=
m until someone<br></div><div class=3D"gmail_quote">else who knows musl can=
 do the port ?<br><br></div><div class=3D"gmail_quote">Bruce<br></div><div =
class=3D"gmail_quote"><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
Cheers,<br>
<br>
Richard<br>
<div class=3D"HOEnZb"><div class=3D"h5">--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--001a11378e1a9d4cad053b5d5e98--

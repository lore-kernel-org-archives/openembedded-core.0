Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f170.google.com (mail-ua0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id AF9A471AD6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 21:27:08 +0000 (UTC)
Received: by mail-ua0-f170.google.com with SMTP id q40so12167682uag.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 14:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=k1Z5nqBgVy8uPZ2NmK5hNWlVGTBqzKAWW1d2CBCHOsE=;
	b=RYei3KJLM7852evp5V2ZPldz+0PMIT6BAsa3y98WqSPH2YIrFxhmOkYBFMkgI495mq
	RXTGrSQ6z/U9KcUu9NZsS9K1YixCPnRy320cswXvpMTEryKsNPhplsFC4m31gU6Mq0N3
	x93Rpl2tb+CdmHNjA3pdHlgAR85RjgqdaF1fqNhv+G1HM3FLjYLmQoiudiLlY3VqMBti
	iVbH+HsO9zqqT307h9SqET9XrkxHg8OC94suXQy/nVrNYxyV1eqyuAISsylj4DfzSXaM
	bvkpB5jI/Apauemp9LDfk0eCfilOqkVnKeMti+DgAuh8ie5dLcjwSrGrfybm5RzCxQ4V
	H1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=k1Z5nqBgVy8uPZ2NmK5hNWlVGTBqzKAWW1d2CBCHOsE=;
	b=oAewXBJRK7xMbDeyERS3Ici+zNw9qRdXhD9dF6V9l3aQs3Gw5Z8nDJEarb39fePCQw
	LNViGijl+0Oq8EzwwSEUuPAsx4oCUNV67Cyq+vYJOh7Gws5+NM4tB8Ejk+RSKOWwZ4D3
	sUKnIIY2HRYR8NxPoaXtPX/azybfaTQuuXlj1cJ2xDl8IBsbMBl45SwiaxHBrIE/vRGs
	feFTKUPcNb421QX1AYnImy1i5jeOHdiNEP6BMLvkKDotRUEwUAKyGoof9XIx7S6VEgNR
	F6HY9E2Ne5JfTHOYugJ8R6NITkyCth+fbw8PF6hBOzDKU11IQxxZTEYRADLyo8KVhitB
	qxkg==
X-Gm-Message-State: AHYfb5gL3daRbycCfgczXPN9ojhFSGYu5zUnuZPp6zZ2uYnMHuPb0ntZ
	/ZRNf5uuce5g7DARi5XPhy8YURSUaw==
X-Received: by 10.176.18.71 with SMTP id s7mr13124454uac.127.1503350829681;
	Mon, 21 Aug 2017 14:27:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.122.88 with HTTP; Mon, 21 Aug 2017 14:27:09 -0700 (PDT)
In-Reply-To: <1503350597.32591.77.camel@linuxfoundation.org>
References: <20170821065633.27570-1-Martin.Jansa@gmail.com>
	<20170821205624.19892-1-Martin.Jansa@gmail.com>
	<1503349649.32591.71.camel@linuxfoundation.org>
	<CA+chaQdU05LZtB_LB8y0aMi=Oqe6uyGO=3SY_X4q2xCYtJNZNQ@mail.gmail.com>
	<1503350597.32591.77.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 21 Aug 2017 23:27:09 +0200
Message-ID: <CA+chaQd4iWvA1fYpOwWS=CCj+yveE6=gQjF2bbQt7eD13MbL9A@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] insane.bbclass: write QA issues to log file only when they are in ERROR_QA or WARN_QA
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
X-List-Received-Date: Mon, 21 Aug 2017 21:27:08 -0000
Content-Type: multipart/alternative; boundary="94eb2c0eb5782d126a05574a2406"

--94eb2c0eb5782d126a05574a2406
Content-Type: text/plain; charset="UTF-8"

> You could do "grep -v version-going-backwards qa.log" I guess?

In theory yes, in practice the same jenkins jobs are building different
DISTROs or different Yocto releases with different QA flags enabled, so I
would end up with using bitbke -e to find
WARN_QA and ERROR_QA for given build and then filter only those from qa.log.

I can still do it outside OE, I just didn't realize that there are reasons
for not wanting the levels in the log file (and I still don't know why it's
a good thing not to have them).

Regards,

On Mon, Aug 21, 2017 at 11:23 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2017-08-21 at 23:13 +0200, Martin Jansa wrote:
> > > all messages are put into the log but at differing log levels.
> >
> > But there aren't the "log levels" in the file (as NOTE, WARN, ERROR)
> > now, it writes only P, error message and type of QA check (not the
> > selected severity of it, like bb.error, bb.warn, bb.note used in the
> > function for normal output).
> >
> > See the function above package_qa_handle_error:
> >
> > def package_qa_write_error(type, error, d):
> >     logfile = d.getVar('QA_LOGFILE')
> >     if logfile:
> >         p = d.getVar('P')
> >         with open(logfile, "a+") as f:
> >             f.write("%s: %s [%s]\n" % (p, error, type))
> >
>
> Sorry, I misread your earlier message and assumed it was logging the
> level already. I've spent too long staring at bitbake server bugs :/.
>
> I'm still torn on this, I can see why qa.log makes sense to contain all
> the qa issues found and then the WARN/ERROR levels filter the console
> output (and ultimately the bitbake exit code). I can also see why in
> general we'd not want "levels" in the logfile, its more of a console
> issue.
>
> You could do "grep -v version-going-backwards qa.log" I guess?
>
> Cheers,
>
> Richard
>
>
>

--94eb2c0eb5782d126a05574a2406
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt;=C2=A0<span style=3D"font-size:12.8px">You could do &q=
uot;grep -v version-going-backwards qa.log&quot; I guess?</span><div><span =
style=3D"font-size:12.8px"><br></span></div><div><span style=3D"font-size:1=
2.8px">In theory yes, in practice=C2=A0the same jenkins jobs are building d=
ifferent DISTROs or different Yocto releases with different QA flags enable=
d, so I would end up with using bitbke -e to find</span></div><div><span st=
yle=3D"font-size:12.8px">WARN_QA and ERROR_QA for given build and then filt=
er only those from qa.log.</span></div><div><span style=3D"font-size:12.8px=
"><br></span></div><div><span style=3D"font-size:12.8px">I can still do it =
outside OE, I just didn&#39;t realize that there are reasons for not wantin=
g the levels in the log file (and I still don&#39;t know why it&#39;s a goo=
d thing not to have them).</span></div><div><span style=3D"font-size:12.8px=
"><br></span></div><div><span style=3D"font-size:12.8px">Regards,</span></d=
iv></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon, =
Aug 21, 2017 at 11:23 PM, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@=
linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><span class=3D"">On Mon, 2017-08-21 at 23:13 +0200, Martin Jansa wrote:<br=
>
&gt; &gt;=C2=A0all=C2=A0messages are put into the log but at differing log =
levels.<br>
&gt;<br>
&gt; But there aren&#39;t the &quot;log levels&quot; in the file (as NOTE, =
WARN, ERROR)<br>
&gt; now, it writes only P, error message and type of QA check (not the<br>
&gt; selected severity of it, like bb.error, bb.warn, bb.note used in the<b=
r>
&gt; function for normal output).<br>
&gt;<br>
&gt; See the function above=C2=A0package_qa_handle_error:<br>
&gt;<br>
&gt; def package_qa_write_error(type, error, d):<br>
&gt; =C2=A0 =C2=A0 logfile =3D d.getVar(&#39;QA_LOGFILE&#39;)<br>
&gt; =C2=A0 =C2=A0 if logfile:<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D d.getVar(&#39;P&#39;)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(logfile, &quot;a+&quot;) as f:<b=
r>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&quot;%s: %s [%s]\n&=
quot; % (p, error, type))<br>
&gt;<br>
<br>
</span>Sorry, I misread your earlier message and assumed it was logging the=
<br>
level already. I&#39;ve spent too long staring at bitbake server bugs :/.<b=
r>
<br>
I&#39;m still torn on this, I can see why qa.log makes sense to contain all=
<br>
the qa issues found and then the WARN/ERROR levels filter the console<br>
output (and ultimately the bitbake exit code). I can also see why in<br>
general we&#39;d not want &quot;levels&quot; in the logfile, its more of a =
console<br>
issue.<br>
<br>
You could do &quot;grep -v version-going-backwards qa.log&quot; I guess?<br=
>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div><br></div>

--94eb2c0eb5782d126a05574a2406--

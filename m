Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8D98D6E5FB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2017 17:53:06 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id u143so1742066oif.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Feb 2017 09:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mlCFq9ygZ1VnIXxpAdSlfkOGve8Ae90i1CvaveMtlVo=;
	b=fU8cZNLAAAOQzDLRgnmjxcSLuIlRk6Kw/6wijGWQYbBh6gd7RNfyiiB6U5WRhwNAe2
	7AmieexHxWHyMCK+eWe/hVqq9/qTJnPbNslT+JE3cNaVAt7cO+Kb2HhVuKMgbc3U3POK
	4ZzD2p01CiNi/8TNm+NUD6us95McKK0djjDuxoJRCqwJj8RAtyVzIMWbf5Ao6aYfpt0A
	5HsV+zGjhrPAiTgAhc+d4DyhIiuDtIid1CLZoCc/jXCMaCZRzP13CK5IVzPGOVI39Mpf
	QrAq8wgKJ3mewmdWfhAXLZaMoDbZ58S54zsL/RltZUSpZLMwYWOLxeUfNmVrFfvXRrxq
	AClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mlCFq9ygZ1VnIXxpAdSlfkOGve8Ae90i1CvaveMtlVo=;
	b=aRcKnmDoG9XOD7WR5KngQZtmskiZQHs+GsoaRw1uWHlZwEN1VEqPZpqeJYCX284thN
	KwJnl0K2uAvMhIijLrXb+1MnsidV6JAQymTAR9EOUPxF4snfuICgnrJ73HLEuZH+JBl5
	PYoLn023dDy3GCar8zPRdfABR2Qfyua0qxh0osWJhecTuJC9gDrWW0wRo8QMM8yt7x64
	m2fplSz9e3F801bDEQtmyVXFk4oim5qrTRLIcrjTCDblQOQcM9M0JsrEAI9o6s/3JHQK
	gQa5wuZE+jLexzCtH4KXuf7XMZFXetoQJtCnqSINvMGExvMpVCdfiCRciQjpPeKr521y
	z/gQ==
X-Gm-Message-State: AIkVDXIYoaHA+k0UzrZ1n/gMSC63VTpmNbb8qrKxSKgpt7flPU/BGtR6QhiY2jT5Ru+Pd3vJ1QOeN+cXQXXbLQ==
X-Received: by 10.202.231.68 with SMTP id e65mr4594364oih.102.1486057986546;
	Thu, 02 Feb 2017 09:53:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.5.8 with HTTP; Thu, 2 Feb 2017 09:52:46 -0800 (PST)
In-Reply-To: <1486055849.14889.52.camel@intel.com>
References: <1486031880.14889.35.camel@intel.com>
	<20170202102105.07a3bb91@seebsdell>
	<1486053547.14889.50.camel@intel.com>
	<20170202111201.3fcee3fa@seebsdell>
	<1486055849.14889.52.camel@intel.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Thu, 2 Feb 2017 10:52:46 -0700
Message-ID: <CABcZANniQfvn2buXPwynsPGwxkyxpozVRTAAbVnSMv8BoshVXw@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: OpenEmbedded <openembedded-core@lists.openembedded.org>
Subject: Re: host-user-contaminated QA check
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
X-List-Received-Date: Thu, 02 Feb 2017 17:53:06 -0000
Content-Type: multipart/alternative; boundary=001a1141ba2467689305478fd638

--001a1141ba2467689305478fd638
Content-Type: text/plain; charset=UTF-8

It's worth noting that host-user-contaminated also triggers on pseudo bugs,
which I've seen before. If we change the behavior, what user would files
that pseudo loses track of entirely be owned by? Or perhaps some of
pseudo's log messages should be made errors..

On Thu, Feb 2, 2017 at 10:17 AM, Patrick Ohly <patrick.ohly@intel.com>
wrote:

> On Thu, 2017-02-02 at 11:12 -0600, Seebs wrote:
> > > But I find mapping to root:root more attractive because it makes
> > > packaging simpler (less worries about accidentally copying the
> > > original uid) and the builds faster (no need to run the QA check).
> >
> > Hmm. I think I would rather have the QA check, because if a file's
> > supposed to be non-root, and ends up root instead, that could cause
> > subtle problems, but we'd no longer have a way to *detect* those
> > problems.
>
> But that's not the kind of the problem detected by the QA check, is it?
>
> It warns when the owner of the file is the same as the user who did the
> build, but because root isn't (normally) used for building, files
> accidentally owned by root on the target won't trigger the warning.
>
> --
> Best Regards, Patrick Ohly
>
> The content of this message is my personal opinion only and although
> I am an employee of Intel, the statements I make here in no way
> represent Intel's position on the issue, nor am I authorized to speak
> on behalf of Intel on this matter.
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--001a1141ba2467689305478fd638
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It&#39;s worth noting that host-user-contaminated also tri=
ggers on pseudo bugs, which I&#39;ve seen before. If we change the behavior=
, what user would files that pseudo loses track of entirely be owned by? Or=
 perhaps some of pseudo&#39;s log messages should be made errors..<div clas=
s=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, Feb 2, 2017 at 10:=
17 AM, Patrick Ohly <span dir=3D"ltr">&lt;<a href=3D"mailto:patrick.ohly@in=
tel.com" target=3D"_blank">patrick.ohly@intel.com</a>&gt;</span> wrote:<br>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><span class=3D"">On Thu, 2017-02-02 at 11:12=
 -0600, Seebs wrote:<br>
&gt; &gt; But I find mapping to root:root more attractive because it makes<=
br>
&gt; &gt; packaging simpler (less worries about accidentally copying the<br=
>
&gt; &gt; original uid) and the builds faster (no need to run the QA check)=
.<br>
&gt;<br>
&gt; Hmm. I think I would rather have the QA check, because if a file&#39;s=
<br>
&gt; supposed to be non-root, and ends up root instead, that could cause<br=
>
&gt; subtle problems, but we&#39;d no longer have a way to *detect* those<b=
r>
&gt; problems.<br>
<br>
</span>But that&#39;s not the kind of the problem detected by the QA check,=
 is it?<br>
<br>
It warns when the owner of the file is the same as the user who did the<br>
build, but because root isn&#39;t (normally) used for building, files<br>
accidentally owned by root on the target won&#39;t trigger the warning.<br>
<span class=3D"im HOEnZb"><br>
--<br>
Best Regards, Patrick Ohly<br>
<br>
The content of this message is my personal opinion only and although<br>
I am an employee of Intel, the statements I make here in no way<br>
represent Intel&#39;s position on the issue, nor am I authorized to speak<b=
r>
on behalf of Intel on this matter.<br>
<br>
<br>
<br>
</span><div class=3D"HOEnZb"><div class=3D"h5">--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=
=3D"ltr"><div><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot c=
om<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Senior Software Engine=
er, Mentor Graphics</div></div></div></div>
</div></div>

--001a1141ba2467689305478fd638--

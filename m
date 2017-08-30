Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f180.google.com (mail-ua0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id E2EB877D30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 07:54:30 +0000 (UTC)
Received: by mail-ua0-f180.google.com with SMTP id y50so16770217uay.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 00:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LljmA/TIkpm0cMEdOfdAxgbWNE2tGd3nyvFB1Dgq1Zc=;
	b=V2EhRuTS7SFT9oflzp5RYyQpiME/+Qr8nQnQRw83NItknl26LOmNGzM89tP7aoXbm8
	BpSRaAYXnYfAt/avhcPfNt2Ls/Aqi8LjFP0xtGmFYuMQUvCTLmOf61n/SokAZ+8lWp7V
	FtWhnaPYAtc8kD79VMFW1YxO2MznWikFbh3bf/l7AnuXLmlfIVeBZc5qKnb7edjHQv6L
	sXw/sRYXUqrfCzwPogXK0Pjkbzu8x725y1sy4eJWVJiYDtKS4m8EI+sndpth+6Bs0gfV
	y8cjjV+gzvcB5elU6UVX22eKRyWHZ0GNu2KIlKyC+V6HIpgGcwKtAaHrDSA/4k8VO5sF
	JtXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LljmA/TIkpm0cMEdOfdAxgbWNE2tGd3nyvFB1Dgq1Zc=;
	b=OD29NB3foQBA5oKceukFQojdiTy1WhkfSVkH9xtT4zhZvEuyRkJCb92NH37U0Bo+a+
	G23m9pmXVu7O0vMA8blnr7BC8vIE3UqsJYW5lcV8kkjw/d+7Ioa1RcfoWxoNhx9JcH5m
	mPdQnu9MFy/F9WrNFxXCZHpeASuhERjkR5ogSWnD+o4odtT52YueL/o6FmDTHGOFIBp2
	9KxnO1satUKXEQQ7eiTkFKJa6AjSg/0Q2gGh/5Ho1ttvLtkJFf2oTbDyn3HL5nV1XSdP
	kVXhj4gag7R653QB+GtlEV6FzpRY2gk2lfmjpbzXz05CXQRWpaMZ7oqPeYfC2yk9xlkF
	O0Cw==
X-Gm-Message-State: AHYfb5jra0/5347RTPTzSwLe3VP4Qxrpn4hqxJ/mJsUj3nHJJXPfmkz2
	JTrNbwNpntPRevLEQWzKZXv25I1lWg==
X-Received: by 10.159.32.163 with SMTP id 32mr430003uaa.127.1504079671728;
	Wed, 30 Aug 2017 00:54:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.15.69 with HTTP; Wed, 30 Aug 2017 00:54:31 -0700 (PDT)
In-Reply-To: <5ba32c0773d848ef8e6afb117a72abb0@XBOX02.axis.com>
References: <cover.1504036763.git.pkj@axis.com>
	<CAJ86T=VajsxSGRakyVVmTZcEWwwLaVZxKpcsE+ZU75bGrsUkbQ@mail.gmail.com>
	<70b15633357a418095d460b943d3e994@XBOX02.axis.com>
	<1504043397.2175.19.camel@linuxfoundation.org>
	<5ba32c0773d848ef8e6afb117a72abb0@XBOX02.axis.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 30 Aug 2017 09:54:31 +0200
Message-ID: <CA+chaQeak4gD3C=jgxE-gg=9yf+g=4sgcHqP3ooMVRMJsbtO5w@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Avoid build failures due to setscene errors
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
X-List-Received-Date: Wed, 30 Aug 2017 07:54:31 -0000
Content-Type: multipart/alternative; boundary="94eb2c0b6d8a8c1dc80557f3d6e1"

--94eb2c0b6d8a8c1dc80557f3d6e1
Content-Type: text/plain; charset="UTF-8"

I agree with this patchset and it would be OK with IGNORE_SETSCENE_ERRORS
conditional as well.

We're also sometimes seeing these errors, sometime anticipated when
cleaning shared sstate-cache on NFS server sometimes unexpected when NFS or
network goes down for a minute and for some builds it happens between
sstate_checkhashes()  and using the sstate.

We normally stop all jenkins builds, until the cleanup is complete (there
is jenkins job doing the cleanup, so it puts jenkins into stop mode, waits
for all current jobs to finish which can take hours, then performs the
cleanup and cancels the stop mode), but we cannot stop hundreds of
developers using the same sstate-cache in local builds (especially when we
cannot really know when exactly the job will have free jenkins to perform
the cleanup) - luckily in local builds it doesn't hurt so bad, because the
developers are more likely to ignore the error as long as the image was
created, but in jenkins builds when bitbake returns error we cannot easily
distinguish this case of "RP is intentionally warning us that something
went wrong with sstate, but everything was built correctly in the end" and
"something failed in the build and we weren't able to recover from that,
maybe even the image wasn't created" - so we don't trigger the follow up
actions like announcing new official builds or parsing release notes or
automated testing.

Yes we could add more logic to these CI jobs, to grep the logs to decide if
this error was the only one which caused the bitbake to return error code
and ignore the returned error in such case, but simple variable is easier
to maintain (even for the cost of forking bitbake and oe-core) and will
work for local builds as well.

Regards,

On Wed, Aug 30, 2017 at 8:44 AM, Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> > Richard Purdie
> > Sent: den 29 augusti 2017 23:50
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; Andre McCurdy
> > <armccurdy@gmail.com>
> > Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
> > Subject: Re: [OE-core] [PATCH 0/2] Avoid build failures due to setscene
> > errors
> >
> > On Tue, 2017-08-29 at 20:59 +0000, Peter Kjellerstedt wrote:
> > > > -----Original Message-----
> > > > From: Andre McCurdy [mailto:armccurdy@gmail.com]
> > > > Sent: den 29 augusti 2017 22:38
> > > > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > > > Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
> > > > Subject: Re: [OE-core] [PATCH 0/2] Avoid build failures due to
> > > > setscene
> > > > errors
> > > >
> > > > On Tue, Aug 29, 2017 at 1:00 PM, Peter Kjellerstedt
> > > > <peter.kjellerstedt@axis.com> wrote:
> > > > >
> > > > > Occasionally, we see errors on our autobuilders where a setscene
> > > > > task
> > > > > fails to retrieve a file from our global sstate cache. It
> > > > > typically
> > > > > looks something like this:
> > > > >
> > > > > WARNING: zip-3.0-r2 do_populate_sysroot_setscene: Failed to fetch
> > > > > URL
> > > > > file://66/sstate:zip:core2-64-poky-linux:3.0:r2:core2-64:3:\
> > > > > 66832b8c4e7babe0eac9d9579d1e2b6a_populate_sysroot.tgz;\
> > > > > downloadfilename=66/sstate:zip:core2-64-poky-linux:3.0:r2:core2-
> > > > 64:3:\
> > > > >
> > > > > 66832b8c4e7babe0eac9d9579d1e2b6a_populate_sysroot.tgz, attempting
> > > > > MIRRORS if available
> > > > > ERROR: zip-3.0-r2 do_populate_sysroot_setscene: Fetcher failure:
> > > > > Unable to find file
> > > > > file://66/sstate:zip:core2-64-poky-linux:3.0:r2:core2-64:3:\
> > > > > 66832b8c4e7babe0eac9d9579d1e2b6a_populate_sysroot.tgz;\
> > > > > downloadfilename=66/sstate:zip:core2-64-poky-linux:3.0:r2:core2-
> > > > 64:3:\
> > > > >
> > > > > 66832b8c4e7babe0eac9d9579d1e2b6a_populate_sysroot.tgz anywhere.
> > > > > The
> > > > > paths that were searched were:
> > > > >     /home/pkj/.openembedded/sstate-cache
> > > > To trigger this, do you have SSTATE_MIRRORS pointing to
> > > > "/home/pkj/.openembedded/sstate-cache" and SSTATE_DIR pointed
> > > > somewhere else? Or are they both pointing to the same local
> > > > directory?
> > > > Or something else?
> > > No, the directory above is actually what is in SSTATE_DIR.
> > > SSTATE_MIRRORS is set to:
> > >
> > > SSTATE_MIRRORS ?= "\
> > > file://.* file:///n/oe/sstate-cache/PATH;downloadfilename=PATH"
> > >
> > > where /n/oe is an NFS mount where we share a global sstate cache.
> > >
> > > The only way I have figured out to manually simulate the problem is
> > > by modifying the code in sstate_checkhashes() in sstate.bbclass and
> > > commenting out the call to fetcher.checkstatus(). Then as long as
> > > there actually is no sstate files for the task in either the global
> > > or the local sstate cache, I will get the above.
> > >
> > > I do not know what triggers it on the autobuilder though. My guess
> > > is
> > > that somehow the sstate tgz file disappears between the call to
> > > sstate_checkhashes() and when bitbake actually tries to download the
> > > file.
> > >
> > > We do have a daily job that cleans up the global sstate cache and
> > > removes files that have not been accessed in the last ten days, but
> > > it seems unlikely that it should remove a file that just happens to
> > > be required again, and do it at exactly the time when that task is
> > > building.
> >
> > I have left this code as an error deliberately as this kind of thing
> > should not happen and if it does, there is really something wrong which
> > you need to figure out. It means that at one point bitbake thinks the
> > sstate is present and valid, then later it isn't.
>
> True, but since the operations of checking if an sstate file exists and
> retrieving it is not an atomic operation, there are always problems that
> can occur. Some may be fixable, some may not. However, using a build
> failure to detect these kind of problems is a bit harsh on the developers
> who only sees their builds complete only to get an error for something
> that is not their fault. We have better ways to detect these kinds of
> problems, e.g., through log monitoring, without having to cause
> unnecessary grief amongst the developers.
>
> > I'm not convinced patching out the errors is the right solution here...
>
> How about I make it conditional by adding an IGNORE_SETSCENE_ERRORS?
> That way it can default to "0", but we can set it to "1" to prioritize
> the production builds.
>
> > Cheers,
> >
> > Richard
>
> //Peter
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c0b6d8a8c1dc80557f3d6e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I agree with this patchset and it would be OK with=C2=A0<s=
pan style=3D"font-size:12.8px">IGNORE_SETSCENE_ERRORS conditional as well.<=
/span><div><span style=3D"font-size:12.8px"><br></span></div><div><span sty=
le=3D"font-size:12.8px">We&#39;re also sometimes seeing these errors, somet=
ime anticipated when cleaning shared sstate-cache on NFS server sometimes u=
nexpected when NFS or network goes down for a minute and for some builds it=
 happens between=C2=A0</span><span style=3D"font-size:12.8px">sstate_checkh=
ashes()</span><span style=3D"font-size:12.8px">=C2=A0 and using the sstate.=
</span></div><div><span style=3D"font-size:12.8px"><br></span></div><div><s=
pan style=3D"font-size:12.8px">W</span><span style=3D"font-size:12.8px">e n=
ormally stop all jenkins builds, until the cleanup is complete (there is je=
nkins job doing the cleanup, so it puts jenkins into stop mode, waits for a=
ll current jobs to finish which can take hours, then performs the cleanup a=
nd cancels the stop mode), but we cannot stop hundreds of developers using =
the same sstate-cache in local builds (especially when we cannot really kno=
w when exactly the job will have free jenkins to perform the cleanup) - luc=
kily in local builds it doesn&#39;t hurt so bad, because the developers are=
 more likely to ignore the error as long as the image was created, but in j=
enkins builds when bitbake returns error we cannot easily distinguish this =
case of &quot;RP is intentionally warning us that something went wrong with=
 sstate, but everything was built correctly in the end&quot; and &quot;some=
thing failed in the build and we weren&#39;t able to recover from that, may=
be even the image wasn&#39;t created&quot; - so we don&#39;t trigger the fo=
llow up actions like announcing new official builds or parsing release note=
s or automated testing.</span></div><div><span style=3D"font-size:12.8px"><=
br></span></div><div><span style=3D"font-size:12.8px">Yes we could add more=
 logic to these CI jobs, to grep the logs to decide if this error was the o=
nly one which caused the bitbake to return error code and ignore the return=
ed error in such case, but simple variable is easier to maintain (even for =
the cost of forking bitbake and oe-core) and will work for local builds as =
well.</span></div><div><span style=3D"font-size:12.8px"><br></span></div><d=
iv><span style=3D"font-size:12.8px">Regards,</span></div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, Aug 30, 2017 at 8:4=
4 AM, Peter Kjellerstedt <span dir=3D"ltr">&lt;<a href=3D"mailto:peter.kjel=
lerstedt@axis.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div cl=
ass=3D"h5">&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core-bounces@lists.openembedded.o=
rg">openembedded-core-bounces@<wbr>lists.openembedded.org</a><br>
&gt; [mailto:<a href=3D"mailto:openembedded-core-bounces@lists.openembedded=
.org">openembedded-core-<wbr>bounces@lists.openembedded.org</a><wbr>] On Be=
half Of<br>
&gt; Richard Purdie<br>
&gt; Sent: den 29 augusti 2017 23:50<br>
&gt; To: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis.c=
om">peter.kjellerstedt@axis.com</a>&gt;; Andre McCurdy<br>
&gt; &lt;<a href=3D"mailto:armccurdy@gmail.com">armccurdy@gmail.com</a>&gt;=
<br>
&gt; Cc: OE Core mailing list &lt;<a href=3D"mailto:openembedded-core@lists=
.openembedded.org">openembedded-core@lists.<wbr>openembedded.org</a>&gt;<br=
>
&gt; Subject: Re: [OE-core] [PATCH 0/2] Avoid build failures due to setscen=
e<br>
&gt; errors<br>
&gt;<br>
&gt; On Tue, 2017-08-29 at 20:59 +0000, Peter Kjellerstedt wrote:<br>
&gt; &gt; &gt; -----Original Message-----<br>
&gt; &gt; &gt; From: Andre McCurdy [mailto:<a href=3D"mailto:armccurdy@gmai=
l.com">armccurdy@gmail.com</a>]<br>
&gt; &gt; &gt; Sent: den 29 augusti 2017 22:38<br>
&gt; &gt; &gt; To: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerst=
edt@axis.com">peter.kjellerstedt@axis.com</a>&gt;<br>
&gt; &gt; &gt; Cc: OE Core mailing list &lt;<a href=3D"mailto:openembedded-=
core@lists.openembedded.org">openembedded-core@lists.<wbr>openembedded.org<=
/a>&gt;<br>
&gt; &gt; &gt; Subject: Re: [OE-core] [PATCH 0/2] Avoid build failures due =
to<br>
&gt; &gt; &gt; setscene<br>
&gt; &gt; &gt; errors<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Tue, Aug 29, 2017 at 1:00 PM, Peter Kjellerstedt<br>
&gt; &gt; &gt; &lt;<a href=3D"mailto:peter.kjellerstedt@axis.com">peter.kje=
llerstedt@axis.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Occasionally, we see errors on our autobuilders where a=
 setscene<br>
&gt; &gt; &gt; &gt; task<br>
&gt; &gt; &gt; &gt; fails to retrieve a file from our global sstate cache. =
It<br>
&gt; &gt; &gt; &gt; typically<br>
&gt; &gt; &gt; &gt; looks something like this:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; WARNING: zip-3.0-r2 do_populate_sysroot_setscene: Faile=
d to fetch<br>
&gt; &gt; &gt; &gt; URL<br>
&gt; &gt; &gt; &gt; file://66/sstate:zip:core2-64-<wbr>poky-linux:3.0:r2:co=
re2-64:3:\<br>
&gt; &gt; &gt; &gt; 66832b8c4e7babe0eac9d9579d1e2b<wbr>6a_populate_sysroot.=
tgz;\<br>
&gt; &gt; &gt; &gt; downloadfilename=3D66/sstate:<wbr>zip:core2-64-poky-lin=
ux:3.0:<wbr>r2:core2-<br>
&gt; &gt; &gt; 64:3:\<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; 66832b8c4e7babe0eac9d9579d1e2b<wbr>6a_populate_sysroot.=
tgz, attempting<br>
&gt; &gt; &gt; &gt; MIRRORS if available<br>
&gt; &gt; &gt; &gt; ERROR: zip-3.0-r2 do_populate_sysroot_setscene: Fetcher=
 failure:<br>
&gt; &gt; &gt; &gt; Unable to find file<br>
&gt; &gt; &gt; &gt; file://66/sstate:zip:core2-64-<wbr>poky-linux:3.0:r2:co=
re2-64:3:\<br>
&gt; &gt; &gt; &gt; 66832b8c4e7babe0eac9d9579d1e2b<wbr>6a_populate_sysroot.=
tgz;\<br>
&gt; &gt; &gt; &gt; downloadfilename=3D66/sstate:<wbr>zip:core2-64-poky-lin=
ux:3.0:<wbr>r2:core2-<br>
&gt; &gt; &gt; 64:3:\<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; 66832b8c4e7babe0eac9d9579d1e2b<wbr>6a_populate_sysroot.=
tgz anywhere.<br>
&gt; &gt; &gt; &gt; The<br>
&gt; &gt; &gt; &gt; paths that were searched were:<br>
&gt; &gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0/home/pkj/.openembedded/<wbr>ss=
tate-cache<br>
&gt; &gt; &gt; To trigger this, do you have SSTATE_MIRRORS pointing to<br>
&gt; &gt; &gt; &quot;/home/pkj/.openembedded/<wbr>sstate-cache&quot; and SS=
TATE_DIR pointed<br>
&gt; &gt; &gt; somewhere else? Or are they both pointing to the same local<=
br>
&gt; &gt; &gt; directory?<br>
&gt; &gt; &gt; Or something else?<br>
&gt; &gt; No, the directory above is actually what is in SSTATE_DIR.<br>
&gt; &gt; SSTATE_MIRRORS is set to:<br>
&gt; &gt;<br>
&gt; &gt; SSTATE_MIRRORS ?=3D &quot;\<br>
&gt; &gt; file://.* file:///n/oe/sstate-cache/<wbr>PATH;downloadfilename=3D=
PATH&quot;<br>
&gt; &gt;<br>
&gt; &gt; where /n/oe is an NFS mount where we share a global sstate cache.=
<br>
&gt; &gt;<br>
&gt; &gt; The only way I have figured out to manually simulate the problem =
is<br>
&gt; &gt; by modifying the code in sstate_checkhashes() in sstate.bbclass a=
nd<br>
&gt; &gt; commenting out the call to fetcher.checkstatus(). Then as long as=
<br>
&gt; &gt; there actually is no sstate files for the task in either the glob=
al<br>
&gt; &gt; or the local sstate cache, I will get the above.<br>
&gt; &gt;<br>
&gt; &gt; I do not know what triggers it on the autobuilder though. My gues=
s<br>
&gt; &gt; is<br>
&gt; &gt; that somehow the sstate tgz file disappears between the call to<b=
r>
&gt; &gt; sstate_checkhashes() and when bitbake actually tries to download =
the<br>
&gt; &gt; file.<br>
&gt; &gt;<br>
&gt; &gt; We do have a daily job that cleans up the global sstate cache and=
<br>
&gt; &gt; removes files that have not been accessed in the last ten days, b=
ut<br>
&gt; &gt; it seems unlikely that it should remove a file that just happens =
to<br>
&gt; &gt; be required again, and do it at exactly the time when that task i=
s<br>
&gt; &gt; building.<br>
&gt;<br>
&gt; I have left this code as an error deliberately as this kind of thing<b=
r>
&gt; should not happen and if it does, there is really something wrong whic=
h<br>
&gt; you need to figure out. It means that at one point bitbake thinks the<=
br>
&gt; sstate is present and valid, then later it isn&#39;t.<br>
<br>
</div></div>True, but since the operations of checking if an sstate file ex=
ists and<br>
retrieving it is not an atomic operation, there are always problems that<br=
>
can occur. Some may be fixable, some may not. However, using a build<br>
failure to detect these kind of problems is a bit harsh on the developers<b=
r>
who only sees their builds complete only to get an error for something<br>
that is not their fault. We have better ways to detect these kinds of<br>
problems, e.g., through log monitoring, without having to cause<br>
unnecessary grief amongst the developers.<br>
<span class=3D""><br>
&gt; I&#39;m not convinced patching out the errors is the right solution he=
re...<br>
<br>
</span>How about I make it conditional by adding an IGNORE_SETSCENE_ERRORS?=
<br>
That way it can default to &quot;0&quot;, but we can set it to &quot;1&quot=
; to prioritize<br>
the production builds.<br>
<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
//Peter<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--94eb2c0b6d8a8c1dc80557f3d6e1--

Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id B14106B7F3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 22:33:41 +0000 (UTC)
Received: by mail-ob0-f181.google.com with SMTP id uy5so1947357obc.26
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 14:33:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=EyDKWguBLu/09Xc1QzkxjNh670kJ4gH1sX9eD+A1j4Y=;
	b=WMaFuKapLvmTMtyVULIIUdhjy9XQgSE4apE5uEICNKXBw80+OJSdjgSym76m5eOOD3
	DQYkTr5vzBjjbi2loRNXLexpeF9m/qTNLzzWR1p5IElGI0C3ZQH2SBzmNNoHTDfN1OFc
	zDmYn45oZSZu4JOFJvS6I70F5av0Wu+mVnN2HhcufngCDUABVdIh8D7vs0P7Hf2IMTOQ
	zeypMLAzeFLW+fDOhA07zoszmElX3J47D1ctr3NfeGwgr/yXpCuS2Bui9B+DZRs4b073
	D7UlbgOX02phZGBOGrggUM/tDJWdC4XWCxZpORNTx8h04cMu3/GQKLRdVimQdcVW7TJS
	uWaA==
X-Gm-Message-State: ALoCoQmFlzCiVoY4YMg2Xis4rctycbKR/l6CvttsU2PEnXn9hH4Hc1LSa6/5Pcu4xQp8QYLTW4fT
X-Received: by 10.182.72.234 with SMTP id g10mr12684378obv.21.1385159620650;
	Fri, 22 Nov 2013 14:33:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.0.50 with HTTP; Fri, 22 Nov 2013 14:33:20 -0800 (PST)
In-Reply-To: <5282EC62.9010805@gmail.com>
References: <1384162062-30319-2-git-send-email-layliu@gmail.com>
	<1384251828.1143.3.camel@ted> <5282EC62.9010805@gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 22 Nov 2013 23:33:20 +0100
Message-ID: <CAP71Wjz9ymXepFCBpLQkKuzH_sGv0H7sYFW5M9FDV1Z8GSqmKw@mail.gmail.com>
To: Lei Liu <layliu@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] Fix grep pattern when mklibs collects executables in rootfs
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
X-List-Received-Date: Fri, 22 Nov 2013 22:33:41 -0000
Content-Type: multipart/alternative; boundary=001a11c2e06425800004ebcb9b69

--001a11c2e06425800004ebcb9b69
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

hi,

On Wed, Nov 13, 2013 at 4:05 AM, Lei Liu <layliu@gmail.com> wrote:

> On 2013=E5=B9=B411=E6=9C=8812=E6=97=A5 18:23, Richard Purdie wrote:
> > On Mon, 2013-11-11 at 17:27 +0800, Lei Liu wrote:
> >> From: Lei Liu <lei.liu2@windriver.com>
> >>
> >> File command in some version could print extra space between
> >> "LSB" and "executable" - it causes mklibs can't find any executables
> >> using grep "LSB executable".  Fix the grep pattern to catch
> >> multiple spaces.
> >>
> >> Signed-off-by: Lei Liu <lei.liu2@windriver.com>
> >> ---
> >>  meta/classes/image-mklibs.bbclass |    2 +-
> >>  1 files changed, 1 insertions(+), 1 deletions(-)
> > I've queued this but please put the area name in the short line of the
> > commit in future ("image-mklibs: " in this case).
> >
>
> Okay.  Thanks.


First of all, this patch is needed on dora branch too , and it applies
cleanly, can that be merged?

Now, the real question... i am not able to get mklibs to work at all (even
with this patch). What i am seeing is that mklibs 0.1.38 doesn't support
anymore the use of 'sysroot'. I think this is because of this upstream
change

http://anonscm.debian.org/gitweb/?p=3Dd-i/mklibs.git;a=3Dcommit;h=3D60bda7e=
2132d197e1c88afb5012f9677b6967db2

If I revert to 0.1.34 (that we had on dylan branch), i can build my image
just fine (note that I am building an arm soft-float image), so are you
able to use image-mklibs with dora or master which have 0.1.38?

--001a11c2e06425800004ebcb9b69
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">hi,</div><div class=3D"gmail_ex=
tra"><br><div class=3D"gmail_quote">On Wed, Nov 13, 2013 at 4:05 AM, Lei Li=
u <span dir=3D"ltr">&lt;<a href=3D"mailto:layliu@gmail.com" target=3D"_blan=
k">layliu@gmail.com</a>&gt;</span> wrote:<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div>On 2013=E5=B9=B411=E6=9C=8812=E6=97=A5 18:23, Richard=
 Purdie wrote:<br>
&gt; On Mon, 2013-11-11 at 17:27 +0800, Lei Liu wrote:<br>
&gt;&gt; From: Lei Liu &lt;<a href=3D"mailto:lei.liu2@windriver.com" target=
=3D"_blank">lei.liu2@windriver.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; File command in some version could print extra space between<br>
&gt;&gt; &quot;LSB&quot; and &quot;executable&quot; - it causes <span>mklib=
s</span> can&#39;t find any executables<br>
&gt;&gt; using grep &quot;LSB executable&quot;. =C2=A0Fix the grep pattern =
to catch<br>
&gt;&gt; multiple spaces.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Lei Liu &lt;<a href=3D"mailto:lei.liu2@windriver.co=
m" target=3D"_blank">lei.liu2@windriver.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; =C2=A0meta/classes/image-<span>mklibs</span>.bbclass | =C2=A0 =C2=
=A02 +-<br>
&gt;&gt; =C2=A01 files changed, 1 insertions(+), 1 deletions(-)<br>
&gt; I&#39;ve queued this but please put the area name in the short line of=
 the<br>
&gt; commit in future (&quot;image-<span>mklibs</span>: &quot; in this case=
).<br>
&gt;<br>
<br>
</div>Okay. =C2=A0Thanks.</blockquote></div><br>First of all, this patch is=
 needed on dora branch too , and it applies cleanly, can that be merged?</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Now, the=
 real question... i am not able to get mklibs to work at all (even with thi=
s patch). What i am seeing is that mklibs 0.1.38 doesn&#39;t support anymor=
e the use of &#39;sysroot&#39;. I think this is because of this upstream ch=
ange</div>

<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><a href=3D"=
http://anonscm.debian.org/gitweb/?p=3Dd-i/mklibs.git;a=3Dcommit;h=3D60bda7e=
2132d197e1c88afb5012f9677b6967db2">http://anonscm.debian.org/gitweb/?p=3Dd-=
i/mklibs.git;a=3Dcommit;h=3D60bda7e2132d197e1c88afb5012f9677b6967db2</a><br=
>

</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">If I =
revert to 0.1.34 (that we had on dylan branch), i can build my image just f=
ine (note that I am building an arm soft-float image), so are you able to u=
se image-mklibs with dora or master which have 0.1.38?</div>

<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra"><br></div></div>

--001a11c2e06425800004ebcb9b69--

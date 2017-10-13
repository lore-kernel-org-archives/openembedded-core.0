Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id CD3C577FC1;
	Fri, 13 Oct 2017 02:35:35 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id b189so17544593wmd.4;
	Thu, 12 Oct 2017 19:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4YejH/tHW3j7bX93j1KWCyVmnYuyxfwP8cmxuDg9Zrw=;
	b=pBQfiDbdvfxqWiFb5MkYAA2JE4tRDpZcAP0TGAFMeTQJuI0B737GWBr00Eks2iUWSs
	sXWwmSeHgm94UH8bnTizWn7rNDQwlheYby2m1rFwaf3uMRz13MLYq5wltHzPGTY10lm8
	p06KXrwktU+aJAnhQatWGwoAFQIcL1VLbUz3claQLcImsDV7V4nG9Xssoc6wjd4z1j2n
	A+6ngw/Ptwt9p/WrzX/wbbb8wShZ6bqCiaUWkSAlS0aKSiuXvW4u+3TV7BxEyk2M0HaI
	X0of/GeCnjIeeNvugu5r0d4FCChkCUyNj/GvyNM0aUFDlBidEIwgXP7MrBQSuV0nxMB0
	r0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4YejH/tHW3j7bX93j1KWCyVmnYuyxfwP8cmxuDg9Zrw=;
	b=laRBYoFzpfU0Qs7bKjLvbI6M9SH+8wHxlvmNKGtmQiAbOM4T/jl6HVkGk75ygLqyWa
	iMpq0C4ecXdPulfIt4QoRb9aSGkGiRgiQnis3wOOpHdAkMnx0blJ58WT2OMGy73Ktc4O
	y9SzhSHF2F3t3x2HbW3xbt8NOjQzBSvVgRwQC6Vbrz0xjZLSJt4jrgwk/mMTEencBqgr
	5z37s5oNU/6JMLTs8nVhFuKtpS5sHpiK2uUhpS2hKDanIuFeWUwhGOYCLj3R+hcL6BNa
	iz45txhdCC81479Ko9y6dhVD+aSb5InmXYBvYbwIvEnICu5fMhv+caDCCOGCB7guFAkS
	o9iw==
X-Gm-Message-State: AMCzsaWWCn+GIGSffPrlaHHy5jvGqTcQBMXObSQ04ccjrxbeK+/c0zxp
	VdZ5I+l0V8FWIGevH733puA9aQc+ccxfxPKtpIc=
X-Google-Smtp-Source: ABhQp+R+AURSSn4KDmQTBmut2lCJXc/0ylRE6Uwaz/fKRPBdJUNVZsfuonP5coE0Z8ZETdUGsRD4VrA8LLr6HGdNmFY=
X-Received: by 10.28.211.69 with SMTP id k66mr135162wmg.1.1507862136470; Thu,
	12 Oct 2017 19:35:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.183.212 with HTTP; Thu, 12 Oct 2017 19:35:35 -0700 (PDT)
In-Reply-To: <CAJTo0LZMRAP4t4XcjyNw-uhnqLLU=sQW38=EMKn=RKo3=c-bEw@mail.gmail.com>
References: <150754017019.10662.17591818165714630277@git.openembedded.org>
	<20171012015609.GA3832@jama>
	<CAMKF1sptwf=LMdHmXCKN1tCyPGgQcezhvKqHX3rNs113pL1dnQ@mail.gmail.com>
	<50262241.T8AzmBLD0O@peggleto-mobl.ger.corp.intel.com>
	<CAMKF1sqqx-7PgL7833JVTn87Tdc57+h-Ob7VLfBD4khmpKN+HA@mail.gmail.com>
	<CAJTo0LZMRAP4t4XcjyNw-uhnqLLU=sQW38=EMKn=RKo3=c-bEw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 13 Oct 2017 04:35:35 +0200
Message-ID: <CA+chaQe1gHwBOzvA7mKTMU312iF5HApkMjib7J5CysEQCuA-3g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	"openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 01/01: bitbake.conf: add tools required by testimage to HOSTTOOLS conditionally
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
X-List-Received-Date: Fri, 13 Oct 2017 02:35:36 -0000
Content-Type: multipart/alternative; boundary="001a114672fc03c215055b6483c2"

--001a114672fc03c215055b6483c2
Content-Type: text/plain; charset="UTF-8"

I just got bunch of do_fetch errors from components using
git://....;protocol=ssh

So it isn't just the sanity check and CONNECTIVITY_CHECK_URIS, it's
everywhere where git-native (by default in ASSUME_PROVIDED) is used with
ssh.

On Thu, Oct 12, 2017 at 1:34 PM, Burton, Ross <ross.burton@intel.com> wrote:

> On 12 October 2017 at 06:01, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Wed, Oct 11, 2017 at 9:32 PM, Paul Eggleton
>> <paul.eggleton@linux.intel.com> wrote:
>> > On Thursday, 12 October 2017 3:15:12 PM NZDT Khem Raj wrote:
>> >> On Wed, Oct 11, 2017 at 6:56 PM, Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>> >> > On Mon, Oct 09, 2017 at 09:09:31AM +0000, git@git.openembedded.org
>> wrote:
>> >> >> --- a/meta/conf/bitbake.conf
>> >> >> +++ b/meta/conf/bitbake.conf
>> >> >> @@ -484,7 +484,7 @@ HOSTTOOLS += " \
>> >> >>  "
>> >> >>
>> >> >>  # Tools needed to run testimage runtime image testing
>> >> >> -HOSTTOOLS += "ip ping ps scp ssh stty"
>> >> >> +HOSTTOOLS += "${@['', 'ip ping ps scp ssh
>> stty'][bb.data.inherits_class('testimage', d)]}"
>> >> >
>> >> > Shouldn't we include at least ssh by default?
>> >>
>> >> I would say no, since nothing in OE-Core depends on it. more we
>> >> abstract from host system better it is.
>> >
>> > I'm with Martin on this one, let's not make it painful for people to use
>> > the SSH protocol in git URLs in their recipes. I don't see much
>> potential
>> > for host contamination.
>>
>> Standard distro do not install ssh, if we want to add it here, probably we
>> should at the same time let user know that he should install ssh
>>
>
> That's what HOSTTOOLS_NONFATAL is for.  Who is going to claim the glory
> and post a patch?
>
> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a114672fc03c215055b6483c2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I just got bunch of do_fetch errors from components using =
git://....;protocol=3Dssh<div><br></div><div>So it isn&#39;t just the sanit=
y check and=C2=A0<span style=3D"font-size:12.8px">CONNECTIVITY_CHECK_URIS, =
it&#39;s everywhere where git-native (by default in ASSUME_PROVIDED) is use=
d with ssh.</span></div></div><div class=3D"gmail_extra"><br><div class=3D"=
gmail_quote">On Thu, Oct 12, 2017 at 1:34 PM, Burton, Ross <span dir=3D"ltr=
">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burto=
n@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div di=
r=3D"ltr"><span class=3D"">On 12 October 2017 at 06:01, Khem Raj <span dir=
=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.kh=
em@gmail.com</a>&gt;</span> wrote:<br></span><div class=3D"gmail_extra"><di=
v class=3D"gmail_quote"><span class=3D""><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><sp=
an>On Wed, Oct 11, 2017 at 9:32 PM, Paul Eggleton<br>
&lt;<a href=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul=
.eggleton@linux.intel.com</a><wbr>&gt; wrote:<br>
&gt; On Thursday, 12 October 2017 3:15:12 PM NZDT Khem Raj wrote:<br>
&gt;&gt; On Wed, Oct 11, 2017 at 6:56 PM, Martin Jansa &lt;<a href=3D"mailt=
o:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; =
wrote:<br>
&gt;&gt; &gt; On Mon, Oct 09, 2017 at 09:09:31AM +0000, <a href=3D"mailto:g=
it@git.openembedded.org" target=3D"_blank">git@git.openembedded.org</a> wro=
te:<br>
&gt;&gt; &gt;&gt; --- a/meta/conf/bitbake.conf<br>
&gt;&gt; &gt;&gt; +++ b/meta/conf/bitbake.conf<br>
&gt;&gt; &gt;&gt; @@ -484,7 +484,7 @@ HOSTTOOLS +=3D &quot; \<br>
&gt;&gt; &gt;&gt;=C2=A0 &quot;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 # Tools needed to run testimage runtime image testi=
ng<br>
&gt;&gt; &gt;&gt; -HOSTTOOLS +=3D &quot;ip ping ps scp ssh stty&quot;<br>
&gt;&gt; &gt;&gt; +HOSTTOOLS +=3D &quot;${@[&#39;&#39;, &#39;ip ping ps scp=
 ssh stty&#39;][bb.data.inherits_class(<wbr>&#39;testimage&#39;, d)]}&quot;=
<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Shouldn&#39;t we include at least ssh by default?<br>
&gt;&gt;<br>
&gt;&gt; I would say no, since nothing in OE-Core depends on it. more we<br=
>
&gt;&gt; abstract from host system better it is.<br>
&gt;<br>
&gt; I&#39;m with Martin on this one, let&#39;s not make it painful for peo=
ple to use<br>
&gt; the SSH protocol in git URLs in their recipes. I don&#39;t see much po=
tential<br>
&gt; for host contamination.<br>
<br>
</span>Standard distro do not install ssh, if we want to add it here, proba=
bly we<br>
should at the same time let user know that he should install ssh<br></block=
quote><div><br></div></span><div>That&#39;s what HOSTTOOLS_NONFATAL is for.=
=C2=A0 Who is going to claim the glory and post a patch?</div><span class=
=3D"HOEnZb"><font color=3D"#888888"><div><br></div><div>Ross=C2=A0</div></f=
ont></span></div></div></div>
<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div>

--001a114672fc03c215055b6483c2--

Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f52.google.com (mail-qa0-f52.google.com
	[209.85.216.52])
	by mail.openembedded.org (Postfix) with ESMTP id 300CD722AD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Nov 2014 17:24:02 +0000 (UTC)
Received: by mail-qa0-f52.google.com with SMTP id dc16so4664362qab.39
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Nov 2014 09:24:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=4GZCH1CCHKrkd9FJ7uM3bA1jeg3aYjtlf+r7rSbNWyU=;
	b=Afyi+4j9UuLo8CSkuWvKoXnCoDNlLryxSR1WcwjSz9eSkLoT/OkE6KMxpcFlFeiRxu
	0m9NgcHCuPhAAQVgWaJU/s+siQTwrJcotthsvvntIBNHQ0l01EekAgTRfwfEYm+5XLFp
	3CIm3iyCmKQ8M2rxA6msjFLqzcgCdnSqxJ4tAcEAdmRrC/rUV4MXP3nfRY2ovy0UQqQW
	CS9KJeAjYtIDJ28ewTMW4q2mJxXFLavXSnzSoQKMMsnyZyEdeul6jpgTQfpAwEexG1uz
	GRcS7+oxzkNIdHrMXPTRBLef0fxSbAxhcGuu/jQY3LHUCCPc25fyw222u6HDnzYtLv2L
	4c9Q==
X-Gm-Message-State: ALoCoQkJvGjS6dScF54xldI7tmFABcNN1+A1Kr021MOt/ffekfeG97OhLqUsqkA2MYH9oYk0I1cK
X-Received: by 10.224.138.2 with SMTP id y2mr64688864qat.52.1417195443308;
	Fri, 28 Nov 2014 09:24:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Fri, 28 Nov 2014 09:23:43 -0800 (PST)
In-Reply-To: <CAK8F28knQaCCX0uctfEKDg=9eGgw20nZ0j27C-BBkfhdZH=iAw@mail.gmail.com>
References: <1412389675-13389-1-git-send-email-Martin.Jansa@gmail.com>
	<20141004023040.GO25706@jama> <20141024090416.GB2430@jama>
	<CAJTo0LauN8+Qc14WNkuOmQmhrF=2nXzfrM_O560E0gfqMgfLtQ@mail.gmail.com>
	<CALbNGRTJxpctu143L8myaN1yzDdMVUVJhFoH3iznyr8webpgRA@mail.gmail.com>
	<CAK8F28knQaCCX0uctfEKDg=9eGgw20nZ0j27C-BBkfhdZH=iAw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 28 Nov 2014 17:23:43 +0000
Message-ID: <CAJTo0Lb7TcAKd6rkAUMPtgMVSW6pxZ6brFtNCBAVGGbj-Vuvog@mail.gmail.com>
To: Ash Charles <ashcharles@gmail.com>, Armin Kuster <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [WIP][PATCH] systemd: don't move libgudev around, it breaks libgudev-1.0.la
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
X-List-Received-Date: Fri, 28 Nov 2014 17:24:11 -0000
Content-Type: multipart/alternative; boundary=047d7b6709c3f9e2ae0508ee86fa

--047d7b6709c3f9e2ae0508ee86fa
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I can't see why not.  CC'ing Armin, the dizzy maintainer.

On 27 November 2014 at 21:29, Ash Charles <ashcharles@gmail.com> wrote:

> I cherry-picked this patch onto dizzy and it unbroke my build.  Is it
> possible/reasonable for it to be included in dizzy?
> --Ash
>
> On Fri, Oct 31, 2014 at 1:21 AM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
> > On Fri, Oct 24, 2014 at 12:29 PM, Burton, Ross <ross.burton@intel.com>
> wrote:
> >>
> >> On 24 October 2014 10:04, Martin Jansa <martin.jansa@gmail.com> wrote:
> >>>
> >>> Should I resend without WIP tag now when ChenQi confirmed that moving
> >>> libgudev isn't needed?
> >>
> >>
> >> No need, I've merged it into my staging branch already.
> >>
> > This should go into dizzy - right?
> >
> > Andreas
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--047d7b6709c3f9e2ae0508ee86fa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I can&#39;t see why not.=C2=A0 CC&#39;ing Armin, the dizzy=
 maintainer.</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"=
>On 27 November 2014 at 21:29, Ash Charles <span dir=3D"ltr">&lt;<a href=3D=
"mailto:ashcharles@gmail.com" target=3D"_blank">ashcharles@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">I cherry-picked this patc=
h onto dizzy and it unbroke my build.=C2=A0 Is it<br>
possible/reasonable for it to be included in dizzy?<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--Ash<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
On Fri, Oct 31, 2014 at 1:21 AM, Andreas M=C3=BCller<br>
&lt;<a href=3D"mailto:schnitzeltony@googlemail.com">schnitzeltony@googlemai=
l.com</a>&gt; wrote:<br>
&gt; On Fri, Oct 24, 2014 at 12:29 PM, Burton, Ross &lt;<a href=3D"mailto:r=
oss.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On 24 October 2014 10:04, Martin Jansa &lt;<a href=3D"mailto:marti=
n.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Should I resend without WIP tag now when ChenQi confirmed that=
 moving<br>
&gt;&gt;&gt; libgudev isn&#39;t needed?<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; No need, I&#39;ve merged it into my staging branch already.<br>
&gt;&gt;<br>
&gt; This should go into dizzy - right?<br>
&gt;<br>
&gt; Andreas<br>
</div></div><div class=3D"HOEnZb"><div class=3D"h5">&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/ope=
nembedded-core</a><br>
</div></div></blockquote></div><br></div>

--047d7b6709c3f9e2ae0508ee86fa--

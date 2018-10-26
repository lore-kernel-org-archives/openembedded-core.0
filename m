Return-Path: <alan.kozlay@ves.solutions>
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 75182744AE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Oct 2018 19:43:08 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id 32-v6so1007916pgu.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Oct 2018 12:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ves-solutions-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=FnlrmtjQuDuNckBXyfCsA5Y/f5soNZQhUfnhy4NTQGA=;
	b=UHZkl14uqo7anIhMo1UhKgj2zlHNYf6bk40Aqn9QjauwUTGystePCsracBkc24eodN
	vxAGwupPyJUO+UyJd3USvicnjhRBSzWjKPpkrDRITQFu805pAxWIyArLHgps5mIqUKJz
	Zb7l+bXl6Em7WHXhvg5Yo8TExSF3rnZOIbnl27BZlaYu7JnXDCL8Tj0xXOn+iWA/CZQz
	aQ96+D79CE9gY3D52KnWNf4snaZNngqjS32DCMDZ388oeA4aWtnmq/OXAsfC7nFid2WY
	6rIQztAbsXVEJt8NE0WauAM/E7mdc50o9FhN4Rzspr7e/Ep6isLCib+Zw+/5SZPigdQR
	Z6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=FnlrmtjQuDuNckBXyfCsA5Y/f5soNZQhUfnhy4NTQGA=;
	b=npKHZl8tZKWktXthrsJCYLrjrUY0aLmBaJ8yu6Ow46wl550c3ix7wxS4pEXXA0HVAH
	XpA6U/pIgqlSW5usa+s5O7XrI1qnApAoFAgAxqrEwy8nMuxIDZweyyejus9ooKgj9GOK
	P0OyoLrQBZK0WgyUWusjaJirgy5nNbmsZouIdCh1FRs/YdoRBNvMoyE1hzdMC9JJsXcg
	jb4Mmj0ca4QnT0b4cWnEix3CQk5UdyxKx/OTVVxF1SgaJCSQe+tJqZcBfSkO0cGy1D1Q
	RQYqVDFtYigok5bA6cEcBOiFxB6dwjHkfEpwVpxwyQF1NUQm8SvsvD01FCSESEqCl0ef
	3ccw==
X-Gm-Message-State: AGRZ1gJFFHatcNkCQeiCeLJKE/3j/aIuZZT2JQi0WfPd8DSnK4bbc8Jy
	0Z41/DV4JCeAYVBaX37hkxL6ELZ89HXTrwa5hk9mFAXx/zA=
X-Google-Smtp-Source: AJdET5fksja1lvlaStx5rLQrOfKpk+4FLyKxq/oQ57RCP/k5Xs6x+EvnhUnNaW4C6IrnJF9ebggMReHAWrcs+nx8Gl0=
X-Received: by 2002:a62:564e:: with SMTP id
	k75-v6mr5081009pfb.33.1540582989075; 
	Fri, 26 Oct 2018 12:43:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAJE9sGmRD4VtDKfcrBzpLNC5LZF7O1z3sOzvaHXo3PKzXTed9w@mail.gmail.com>
In-Reply-To: <CAJE9sGmRD4VtDKfcrBzpLNC5LZF7O1z3sOzvaHXo3PKzXTed9w@mail.gmail.com>
From: Alan Kozlay <alan.kozlay@ves-solutions.com>
Date: Fri, 26 Oct 2018 15:42:32 -0400
Message-ID: <CAJE9sG=atK1Dpk7FS=NMFtbXfrR2UD7oOCSHb4X91q1Z7OOaNg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: disabling the whitelist
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
X-List-Received-Date: Fri, 26 Oct 2018 19:43:08 -0000
Content-Type: multipart/alternative; boundary="000000000000cfa992057926ede9"

--000000000000cfa992057926ede9
Content-Type: text/plain; charset="UTF-8"

Community,

My apologies.  Please ignore my last post "Disabling the whitelist".
That was in reference to a feature that OE apparently rejected (in 2015)
but was adopted into WRLinux, which is what I'm working with.

-Alan


On Fri, Oct 26, 2018 at 3:11 PM Alan Kozlay <alan.kozlay@ves-solutions.com>
wrote:

> Community,
>
> We have a whitelist for packages in place and whitelist.bbclass works as
> expected.  But is there a simple mechanism that can be employed in
> local.conf to disable it, when needed?
>
> To be clear, we don't want it disabled all of the time, but it would help
> to have a simple line in local.conf disabled it, during development.
>
> Any ideas?
>
> -Alan
>
> --
> Alan Kozlay
> VES Solutions, LLC
> Alan Kozlay <alan.kozlay@ves.solutions>
> DESK 443-595-7734
> CELL 443-752-0323
>


-- 
Alan Kozlay
VES Solutions, LLC
Alan Kozlay <alan.kozlay@ves.solutions>
DESK 443-595-7734
CELL 443-752-0323

--000000000000cfa992057926ede9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Community,<input name=3D"virtru-metadata" type=3D"hidden" =
value=3D"{&quot;email-policy&quot;:{&quot;state&quot;:&quot;closed&quot;,&q=
uot;expirationUnit&quot;:&quot;days&quot;,&quot;disableCopyPaste&quot;:fals=
e,&quot;disablePrint&quot;:false,&quot;disableForwarding&quot;:false,&quot;=
enableNoauth&quot;:false,&quot;expires&quot;:false,&quot;isManaged&quot;:fa=
lse},&quot;attachments&quot;:{},&quot;compose-id&quot;:&quot;5&quot;,&quot;=
compose-window&quot;:{&quot;secure&quot;:false}}"><div><br></div><div>My ap=
ologies.=C2=A0 Please ignore my last post &quot;Disabling the whitelist&quo=
t;.</div><div>That was in reference to a feature that OE apparently rejecte=
d (in 2015) but was adopted into WRLinux, which is what I&#39;m working wit=
h.</div><div><br></div><div>-Alan</div><div><br></div><br><div class=3D"gma=
il_quote" style=3D""><div dir=3D"ltr">On Fri, Oct 26, 2018 at 3:11 PM Alan =
Kozlay &lt;<a href=3D"mailto:alan.kozlay@ves-solutions.com">alan.kozlay@ves=
-solutions.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div =
dir=3D"ltr">Community,<br clear=3D"all"><div><br></div><div>We have a white=
list for packages in place and whitelist.bbclass works as expected.=C2=A0 B=
ut is there a simple mechanism that can be employed in local.conf to disabl=
e it, when needed?</div><div><br></div><div>To be clear, we don&#39;t want =
it disabled all of the time, but it would help to have a simple line in loc=
al.conf disabled it, during development.</div><div><br></div><div>Any ideas=
?</div><div><br></div><div>-Alan</div><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"m_3288865074387481365gmail_signature" data-smartmail=3D"gmail_si=
gnature"><div dir=3D"ltr"><div><div dir=3D"ltr"><span><div><div dir=3D"ltr"=
><div><div>Alan Kozlay<br></div><div dir=3D"ltr">VES Solutions, LLC<br><spa=
n>Alan Kozlay &lt;alan.kozlay@ves.solutions&gt;</span><div>DESK 443-595-773=
4<br></div><div>CELL 443-752-0323</div></div></div></div></div></span></div=
></div></div></div></div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"l=
tr"><div><div dir=3D"ltr"><span><div><div dir=3D"ltr"><div><div>Alan Kozlay=
<br></div><div dir=3D"ltr">VES Solutions, LLC<br><span>Alan Kozlay &lt;alan=
.kozlay@ves.solutions&gt;</span><div>DESK 443-595-7734<br></div><div>CELL 4=
43-752-0323</div></div></div></div></div></span></div></div></div></div></d=
iv>

--000000000000cfa992057926ede9--

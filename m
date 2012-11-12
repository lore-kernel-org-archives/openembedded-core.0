Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <alexandru.damian@intel.com>) id 1TXxN5-0000mk-R3
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Nov 2012 18:00:28 +0100
Received: from mail-ie0-f197.google.com ([209.85.223.197])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 12 Nov 2012 08:46:33 -0800
Received: by mail-ie0-f197.google.com with SMTP id 9so18259612iec.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Nov 2012 08:46:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=07UGXoaR2WisBywNjY/2idXCK5kmgBWZwprG0SE5ASs=;
	b=MdbDpo4aW58EigwG1tqDtXDcHs6NMH8UlqxVgVYD+wgj1pbCcVkpq/wSeq1HOO+YEQ
	aPB+CHRpVz78PSQIoe15MjYGV58Av2SNCCf1G3jwqtihke9w4LYr+lGW0fhAhSZf0vNv
	NMnxr7YaI3doRVRtX+ItW/NLTZIP3eQzmx9Fn0oZh4BFxvLedwXYL7G0G9gHvxdwmz3k
	hDw28f9N5mCPTt7KFCRC44S12kH22RDxU8SM9ZWkuhUUWQJuTbe2L7RzFHV0bxFmgQa9
	ujkzfNTbGQTKusO3sz+9a2KTiatUw84rQmgSGRWcffaFBljrXWW1Fwy9oiyRbjtpQJp/
	D2gw==
Received: by 10.50.184.229 with SMTP id ex5mr8508269igc.72.1352738792552;
	Mon, 12 Nov 2012 08:46:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.184.229 with SMTP id ex5mr8508263igc.72.1352738792414; Mon,
	12 Nov 2012 08:46:32 -0800 (PST)
Received: by 10.64.49.164 with HTTP; Mon, 12 Nov 2012 08:46:32 -0800 (PST)
In-Reply-To: <CAJTo0LZrxU2mparU6upANr_O9SkFJoE+YVNtOy8i7EuLnaCv2A@mail.gmail.com>
References: <1351780335-12617-1-git-send-email-alexandru.damian@intel.com>
	<1351798319.6502.19.camel@ted>
	<CAJ2CSBsLk0HC8Lx0ptTzBPY1EVKan5o+wb9AbHcGy4vORcu6JA@mail.gmail.com>
	<CAJ2CSBvFvXXk93A8or4M6vmGo==h0F+VOR8-FVAFP9jYs8FS1w@mail.gmail.com>
	<CAJ2CSBuAx4AuUFCKVHsCjDvFuhGkQyOi-jAkuhCD9e4mgMm47w@mail.gmail.com>
	<CAP9ODKrtmGBg2gHx2=SqjRBVH3AwQtBkGFe-jsuTLQb+RmT=4g@mail.gmail.com>
	<CAJTo0LZrxU2mparU6upANr_O9SkFJoE+YVNtOy8i7EuLnaCv2A@mail.gmail.com>
Date: Mon, 12 Nov 2012 18:46:32 +0200
Message-ID: <CAJ2CSBsM8QokMedca2OFfrHsRfNdK7hAAX=1eLEoFMWJNK+bGw@mail.gmail.com>
From: "Damian, Alexandru" <alexandru.damian@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkVJAjtbGQgRv2aw1G2hboxN5fIwkl1ezpfvvaslouh2VVs8kCch55tTQA3HRm1y71Cq51uN0t80uP6+gvQNTkQ2tnN2iuzORvydxsFpfYgvIGTfI/E6GoaNrM0LPN+FFttXhECTu7uhMiwm+p6YfcmlB24CADpL1Az8ReJqyhUXAoN/G7DohXXoG+/zBkn83vrYUhs
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] initrdscripts: fix udevd path
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Nov 2012 17:00:28 -0000
Content-Type: multipart/alternative; boundary=14dae9340ddf321f6104ce4f0ba5

--14dae9340ddf321f6104ce4f0ba5
Content-Type: text/plain; charset=ISO-8859-1

I'm working on it now. Expect the patches shortly.

Alex


On Mon, Nov 12, 2012 at 6:13 PM, Burton, Ross <ross.burton@intel.com> wrote:

> On 7 November 2012 00:01, Otavio Salvador <otavio@ossystems.com.br> wrote:
> > Please split the patch in two: one fixing udevd and another with new
> > features; please tag it properly  as v3 so it is easy to spoit it.
>
> Alex - ping?
>
> Ross
> ---------------------------------------------------------------------
> Intel Corporation (UK) Limited
> Registered No. 1134945 (England)
> Registered Office: Pipers Way, Swindon SN3 1RJ
> VAT No: 860 2173 47
>
> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). Any review or distribution
> by others is strictly prohibited. If you are not the intended
> recipient, please contact the sender and delete all copies.
>

--14dae9340ddf321f6104ce4f0ba5
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><div>I&#39;m working on it now. Expect the patches shortly.</div><div><=
br></div><div>Alex</div><div class=3D"gmail_extra"><br><br><div class=3D"gm=
ail_quote">On Mon, Nov 12, 2012 at 6:13 PM, Burton, Ross <span dir=3D"ltr">=
&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@=
intel.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 7 November 2012 00:01, =
Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.br">otavio@ossys=
tems.com.br</a>&gt; wrote:<br>

&gt; Please split the patch in two: one fixing udevd and another with new<b=
r>
&gt; features; please tag it properly =A0as v3 so it is easy to spoit it.<b=
r>
<br>
</div>Alex - ping?<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Ross<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5">---------------------=
------------------------------------------------<br>
Intel Corporation (UK) Limited<br>
Registered No. 1134945 (England)<br>
Registered Office: Pipers Way, Swindon SN3 1RJ<br>
VAT No: 860 2173 47<br>
<br>
This e-mail and any attachments may contain confidential material for<br>
the sole use of the intended recipient(s). Any review or distribution<br>
by others is strictly prohibited. If you are not the intended<br>
recipient, please contact the sender and delete all copies.<br>
</div></div></blockquote></div><br></div>

--14dae9340ddf321f6104ce4f0ba5--

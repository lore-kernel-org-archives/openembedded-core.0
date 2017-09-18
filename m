Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id AD7BC77D6D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 19:19:35 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id i197so4694392ioe.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 12:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PPHR/tnr/dROUZfkfWpP2anZCY2f18iwMIeByyavpN4=;
	b=Haa+6JBPqpZOA6fw6w9Y1ei2khhpoNTR/8JDVKK1cDcwIfceKBjl/Lkt0QnLHG+Dfc
	ABF8Z7rq/wtVoHkfb70Lb+1qQKV9SI9x09WPNIjLeKhuvKqOCau+k8IwqvfGw+tMDaQP
	k+kIhRHFV+r0z6qOAy4kmLnPcdnkRRx+MiraJg5JsZynSnZvYZTkMBKE+VngaDVUdbqX
	A4jQWqeuAVA4D7OkUOghXGKgeIgMr7pJGK1Aa6oCq2dfMnVaa34SiHU4AOtCdWeOkpNM
	bAgu1w7hfteEVgHuqzD3nnmAmbkCSKbr89XM00vaVybcXznVRl786fU8rn66fZzpFQj5
	sRGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PPHR/tnr/dROUZfkfWpP2anZCY2f18iwMIeByyavpN4=;
	b=Sm6TeSqXVpLGklRAV9tfv57G33NTix/YDOyXK5dx7ASRp7uYdawu37KvCaBI3ihn1n
	KqvFNA2bMqKPn5pWyRjZXPA0h2ZE4p7MSCfsbTr9bQdU4pa8Fip7AEY8AXPSMxCl7mi2
	wDLDRL4eawU0jaQYuXB6av/7VNVrk+SZLsduiEvNKSd3FbAXwwGWLQWN6pM5rzX75Na/
	2VwL2FjVSfGFQoILfPA0raWT+tpdOXgnSwpqCa2Rd3lEqxHywrGEdx4KgpXs0a/vxZe8
	3lSYLuShjgq75+1C9tf/3+8W5bFBW5+1rEz3yAKmmQ6jxpHdHmJHz2gblcquaK9NmCFp
	SbOA==
X-Gm-Message-State: AHPjjUhSuyrgyLVm25/0jukBrCtUjCIO8A4XzO7bZZ13Grqw54gbM92k
	J7lNgNtTr//LB96ORd0rI7nZPWxERqlXdPSWKxyd3g==
X-Google-Smtp-Source: AOwi7QC3CVahqJmXlUfGLIuriOFlAGDwfrBC7GrwriyZXfGgW4ebAY5G8YKQMHUi7HxcNdl64bv9sf+PYSuDtPZIyLU=
X-Received: by 10.107.135.72 with SMTP id j69mr22580984iod.210.1505762376737; 
	Mon, 18 Sep 2017 12:19:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Mon, 18 Sep 2017 12:19:16 -0700 (PDT)
In-Reply-To: <CAJ86T=X5xAtSL4bK9tGLxrdxqtNh6ewG0n8rLfeiewL=cWA6xA@mail.gmail.com>
References: <1505723966-17120-1-git-send-email-mike.looijmans@topic.nl>
	<da35387ee5e44bd0a4248c41b79d1512@XBOX02.axis.com>
	<660382f7-55b7-39cc-ae2a-afab46301b3c@topic.nl>
	<CAJTo0LY=JnUkd7XMvkpNppc2drcSB8AF9dj_CyxHJRjixZ1uFA@mail.gmail.com>
	<1505743634-13500-1-git-send-email-mike.looijmans@topic.nl>
	<a6389819751745fb864af89806f86b5d@XBOX02.axis.com>
	<CAJTo0LaZo2Jhh7Jj=RAUzOzXq_FcXnobu-idL7RFnbq84iR_VA@mail.gmail.com>
	<CAJ86T=UqdDrT2ApxMiM=g__pTftCc5g0-gzs20vd-jV06+6x7w@mail.gmail.com>
	<CAJTo0LZrPSoVNAX6onFFsGgkD1LEm=2DLdBOecnhNEQBRDnS6A@mail.gmail.com>
	<CAJ86T=X5xAtSL4bK9tGLxrdxqtNh6ewG0n8rLfeiewL=cWA6xA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Sep 2017 20:19:16 +0100
Message-ID: <CAJTo0Lag_GCyfHCcEnNbfLOXSB+qyDhQHxUkdTF5RacgfxQEWg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base-files: profile: Get rid of "resize"
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
X-List-Received-Date: Mon, 18 Sep 2017 19:19:35 -0000
Content-Type: multipart/alternative; boundary="001a113f8e7095030805597b9fe6"

--001a113f8e7095030805597b9fe6
Content-Type: text/plain; charset="UTF-8"

On 18 September 2017 at 20:01, Andre McCurdy <armccurdy@gmail.com> wrote:

> > The question is does it do something useful *now*?
>
> I don't have a board with a serial console to test at the moment.
> Busybox hasn't changed in recent memory though, so as long as the
> resize command does actually get run I presume it's still going to
> work.
>

Re-read the code.  There's a call to ioctl with TIOCSWINSZ which I'm
*guessing* is set window size.  Google is not useful for this!  It does all
this on stderr.

So yes it *should* work, but not if you redirect stderr to /dev/null.

Yes, this is a mess. :)

Ross

--001a113f8e7095030805597b9fe6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 18 September 2017 at 20:01, Andre McCurdy <span dir=3D"=
ltr">&lt;<a href=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy=
@gmail.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:r=
gb(204,204,204);padding-left:1ex"><div class=3D"gmail-HOEnZb"><div class=3D=
"gmail-h5">&gt; The question is does it do something useful *now*?<br>
<br>
</div></div>I don&#39;t have a board with a serial console to test at the m=
oment.<br>
Busybox hasn&#39;t changed in recent memory though, so as long as the<br>
resize command does actually get run I presume it&#39;s still going to<br>
work.<br></blockquote><div><br></div><div>Re-read the code.=C2=A0 There&#39=
;s a call to ioctl with=C2=A0<span style=3D"color:rgb(0,0,0);font-size:13.3=
33333015441895px">TIOCSWINSZ which I&#39;m *guessing* is set window size.=
=C2=A0 Google is not useful for this!=C2=A0 It does all this on stderr.</sp=
an></div><div><span style=3D"color:rgb(0,0,0);font-size:13.333333015441895p=
x"><br></span></div><div><span style=3D"color:rgb(0,0,0);font-size:13.33333=
3015441895px">So yes it *should* work, but not if you redirect stderr to /d=
ev/null.</span></div><div><span style=3D"color:rgb(0,0,0);font-size:13.3333=
33015441895px"><br></span></div><div><span style=3D"color:rgb(0,0,0);font-s=
ize:13.333333015441895px">Yes, this is a mess. :)</span></div><div><span st=
yle=3D"color:rgb(0,0,0);font-size:13.333333015441895px"><br></span></div><d=
iv><span style=3D"color:rgb(0,0,0);font-size:13.333333015441895px">Ross</sp=
an></div></div></div></div>

--001a113f8e7095030805597b9fe6--

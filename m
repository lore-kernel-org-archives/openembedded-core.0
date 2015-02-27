Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id C4C9273689
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 16:07:39 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id f51so7108604qge.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 08:07:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=vJ481sJHS+c/JHY+P/9DIJt2XKLSS7M84SnLCkDRQcU=;
	b=daPzubExqFrGRxg17hAWEfAGv3Kpp48vYBPDJnD7fnaBf3eSeH+63XkFkK/iVkgJ5J
	dehGWSlCpF7jivNsKpJi37EFHaY0pHgJhVsiHIaGjJHSCDjKMXbfTI5ZzgI+VKLuqLvK
	T0qe26zXCtH9vGAvi89LQMhDvdNZ5ql7d9ySKN/STC3wrGfV8o+jsQxww+H48aXwhrHE
	Nc7Pe+gBG+Nxa224AsLFeOCAkGXsLWy83JB2g7/MjQnDNCxBQsYbdE0RHkIdcbmevIVm
	lmyYRfmMcB8DwXYj44TlXwkJDFYAxQ/B5cLJQwDTZjMbxcNNeBhSZBdl71nOUxpAJPRB
	TIlg==
X-Gm-Message-State: ALoCoQnKjacGb9PtGD1dh5trdzfbfC7M2673QTaQ7YXUYaLZVVMqLSSU6iCGpEL4FjJqJAXihmCZ
X-Received: by 10.140.232.3 with SMTP id d3mr30590766qhc.82.1425053261050;
	Fri, 27 Feb 2015 08:07:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Fri, 27 Feb 2015 08:07:20 -0800 (PST)
In-Reply-To: <54F0756E.7020205@urbanec.net>
References: <cover.1424210642.git.alejandro.hernandez@linux.intel.com>
	<54F0756E.7020205@urbanec.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 27 Feb 2015 16:07:20 +0000
Message-ID: <CAJTo0LbPVzhW9C7e3-2J45Yc5HiTEsby=c95PuaCRhF+bV01tQ@mail.gmail.com>
To: Peter Urbanec <openembedded-devel@urbanec.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/1] Python: Upgrade from 2.7.3 to 2.7.9
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
X-List-Received-Date: Fri, 27 Feb 2015 16:07:46 -0000
Content-Type: multipart/alternative; boundary=001a11c128b0695e3b0510141188

--001a11c128b0695e3b0510141188
Content-Type: text/plain; charset=UTF-8

On 27 February 2015 at 13:47, Peter Urbanec <openembedded-devel@urbanec.net>
wrote:

> I think it may be a good idea to keep python 2.7.3 packages in oe-core
> because a move from 2.7.3 to 2.7.9 is likely to break some systems. At
> least in terms of item 1, we have a large potential for breakage, since the
> SSL cert checking will break anything that uses self-signed SSL certs for
> HTTPS without deploying the correct CA to the client systems. As far as I
> can tell, there is no system wide override for this behaviour.


IIRC the general argument is if that if you're assuming a self-signed
certification is valid, you've lost so much security.  We're in the middle
of a development cycle so this will only impact people using or moving to
1.8.

I've just verified that python-imaging works for me (and works on the
autobuilders), so if you can replicate the failure on demand that filing a
bug would be useful.

Ross

--001a11c128b0695e3b0510141188
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 February 2015 at 13:47, Peter Urbanec <span dir=3D"ltr">&lt;<a href=
=3D"mailto:openembedded-devel@urbanec.net" target=3D"_blank">openembedded-d=
evel@urbanec.net</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">I =
think it may be a good idea to keep python 2.7.3 packages in oe-core becaus=
e a move from 2.7.3 to 2.7.9 is likely to break some systems. At least in t=
erms of item 1, we have a large potential for breakage, since the SSL cert =
checking will break anything that uses self-signed SSL certs for HTTPS with=
out deploying the correct CA to the client systems. As far as I can tell, t=
here is no system wide override for this behaviour.</blockquote><div><br></=
div><div>IIRC the general argument is if that if you&#39;re assuming a self=
-signed certification is valid, you&#39;ve lost so much security.=C2=A0 We&=
#39;re in the middle of a development cycle so this will only impact people=
 using or moving to 1.8.</div><div><br></div><div>I&#39;ve just verified th=
at python-imaging works for me (and works on the autobuilders), so if you c=
an replicate the failure on demand that filing a bug would be useful.</div>=
<div><br></div><div>Ross</div></div></div></div>

--001a11c128b0695e3b0510141188--

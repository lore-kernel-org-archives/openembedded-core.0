Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4B813771C5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 14:17:44 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id 9so183539343iom.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 06:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aMsf0YVvT7EsHv8BGesM244B7Ppe4UgyXZRBU9WalC0=;
	b=YTlXlcn0aWftxwmApUtVIClPiGP8VM4L8RaLAA5cV8U0QgfppmzfZP8J4rwdcaAxqa
	ekLD+/26VjyKDxwz9JAA1JD6Xw/Htyy3aXbuEHH+lYgghoFjiWx93bRZZGIisTzO+3MP
	RBvw6XVbBtzHALhX9ZkrXVbeBwW2FeOM9XfoUoikt576JfZGO5nEuNK3FQpz5iHLK4K+
	VKM38THyLpjZfw0RD5dEi0ldjKuh9JMNl9dSsnRSQ1SKUP3qkHVoKkjd7p+/pnP+MFGw
	hUMu8ZX/BETX8dzQkNtDOweo7CKPSZmE8Rp+9cGMnzplEyhi7mqbKJeI+ywUNRWX7Xap
	yPHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aMsf0YVvT7EsHv8BGesM244B7Ppe4UgyXZRBU9WalC0=;
	b=ej8ABiHAzUQZcJEwrXajri1TcVUy4VeNDklavWIf8L+nuq9rnbTSz9olbAuXdgSblj
	2h+bfEEdlPb7qtyXjSWHX4X0/ATcKdmGQNkXorh1Krmw6gww1CRCgLaP+5oIGjd7f6Z9
	y1n2+O+uh/a8CX2/laCX9byJiQvc0SSQXde01px0qmzuFOqNYmj4BZFV4DqKULPJrfku
	0JzPpTk/T3Ikh3e4/sUSdjueAXZplWeOq9jNHoL6svVU8ZyLEOIF3bNYhHZoR32KVoNo
	L3l9vBR5LV8BQsg+2SM7bVX4yJgqypSJ72hXO+UBnjsZQX2GFdHhtlLisiCPX9gDFcli
	IagA==
X-Gm-Message-State: AG10YOSKuMwz3Dp8HCYWjvNL5Z940In9JJ/S3dXtAJrpus3Gw2D5KKm4JResJ6dTX7/btqR3ukMuTi/h29ZVMhud
X-Received: by 10.107.164.15 with SMTP id n15mr17731762ioe.148.1456755465683; 
	Mon, 29 Feb 2016 06:17:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 29 Feb 2016 06:17:26 -0800 (PST)
In-Reply-To: <20160226081455.GH6210@loska>
References: <cover.1456327117.git.mariano.lopez@linux.intel.com>
	<20160225121421.GB6210@loska> <20160225122912.GC6210@loska>
	<20160225132748.GD6210@loska> <20160225140942.GE6210@loska>
	<20160226081455.GH6210@loska>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Feb 2016 14:17:26 +0000
Message-ID: <CAJTo0LYAD76f7qOjAhyZF3NAgBo79ewUGKOT=8REWrnSK+cw7Q@mail.gmail.com>
To: Mikko.Rapeli@bmw.de
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Add initial capability to check CVEs for recipes
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
X-List-Received-Date: Mon, 29 Feb 2016 14:17:45 -0000
Content-Type: multipart/alternative; boundary=001a113776820ea870052ce9503d

--001a113776820ea870052ce9503d
Content-Type: text/plain; charset=UTF-8

On 26 February 2016 at 08:14, <Mikko.Rapeli@bmw.de> wrote:

> 17:45:37  *** 0013:        with open(patch_file, "r") as f:
> 17:45:37      0014:            patch_text = f.read()
> 17:45:37      0015:
> 17:45:37      0016:        # Search for the "CVE: " line
> 17:45:37      0017:        match = cve_match.search(patch_text)
> 17:45:37 Exception: IOError: [Errno 2] No such file or directory:
> '/home/builder/src/base/build/tmp/work/corei7-64-linux/mailx/12.5-r2/heirloom-mailx_12.5-1.diff'
> 17:45:37
> 17:45:37 ERROR: Function failed: do_cve_check
>
> So could this be caused by cve-check changes or is this just a side effect
> of some other recipe problems?
>

Do you have rm_work enabled?

Ross

--001a113776820ea870052ce9503d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 February 2016 at 08:14,  <span dir=3D"ltr">&lt;<a href=3D"mailto:Mikk=
o.Rapeli@bmw.de" target=3D"_blank">Mikko.Rapeli@bmw.de</a>&gt;</span> wrote=
:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><div id=3D":3o9" class=3D"a3s" style=3D=
"overflow:hidden">17:45:37=C2=A0 *** 0013:=C2=A0 =C2=A0 =C2=A0 =C2=A0 with =
open(patch_file, &quot;r&quot;) as f:<br>
17:45:37=C2=A0 =C2=A0 =C2=A0 0014:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 patch_text =3D f.read()<br>
17:45:37=C2=A0 =C2=A0 =C2=A0 0015:<br>
17:45:37=C2=A0 =C2=A0 =C2=A0 0016:=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Search for =
the &quot;<span class=3D"il">CVE</span>: &quot; line<br>
17:45:37=C2=A0 =C2=A0 =C2=A0 0017:=C2=A0 =C2=A0 =C2=A0 =C2=A0 match =3D cve=
_match.search(patch_text)<br>
17:45:37 Exception: IOError: [Errno 2] No such file or directory: &#39;/hom=
e/builder/src/base/build/tmp/work/corei7-64-linux/mailx/12.5-r2/heirloom-ma=
ilx_12.5-1.diff&#39;<br>
17:45:37<br>
17:45:37 ERROR: Function failed: do_cve_check<br>
<br>
So could this be caused by <span class=3D"il">cve</span>-check changes or i=
s this just a side effect<br>
of some other recipe problems?</div></blockquote></div><br>Do you have rm_w=
ork enabled?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra">Ross</div></div>

--001a113776820ea870052ce9503d--

Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 7768371AD4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 09:33:36 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id m36so120219846qtb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 02:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8fWKCScu50PB7qTK9427A7VKQxlMzsgzGUfsnRMRiGM=;
	b=iQ5LeiJiMnk1nTBda2eP1ZFTwfT3kUsHNTXHVXCro1dlnTYgFTudbgCZqRtOamDX68
	Bou+LPKoB1Mndqh/+mCheI+H2jlrvYlg4Yjyb0yMpncDrjomIEGmnMBy4a1uC47EG9qf
	yHbUnLCeD6tEQYYaTnt0XXsbm+XJlgzmkXeJUiLR9SU7GbZ/e9y3p0sYNimX3R+mTCt3
	rRnvVKUj7I5qprRFSD8QPq7yNG1rBXT4FxDqlA603E8LCVksmBCBIH78HeX6YuhHwkvv
	8R6OOsapQi7rqIcf+PLT8q69WIl0+5E7I691K2I7KzyBmoa7XB0fA2zJSkG2LZZ12Kr5
	b6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8fWKCScu50PB7qTK9427A7VKQxlMzsgzGUfsnRMRiGM=;
	b=fSZv9j6lh+ejjp3Z18VPQgtrnz7U82W0l2jc5V5cXZXDeNFSTO3fV6tjaVUxXdJ6Bp
	WElHUf6EJAC1mzRs126TTc0ZQtRgwW21ZSP72lSfOvVP2pv9IOgofk6UwLX2j2SnLmox
	ybG5XJ+bFSWRZd3+8NtHeTAdnyQ26W3JEB44/2Bb8gkA255R8ee7cqh+qrjXhAwhjlWK
	5UaK7KxLuW8///vM3B7c+5QlyoDbuzMjVps2SQ1oqB3i/reTfxMdv7JJBZxhVl7XFv1e
	W3mQqFfHb0LC3BMQyVM6SP78mmrBFxTcbmaPdbJo3ugWgA6rwj2vVAFMni4WLerrhNHA
	u0JA==
X-Gm-Message-State: AN3rC/5vkuBPZf/wKv+FVhwPC+NaANdg5dBDRll0ApbcFan3dBoFCSEi
	DA2T415Phl0gg/Su2OiI4znT1227a2Mv8sU=
X-Received: by 10.200.34.162 with SMTP id f31mr13719712qta.65.1492508017391;
	Tue, 18 Apr 2017 02:33:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Tue, 18 Apr 2017 02:33:16 -0700 (PDT)
In-Reply-To: <1492505071.7102.5.camel@linux.intel.com>
References: <20170413083344.22737-1-dmitry.rozhkov@linux.intel.com>
	<85c346c4-f6d6-c853-bfc5-0daa64ea2db8@linux.intel.com>
	<CAJTo0LYA8nsexqtfwz4bbOYA1HtnRDxCcKGZE8Jz+m+=tOcTdA@mail.gmail.com>
	<1492505071.7102.5.camel@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 18 Apr 2017 10:33:16 +0100
Message-ID: <CAJTo0LaX+ONYjsEx9ixF+R5V2X64_BLHVk2F0FRPcmAm5KbNLw@mail.gmail.com>
To: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python: make python2 and python3 alternatives to python
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
X-List-Received-Date: Tue, 18 Apr 2017 09:33:37 -0000
Content-Type: multipart/alternative; boundary=001a114027ec3390a4054d6d9a84

--001a114027ec3390a4054d6d9a84
Content-Type: text/plain; charset=UTF-8

On 18 April 2017 at 09:44, Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
wrote:

> I've just checked PEP-349. It recommends that
>
> "- The more general python command should be installed whenever any
> version of Python 2 is installed and should invoke the same version of
> Python as the python2 command (however, note that some distributions
> have already chosen to have python implement the python3 command; see
> the Rationale and Migration Notes below)."
>
> The proposed patch doesn't violate this recommendation, because
> "whenever" Python 2 is installed the python command still invokes
> python2.
>

Only out of the box: you can install py2 and py3 and set the alternatives
so that python is python3.

If I understood correctly OE-core is not a distribution, but a tool to
> create "a custom one". I would rather allow people to create
> distributions where python3 is the default like in Arch Linux.


Personally I feel the PEP is an attempt to limit the damage caused by Arch
ignoring the Python maintainers, and I'd prefer not to spread the
impression that 'python' could be Python 3.  Unless you code incredibly
carefully it's not simple to have a script that doesn't care if it runs
under Py2 or Py3.

Ross

--001a114027ec3390a4054d6d9a84
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 April 2017 at 09:44, Dmitry Rozhkov <span dir=3D"ltr">&lt;<a href=3D"=
mailto:dmitry.rozhkov@linux.intel.com" target=3D"_blank">dmitry.rozhkov@lin=
ux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:soli=
d;border-left-color:rgb(204,204,204);padding-left:1ex"><div id=3D"gmail-:mu=
" class=3D"gmail-a3s gmail-aXjCH gmail-m15b803c4ca69fea5">I&#39;ve just che=
cked PEP-349. It recommends that<br>
<br>
&quot;- The more general python command should be installed whenever any<br=
>
version of Python 2 is installed and should invoke the same version of<br>
Python as the python2 command (however, note that some distributions<br>
have already chosen to have python implement the python3 command; see<br>
the Rationale and Migration Notes below).&quot;<br>
<br>
The proposed patch doesn&#39;t violate this recommendation, because<br>
&quot;whenever&quot; Python 2 is installed the python command still invokes=
<br>
python2.<br></div></blockquote></div><br>Only out of the box: you can insta=
ll py2 and py3 and set the alternatives so that python is python3.</div><di=
v class=3D"gmail_extra"><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
border-left-color:rgb(204,204,204);padding-left:1ex"><span style=3D"font-si=
ze:12.800000190734863px">If I understood correctly OE-core is not a distrib=
ution, but a tool to<br></span><span style=3D"font-size:12.800000190734863p=
x">create &quot;a custom one&quot;. I would rather allow people to create<b=
r></span><span style=3D"font-size:12.800000190734863px">distributions where=
 python3 is the default like in Arch Linux.</span></blockquote><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Personally I feel the=
 PEP is an attempt to limit the damage caused by Arch ignoring the Python m=
aintainers, and I&#39;d prefer not to spread the impression that &#39;pytho=
n&#39; could be Python 3.=C2=A0 Unless you code incredibly carefully it&#39=
;s not simple to have a script that doesn&#39;t care if it runs under Py2 o=
r Py3.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"=
>Ross</div></div>

--001a114027ec3390a4054d6d9a84--

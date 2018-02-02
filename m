Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id C31087857A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Feb 2018 20:58:55 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id z6so24290426iob.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Feb 2018 12:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0Zsh5wK+Ty/n1SppomngYeX1q3XTvHLWBWOPzSJFoo0=;
	b=Dav0fSBIaskdvyFM/q5RQOes4g1iiQaVBWbNsxO6pMv/mFAMVM8XLrsXzSn9r8bxja
	TuTV978Ovj18TH3wTQIFpfzqrAluAtGaEdUgh3Vr3rOjcNXudojo/hY/Doptm/wWf/Z3
	sGuAMs1TOr1wf6K7VcNnHqRglOEy4fwPSgWOnj5Mbkx74n8afmfm0ymBYMg5J0oxmPG1
	MClffiETEy0OOlJnp5ILsPgaB7gEMeBlEG3HGSHCIWn03nZg88jnasPi/WsUYWoAzoOl
	e5bw4cKlgtGFndq070l3hhyItuoJF7tYC7UliEs3ZcwPsopyXFaGqO9qUZOXdu0qEcp6
	YfDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0Zsh5wK+Ty/n1SppomngYeX1q3XTvHLWBWOPzSJFoo0=;
	b=WhACI/XXr9DJ+5BtAR/8ovXHu17HMJU7yX05mc+hI5NHQBTysOTVLdAA+gzGXPDx++
	iCAxKM11MNqHnA38yO/JpLJ6npf8C5iAlJDay1oDrEA5sCW8ALNCs0WUeTna6KHmQPvu
	X/9kPlTMVrsJgj67ocV3CzMvV3zReuHfxYzwcRABEj3xnMukcL5me/guslaq7xMVdFUS
	PSKojC7XKWcadZ1dWeLz0iENmQY1PIb7UsNBXyf7jion6M8XefJxdpuvNVz6YCg2Vyrp
	yg8emakPKr/pITRUYRCZ2BCPFcOIuZkPY5yvh7/IudIuhzyowEef4F9W/PAZv6rAwIQo
	w7cg==
X-Gm-Message-State: AKwxyte/2HX3dwoJ6ylkSpX6zuNLFhlYxxBtiVjRH9KHHvE3ZFGLRDon
	J2AsgKM8LJ++lAAUou4118HWEyUSkwMVug4KhfHglA==
X-Google-Smtp-Source: AH8x226sGk52UwKRk1dWJQXRSj7mLtMPRX+TT3q1rMnH00qoOHTRaloyg8Mfq/lbNUyhwP8Axj1u3dG9T/kb12acj4Q=
X-Received: by 10.107.175.8 with SMTP id y8mr44879242ioe.37.1517605137183;
	Fri, 02 Feb 2018 12:58:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Fri, 2 Feb 2018 12:58:36 -0800 (PST)
In-Reply-To: <MWHPR0201MB3401497FB2219F33ADADA13FACF90@MWHPR0201MB3401.namprd02.prod.outlook.com>
References: <1517523029-19272-1-git-send-email-alejandr@xilinx.com>
	<20180201223257.15539.41169@do.openembedded.org>
	<MWHPR0201MB3401497FB2219F33ADADA13FACF90@MWHPR0201MB3401.namprd02.prod.outlook.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 2 Feb 2018 20:58:36 +0000
Message-ID: <CAJTo0LbLxeJEGu=sTpg0uXWNRue7FcFuHMc+qbb1zzDe2QH_cQ@mail.gmail.com>
To: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIG5pbmphOiBVcGdyYWRlIGZyb20gMS43LjIgdG8gbWFqb3IgcmVsZWFzZSAxLjguMiAocmV2Mik=?=
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
X-List-Received-Date: Fri, 02 Feb 2018 20:58:56 -0000
Content-Type: multipart/alternative; boundary="001a1144a2681c88e9056440fb17"

--001a1144a2681c88e9056440fb17
Content-Type: text/plain; charset="UTF-8"

On 2 February 2018 at 19:06, Alejandro Enedino Hernandez Samaniego <
alejandr@xilinx.com> wrote:

> This makes no sense to me, I rebased to master just before sending it.
>

Are you sure that the master you're rebasing is the actual upstream master?

Applying: ninja: Upgrade from 1.7.2 to major release 1.8.2
Using index info to reconstruct a base tree...
error: patch failed: meta/recipes-devtools/ninja/ninja_1.7.2.bb:1
error: meta/recipes-devtools/ninja/ninja_1.7.2.bb: patch does not apply
error: Did you hand edit your patch?
It does not apply to blobs recorded in its index.
Patch failed at 0001 ninja: Upgrade from 1.7.2 to major release 1.8.2

--001a1144a2681c88e9056440fb17
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 2 February 2018 at 19:06, Alejandro Enedino Hernandez S=
amaniego <span dir=3D"ltr">&lt;<a href=3D"mailto:alejandr@xilinx.com" targe=
t=3D"_blank">alejandr@xilinx.com</a>&gt;</span> wrote:<br><div class=3D"gma=
il_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid=
;border-left-color:rgb(204,204,204);padding-left:1ex">This makes no sense t=
o me, I rebased to master just before sending it.<br></blockquote><div><br>=
</div><div>Are you sure that the master you&#39;re rebasing is the actual u=
pstream master?</div><div><br></div><div>Applying: ninja: Upgrade from 1.7.=
2 to major release 1.8.2</div><div>Using index info to reconstruct a base t=
ree...</div><div>error: patch failed: meta/recipes-devtools/ninja/<a href=
=3D"http://ninja_1.7.2.bb:1">ninja_1.7.2.bb:1</a></div><div>error: meta/rec=
ipes-devtools/ninja/<a href=3D"http://ninja_1.7.2.bb">ninja_1.7.2.bb</a>: p=
atch does not apply</div><div>error: Did you hand edit your patch?</div><di=
v>It does not apply to blobs recorded in its index.</div><div>Patch failed =
at 0001 ninja: Upgrade from 1.7.2 to major release 1.8.2</div><div><br></di=
v><div>=C2=A0</div></div></div></div>

--001a1144a2681c88e9056440fb17--

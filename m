Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f171.google.com (mail-qc0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8825865CD0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2015 07:01:21 +0000 (UTC)
Received: by qcbkw5 with SMTP id kw5so630052qcb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2015 00:01:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=gRZpdTMXPGbxonw6/WlHSN7CjR9m/8HY7u3RtqXXNdc=;
	b=MGZaHUPJsTRulYd4HIGkMvx0+7Ir7myWkA1YQkqQvbW+3pMpSceMjN4le+K485KiU6
	DJMKwv/Y3yZsef8kTPd6enTO1X4o+4e7fnPljjTewVdrttvvoxr6GbSHKmpp4CeXzjXy
	ao3Y4Yp5xyUnt7/I3i1QneFtcTEw59/bk+se3EVkgbp8r3AfgRWpm4L5SrwUWM0cs6It
	jRt3ga8k6f5Cn7/2llyr7yhVO/cGK2FSxl6QHcQjnKPdA/tJqE01whPYA79CxZlHjLMb
	7Js9xYQqo8jrBQfO2AzUHmadC4Bz6/0c3Q8vu8QD8/C2kx0sqAyDjuRCHGwvoP9EwSKT
	09TQ==
X-Gm-Message-State: ALoCoQk7xCPYVLvhuoD0J0ckvL8iOVFhuMrYLkwscy7DPJpuGxhDMnLVh+i7tWLUPWr7GWpbx3IQ
X-Received: by 10.141.23.208 with SMTP id z199mr24215434qhd.27.1426575682665; 
	Tue, 17 Mar 2015 00:01:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Tue, 17 Mar 2015 00:01:02 -0700 (PDT)
In-Reply-To: <82c728adf7229f85982233033cf23c1c6041069c.1426525757.git.bruce.ashfield@windriver.com>
References: <cover.1426525757.git.bruce.ashfield@windriver.com>
	<82c728adf7229f85982233033cf23c1c6041069c.1426525757.git.bruce.ashfield@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Mar 2015 09:01:02 +0200
Message-ID: <CAJTo0LYgteZ1kuHLj4WJr6D12_9JRD2+McYtO7TVrCAOoUDtKg@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] perf: drop PR
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
X-List-Received-Date: Tue, 17 Mar 2015 07:01:21 -0000
Content-Type: multipart/alternative; boundary=001a11423afecfaf750511768810

--001a11423afecfaf750511768810
Content-Type: text/plain; charset=UTF-8

On 16 March 2015 at 19:27, Bruce Ashfield <bruce.ashfield@windriver.com>
wrote:

> -PR = "r9"
>

In general you can only remove PR if it's r0 (as that's the default in
bitbake.conf), so this will have to remain until the PV for perf is
changed.  But perf is versioned according to the kernel that it's built
against so I think this PR is destined to stay forever as perf has no
control over it's own version.

Ross

--001a11423afecfaf750511768810
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 March 2015 at 19:27, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"=
mailto:bruce.ashfield@windriver.com" target=3D"_blank">bruce.ashfield@windr=
iver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":4el" class=3D"a3s" style=3D"overflow:hidden">-PR =3D &quot;r9&quot;<br=
></div></blockquote></div><br>In general you can only remove PR if it&#39;s=
 r0 (as that&#39;s the default in bitbake.conf), so this will have to remai=
n until the PV for perf is changed.=C2=A0 But perf is versioned according t=
o the kernel that it&#39;s built against so I think this PR is destined to =
stay forever as perf has no control over it&#39;s own version.</div><div cl=
ass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11423afecfaf750511768810--

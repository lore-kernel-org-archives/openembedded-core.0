Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2312371975
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 12:37:33 +0000 (UTC)
Received: by mail-qt0-f176.google.com with SMTP id f92so20113qtb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 05:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UQBgkD5CM+yDPiQnbXV/+aaGFGVrhCVLhM8pG+0N+90=;
	b=tydmsVj03j/vHW3Fue9sHi6snos8gYZ8H2WJuZ4L6+87U3EOJLcMrUOvMeRnwpFL32
	9ynFzjDwf0W/lNIVDloApaGrNx3UREQHE0xmd/SM7euK3dAYA0PX6nS1nReT8oH5ebRc
	NqIZLhmdx/nzPec1EQGl99YTUOxgea2y7pW4ACujLDDx881rpzHDbNOV516LtrSj35jB
	XZokguJaZtekKcRhqp2GEh43JKzAQy8GjHnRj71Cn7zE17t80IG8VqlZXac1s/wzq+TQ
	8Z1MyfhcLYJBYsYdvjLv2MOhjsaltyrHgXIB8Gchbb39QcFFY5eowqwUJQFoEBXWwN39
	VW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UQBgkD5CM+yDPiQnbXV/+aaGFGVrhCVLhM8pG+0N+90=;
	b=kYEIGd+HguFqlKPuySKX2fwcCF4fl6/q7X7n0dQaeMLOZ331l6SWV0jzVD/tb9cAVT
	J/Gh4AecyTHDuJDOFQxWyecTMRwAdq/b1lKGha6lbWPzs/Ts2hBxvW8G8LLCrhIf+h/9
	GjiiWM050SQEfL5ugiGCV3zXbC+54le+rhBiwml8UTZMha2/CyDcFnQ9Jk9g80dcYRNN
	KEVOgGecV2/YEH+/yiWTQkzHDbcH/b4Kr+3eKOYXZXO6bsJtfUIkRAK1HqfTsPZke+a5
	k4LJwJmY3NhQ+tuIR6Rw3uiO2GcjxYR7pZyXtPhx8EB4YFeE7fTm2VPMccXsc+Hje8Jr
	3gyQ==
X-Gm-Message-State: AKS2vOz0dBz5mm1cLZDLPyAofmSzxXFNlbBojo4ifXZMfm9zYLRkfVzw
	zZLbPKpwomgTpbSHFmpIRdVCMfUQIuew
X-Received: by 10.237.59.134 with SMTP id r6mr23151733qte.47.1498480654136;
	Mon, 26 Jun 2017 05:37:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.31.118 with HTTP; Mon, 26 Jun 2017 05:37:13 -0700 (PDT)
In-Reply-To: <56128a61-8244-9586-0fef-2cead1dd97d7@yadro.com>
References: <56128a61-8244-9586-0fef-2cead1dd97d7@yadro.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 26 Jun 2017 13:37:13 +0100
Message-ID: <CAJTo0Lb55gNRVebzugqaaEY7tbhSUG3+1NBrsEfw-7VZW_Vv+A@mail.gmail.com>
To: Anton Novikov <a.novikov@yadro.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] (master) automake: fix Perl regex
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
X-List-Received-Date: Mon, 26 Jun 2017 12:37:34 -0000
Content-Type: multipart/alternative; boundary="94eb2c19004017ca140552dc37de"

--94eb2c19004017ca140552dc37de
Content-Type: text/plain; charset="UTF-8"

The subject needs to be of the form:

  automake: fix perl regex for Perl 5.22 onwards

Also the Upstream-Status can be set to Backport as this is sha 13f00eb4
upstream.

Cheers,
Ross

On 21 June 2017 at 09:55, Anton Novikov <a.novikov@yadro.com> wrote:

> Thanks,
>
> Anton
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--94eb2c19004017ca140552dc37de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The subject needs to be of the form:<div><br></div><div>=
=C2=A0 automake: fix perl regex for Perl 5.22 onwards</div><div><br></div><=
div>Also the Upstream-Status can be set to Backport as this is sha=C2=A013f=
00eb4 upstream.</div><div><br></div><div>Cheers,</div><div>Ross</div></div>=
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 21 June 2017 a=
t 09:55, Anton Novikov <span dir=3D"ltr">&lt;<a href=3D"mailto:a.novikov@ya=
dro.com" target=3D"_blank">a.novikov@yadro.com</a>&gt;</span> wrote:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">Thanks,<br>
<br>
Anton<br>
<br>
<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div>

--94eb2c19004017ca140552dc37de--

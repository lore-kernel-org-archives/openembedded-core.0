Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id AFC6E71C70
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Dec 2017 15:33:42 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id d137so7538188itc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Dec 2017 07:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=knXmQ8QUXJbkREW3S4hsll7CZeyk9ZysV2j4gXnQGic=;
	b=httfm6SOWhhteia8JIPsPzzxkOF5ooxMO1Z7il93K6yGTJAv5Oh65HS1XA6VHRpveP
	VfhuLTOWxF7zOCaFsJaFp+dbkNjPW2drsUkR0QzSrzF7Oty79GhYhI75D9jmsXz7Ev+n
	JjP+x0ELmaiRbX6UY+Sd7iVYz5XSu0uUAAe0q3N1/f0I5wuoYhkVE/cDlc/8NDUQjpDH
	sKqRDINZpmuEcZuzQmTovewrVCHdpiucaaoQNCX9PCTiGWewJ7q4HGvTCAQT1EtqotE8
	E03HrAATtLp7GpX+N/vLnyUMxaSFLP70jAI8p31dzodfRCdd/d916q0PFcYD3aR0TMi+
	BJ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=knXmQ8QUXJbkREW3S4hsll7CZeyk9ZysV2j4gXnQGic=;
	b=qd46gsIeJi2HhiSNYg690ja+aEZngr8iH3d57+7RfrWXpbvZIq2Si75DPS5vD7oo3/
	K1B1v96jK3QiWA899RJydiUO9TQ3QQWAGbeRXl3utulgm22k4hU5StidVichzbKJ6rD2
	OYpaE+4s+m4EJxxz3Pt7UW3wp04tnaCGzSy1+h4/QWHypAYuGE/TKG56oeF7UPr4NVM8
	blBVYAqIl3DYHY4UxoGUbyz2I43w+fbXy9VOBCx56xncN2x7S8qOF7VdWnuL4hgIhHGO
	j61K/C7LMejTK0fc3ew0kGBrOXo8/nT44Sf28GtxFxCLlPsYAsJSoqgIYv87xaxDGTwS
	yttQ==
X-Gm-Message-State: AKGB3mJkboo1lfWif1lRTxtxeYBJ4bj8khYw6UvL4ciF1Ser/KqCwSGz
	//4liqEoHbcddJFyMKVoYHwj3thB7z7gIJWT1+oChQ==
X-Google-Smtp-Source: AGs4zMZOPTsMWFe1cfmn9Vd6y2CGgjDJT7hvb3zyQYpQAxhRH14TnuQJpX24dtv91b+2ZudQo+PhRPa+DFz9i5TYsL8=
X-Received: by 10.36.162.65 with SMTP id o1mr13631819iti.85.1512401623589;
	Mon, 04 Dec 2017 07:33:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.134 with HTTP; Mon, 4 Dec 2017 07:33:22 -0800 (PST)
In-Reply-To: <20171204153001.enqgfe27iapaoftl@axis.com>
References: <20171201155024.3002-1-olofjn@axis.com>
	<20171201155024.3002-6-olofjn@axis.com>
	<CAJTo0LbrTAEyXgB=RxQNcjUObG-cEMfwMxdPXW22GZuc3YTCOQ@mail.gmail.com>
	<20171204153001.enqgfe27iapaoftl@axis.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 4 Dec 2017 15:33:22 +0000
Message-ID: <CAJTo0LamaocQdf-kAKHw-0OZs7ZZ4uMfV598cJiJxFV+R=PaBA@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	Olof Johansson <olof.johansson@axis.com>
Subject: Re: [PATCH 5/5] lib/oe/package.py: is_elf: Make it less prone to false positives
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
X-List-Received-Date: Mon, 04 Dec 2017 15:33:42 -0000
Content-Type: multipart/alternative; boundary="f403045fbd848844ba055f85716c"

--f403045fbd848844ba055f85716c
Content-Type: text/plain; charset="UTF-8"

On 4 December 2017 at 15:30, Olof Johansson <olof.johansson@axis.com> wrote:

> On 17-12-04 12:36 +0000, Burton, Ross wrote:
> > You might be interested in some of the patches I've got sitting in
> > http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=ross/mutb
> > specifically around "Add new ELF parser".  This adds a fully-featured
> > Python ELF parser to lib/oe which could be used to inspect the binaries
> the
> > way file does, but without having to call and parse the output of file.
>
> Oh, that's awesome. Please disregard v1 of my patch series, and
> I'll try to adapt package.bbclass and lib/oe/package.py to make
> use of your changes and see what happens. Thanks!
>

Hopefully to get what you want out of it doesn't involve too much pain...

I still need to finish the series of to get it ready for merging, but I've
just pushed a new branch ross/elf to poky-contrib which has just the
patches.  As I clean it up I'll force push there, so feel free to
track/rebase/send improvements.

Ross

--f403045fbd848844ba055f85716c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 4 December 2017 at 15:30, Olof Johansson <span dir=3D"l=
tr">&lt;<a href=3D"mailto:olof.johansson@axis.com" target=3D"_blank">olof.j=
ohansson@axis.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div =
class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On 17=
-12-04 12:36 +0000, Burton, Ross wrote:<br>
&gt; You might be interested in some of the patches I&#39;ve got sitting in=
<br>
&gt; <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/=
?h=3Dross/mutb" rel=3D"noreferrer" target=3D"_blank">http://git.yoctoprojec=
t.org/<wbr>cgit/cgit.cgi/poky-contrib/<wbr>log/?h=3Dross/mutb</a><br>
&gt; specifically around &quot;Add new ELF parser&quot;.=C2=A0 This adds a =
fully-featured<br>
&gt; Python ELF parser to lib/oe which could be used to inspect the binarie=
s the<br>
&gt; way file does, but without having to call and parse the output of file=
.<br>
<br>
</span>Oh, that&#39;s awesome. Please disregard v1 of my patch series, and<=
br>
I&#39;ll try to adapt package.bbclass and lib/oe/package.py to make<br>
use of your changes and see what happens. Thanks!<br></blockquote><div><br>=
</div><div>Hopefully to get what you want out of it doesn&#39;t involve too=
 much pain...</div><div><br></div><div>I still need to finish the series of=
 to get it ready for merging, but I&#39;ve just pushed a new branch ross/el=
f to poky-contrib which has just the patches.=C2=A0 As I clean it up I&#39;=
ll force push there, so feel free to track/rebase/send improvements.</div><=
div><br></div><div>Ross=C2=A0</div></div></div></div>

--f403045fbd848844ba055f85716c--

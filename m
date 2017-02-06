Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yb0-f176.google.com (mail-yb0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id B8CCC7198F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 15:17:35 +0000 (UTC)
Received: by mail-yb0-f176.google.com with SMTP id j82so26220127ybg.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Feb 2017 07:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BPY+v6zj5VUOoup2RA2TFhj1aS5Wu73zEV0QUsVFgIY=;
	b=UNpdVb2DS1ecvszcj4dh2RPHvuTKv1sttErIGINKRSWIq3GSdQkXqEagdIK1a4X4ds
	3oWiqGeft/TaNF/oDys/kNI6eKYMazuwr+He6oLQQs/7/cbWlh1kODuTwMEW/VvF8HMd
	clIl7jstJSzribDDkoyIQBpR+nbflADucC2X+TXL7595DXeoKYkdtEivwFw5lyPMyFeF
	ME11ctKQD2yu/Q7uVtPUIg4v7Dj1X0OCvdAeqwVtS/F11Rrxe7QDNpK8Zypgj7GopD3T
	4xgewf7LgUCOFiNLlLRAEfDdpzw+7PMO9CCXGeEg/zkFy4VC3arTYmX4nO7WPGWe6/lm
	sh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BPY+v6zj5VUOoup2RA2TFhj1aS5Wu73zEV0QUsVFgIY=;
	b=mtIcjyntr79gFehs13RR2VQErIK6wF//sDaoa33OsHnK1eJOxI4u+G5enjWTFDfSrw
	vbQlYvbBjgHsp9YokRSMj+2U/kI6QhyBl0FOBrZ0KmdCSoi4qDWQnoxAgwdWHAi7+y/Z
	fOpeI/43zMB0T8SnORlX0zrmhvDNUg4h0jAG2suyGGKCvxh+GJ1dDBpxc996XXCpTgEx
	VBfLuzEPC167ca7UPx1fnPwZr7KlnFT74ljLCp35/1QaoZtlHNAC1m0Y5FTYXuIYmkxC
	Ut/OD3XSTIbVvP1lmDO5Gcs5doqwvg4GF0XpE2AmjY6VFJvBpaKt5fdcAWrP2eJn7TCY
	wSew==
X-Gm-Message-State: AMke39mTwPg7NhSxrUMZRxHEfD0+F+QG6PS+GQVAGOIOVSNvIDVHEJ5tCYurSWpzM3HQBg3+L+miDfS+dGlXusSc
X-Received: by 10.37.35.194 with SMTP id j185mr7456837ybj.3.1486394255359;
	Mon, 06 Feb 2017 07:17:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.13.234.11 with HTTP; Mon, 6 Feb 2017 07:17:04 -0800 (PST)
In-Reply-To: <CAJTo0LZ+khtB9f==4KQr_iaVJhHmTGfFj-2toAnN=GFPiyUVDQ@mail.gmail.com>
References: <3230301C09DEF9499B442BBE162C5E48AC31CBF7@SESTOEX04.enea.se>
	<CAJTo0LZ+khtB9f==4KQr_iaVJhHmTGfFj-2toAnN=GFPiyUVDQ@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 6 Feb 2017 17:17:04 +0200
Message-ID: <CAHiDW_GXHZ4Yk_pbEZXLgvzsnohZFjHGcDdfMUFz2bmCcSbJ=g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"mariano.lopez@intel.com" <mariano.lopez@intel.com>
Subject: Re: do_populate_cve_db: Error in executing cve-check-update
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
X-List-Received-Date: Mon, 06 Feb 2017 15:17:36 -0000
Content-Type: multipart/alternative; boundary=001a113ce0d696c1600547de2151

--001a113ce0d696c1600547de2151
Content-Type: text/plain; charset=UTF-8

On 6 February 2017 at 16:56, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 6 February 2017 at 14:43, Sona Sarmadi <sona.sarmadi@enea.com> wrote:
>
>>     bbdebug 2 "Updating cve-check-tool database located in $cve_dir"
>>     if cve-check-update -d "$cve_dir" ; then
>>         printf "CVE database was updated on %s UTC\n\n" "$(LANG=C date
>> --utc +'%F %T')" > "$cve_file"
>>     else
>>         bbwarn "Error in executing cve-check-update"
>> <<<<<<<<<<<<<<<<<<<<<<<<<
>>
>
> This definitely needs to be rewritten so you can see the output if it
> fails.  Just run cve-check-update -d <dir> yourself and see what it says.
> Last time I had this failing it was because the mitre servers were offline.
>

Agreed about the error output.

I think recipe specific sysroots broke the setup somehow (so the tools are
not actually in sysroot when they're needed). I'm taking a look at this
tomorrow.

Jussi

--001a113ce0d696c1600547de2151
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 6 February 2017 at 16:56, Burton, Ross <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><di=
v class=3D"gmail_extra"><span class=3D""><br><div class=3D"gmail_quote">On =
6 February 2017 at 14:43, Sona Sarmadi <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:sona.sarmadi@enea.com" target=3D"_blank">sona.sarmadi@enea.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"m_58810534074457=
94043:1vq" class=3D"m_5881053407445794043a3s m_5881053407445794043aXjCH m_5=
881053407445794043m15a13e1fae6963e3">=C2=A0 =C2=A0 bbdebug 2 &quot;Updating=
 cve-check-tool database located in $cve_dir&quot;<br>
=C2=A0 =C2=A0 if cve-check-update -d &quot;$cve_dir&quot; ; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 printf &quot;CVE database was updated on %s UTC=
\n\n&quot; &quot;$(LANG=3DC date --utc +&#39;%F %T&#39;)&quot; &gt; &quot;$=
cve_file&quot;<br>
=C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bbwarn &quot;Error in executing cve-check-updat=
e&quot;=C2=A0 &lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&=
lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;</div></blockquote></div><br></span>=
This definitely needs to be rewritten so you can see the output if it fails=
.=C2=A0 Just run cve-check-update -d &lt;dir&gt; yourself and see what it s=
ays.=C2=A0 Last time I had this failing it was because the mitre servers we=
re offline.</div></div></blockquote><div><br></div><div>Agreed about the er=
ror output.</div><div><br></div><div>I think recipe specific sysroots broke=
 the setup somehow (so the tools are not actually in sysroot when they&#39;=
re needed). I&#39;m taking a look at this tomorrow.</div><div><br></div><di=
v>Jussi=C2=A0</div><div><br></div></div></div></div>

--001a113ce0d696c1600547de2151--

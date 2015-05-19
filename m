Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id A7588601DF
	for <openembedded-core@openembedded.org>;
	Tue, 19 May 2015 17:44:40 +0000 (UTC)
Received: by qkgx75 with SMTP id x75so15005477qkg.1
	for <openembedded-core@openembedded.org>;
	Tue, 19 May 2015 10:44:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=c61/DixLu/I+bRRdAIEriJ/pgAM4BySEnxSGbAHEBHk=;
	b=W9itMhuG5B2N3oFFvv45erFWvs7Ob5WNfi4M5wYYLtzK8nOG13I8VPtYJjCGC8l3/A
	QM2YsASQhbS0wwrLpQKPNrYL3IeRwqXe9betBPOJm5Amwo+fhx0Qb9sibBiGJOc8+lko
	2GkqQpJw/FKdt1t5bd4vgOtrfILmN20OsyujKvCM8SGG3KbgD5a+DBldkjZuhURCqpDe
	jw5itjnMgA3UACFEQyqSU2Mq3pql1kVe1qfBWggeiLcvVUIylEdNjVzyJ8seH/8A67ME
	k6qFhrpY6LPJdWLcI7nLDVmDfioIVscAOM+gLp4NfY/RXUMrj8jRvuN4goLACkHbsOD4
	m46g==
X-Gm-Message-State: ALoCoQk3jnZuriOdJMnN0vGVS1Sxr2L9a9OdNoIMYAf0Id3B65po6YXO0Jgk4onaKwZDzXgLJSTY
X-Received: by 10.229.96.138 with SMTP id h10mr13059483qcn.5.1432057479744;
	Tue, 19 May 2015 10:44:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 19 May 2015 10:44:19 -0700 (PDT)
In-Reply-To: <555B53AB.2010804@mlbassoc.com>
References: <555B53AB.2010804@mlbassoc.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 May 2015 18:44:19 +0100
Message-ID: <CAJTo0LaGPMOHEdYNSGCWipQm=mqUGPANr6kaK7EzXpXbSBuO0g@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: "openembedded-core@openembedded.org" <openembedded-core@openembedded.org>
Subject: Re: media player (gtk-play)
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
X-List-Received-Date: Tue, 19 May 2015 17:44:42 -0000
Content-Type: multipart/alternative; boundary=001a1133dd7460e3ae051672dda4

--001a1133dd7460e3ae051672dda4
Content-Type: text/plain; charset=UTF-8

On 19 May 2015 at 16:15, Gary Thomas <gary@mlbassoc.com> wrote:

> Do you know if there is a way to tell gtk-play what gstreamer
> back-end(s) to use?  In particular, for my i.MX6 board, it is
> not choosing the video plugin I think it should and it would be
> nice to test if it does the right thing if the correct plugin
> is used.
>

I guess there's a few solutions:

1) Patch gst-player (upstream is very responsive!) to add options to pass
these hints to the playbin
2) Delete the plugins you don't want it to use
3) Use gst-launch directly to do these tests (gst-launch playbin
video-sink=foosink uri=...)

For (1) this should be a fairly simple matter of passing the sink name,
then constructing that element and passing it as the audio-sink/video-sink
property on the playbin.

Ross

--001a1133dd7460e3ae051672dda4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 May 2015 at 16:15, Gary Thomas <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:gary@mlbassoc.com" target=3D"_blank">gary@mlbassoc.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><div style=3D"overflow:hidden">Do you=
 know if there is a way to tell gtk-play what gstreamer<br>
back-end(s) to use?=C2=A0 In particular, for my i.MX6 board, it is<br>
not choosing the video plugin I think it should and it would be<br>
nice to test if it does the right thing if the correct plugin<br>
is used.</div></blockquote></div><br>I guess there&#39;s a few solutions:</=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">1) Patc=
h gst-player (upstream is very responsive!) to add options to pass these hi=
nts to the playbin</div><div class=3D"gmail_extra">2) Delete the plugins yo=
u don&#39;t want it to use</div><div class=3D"gmail_extra">3) Use gst-launc=
h directly to do these tests (gst-launch playbin video-sink=3Dfoosink uri=
=3D...)</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra=
">For (1) this should be a fairly simple matter of passing the sink name, t=
hen constructing that element and passing it as the audio-sink/video-sink p=
roperty on the playbin.</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">Ross</div></div>

--001a1133dd7460e3ae051672dda4--

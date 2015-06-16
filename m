Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id D4DEB73BBE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 12:08:55 +0000 (UTC)
Received: by qkdm188 with SMTP id m188so7403591qkd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 05:08:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ch+XMS3oAEAfpb8kjsR0EpzT7Ngcjxt0o2pid3W1Cvw=;
	b=LLZbpy94XTdBK6xHgD12uskfmzwXftLUjF5taCP+jaEFnP2JXGmwyyydQrhaS3lbuR
	5ZWrB5TDePw6ony5GT1UhlppxQAsP7O/XziXpW2L6YhmXfY9BIz7l+OeI88TfpVXSWyp
	UIsZ62B1LRPcUlmHNif+JytyUNcvFuQd5Uyb2HyBTKMWvfPW41HOVxsQJLwCEyAFrivr
	fb8Hjd26MZCXK55JVt7kbCRKeJih+p4ZtMgLiMLF5QMtybUv7NZlACkpSwDfNxGxZlq0
	SgGAnqEpbujMsR/beOqqKTPGNH1E4yV4OLvVqE4eX5K9SiQ9BI2vdThhZwnCD4ABtgfT
	iLTg==
X-Gm-Message-State: ALoCoQmwYtWxC5eEs61+w5qWOzLZAruq+SBO6He4ITZ8Fjd75pPIqxwN3PREaTo/3xIQC28VgTf6
X-Received: by 10.55.25.150 with SMTP id 22mr70781555qkz.105.1434456536299;
	Tue, 16 Jun 2015 05:08:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 16 Jun 2015 05:08:35 -0700 (PDT)
In-Reply-To: <1433189842-17654-2-git-send-email-philip@balister.org>
References: <1433189842-17654-1-git-send-email-philip@balister.org>
	<1433189842-17654-2-git-send-email-philip@balister.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 Jun 2015 13:08:35 +0100
Message-ID: <CAJTo0LYLxsH6_28DCakvnaKMpUyk=syfGcsfrQriTj8y_21n6Q@mail.gmail.com>
To: Philip Balister <philip@balister.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] packagegroup-core-tools-profile.bb: Remove oprofile.
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
X-List-Received-Date: Tue, 16 Jun 2015 12:08:58 -0000
Content-Type: multipart/alternative; boundary=001a1147b3b04aea960518a1700a

--001a1147b3b04aea960518a1700a
Content-Type: text/plain; charset=UTF-8

On 1 June 2015 at 21:17, Philip Balister <philip@balister.org> wrote:

> Oprofile functions duplicate perf. Since perf is easier to use drop
> oprofile
> from the core-tools-profile package.
>
> Also, the oprofile-ui package opens a port on the device. removing this
> package reduces a possible security issue for devices with profiling tools.
>

I filed this in the "think about" box when you submitted it, but then
failed to think.  My concern was "oprofile is the profiling tool we support
with oprofileui on the host" but that point is fairly moot right now as
oprofileui doesn't work anymore... (#7054).

When that's fixed, we can re-add the tooling as appropriate.

Ross

--001a1147b3b04aea960518a1700a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 June 2015 at 21:17, Philip Balister <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:philip@balister.org" target=3D"_blank">philip@balister.org</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":dv" class=3D"a3s"=
 style=3D"overflow:hidden">Oprofile functions duplicate perf. Since perf is=
 easier to use drop oprofile<br>
from the core-tools-profile package.<br>
<br>
Also, the oprofile-ui package opens a port on the device. removing this<br>
package reduces a possible security issue for devices with profiling tools.=
</div></blockquote></div><br>I filed this in the &quot;think about&quot; bo=
x when you submitted it, but then failed to think.=C2=A0 My concern was &qu=
ot;oprofile is the profiling tool we support with oprofileui on the host&qu=
ot; but that point is fairly moot right now as oprofileui doesn&#39;t work =
anymore... (#7054).</div><div class=3D"gmail_extra"><br></div><div class=3D=
"gmail_extra">When that&#39;s fixed, we can re-add the tooling as appropria=
te.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ro=
ss</div></div>

--001a1147b3b04aea960518a1700a--

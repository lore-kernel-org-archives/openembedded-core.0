Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
	[209.85.217.68])
	by mail.openembedded.org (Postfix) with ESMTP id 64A897F859
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2019 21:11:02 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id b16so5802930vso.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Nov 2019 13:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Tv8oxhfbEDs9TYlXA9Gg8+BlG7obSqwqcumqk3BTxMw=;
	b=ee2jTfS4VTTcX3+7Zp2Pr9J09HqjS/gxbNTAEzihE8MqfSHMdnNCCPxiDUM5vdSFZw
	cqF8XmAkqi2yVi8sncmrPv0DwxEmpTp40ooklP5oRm6M/5jO+ER1iGtfx3kchO8I3JS7
	BNet2Cqi8ZOhub/OaJK0XCcf0dnNRXM7AAJ42X3W+K83cWIvtRgSLk2BQ7cXwJNEpmBk
	PAohBUSeHQR1DZ5kWUYQRqmKtHJFZ4N62r2j2ucUtu5CYrRUHjwn5s8eOOVMJOfDe0gK
	Q+euscGwWhCNFmtVerX/GiDErFiTw8fIEtfqW1GaX0UiZHHvguR1uJQB8+ZOnXLTvC3O
	hu0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Tv8oxhfbEDs9TYlXA9Gg8+BlG7obSqwqcumqk3BTxMw=;
	b=isYhmEf1pcl+fj/RBygj44JTQQ93xodQ6HRyfi/BAGggHUoWGXLRtqWRgIPbqyP+Z8
	e813HUHXzdFd7u0h3bLC2ZZrPcv+aCtBkebRlnOYGKVmyYrJCvjwYTlAwN5gLZcgxENL
	pV3IU5UJVTmQGtH9gsF31p1J3iuQ1+LPr5TCR8pDVGsSCDWo0/v58EFnjeN03xkgoN0t
	TXTXt7/9FbPVqwSMYLAVQ8znN6L0rATKXJEvaq/oeVJXZH8MOWIgFd1G36Hp+oXPPUBw
	Tb/pMv+bifrpc5I4qbo/xeAX1DcubIxLcwHLqQfl9Xgj429Dai/M45H4pALkOI1wP1BQ
	KiXg==
X-Gm-Message-State: APjAAAV0YlZFsJqRB3/a/py63fH1bHa7WI3XT1eJSkMUjKRBVZLHG/ho
	EmBqjz09yGgY9Ibcuiu5Knb5hTHeasvmiOHYl4E=
X-Google-Smtp-Source: APXvYqy+zLnwSLuT9gx1vVGu3yJjv0qLIxeiAaLGj6DtYsce+3kMYRpmBiwOg8KpdZGd5QBQgU0VylPEeqEB6eucbMU=
X-Received: by 2002:a67:ea5a:: with SMTP id r26mr12906984vso.94.1572901862950; 
	Mon, 04 Nov 2019 13:11:02 -0800 (PST)
MIME-Version: 1.0
References: <20191031093655.14852-1-alex.kanavin@gmail.com>
	<20191031093655.14852-3-alex.kanavin@gmail.com>
	<dc6caf95-a1e0-0eb7-f721-8dd3d1e2aa93@intel.com>
	<CANNYZj9i0mvP_X3WFapfda49YdVvuY9Tr1KY7mFcsnqRr5J-HA@mail.gmail.com>
	<CANNYZj9dmYgWxYOG6o3hJC9rEk6ghUxYRAak5wZjELMbtOJKag@mail.gmail.com>
In-Reply-To: <CANNYZj9dmYgWxYOG6o3hJC9rEk6ghUxYRAak5wZjELMbtOJKag@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 4 Nov 2019 22:10:51 +0100
Message-ID: <CANNYZj-Cmx_iNn+tJAW4XE=VSi4MT+LeiaPQk-8REhG+Xd_JsA@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] oe-selftest: extend virgl gtk test to also check the SDL option
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
X-List-Received-Date: Mon, 04 Nov 2019 21:11:02 -0000
Content-Type: multipart/alternative; boundary="000000000000cecb9505968bc017"

--000000000000cecb9505968bc017
Content-Type: text/plain; charset="UTF-8"

On Sat, 2 Nov 2019 at 23:29, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Same failures on the Debian 10 worker:
>
>>
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/778
>>>
>>
>> runqemu - ERROR - Failed to run qemu: Xlib:  extension "RANDR" missing on
>> display ":1".
>> qemu-system-x86_64: ../libepoxy-1.5.3/src/dispatch_common.c:863:
>> epoxy_get_proc_address: Assertion `0 && "Couldn't find current GLX or EGL
>> context.\n"' failed.
>>
>> Thanks - the Gtk part is passing fine, so it's something SDL does that
>> upsets the X/GL stack on the Debian 10 host.
>> I am reluctant to disable the SDL part of the virgl tests on Debian 10,
>> as it is a new distro (unlike centos 7).
>>
>> I'll try to see if I can run Debian 10 in a VM here and try to reproduce.
>> Or is it possible to debug directly on a Debian 10 worker?
>>
>
> So I actually went ahead, and installed Debian 10 into a qemu image, then
> transferred a pre-populated build directory into it, and ran runqemu there
> against tigervnc (hurray for the nested kvm feature!).
>
> Both 'runqemu kvm sdl gl' and 'runqemu kvm gtk gl' work fine, including
> running kmscube!
>
> So I'd like to see what packages are installed on the Debian 10 worker vs.
> my Debian 10 installation.
>
> Can you issue 'dpkg -l' on the worker, and send me the output, please?
> Maybe something is missing?
>

After additional digging I reproduced this. The culprit is the outdated VNC
server implementation that runs on the Debian 10 autobuilder (and maybe
others as well).

Specifically, it's tightvncserver, where all Linux development has ceased
10 years ago (!).
https://www.tightvnc.com/

If you replace that with tigervnc (a modern, supported fork of tightvnc),
then the tests pass fine.
https://tigervnc.org/

As Fedora has already obsoleted tightvnc in favor of tigervnc, I think we
should do the same on all debian machines (debian provides both tightvnc
and tigervnc, but treats them as equal).
https://src.fedoraproject.org/rpms/tightvnc/blob/master/f/dead.package
I also checked that tightvnc is not available for opensuse either.

Alex

--000000000000cecb9505968bc017
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, 2 Nov 2019 at 23:29, Alexander Ka=
navin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com<=
/a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div dir=3D"ltr">Same failures on the Debian 10 w=
orker:<br><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/56/build=
s/778" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoprojec=
t.org/typhoon/#/builders/56/builds/778</a><br></blockquote><div><br></div><=
div><div dir=3D"ltr"><div>runqemu - ERROR - Failed to run qemu: Xlib: =C2=
=A0extension &quot;RANDR&quot; missing on display &quot;:1&quot;.<br>qemu-s=
ystem-x86_64: ../libepoxy-1.5.3/src/dispatch_common.c:863: epoxy_get_proc_a=
ddress: Assertion `0 &amp;&amp; &quot;Couldn&#39;t find current GLX or EGL =
context.\n&quot;&#39; failed.<br></div><div><br></div><div>Thanks - the Gtk=
 part is passing fine, so it&#39;s something SDL does that upsets the X/GL =
stack on the Debian 10 host.</div><div>I am reluctant to disable the SDL pa=
rt of the virgl tests on Debian 10, as it is a new distro (unlike centos 7)=
.<br></div><div><br></div><div>I&#39;ll try to see if I can run Debian 10 i=
n a VM here and try to reproduce. Or is it possible to debug directly on a =
Debian 10 worker?<br></div></div></div></div></div></blockquote><div><br></=
div><div>So I actually went ahead, and installed Debian 10 into a qemu imag=
e, then transferred a pre-populated build directory into it, and ran runqem=
u there against tigervnc (hurray for the nested kvm feature!).=C2=A0</div><=
div><br></div><div>Both &#39;runqemu kvm sdl gl&#39; and &#39;runqemu kvm g=
tk gl&#39; work fine, including running kmscube!<br></div><div><br></div><d=
iv>So I&#39;d like to see what packages are installed on the Debian 10 work=
er vs. my Debian 10 installation. </div><div><br></div><div>Can you issue &=
#39;dpkg -l&#39; on the worker, and send me the output, please? Maybe somet=
hing is missing?</div></div></div></blockquote><div><br></div><div>After ad=
ditional digging I reproduced this. The culprit is the outdated VNC server =
implementation that runs on the Debian 10 autobuilder (and maybe others as =
well). <br></div><div><br></div><div>Specifically, it&#39;s tightvncserver,=
 where all Linux development has ceased 10 years ago (!).</div><div><a href=
=3D"https://www.tightvnc.com/">https://www.tightvnc.com/</a></div><div><br>=
</div><div>If you replace that with tigervnc (a modern, supported fork of t=
ightvnc), then the tests pass fine.</div><div><a href=3D"https://tigervnc.o=
rg/">https://tigervnc.org/</a></div><div><br></div><div>As Fedora has alrea=
dy obsoleted tightvnc in favor of tigervnc, I think we should do the same o=
n all debian machines (debian provides both tightvnc and tigervnc, but trea=
ts them as equal).</div><div><a href=3D"https://src.fedoraproject.org/rpms/=
tightvnc/blob/master/f/dead.package">https://src.fedoraproject.org/rpms/tig=
htvnc/blob/master/f/dead.package</a></div><div>I also checked that tightvnc=
 is not available for opensuse either.<br></div><div><br></div><div>Alex<br=
></div><div><br></div></div></div>

--000000000000cecb9505968bc017--

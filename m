Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 8183B600B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2016 14:02:52 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id f30so72364265ioj.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2016 07:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dOQNTBpGejyyc7HPtFjNcheorqBWDihMCiGJoAPpO4M=;
	b=ZoswZMXNHpsIu2/dnJuA3Sj3ANTjYkQDqHlizbMke67t8MxPJ80eDuJQcY+9TR0uwS
	ZQwiefbEFr5HAzxembKwFnsvdGQJ+/+ZuvDgI3dvAuYgic4GHWoNiRquYXjG3eJ3eJ3+
	t8SEAa352MUfINqkHnITHSELG0HWSiqh30vUhGmUAiufEQ6vN3l2ZXxuxlgtke4xHEN7
	pcnygh18fnoIA1c4ELXkEyQx2F8MyRs86LH642Zr5IB8m0JqaoLyZMmiByQ0xjEOsQcN
	tYLLwyEkqQxNcJ6QH+5ZUO7/v2mrrxSR5hOC+PUXFihwMgICc1PwHYctZlSFYV7Mrqa1
	PpHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dOQNTBpGejyyc7HPtFjNcheorqBWDihMCiGJoAPpO4M=;
	b=fxAkRXX/GoKOuxVdL0OY805o6pAySOGYJulXzUofOcdb+djnTlm/URNJAWnODnRp13
	t1BVLmFZxX0OswR0jEg4X5hpApnPcc58WmRPM8vISEp3R8LU/FZFiromc9N4fRFFL7vA
	Z21ny0Cd3TG8z1tFZanOI+yIe92JQxmwXJXvwUrl7YEZKxaklYa0SaANZwkcyidAQf8R
	4oT4d+BrB8baArJdu4I0d+IqmHgJHlqYcAa5ldD6guH8GNUmbuM2DXX2EYKqGy5oAMn3
	IcfnpcSkNNFUQEJ+3FgYUXuL2tbPepi6jJCN/51N5AMNok6gVNcm6CCT9XDR+1FVSahl
	MHRw==
X-Gm-Message-State: ALyK8tKKGepOg5qW/h1qFRFBXvGqTV7tbeNYU37oZ4As8AaPawIAEoexgPXjTq+0oCFeqc44AGVTU4ZvIKXYydZW
X-Received: by 10.107.138.201 with SMTP id c70mr14101367ioj.148.1467295372431; 
	Thu, 30 Jun 2016 07:02:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.151 with HTTP; Thu, 30 Jun 2016 07:02:33 -0700 (PDT)
In-Reply-To: <1467293398-12667-1-git-send-email-michael.davis@essvote.com>
References: <1467293398-12667-1-git-send-email-michael.davis@essvote.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 30 Jun 2016 15:02:33 +0100
Message-ID: <CAJTo0LYkzKS7xtGBE1wapAUs1Q=PbJPrFzzbDn24=Su6Vv4fBA@mail.gmail.com>
To: "Davis, Michael" <michael.davis@essvote.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pusleaudio: Fix missing libcheck dependency
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
X-List-Received-Date: Thu, 30 Jun 2016 14:02:52 -0000
Content-Type: multipart/alternative; boundary=001a113e8e6a747e5305367f53d2

--001a113e8e6a747e5305367f53d2
Content-Type: text/plain; charset=UTF-8

On 30 June 2016 at 14:30, Davis, Michael <michael.davis@essvote.com> wrote:

> +DEPENDS = "libatomic-ops libsndfile1 libtool intltool-native libcheck"
>

This is only because pulseaudio auto-detects if libcheck is present if unit
testing is enabled, which it is by default.

As we don't ship the unit tests then instead of adding libcheck to DEPENDS
and building tests that we're not going to run, we should pass
--disable-tests instead.

Ross

--001a113e8e6a747e5305367f53d2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 30 June 2016 at 14:30, Davis, Michael <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:michael.davis@essvote.com" target=3D"_blank">michael.davis@essvote.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":cuf" =
class=3D"a3s aXjCH m155a1823a4a0155b">+DEPENDS =3D &quot;libatomic-ops libs=
ndfile1 libtool intltool-native libcheck&quot;<br></div></blockquote></div>=
<br></div><div class=3D"gmail_extra">This is only because pulseaudio auto-d=
etects if libcheck is present if unit testing is enabled, which it is by de=
fault.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"=
>As we don&#39;t ship the unit tests then instead of adding libcheck to DEP=
ENDS and building tests that we&#39;re not going to run, we should pass --d=
isable-tests instead.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--001a113e8e6a747e5305367f53d2--

Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
	[209.85.222.179])
	by mail.openembedded.org (Postfix) with ESMTP id A8155793E9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 21:47:10 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id g184-v6so326060qkc.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 14:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zcHC9rB7j9zP0qhTnK273VOSlIwvEQHcfWVTsspyoKk=;
	b=S1GV40epaAB1otuS2j3hq8EFoxJYvapzyNiPuO0gQBUDWjGBq2P3mGe1LfTfh8uHMe
	RX0GwZ9CmMzC0DYknPfdJRjlqxoEixpv36q5mpbfqfm6JFNUYWDsLrKvMacEAULAGNJa
	p3roFuwmh0lbvG00C/39rKkmc9VN+C5dj56+LZ9IMqHfqYtLgukowiaC48dnXuFEeTjt
	VkqF+SlJYNfU27qvbpWwKmm3H/Hk7mJMhFw+j+1WEAi1XE06tT0xOklE0w1KJC1bCHCW
	3EULq+bf5hODF0+wxQvNCtCckkNlIpZIgPsO/RKo+okNDg2YcsLeZmaMUiZEfWhQfVt+
	g3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zcHC9rB7j9zP0qhTnK273VOSlIwvEQHcfWVTsspyoKk=;
	b=nshfUxYhxJThXkb4iisNRTvRdzgr5/PT7j1JouS2yS71Sdy2j6f2SUaGnG+Ga+Yhfu
	fuc3T1Uif803GbxILKxEgF6hXjTyBmE/0dLMB+Q7AChYWK4iC+nRUtE3GeACghFeu40b
	v8ONcOX4smHSrpBcjUoDzxRiysziD5amZTmbkOKEATNYnRm8iMyOIl0+aTzh9l8z0L72
	6Dmcmec6VZsuwk6kBzk96XSFjYDwN0hu+sra66qZwDtD+QDGjcCwvFCQqKUTl8me5oaq
	bGoFpRw+e6VLhsbjVm9FQZ2K/F7pYnW/+9oO6sHXiwjlO0zOAOy1zezBPOxyv0eIbOQx
	4Vfg==
X-Gm-Message-State: ABuFfohShJ50Wj+7jIL3077EaklVQiQnGWTKeoExyl6u6DGJJFc3r5gA
	YGiFtE1oJ0fi/hbhf199pvyfBLCUyAR2iYRUMeI=
X-Google-Smtp-Source: ACcGV61Q6RmoFfLe919gsgFPq0YPbIJupYTxzmmEgjM3TdvOPeWijvVrx+blkaKDv5ytuA3i3imrM6MGloVfFx++lpw=
X-Received: by 2002:a37:ac02:: with SMTP id e2-v6mr5848555qkm.2.1537998431382; 
	Wed, 26 Sep 2018 14:47:11 -0700 (PDT)
MIME-Version: 1.0
References: <CALbNGRSPiWuTyLqaWbiH3UDF-maBQusnrbPCH_eWCxzm7n5rPA@mail.gmail.com>
In-Reply-To: <CALbNGRSPiWuTyLqaWbiH3UDF-maBQusnrbPCH_eWCxzm7n5rPA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Sep 2018 14:46:59 -0700
Message-ID: <CAMKF1sqGCuANwBQH6ZKuNUs1L+7N=WQSxAu1RmWjUooVs5bvxg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Run experience with security flags enabled
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
X-List-Received-Date: Wed, 26 Sep 2018 21:47:10 -0000
Content-Type: multipart/alternative; boundary="0000000000002af1d70576cd2afb"

--0000000000002af1d70576cd2afb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 26, 2018 at 2:25 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m>
wrote:

> Hi,
>
> from oe-core perspective my images are build on sumo (glibc 2.27). To
> see what to expect, I enabled security flags (and yes some recipes in
> my layers needed rework).
>
> Now that I have an image, I thought: let's give it a run. Apart of
> other issues (maybe later) I get on every startup an error message for
> ldconfig.
> systemctl ldconfig says:
>
> =E2=97=8F ldconfig.service - Rebuild Dynamic Linker Cache
>    Loaded: loaded (/lib/systemd/system/ldconfig.service; static;
> vendor preset: enabled)
>    Active: failed (Result: core-dump) since Mon 2018-09-24 19:05:04
> UTC; 2 days ago
>      Docs: man:ldconfig(8)
>   Process: 136 ExecStart=3D/sbin/ldconfig -X (code=3Ddumped, signal=3DSEG=
V)
>  Main PID: 136 (code=3Ddumped, signal=3DSEGV)
>
> Sep 24 19:05:04 raspberrypi3 systemd[1]: Starting Rebuild Dynamic
> Linker Cache...
> Sep 24 19:05:04 raspberrypi3 systemd[1]: ldconfig.service: Main
> process exited, code=3Ddumped, status=3D11/SEGV
> Sep 24 19:05:04 raspberrypi3 systemd[1]: ldconfig.service: Failed with
> result 'core-dump'.
> Sep 24 19:05:04 raspberrypi3 systemd[1]: Failed to start Rebuild
> Dynamic Linker Cache.
>
> Again somebody else seeing similar / remembers a fix?
>

I see similar issue in sumo as well
I do use security flags too and was not sure if that was the reason I think
its a good data point
Sadly I don=E2=80=99t yet have looked into the issue in detail

>
> Help appreciated
>
> Andreas
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000002af1d70576cd2afb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed,=
 Sep 26, 2018 at 2:25 PM Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitze=
ltony@gmail.com">schnitzeltony@gmail.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">Hi,<br>
<br>
from oe-core perspective my images are build on sumo (glibc 2.27). To<br>
see what to expect, I enabled security flags (and yes some recipes in<br>
my layers needed rework).<br>
<br>
Now that I have an image, I thought: let&#39;s give it a run. Apart of<br>
other issues (maybe later) I get on every startup an error message for<br>
ldconfig.<br>
systemctl ldconfig says:<br>
<br>
=E2=97=8F ldconfig.service - Rebuild Dynamic Linker Cache<br>
=C2=A0 =C2=A0Loaded: loaded (/lib/systemd/system/ldconfig.service; static;<=
br>
vendor preset: enabled)<br>
=C2=A0 =C2=A0Active: failed (Result: core-dump) since Mon 2018-09-24 19:05:=
04<br>
UTC; 2 days ago<br>
=C2=A0 =C2=A0 =C2=A0Docs: man:ldconfig(8)<br>
=C2=A0 Process: 136 ExecStart=3D/sbin/ldconfig -X (code=3Ddumped, signal=3D=
SEGV)<br>
=C2=A0Main PID: 136 (code=3Ddumped, signal=3DSEGV)<br>
<br>
Sep 24 19:05:04 raspberrypi3 systemd[1]: Starting Rebuild Dynamic<br>
Linker Cache...<br>
Sep 24 19:05:04 raspberrypi3 systemd[1]: ldconfig.service: Main<br>
process exited, code=3Ddumped, status=3D11/SEGV<br>
Sep 24 19:05:04 raspberrypi3 systemd[1]: ldconfig.service: Failed with<br>
result &#39;core-dump&#39;.<br>
Sep 24 19:05:04 raspberrypi3 systemd[1]: Failed to start Rebuild<br>
Dynamic Linker Cache.<br>
<br>
Again somebody else seeing similar / remembers a fix?<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I see similar is=
sue in sumo as well=C2=A0</div><div dir=3D"auto">I do use security flags to=
o and was not sure if that was the reason I think its a good data point=C2=
=A0</div><div dir=3D"auto">Sadly I don=E2=80=99t yet have looked into the i=
ssue in detail=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Help appreciated<br>
<br>
Andreas<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--0000000000002af1d70576cd2afb--

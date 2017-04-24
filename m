Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id B8CF877A8A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 14:18:08 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id u75so21162884qka.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 07:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=w243FZS7NY1DzWwWLsye5M0HSNQjxHgmV6xQvLjMTt8=;
	b=w/9PhegeVdSMm0kqHQ18EVJqIC+SMRRCm/BPFS5P7lpD6qTlw5QVW5xFuVsm/s5RNZ
	3zXt2tABewmZfHxrW1BPCtBd5gm16/ZpOh/SLQ6JJ42rsgPiUBDqyTtihVBku30GYfZ3
	BbtwLWCy0kv/cyRhmwtZ1j/xFud+5OtHkQmleseKHFMw3EI7o2oEcnDlZ/EMzBLlBCeJ
	TnuT2bH2wiDqN4ViFnrmNIz4iLXINzGNgFIVTY5oMhkM5CJUZnTnz+WIFFl7AhN/jC+E
	b5B26ylsr1Mc9Gr/4/heUmlxJSwy5c8hRqJ6VOjWM0Iad2LoRmXk9aTmUeW2o+K5GXlV
	0tpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=w243FZS7NY1DzWwWLsye5M0HSNQjxHgmV6xQvLjMTt8=;
	b=QQtY0+SU7GWceW5mepvvfXM7REnDQn1gtdgbuDRywyKiLOXHIGy+qCirgvj80weAJh
	E8rCwZCPHRxRTIZWPHQe7mULW0CgALztKhTpwkQ45s44jU8+uys1zsfGfYRxAJWmj/YU
	AN/t1yOQJ+fdzlBLnrjtUbg6zLFiRly4oDQ4RQzB07B0KeC21clpUctXrPGoPfq26cb3
	4SYCsvwxudugfUiSLSapNisfufJbq9MuUrY0ihIBJK1UauXTv5Ezb12MjduHqN3LQO9q
	70Z53kgiMyFhUeLCM9UZTdJYqjhy9I+onhMiQASFGPEXM7mW4M/8GYz4BpPZPP26e/me
	HqNw==
X-Gm-Message-State: AN3rC/7SOT+HgB8F+9ixHPnsOJs1x5rmNfMTahl/MGWs91TO+wAjyzE2
	ERasU/HDGSdNDWj2FkEhczKjKuJ2UAVb
X-Received: by 10.55.214.208 with SMTP id p77mr27321464qkl.121.1493043489740; 
	Mon, 24 Apr 2017 07:18:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 24 Apr 2017 07:17:49 -0700 (PDT)
In-Reply-To: <CALxi_JEEcpVbqSuaUbqd-GrNw7jdn2JU196tofw3jYHtowhMGw@mail.gmail.com>
References: <CALxi_JEEcpVbqSuaUbqd-GrNw7jdn2JU196tofw3jYHtowhMGw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Apr 2017 15:17:49 +0100
Message-ID: <CAJTo0LbK23V+To_EhP_jOT89a5Uz+TPSqaiCax-tGXz5HyZ2qg@mail.gmail.com>
To: david bensoussan <minipada@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Add LAPACK/ATLAS/BLAS library to OE-CORE
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
X-List-Received-Date: Mon, 24 Apr 2017 14:18:09 -0000
Content-Type: multipart/alternative; boundary=001a1149d4f8d73112054dea46af

--001a1149d4f8d73112054dea46af
Content-Type: text/plain; charset=UTF-8

On 24 April 2017 at 14:36, david bensoussan <minipada@gmail.com> wrote:

> What do you think of this? Should I go for it this way?
>

That's probably the only way of making it work in the short term, but I
wouldn't recommend attempting to merge the recipes into oe-core as they're
not general purpose enough.

You'd be better off convincing them to allow cross-compilation: unless
they've got a really weird setup just allowing the user to tell it what the
target architecture is and skipping the probing should work.

Ross

--001a1149d4f8d73112054dea46af
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 April 2017 at 14:36, david bensoussan <span dir=3D"ltr">&lt;<a href=
=3D"mailto:minipada@gmail.com" target=3D"_blank">minipada@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div>What do you think of =
this? Should I go for it this way?<br></div></blockquote></div><br>That&#39=
;s probably the only way of making it work in the short term, but I wouldn&=
#39;t recommend attempting to merge the recipes into oe-core as they&#39;re=
 not general purpose enough.</div><div class=3D"gmail_extra"><br></div><div=
 class=3D"gmail_extra">You&#39;d be better off convincing them to allow cro=
ss-compilation: unless they&#39;ve got a really weird setup just allowing t=
he user to tell it what the target architecture is and skipping the probing=
 should work.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail=
_extra">Ross</div></div>

--001a1149d4f8d73112054dea46af--

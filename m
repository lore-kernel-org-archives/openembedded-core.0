Return-Path: <kergoth@gmail.com>
Received: from mail-yb0-f194.google.com (mail-yb0-f194.google.com
	[209.85.213.194])
	by mail.openembedded.org (Postfix) with ESMTP id D615C65D00
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 16:00:44 +0000 (UTC)
Received: by mail-yb0-f194.google.com with SMTP id v78so7173109ybe.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 08:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=LT4TFcVtZGZ11P3kwN7BmP5i6uWc+HLbD1gx1wk2Kww=;
	b=E4SJ1w52BkfWyVOnYz/9vQNcC1W0n9Sx0s7TmGV6nXlwhRCArMBIaBp7FiATkbJbSk
	DwyjZUJcYCD6HDxTJ65uyfiFahHzlFDxewpEO4zkSImQvjum+mHdMpZAod9voPcJW9Wz
	3r+vTaDok6aICcPZYX65iLjn976RoxaZBJC1lKxfmUATJOW+FJgCz+MMar/mSFQLi6kB
	+wUIXQb7NqMLPWKvA1YorQRevwOeASbQ79ddCzIzLzefUcJwbDrKiKs0w4Q02lOgXevd
	jtVUgbi/IUOdt7M8HTxLoCi6yABeGIFx4axiigWqGIpMvkDa69L6LoDPGlAKfu4/1FvH
	6fpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=LT4TFcVtZGZ11P3kwN7BmP5i6uWc+HLbD1gx1wk2Kww=;
	b=fnqwK/cDKirXoxMmWSBjmOtvIv2N0JzaXfUQZcYJuceVDxCdlvePR/MP8W6GABMyIS
	s8n+XOKM9SkhdaUwqYp4h0y17ly4rPFqP7a4lGRYG1S8vaxWJ2N08yvIoX7wjMdWUxsz
	Yva/Dqsnu9PgOIJLrtkDVyIaHYC5NLAXWIcNdlN04cnzOghCPIAdRwsqJCLoUNV3c60N
	/Oq8XfW2R3qrJ3dAHJxgVpYrZFb5qyD4Ua78nlKqJRK3iwiM4c0q09VF9i2dOUk8hfp1
	OR8Nfc1KNYSYE6pRkii8lUx76zCMP6tTazDF88XWQBUYqK4ppNz1pZSFI2wWt2FvVfZt
	sHXQ==
X-Gm-Message-State: ABUngvdMqRQItrNzaXClg0A98HEnfnj0zy9Ys+/h6mBShAOpminoTGJeKV05kCMmvBThN0GAvAbyZSNhzPyCyw==
X-Received: by 10.157.3.143 with SMTP id f15mr1668540otf.150.1479398446322;
	Thu, 17 Nov 2016 08:00:46 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.35.65 with HTTP; Thu, 17 Nov 2016 08:00:25 -0800 (PST)
In-Reply-To: <1479396394-26134-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1479396394-26134-1-git-send-email-fabio.berton@ossystems.com.br>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 17 Nov 2016 09:00:25 -0700
X-Google-Sender-Auth: v0FFKsvApMTFB4PFIcWWyopDcMM
Message-ID: <CABcZANmh+pV4Xxwi2UY7fA+BctpVXRvM6gLcgMJEx-rwODMi4g@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libpcap: Fix build when PACKAGECONFIG ipv6 is not enable
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
X-List-Received-Date: Thu, 17 Nov 2016 16:00:46 -0000
Content-Type: multipart/alternative; boundary=94eb2c03b022dfd8c60541814ab7

--94eb2c03b022dfd8c60541814ab7
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 17, 2016 at 8:26 AM, Fabio Berton <fabio.berton@ossystems.com.br
> wrote:

> Add patches to fix error:
> /
> | ERROR: oe_runmake failed
> | config.status: creating pcap-config.tmp
> | mv pcap-config.tmp pcap-config
> | chmod a+x pcap-config
> | ../libpcap-1.8.1/gencode.c: In function 'pcap_compile':
> | ../libpcap-1.8.1/gencode.c:693:8: error: 'compiler_state_t
> | {aka struct _compiler_state}' has no member named 'ai'
> |   cstate.ai = NULL;
> |         ^
> | ../libpcap-1.8.1/gencode.c: In function 'gen_gateway':
> | ../libpcap-1.8.1/gencode.c:4914:13: error: 'cstate' undeclared
> | (first use in this function)
> |    bpf_error(cstate, "direction applied to 'gateway'");
> |              ^~~~~~
> | ../libpcap-1.8.1/gencode.c:4914:13: note: each undeclared identifier is
> | reported only once for each function it appears in
> \
>
> Patches were submitted to upstream [1]
>
> [1] https://github.com/the-tcpdump-group/libpcap/pull/541
>
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
>

This is fairly common, but afaik the Upstream-Status is an artifact of the
patch, not the commit that generated the patch, so belongs outside (above)
the commit message in the patch file.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--94eb2c03b022dfd8c60541814ab7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Nov 17, 2016 at 8:26 AM, Fabio Berton <span dir=3D"ltr">&lt;<a href=
=3D"mailto:fabio.berton@ossystems.com.br" target=3D"_blank">fabio.berton@os=
systems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
 id=3D":1a6" class=3D"a3s aXjCH m15872fe1605e2248">Add patches to fix error=
:<br>
/<br>
| ERROR: oe_runmake failed<br>
| config.status: creating pcap-config.tmp<br>
| mv pcap-config.tmp pcap-config<br>
| chmod a+x pcap-config<br>
| ../libpcap-1.8.1/gencode.c: In function &#39;pcap_compile&#39;:<br>
| ../libpcap-1.8.1/gencode.c:<wbr>693:8: error: &#39;compiler_state_t<br>
| {aka struct _compiler_state}&#39; has no member named &#39;ai&#39;<br>
|=C2=A0 =C2=A0<a href=3D"http://cstate.ai" rel=3D"noreferrer" target=3D"_bl=
ank">cstate.ai</a> =3D NULL;<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
| ../libpcap-1.8.1/gencode.c: In function &#39;gen_gateway&#39;:<br>
| ../libpcap-1.8.1/gencode.c:<wbr>4914:13: error: &#39;cstate&#39; undeclar=
ed<br>
| (first use in this function)<br>
|=C2=A0 =C2=A0 bpf_error(cstate, &quot;direction applied to &#39;gateway&#3=
9;&quot;);<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~<br>
| ../libpcap-1.8.1/gencode.c:<wbr>4914:13: note: each undeclared identifier=
 is<br>
| reported only once for each function it appears in<br>
\<br>
<br>
Patches were submitted to upstream [1]<br>
<br>
[1] <a href=3D"https://github.com/the-tcpdump-group/libpcap/pull/541" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/the-<wbr>tcpdump-group=
/libpcap/pull/541</a><br>
<br>
Signed-off-by: Fabio Berton &lt;<a href=3D"mailto:fabio.berton@ossystems.co=
m.br">fabio.berton@ossystems.com.br</a><wbr>&gt;</div></blockquote></div><b=
r>This is fairly common, but afaik the Upstream-Status is an artifact of th=
e patch, not the commit that generated the patch, so belongs outside (above=
) the commit message in the patch file.<br>-- <br><div class=3D"gmail_signa=
ture" data-smartmail=3D"gmail_signature">Christopher Larson<br>clarson at k=
ergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer=
 - Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--94eb2c03b022dfd8c60541814ab7--

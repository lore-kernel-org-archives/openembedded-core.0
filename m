Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 9505F6059E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 16:12:00 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id t79so154777167wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 08:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4ObTDrd9Pf3dwhqfSyBYjGbE23/vzhaPXpu+hAm+Qqs=;
	b=cjFDX8PVdzdOPAZfsdWQwf0TUsECQ1qTU5/tCkVeaG9aq1S94EGHLb5mpJo6DyHYvL
	LSRrlFE7UrSWog9KQPu1NZt76a9sOLls1tDuB+JyPIQ8gCnIxe70SZ53Vsi7xf50nKVD
	H/E/WWffnWMb24b8y8yQoJxk6IFAxDqdN847HJCYXBbC9uslBrjnHM8j49gBb15PVs+g
	BTelcymmLePAO5Y6p9+9CnbFlZQxvrA4BgmlaVeblVgFOdjvAIecTrdYDG2obwiMKAqM
	PkssmF0CvgeHYjiUwdvEqs6N4z+Sh2gWPBeUtbou6ur4jGonQFQAxFNGLLOHGuPK1Nd5
	/XpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4ObTDrd9Pf3dwhqfSyBYjGbE23/vzhaPXpu+hAm+Qqs=;
	b=gz98KP74jbOK75laffF7DbuzbZ+/j7PeNTCfUmcBatd1n/FgHKPIMx40h0okgwjXpv
	T4RkP9Ygl6sYW6rZsoEPOqRhPfat7wRvE68zGDG8lrg6QmWEcq6gNx6SKE33OJrPacSB
	Vce8S3hXkpaxT3Z+YmrUEYnEdguDpDLvf5M8IHjjvuLEGgnaEq4b+pX/EOpUruEw4sX9
	w3AZr8UrRzw0csMDX8JRbEYIapfmSd1CCMDHSvQDLHi59MnGe6sWRHwcy5FUlQgB8pJm
	pJUDVWtdIOVy97ZpddulH198mY79FNEsWxQoLSuvAxbP4ERawkJsN354nE0mKkUXNny1
	T1PA==
X-Gm-Message-State: ABUngveR00XgGHKo7MafVNaC2ODH15bjJ3NF77aNASVj+zKSdUB9iUAT6fRhwHlKkcrsIQ/LByo6KYhSsSQZZw==
X-Received: by 10.25.169.137 with SMTP id s131mr702510lfe.54.1479399121002;
	Thu, 17 Nov 2016 08:12:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.40.6 with HTTP; Thu, 17 Nov 2016 08:11:30 -0800 (PST)
X-Originating-IP: [181.220.123.3]
In-Reply-To: <CABcZANmh+pV4Xxwi2UY7fA+BctpVXRvM6gLcgMJEx-rwODMi4g@mail.gmail.com>
References: <1479396394-26134-1-git-send-email-fabio.berton@ossystems.com.br>
	<CABcZANmh+pV4Xxwi2UY7fA+BctpVXRvM6gLcgMJEx-rwODMi4g@mail.gmail.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Thu, 17 Nov 2016 14:11:30 -0200
Message-ID: <CAAPZna2pDLyq6PH6sb8c0J_Bxa2Pi+FNNZw_tVJ38o90mGsEJw@mail.gmail.com>
To: Christopher Larson <clarson@kergoth.com>
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
X-List-Received-Date: Thu, 17 Nov 2016 16:12:01 -0000
Content-Type: multipart/alternative; boundary=001a11407f5416c7d005418173d2

--001a11407f5416c7d005418173d2
Content-Type: text/plain; charset=UTF-8

Hi Chistopher,

Patches in this commit have Upstream-Status: Submitted tag.

Thanks.

On Thu, Nov 17, 2016 at 2:00 PM, Christopher Larson <clarson@kergoth.com>
wrote:

>
> On Thu, Nov 17, 2016 at 8:26 AM, Fabio Berton <
> fabio.berton@ossystems.com.br> wrote:
>
>> Add patches to fix error:
>> /
>> | ERROR: oe_runmake failed
>> | config.status: creating pcap-config.tmp
>> | mv pcap-config.tmp pcap-config
>> | chmod a+x pcap-config
>> | ../libpcap-1.8.1/gencode.c: In function 'pcap_compile':
>> | ../libpcap-1.8.1/gencode.c:693:8: error: 'compiler_state_t
>> | {aka struct _compiler_state}' has no member named 'ai'
>> |   cstate.ai = NULL;
>> |         ^
>> | ../libpcap-1.8.1/gencode.c: In function 'gen_gateway':
>> | ../libpcap-1.8.1/gencode.c:4914:13: error: 'cstate' undeclared
>> | (first use in this function)
>> |    bpf_error(cstate, "direction applied to 'gateway'");
>> |              ^~~~~~
>> | ../libpcap-1.8.1/gencode.c:4914:13: note: each undeclared identifier is
>> | reported only once for each function it appears in
>> \
>>
>> Patches were submitted to upstream [1]
>>
>> [1] https://github.com/the-tcpdump-group/libpcap/pull/541
>>
>> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
>>
>
> This is fairly common, but afaik the Upstream-Status is an artifact of the
> patch, not the commit that generated the patch, so belongs outside (above)
> the commit message in the patch file.
> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
>

--001a11407f5416c7d005418173d2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace;font-size:small">Hi Chistopher,<br><br></div><div class=3D"gmai=
l_default" style=3D"font-family:monospace,monospace;font-size:small">Patche=
s in this commit have Upstream-Status: Submitted tag.<br><br></div><div cla=
ss=3D"gmail_default" style=3D"font-family:monospace,monospace;font-size:sma=
ll">Thanks.<br></div></div><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On Thu, Nov 17, 2016 at 2:00 PM, Christopher Larson <span dir=3D"=
ltr">&lt;<a href=3D"mailto:clarson@kergoth.com" target=3D"_blank">clarson@k=
ergoth.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr"><div class=3D"gmail_extra"><span class=3D""><br><div class=3D"gmai=
l_quote">On Thu, Nov 17, 2016 at 8:26 AM, Fabio Berton <span dir=3D"ltr">&l=
t;<a href=3D"mailto:fabio.berton@ossystems.com.br" target=3D"_blank">fabio.=
berton@ossystems.com.br</a><wbr>&gt;</span> wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex"><div id=3D"m_4271526278090447355:1a6" class=3D"m_4271526278090447=
355a3s m_4271526278090447355aXjCH m_4271526278090447355m15872fe1605e2248">A=
dd patches to fix error:<br>
/<br>
| ERROR: oe_runmake failed<br>
| config.status: creating pcap-config.tmp<br>
| mv pcap-config.tmp pcap-config<br>
| chmod a+x pcap-config<br>
| ../libpcap-1.8.1/gencode.c: In function &#39;pcap_compile&#39;:<br>
| ../libpcap-1.8.1/gencode.c:693<wbr>:8: error: &#39;compiler_state_t<br>
| {aka struct _compiler_state}&#39; has no member named &#39;ai&#39;<br>
|=C2=A0 =C2=A0<a href=3D"http://cstate.ai" rel=3D"noreferrer" target=3D"_bl=
ank">cstate.ai</a> =3D NULL;<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
| ../libpcap-1.8.1/gencode.c: In function &#39;gen_gateway&#39;:<br>
| ../libpcap-1.8.1/gencode.c:491<wbr>4:13: error: &#39;cstate&#39; undeclar=
ed<br>
| (first use in this function)<br>
|=C2=A0 =C2=A0 bpf_error(cstate, &quot;direction applied to &#39;gateway&#3=
9;&quot;);<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~<br>
| ../libpcap-1.8.1/gencode.c:491<wbr>4:13: note: each undeclared identifier=
 is<br>
| reported only once for each function it appears in<br>
\<br>
<br>
Patches were submitted to upstream [1]<br>
<br>
[1] <a href=3D"https://github.com/the-tcpdump-group/libpcap/pull/541" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/the-tcpdump<wbr>-group=
/libpcap/pull/541</a><br>
<br>
Signed-off-by: Fabio Berton &lt;<a href=3D"mailto:fabio.berton@ossystems.co=
m.br" target=3D"_blank">fabio.berton@ossystems.com.br</a><wbr>&gt;</div></b=
lockquote></div><br></span>This is fairly common, but afaik the Upstream-St=
atus is an artifact of the patch, not the commit that generated the patch, =
so belongs outside (above) the commit message in the patch file.<span class=
=3D"HOEnZb"><font color=3D"#888888"><br>-- <br><div class=3D"m_427152627809=
0447355gmail_signature" data-smartmail=3D"gmail_signature">Christopher Lars=
on<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZa=
urus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics</di=
v>
</font></span></div></div>
</blockquote></div><br></div>

--001a11407f5416c7d005418173d2--

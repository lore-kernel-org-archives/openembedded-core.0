Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id AC14777D30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 07:44:20 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id k22so2643456iod.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 00:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zAxCKS/AS+nzrMgPsrRqL6cRK23DJClDnMxfY8Bpcps=;
	b=efv3ntjzvUBoC/i/QN9teroPeWtGMmNt3hn0tnLmaIyBD0Uq4PaZT5MvXlO3VAAR6i
	CWOMEE1GgzLdNwVXIfTOd3NWobG9NoPfENUjsS0lPBwmfZBC0Qli71JjsAXIaHbFZkQw
	i909ZfaAWoCo4ZJTusveY7EeXIgZBrx5vRV58fzkZ17CFHneMoiZJZVWi89RCQBeIWZT
	uZ1vtnscBAHf59bFifA0emc9CYaFlIucj7g3NdWJOHVyaFL2QSqKjGg/l8zKsU/PaCiB
	fX31EQf2SvI1aV/IqL6LAcRw+Oo0uRjkvykU1l/lyxHg3X6X+z1ARuBbJO4D9CdwrUek
	1nnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zAxCKS/AS+nzrMgPsrRqL6cRK23DJClDnMxfY8Bpcps=;
	b=r7JuUE4rHGA2aBdhFVaCtKnn/CrNEVIXm/qjMKw4K1PsewqXb8fFPUiVaTSprFsyg3
	Y62qrSbgM0pTalADHWZOJ+m2iKurQfsHYOBxOSrLxi/yljqQGhKZSsjlAtloDay9ToAH
	rbmt2E2wfl6arGfnAB8RTp3G4g+wRnoIT27+BI39xJ8ddyRK0ZFabJVmTmjiI7/gNLJH
	evNTm73ggE4SvDdy/Zg461PQIakowN3KkWRQXgyqE+QYerJfCHTBHPCKAsQ4Mo2JdNsB
	szegeo1YR7ej1czpLVyt9uvAxEOBeojYveNfhCPNkaqzwWBBcOtycF9jgyqoQrussexE
	s/mg==
X-Gm-Message-State: AHPjjUiBF2eT4fv9ERUYrbMnzMXwGNSljPRIDMfX/78XhdPJkLTjjfL3
	YXwA80xFzdXlR6DKkox0BZH+ipiW4E2c
X-Received: by 10.107.15.142 with SMTP id 14mr497754iop.203.1504079061611;
	Wed, 30 Aug 2017 00:44:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.215 with HTTP; Wed, 30 Aug 2017 00:43:50 -0700 (PDT)
In-Reply-To: <4366abb5-d116-03dc-eae6-7af98965d288@windriver.com>
References: <1503991517-3965-1-git-send-email-yi.zhao@windriver.com>
	<1503991517-3965-2-git-send-email-yi.zhao@windriver.com>
	<CAJTo0LazwJDfbXnnoLPiMH3+yqDFHm_nHJs=66nm8Ygkqf11cw@mail.gmail.com>
	<4366abb5-d116-03dc-eae6-7af98965d288@windriver.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 30 Aug 2017 10:43:50 +0300
Message-ID: <CAHiDW_HXpZOhODj0=0xyV9EJLdYcO-g4e-Cye3U-vzNSiWMjcQ@mail.gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] iproute2: enable build tipc by default
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
X-List-Received-Date: Wed, 30 Aug 2017 07:44:20 -0000
Content-Type: multipart/alternative; boundary="001a113eecc22e983f0557f3b29b"

--001a113eecc22e983f0557f3b29b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 30 August 2017 at 03:35, Yi Zhao <yi.zhao@windriver.com> wrote:

>
>
> =E5=9C=A8 2017=E5=B9=B408=E6=9C=8830=E6=97=A5 00:13, Burton, Ross =E5=86=
=99=E9=81=93:
>
> On 29 August 2017 at 08:25, Yi Zhao <yi.zhao@windriver.com> wrote:
>
>> -PACKAGECONFIG ??=3D ""
>> -PACKAGECONFIG[tipc] =3D ",,libmnl,"
>>
>
> Surely it would be a lot better to just add tipc to the default
> PACKAGECONFIG, so this support and dependencies can be turned off if
> required?
>
>
> There is no easy way to turn off the support with this patch. User should
> remove tipc from EXTRA_OEMAKE manually.
> The package isn't installed to rootfs by default if no package requires i=
t.
>

The question is why not leave the PACKAGECONFIG there so there would be an
easy way to turn it off?

Jussi

--001a113eecc22e983f0557f3b29b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 3=
0 August 2017 at 03:35, Yi Zhao <span dir=3D"ltr">&lt;<a href=3D"mailto:yi.=
zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF"><span class=3D"">
    <p><br>
    </p>
    <br>
    <div class=3D"m_-2270919719305798428moz-cite-prefix">=E5=9C=A8 2017=E5=
=B9=B408=E6=9C=8830=E6=97=A5 00:13, Burton, Ross =E5=86=99=E9=81=93:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">On 29 August 2017 at 08:25, Yi Zhao <span dir=3D"ltr=
">&lt;<a href=3D"mailto:yi.zhao@windriver.com" target=3D"_blank">yi.zhao@wi=
ndriver.com</a>&gt;</span>
        wrote:
        <div class=3D"gmail_extra">
          <div class=3D"gmail_quote">
            <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
              -PACKAGECONFIG ??=3D &quot;&quot;<br>
              -PACKAGECONFIG[tipc] =3D &quot;,,libmnl,&quot;<br>
            </blockquote>
            <div><br>
            </div>
            <div>Surely it would be a lot better to just add tipc to the
              default PACKAGECONFIG, so this support and dependencies
              can be turned off if required?</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br></span>
    There is no easy way to turn off the support with this patch. User
    should remove tipc from EXTRA_OEMAKE manually.<br>
    The package isn&#39;t installed to rootfs by default if no package
    requires it.<br></div></blockquote><div><br></div><div>The question is =
why not leave the PACKAGECONFIG there so there would be an easy way to turn=
 it off?=C2=A0</div><div><br></div><div>Jussi</div></div></div></div>

--001a113eecc22e983f0557f3b29b--

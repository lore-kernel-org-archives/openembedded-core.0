Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8D9616011B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 12:47:18 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id p21so176012qke.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 05:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YoKlfxNnlFIcLxxeLIUUZhfqaTKhdNhEeBaHPRbQQuA=;
	b=uGoX78leU6gMKoWFwwWjRdFPZ4/nViEskaDwNzcIFTu0xHY+Wrw4U+TWglCoFNPkEm
	oHphtwLfNazCq2TCM4UzI2KiMv0mlbiYuPTaJ2M41Tx4VXYrUZea9RAqL+taNgXMTo4y
	6EKWTPQ+vxdqf3LrptJGp7FN3n+/7qn1ArASIHSHYAkF8VXdYgfoOQknIqANZO9a1cWH
	IGELfTlQ9ZjJuq0yGxRv1xofYmvJO1S5oQ64YRAbkNx6wIVTo/GsB1DD7ENiS2A21Gr4
	Wq0KtX00pRP/s399Rey15dwvpBZF15VLnFeopA3xhaSgbKYK/7wwcnvND1V8U9/KlVoG
	TEyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YoKlfxNnlFIcLxxeLIUUZhfqaTKhdNhEeBaHPRbQQuA=;
	b=YGbz3fE4muzIZSIhLNHb6Rwfu+ITiwx4n8fQUSRI0hBZtyeCaCaNEZJXqbeFpj8E/3
	MssUJ6e08SCoQquQqI5Rc0aMCdldojVmRA9SsXtRe4ToCg8qxZT1J7/izO2s05VVCTvL
	QJhAGxjrn6v35kfK6NnyFOnpSKoNQtleJN1NviwNHAmJngqzh0PPFXzN0o/pdjkY2Nwg
	d5+l/5DQcaq5NMuxf46FxVsGjSa38i+Z8JxA8pFECm9AtVuE9D30aSBXMMdu6SaudAdm
	D11VLaV8BdrPc0Q9uR4LthNZqfPggECAJezl51f9amIIhLnnG1af/Ad4/NnhDjDoxQuC
	3aWA==
X-Gm-Message-State: AKS2vOxecvZV8ye90J4xF0Y5uPJLNjr4vKLPdtUnl5UX7TJ0Lb+xobuM
	orSdpZlnCzGEFRvrEWmZamqS33vRg6o+
X-Received: by 10.55.120.69 with SMTP id t66mr13907265qkc.171.1498481240271;
	Mon, 26 Jun 2017 05:47:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.31.118 with HTTP; Mon, 26 Jun 2017 05:46:59 -0700 (PDT)
In-Reply-To: <a2f5de2a-eab8-ae39-cb2f-d54867def27a@yadro.com>
References: <56128a61-8244-9586-0fef-2cead1dd97d7@yadro.com>
	<CAJTo0Lb55gNRVebzugqaaEY7tbhSUG3+1NBrsEfw-7VZW_Vv+A@mail.gmail.com>
	<a2f5de2a-eab8-ae39-cb2f-d54867def27a@yadro.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 26 Jun 2017 13:46:59 +0100
Message-ID: <CAJTo0LaHyV2TnS8ePj7V0oidenTweVQTmLgMvfu8D6NZ=7DYDw@mail.gmail.com>
To: Anton Novikov <a.novikov@yadro.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] (master) automake: fix Perl regex
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
X-List-Received-Date: Mon, 26 Jun 2017 12:47:20 -0000
Content-Type: multipart/alternative; boundary="94eb2c0665cc0780360552dc5a40"

--94eb2c0665cc0780360552dc5a40
Content-Type: text/plain; charset="UTF-8"

Actually looked at the patch: this has been fixed in master since
oe-core 7fa044e799db651d45e4732e2527acfc2bc7cd47, which was committed in
May.

Ross

On 26 June 2017 at 13:39, Anton Novikov <a.novikov@yadro.com> wrote:

> Please reword it at will.
>
> Thanks,
>
> Anton
>
> On 06/26/2017 03:37 PM, Burton, Ross wrote:
>
> The subject needs to be of the form:
>
>   automake: fix perl regex for Perl 5.22 onwards
>
> Also the Upstream-Status can be set to Backport as this is sha 13f00eb4
> upstream.
>
> Cheers,
> Ross
>
> On 21 June 2017 at 09:55, Anton Novikov <a.novikov@yadro.com> wrote:
>
>> Thanks,
>>
>> Anton
>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>
>

--94eb2c0665cc0780360552dc5a40
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Actually looked at the patch: this has been fixed in maste=
r since oe-core=C2=A07fa044e799db651d45e4732e2527acfc2bc7cd47, which was co=
mmitted in May.<div><br></div><div>Ross</div></div><div class=3D"gmail_extr=
a"><br><div class=3D"gmail_quote">On 26 June 2017 at 13:39, Anton Novikov <=
span dir=3D"ltr">&lt;<a href=3D"mailto:a.novikov@yadro.com" target=3D"_blan=
k">a.novikov@yadro.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF">
    <p>Please reword it at will.</p>
    <p>Thanks,</p>
    <p>Anton<br>
    </p><div><div class=3D"h5">
    <br>
    <div class=3D"m_-6241998707143344283moz-cite-prefix">On 06/26/2017 03:3=
7 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">The subject needs to be of the form:
        <div><br>
        </div>
        <div>=C2=A0 automake: fix perl regex for Perl 5.22 onwards</div>
        <div><br>
        </div>
        <div>Also the Upstream-Status can be set to Backport as this is
          sha=C2=A013f00eb4 upstream.</div>
        <div><br>
        </div>
        <div>Cheers,</div>
        <div>Ross</div>
      </div>
      <div class=3D"gmail_extra"><br>
        <div class=3D"gmail_quote">On 21 June 2017 at 09:55, Anton Novikov
          <span dir=3D"ltr">&lt;<a href=3D"mailto:a.novikov@yadro.com" targ=
et=3D"_blank">a.novikov@yadro.com</a>&gt;</span>
          wrote:<br>
          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">Thanks,<br>
            <br>
            Anton<br>
            <br>
            <br>
            --<br>
            ______________________________<wbr>_________________<br>
            Openembedded-core mailing list<br>
            <a href=3D"mailto:Openembedded-core@lists.openembedded.org" tar=
get=3D"_blank">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
            <a href=3D"http://lists.openembedded.org/mailman/listinfo/opene=
mbedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedde=
d.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
            <br>
          </blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <br>
  </div></div></div>

</blockquote></div><br></div>

--94eb2c0665cc0780360552dc5a40--

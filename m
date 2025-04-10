Return-Path: <oe@myspectrum.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B5C7C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 18:33:05 +0000 (UTC)
Received: from outbound3.mail.transip.nl (outbound3.mail.transip.nl [136.144.136.12])
 by mx.groups.io with SMTP id smtpd.web10.5790.1744309982227470044
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 11:33:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@myspectrum.nl header.s=transip-a header.b=hYRzHWFA;
 spf=pass (domain: myspectrum.nl, ip: 136.144.136.12, mailfrom: oe@myspectrum.nl)
Received: from submission10.mail.transip.nl (unknown [10.103.8.161])
	by outbound3.mail.transip.nl (Postfix) with ESMTP id 4ZYT2g5fq8zbB7t;
	Thu, 10 Apr 2025 20:32:59 +0200 (CEST)
Received: from yellow.myspectrum.nl (unknown [IPv6:2a01:7c8:bb0c:45:5054:ff:fe01:854])
	by submission10.mail.transip.nl (Postfix) with ESMTPSA id 4ZYT2f5RGQz2nC0cg;
	Thu, 10 Apr 2025 20:32:58 +0200 (CEST)
Received: from [192.168.178.63] (84-27-20-154.cable.dynamic.v4.ziggo.nl [84.27.20.154])
	(Authenticated sender: oe@myspectrum.nl)
	by yellow.myspectrum.nl (Postfix) with ESMTPSA id 9E72120077;
	Thu, 10 Apr 2025 18:32:56 +0000 (UTC)
Authentication-Results: yellow.myspectrum.nl;
	auth=pass smtp.auth=oe@myspectrum.nl smtp.mailfrom=oe@myspectrum.nl
Content-Type: multipart/alternative;
 boundary="------------bmjVUfPu1ypMq2kSeAQwikil"
Message-ID: <8eee9b46-7e9a-4c1d-8daa-4e58a135d9eb@myspectrum.nl>
Date: Thu, 10 Apr 2025 20:32:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] udev-extraconf: fix ifupdown for non hotplug
 devices
To: yoann.congal@smile.fr, alex.kanavin@gmail.com
Cc: richard.purdie@linuxfoundation.org, Jeroen Hofstee
 <jeroen@myspectrum.nl>, openembedded-core@lists.openembedded.org,
 Jeroen Hofstee <jhofstee@victronenergy.com>
References: <20250407174904.1191173-1-jeroen@myspectrum.nl>
 <a0573ce7a2fe28ee7ec138194177c09dbc53283a.camel@linuxfoundation.org>
 <ecc77fe1-4e85-407c-aa6e-e4b8dcb6e96b@myspectrum.nl>
 <687a5c15fb54930b999cf16a59baaff8f9897a94.camel@linuxfoundation.org>
 <7eb23b12-1fd1-48a5-83cd-eab2edb8777b@myspectrum.nl>
 <CANNYZj-+Td=3EtykeKT3mEq-0c6Ue5EKQ9if_3OCY3TrxTPUJg@mail.gmail.com>
 <CAMSfU+4QKpU=2YaO8L03R+aBzByUq=x3h-sn8yy3rRCxX==YmQ@mail.gmail.com>
Content-Language: en-US
From: Jeroen Hofstee <oe@myspectrum.nl>
In-Reply-To: <CAMSfU+4QKpU=2YaO8L03R+aBzByUq=x3h-sn8yy3rRCxX==YmQ@mail.gmail.com>
X-Scanned-By: ClueGetter at submission10.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=myspectrum.nl; t=1744309978; h=from:subject:to:cc:
 references:in-reply-to:date:mime-version:content-type;
 bh=sJbCf9sNUDku2kJBelyMAwVmOIuEfgpFNg9t2aM535A=;
 b=hYRzHWFAiL9HESTPTMFR5Vavsc67u8XL8zeTc4PXjzB5gh5/2d6k0kJ4XsUOJivy2I2aPl
 4Q97EeFuCVkfFuHEFl/9Jbj9XaMn80GArSDtMWHJLpNPRdBP8WekPAUXsIy4bEE4Wb5lVl
 Jo0rVCeVc2vV/lwqiXhpKnp92gz9Yrw5ua2h0Voe9cMSODHPozIqBJQ9069Im/pKLNz65S
 LWBrADNFQOe6eCErIewRTM/s2mjjsuK2K37bWxCXDRkZiU7da/azJnKoqUloZ7Uim/5Hsv
 0D/GoDAd5ilWLEI1c9wBu63P/Urg8My8YDMecwqOthlqCEJdIJnsr7hhLZ4kQw==
X-Report-Abuse-To: abuse@transip.nl
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 18:33:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214690

This is a multi-part message in MIME format.
--------------bmjVUfPu1ypMq2kSeAQwikil
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hello Alex and Yoann,

On 4/10/25 14:17, Yoann Congal via lists.openembedded.org wrote:
> Le=C2=A0jeu. 10 avr. 2025 =C3=A0=C2=A012:14, Alexander Kanavin via=20
> lists.openembedded.org <http://lists.openembedded.org>=20
> <alex.kanavin=3Dgmail.com@lists.openembedded.org> a =C3=A9crit=C2=A0:
>
>     On Wed, 9 Apr 2025 at 12:40, Jeroen Hofstee via
>     lists.openembedded.org <http://lists.openembedded.org>
>     <oe=3Dmyspectrum.nl@lists.openembedded.org> wrote:
>     > For completeness, this is not some theoretical issue, always
>     calling if up
>     > directly after a network device is discovered does cause issues
>     and is
>     > against spec as well.
>     >
>     > The sed stuff isn't that complicated, is it?
>
>     I beg to differ. The code is basically unreadable (unless you want =
to
>     write an elaborate comment with example input->output transformatio=
ns
>     for every single line it), and that in itself is reason not to take
>     it. Any software solution must not only solve the problem, it must
>     also be written such that other humans can understand and change it=
.
>
>     I think I'd prefer a patch to busybox; even if upstream rejects or
>     ignores it, we still have something that is easier to take care of.
>
>
> FWIW, I agree with Alexander here.
> A patch (even a local one) will be easier to maintain in the long run.
>
Cool, let me know when these patches have landed.

Regards,
Jeroen
--------------bmjVUfPu1ypMq2kSeAQwikil
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>Hello Alex and Yoann,<br>
    </p>
    <div class=3D"moz-cite-prefix">On 4/10/25 14:17, Yoann Congal via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CAMSfU+4QKpU=3D2YaO8L03R+aBzByUq=3Dx3h-sn8yy3rRCxX=3D=3DYmQ@m=
ail.gmail.com">
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DU=
TF-8">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote gmail_quote_container">
          <div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 10 avr. 2025
            =C3=A0=C2=A012:14, Alexander Kanavin via <a
              href=3D"http://lists.openembedded.org"
              moz-do-not-send=3D"true">lists.openembedded.org</a>
            &lt;alex.kanavin=3D<a
              href=3D"mailto:gmail.com@lists.openembedded.org"
              moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">gm=
ail.com@lists.openembedded.org</a>&gt;
            a =C3=A9crit=C2=A0:<br>
          </div>
          <blockquote class=3D"gmail_quote"
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On
            Wed, 9 Apr 2025 at 12:40, Jeroen Hofstee via <a
              href=3D"http://lists.openembedded.org" rel=3D"noreferrer"
              target=3D"_blank" moz-do-not-send=3D"true">lists.openembedd=
ed.org</a><br>
            &lt;oe=3D<a href=3D"mailto:myspectrum.nl@lists.openembedded.o=
rg"
              target=3D"_blank" moz-do-not-send=3D"true"
              class=3D"moz-txt-link-freetext">myspectrum.nl@lists.openemb=
edded.org</a>&gt;
            wrote:<br>
            &gt; For completeness, this is not some theoretical issue,
            always calling if up<br>
            &gt; directly after a network device is discovered does
            cause issues and is<br>
            &gt; against spec as well.<br>
            &gt;<br>
            &gt; The sed stuff isn't that complicated, is it?<br>
            <br>
            I beg to differ. The code is basically unreadable (unless
            you want to<br>
            write an elaborate comment with example input-&gt;output
            transformations<br>
            for every single line it), and that in itself is reason not
            to take<br>
            it. Any software solution must not only solve the problem,
            it must<br>
            also be written such that other humans can understand and
            change it.<br>
            <br>
            I think I'd prefer a patch to busybox; even if upstream
            rejects or<br>
            ignores it, we still have something that is easier to take
            care of.<br>
          </blockquote>
          <div><br>
          </div>
          <div>FWIW, I agree with Alexander here.</div>
          <div>A patch (even a local one) will be easier to maintain in
            the long run.</div>
          <div>=C2=A0</div>
          <br>
        </div>
      </div>
    </blockquote>
    Cool, let me know when these patches have landed.<br>
    <br>
    Regards,<br>
    Jeroen<br>
  </body>
</html>

--------------bmjVUfPu1ypMq2kSeAQwikil--


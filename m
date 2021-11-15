Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57DE1C433F5
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 20:56:44 +0000 (UTC)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com
 [209.85.221.174])
 by mx.groups.io with SMTP id smtpd.web09.497.1637009803677295018
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 12:56:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eYS59xd2;
 spf=pass (domain: gmail.com, ip: 209.85.221.174,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f174.google.com with SMTP id q21so1402561vkn.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 12:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zjg3FAPOxVhN1rf8jrpAqOKG4FK/5gspiHfO5mv5QTM=;
        b=eYS59xd2M+uT9kt5+nkE1l+37i1AzRGMn8i70NzKVYIM2hqh7979XYJ/Ox52dUqvS6
         5ahiI5WVw9X4wP0h5fhElBhwEW+LdcA9saJ2PlHFbfGb1q0TPl/eqqNBOf91Q0JEx7nS
         5a4pIqCn4Plru2NGDHxzK2TPd/AV52m+xdQD/5rHNp+cRiwzI6Djy9w2Ajcvd5x2h+9m
         2Wa5z7zOW4GLDqL+uts4ebr6fHlQLLEuEZIqBOL3FyTBG4HMSMzANfOGLMhX4q52LfgS
         sP75X2jvHYUK/9YbscYKI5twFQPUIv7bM576fFBLIeI93OgiVfISAYOFRNUxprls35om
         mBXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zjg3FAPOxVhN1rf8jrpAqOKG4FK/5gspiHfO5mv5QTM=;
        b=LzE8bBaFEnPSI4CXTOnqWDGr6UGiwbBJqug+v9MPZWqaGcbQtM3JODO1bl1x68N4qt
         tQm8+dsdtWsh9SNvCPq0mjxOaYG4beV8lmEHsvcx2UGUwv4aT+KelqOyJ59kx7rfykPT
         VhJsfI0beJJC4xBaLY49Z4+ToHqyTYqMDgGoRYqrJaYs3BfkBCYCUh5rRofN2TMz91tX
         4S4AsnPB2YmjF2BFhqeitU6PhbYqdR3ULmRfGQ3nN8dAEjV/+Kzw09zMrysBxDRNulsG
         JLygJ1meWCk9edxD0TKw7mHsyzqrxpDOGtEpiW2xiYmTan2YcFHKIY/MrrOfGGweUBKE
         JfLg==
X-Gm-Message-State: AOAM533CDjuBFGkbGHqYMlCdCDZpOBJp+xvV7jhwvt4u37k6Jcjf6uR4
	nr4uzDS3B1T6DALrX2qA8ma07gvgAvQGpxMlhcg=
X-Google-Smtp-Source: 
 ABdhPJxP2VJZKv65ltirxzBVqHqc1Tn0o/iH575YcMqT0kEBlkA/fvg+242n4xrAlWVprJtzf6JtUlCp7geTGQhdeqo=
X-Received: by 2002:a05:6122:a02:: with SMTP id
 2mr64062561vkn.6.1637009802807;
 Mon, 15 Nov 2021 12:56:42 -0800 (PST)
MIME-Version: 1.0
References: <8a12d84e-fdb1-3383-ce9e-10ddc75130cf@gmail.com>
 <CANNYZj-xeJS_+3r-Lwg=Nzyr+KrtFA8hCpGj-DeDpaihzB_TQg@mail.gmail.com>
 <d897665a-3746-80f0-9771-875165d16b2b@gmail.com>
 <CANNYZj-UTWzhnRoxTpTn3kqp4d7FiRk0NPD_Mon0cOd6Js13UQ@mail.gmail.com>
 <7f35ae7d-d12b-8ba3-5459-c2fb92f3f38f@gmail.com>
In-Reply-To: <7f35ae7d-d12b-8ba3-5459-c2fb92f3f38f@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 15 Nov 2021 21:56:31 +0100
Message-ID: 
 <CANNYZj_6BSsJb+k-6n95zMFwUFpqM0=nXDC5D7sSg-ynWx5qJQ@mail.gmail.com>
Subject: Re: [OE-core] Suggestion to use python-parameterized for QA
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ca4b2205d0da0b39"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Nov 2021 20:56:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158315

--000000000000ca4b2205d0da0b39
Content-Type: text/plain; charset="UTF-8"

Can't we achieve the same by abstracting the common part into a function
and defining the two tests explicitly?

Alex

On Mon, 15 Nov 2021 at 21:26, Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:

> It's substituted further down into
> def test_sbin_init(self, _, origInit):
>
> parameterized.expand generates two tests out of it. The string parameter
> is used as a suffix for the test, the rest is used as input parameters,
> i.e. the first test would be called with origInit=True, the second one with
> origInit=False.
>
> The sample output looks like this:
>
> 2021-11-15 20:21:15,740 - oe-selftest - INFO - RESULTS -
> overlayfs.OverlayFSEtcRunTimeTests.test_sbin_init_0_original: PASSED
> (295.73s)
> 2021-11-15 20:21:15,740 - oe-selftest - INFO - RESULTS -
> overlayfs.OverlayFSEtcRunTimeTests.test_sbin_init_1_preinit: PASSED
> (177.97s)
>
> Vyacheslav
>
> On 15.11.2021 21:20, Alexander Kanavin wrote:
>
> I can't understand what is supposed to happen, perhaps because it's
> incomplete? There's
>
> @parameterized.expand([
> ("original", True),
> ("preinit", False),
> ])
>
> but where is that used?
>
> Alex
>
>
>

--000000000000ca4b2205d0da0b39
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Can&#39;t we achieve the same by abstracting the comm=
on part into a function and defining the two tests explicitly?</div><div><b=
r></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Mon, 15 Nov 2021 at 21:26, Vyacheslav Yurkov =
&lt;<a href=3D"mailto:uvv.mail@gmail.com">uvv.mail@gmail.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
 =20
   =20
 =20
  <div>
    <div>It&#39;s substituted further down into<br>
      <span><span>def</span> <span>test_sbin_init</span>(<span>self</span>,
        <span>_</span>, <span>origInit</span>):<br>
        <br>
      </span>parameterized.expand generates two tests out of it. The
      string parameter is used as a suffix for the test, the rest is
      used as input parameters, i.e. the first test would be called with
      origInit=3DTrue, the second one with origInit=3DFalse.<br>
      <br>
      The sample output looks like this:<br>
      <br>
      2021-11-15 20:21:15,740 - oe-selftest - INFO - RESULTS -
      overlayfs.OverlayFSEtcRunTimeTests.test_sbin_init_0_original:
      PASSED (295.73s)<br>
      2021-11-15 20:21:15,740 - oe-selftest - INFO - RESULTS -
      overlayfs.OverlayFSEtcRunTimeTests.test_sbin_init_1_preinit:
      PASSED (177.97s)<br>
      <br>
      Vyacheslav<br>
      <br>
      On 15.11.2021 21:20, Alexander Kanavin wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div>I can&#39;t understand what is supposed to happen, perhaps
          because it&#39;s incomplete? There&#39;s</div>
        <div>
          <table>
            <tbody>
              <tr>
                <td><span>
                    <span><br>
                      @<span>parameterized</span>.<span>expand</span>([</sp=
an></span></td>
              </tr>
              <tr>
              </tr>
            </tbody>
          </table>
          <table>
            <tbody>
              <tr>
                <td> <span><span> (<span>&quot;original&quot;</span>,
                      <span>True</span>),</span></span></td>
              </tr>
              <tr>
              </tr>
            </tbody>
          </table>
          <table>
            <tbody>
              <tr>
                <td> <span><span> (<span>&quot;preinit&quot;</span>,
                      <span>False</span>),</span></span></td>
              </tr>
              <tr>
              </tr>
            </tbody>
          </table>
          <span><span> ])</span></span></div>
        <div><span><span><br>
            </span></span></div>
        <div><span><span>but where is that used?<br>
            </span></span></div>
        <div><span><span><br>
            </span></span></div>
        <div><span><span>Alex<br>
            </span></span></div>
      </div>
      <br>
    </blockquote>
    <br>
  </div>
</blockquote></div>

--000000000000ca4b2205d0da0b39--


Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0025FC433F5
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 06:16:40 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.6439.1637043400205608600
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 22:16:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qWXaeHO4;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: uvv.mail@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id s9so13028825qvk.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 22:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to;
        bh=Oj876/iqIOhuC9ub580ziQfPVJwzszwyE16+Q/YGSoY=;
        b=qWXaeHO4X/TVqXYbPsLXuAqgGk8lIq84DtkU8TBLV3swt4/4g2UVDDCwgrq8LWiBHx
         JAwvp+m1kl99OCkEx8NN+eCHrBCGYJE6zuAsfdzGu/swz2doN7cfiuDc48+kUeabL1rc
         DvULFnVwyKKkv5sv4ClUhf3kqvgjLFn0Uh5XEi5fBymWQIKnVAKpNx7BoqnpS23E/OHd
         AuY5AtmSkoqz4FEX27wBdYdzOUUV2MxZgTpmUnI2+mI+OXXxImlg1xICIoBLU80BHy+P
         zzFVD5POVU9a527WCC6ML7dyPNKX17jPvtHsUJi0QoLvaDThzlQ+sAM3uYyobbsSf3Fz
         rzmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to;
        bh=Oj876/iqIOhuC9ub580ziQfPVJwzszwyE16+Q/YGSoY=;
        b=Vgx6BP1/vVhY3+5LUa7qhig7BRbnq7MZy1I1S3Rn1pZqvbxAgPZ6W6cXh5dYi+Vx2m
         jPvjdAv2c1siLXQ6QdTIfb8G/71msk9AWQcKWAJ30rl8qQrqTJfiaLnLnzl+onWBirKI
         i/CBuoL38h7+Wb8DnM1Jk0iR2WljznuJOmvYcwjQvlVhFZaXumPhcfwIYg8L2ZbUKX1s
         I3aHZa7Pq+B/R2JSuWaMX1MLGobCpVecF/mZdI4FC3t4aIUg4lav4b/4Sryw7usxeAzH
         6xbYP0pHy+6j+4UESyeZhErJlhBCEVXctktyglj46pKkegWuabJkF3KBIS+nfeqQzkIY
         /lXQ==
X-Gm-Message-State: AOAM533oodQfWXeLbMm1l2kc9jfEuzzAFrDtkt1f2jj2Vs+hUgmDI2w3
	hA/VBQkqtpTeMMVkjFvcL9Y=
X-Google-Smtp-Source: 
 ABdhPJyekqTxBesJ5bKV1E0W/J2dbAYXcSHza+ubwp4j+mEQ7kRKgKfYl1tWJhVZpxDO5aXi2rp1uw==
X-Received: by 2002:a05:6214:21ee:: with SMTP id
 p14mr43891071qvj.11.1637043399353;
        Mon, 15 Nov 2021 22:16:39 -0800 (PST)
Received: from [10.129.149.96] ([37.120.205.162])
        by smtp.gmail.com with ESMTPSA id
 t64sm7889640qkd.71.2021.11.15.22.16.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Nov 2021 22:16:39 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------314VHKFEbBSmpNm1Ofcw1DXp"
Message-ID: <3882908e-02f1-2855-45a3-f96971598021@gmail.com>
Date: Tue, 16 Nov 2021 07:16:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [OE-core] Suggestion to use python-parameterized for QA
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <8a12d84e-fdb1-3383-ce9e-10ddc75130cf@gmail.com>
 <CANNYZj-xeJS_+3r-Lwg=Nzyr+KrtFA8hCpGj-DeDpaihzB_TQg@mail.gmail.com>
 <d897665a-3746-80f0-9771-875165d16b2b@gmail.com>
 <CANNYZj-UTWzhnRoxTpTn3kqp4d7FiRk0NPD_Mon0cOd6Js13UQ@mail.gmail.com>
 <7f35ae7d-d12b-8ba3-5459-c2fb92f3f38f@gmail.com>
 <CANNYZj_6BSsJb+k-6n95zMFwUFpqM0=nXDC5D7sSg-ynWx5qJQ@mail.gmail.com>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: 
 <CANNYZj_6BSsJb+k-6n95zMFwUFpqM0=nXDC5D7sSg-ynWx5qJQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Nov 2021 06:16:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158341

This is a multi-part message in MIME format.
--------------314VHKFEbBSmpNm1Ofcw1DXp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Yes, technically it would be the same. Thanks for the hint.

Vyacheslav

On 15.11.2021 21:56, Alexander Kanavin wrote:
> Can't we achieve the same by abstracting the common part into a 
> function and defining the two tests explicitly?
>
> Alex
>
> On Mon, 15 Nov 2021 at 21:26, Vyacheslav Yurkov <uvv.mail@gmail.com> 
> wrote:
>
>     It's substituted further down into
>     def test_sbin_init(self, _, origInit):
>
>     parameterized.expand generates two tests out of it. The string
>     parameter is used as a suffix for the test, the rest is used as
>     input parameters, i.e. the first test would be called with
>     origInit=True, the second one with origInit=False.
>
>     The sample output looks like this:
>
>     2021-11-15 20:21:15,740 - oe-selftest - INFO - RESULTS -
>     overlayfs.OverlayFSEtcRunTimeTests.test_sbin_init_0_original:
>     PASSED (295.73s)
>     2021-11-15 20:21:15,740 - oe-selftest - INFO - RESULTS -
>     overlayfs.OverlayFSEtcRunTimeTests.test_sbin_init_1_preinit:
>     PASSED (177.97s)
>
>     Vyacheslav
>
--------------314VHKFEbBSmpNm1Ofcw1DXp
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Yes, technically it would be the same.
      Thanks for the hint.<br>
      <br>
      Vyacheslav<br>
      <br>
      On 15.11.2021 21:56, Alexander Kanavin wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANNYZj_6BSsJb+k-6n95zMFwUFpqM0=nXDC5D7sSg-ynWx5qJQ@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div>Can't we achieve the same by abstracting the common part
          into a function and defining the two tests explicitly?</div>
        <div><br>
        </div>
        <div>Alex<br>
        </div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Mon, 15 Nov 2021 at 21:26,
          Vyacheslav Yurkov &lt;<a href="mailto:uvv.mail@gmail.com"
            moz-do-not-send="true" class="moz-txt-link-freetext">uvv.mail@gmail.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
          <div>
            <div>It's substituted further down into<br>
              <span><span>def</span> <span>test_sbin_init</span>(<span>self</span>,
                <span>_</span>, <span>origInit</span>):<br>
                <br>
              </span>parameterized.expand generates two tests out of it.
              The string parameter is used as a suffix for the test, the
              rest is used as input parameters, i.e. the first test
              would be called with origInit=True, the second one with
              origInit=False.<br>
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
            </div>
          </div>
        </blockquote>
      </div>
    </blockquote>
  </body>
</html>
--------------314VHKFEbBSmpNm1Ofcw1DXp--



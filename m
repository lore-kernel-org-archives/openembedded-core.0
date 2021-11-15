Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F636C433EF
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 20:26:47 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.106.1637008005629786641
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 12:26:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aJNA24GY;
 spf=pass (domain: gmail.com, ip: 209.85.160.171,
 mailfrom: uvv.mail@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id z9so16779839qtj.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 12:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to;
        bh=+o8hDCQNgMCYp+gUU12KqcmXtL8w1X2ADL8ZD4Wf6WU=;
        b=aJNA24GYP6pNSLk1h3yuGyeDh/DgB0WrQdo8PFU32nflWC6Jn8uaFI7WJrpgBEk7Fv
         dneA8/WndIgoJOyVHJebWGZpatH4MCRfmh53YlxngYQcHAAe8qGDN1F3P/BJ4gvbLKzu
         TYmW1boOS+oAB4uituOwzOPLGiVJpThrvNof7zotgyQJR+N/v4lWnBVcI66tEh+h8bcU
         nLxW8Ky6iVnXvKzP0kcFbJHeNJXC7CcAaNgaL+AHyWdlcSYUJGv7+Ytjt3Q8oFpfa5rH
         MRQlE3CVDa2AD6ZDsFySFWuzESuJHqAWsEdmAsKg87+DfaqQ3Vd60EJyORAGIoblHPEh
         1alg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to;
        bh=+o8hDCQNgMCYp+gUU12KqcmXtL8w1X2ADL8ZD4Wf6WU=;
        b=Pm79pR5YHEe5PqVl9zhItq8jeFeZrnAI9q/usW1nOw71js//0SGbM6CNmPmygIMNjB
         VY0V4Yi8KSb5HsGh+Qfwu5peZ+tQ7gx5rDb3+tvgqZR7JtoJ9DFb7n3e3pawo26JEziA
         JLFi/Q4tXpgc8lpijyk+z0UPNo2P0fi8O5YG8eWGnikG110dFmAE23vbmX8+H499ZVob
         wXfjc8xRVutZa1sMv2TDHRq+QphAbuPkrInuWsNI8NJ9D+PR5aQwYHCZiT9HOdgzE9tY
         gsSuEezfVxtx8HpGHhztyUHMkwQSyOCKSOvauHhNuVocO89vWuHFbhILU6Wzqi4/0Ug4
         GsmA==
X-Gm-Message-State: AOAM533T9Wj3HoqaOgwqy64vSeWwmorbadtr+cbXy/eHj3Aj9/r3Ux65
	7tuzX8j2JF3hLQ20ecN908k=
X-Google-Smtp-Source: 
 ABdhPJwLiH9rSvVQLa81LioE51LP11LwyFtXcjcLqvnftEUFw/hnbD8pc760YGwkaoSnWYoeqEdIww==
X-Received: by 2002:a05:622a:346:: with SMTP id
 r6mr1866064qtw.78.1637008004752;
        Mon, 15 Nov 2021 12:26:44 -0800 (PST)
Received: from [10.129.163.78] ([37.120.205.172])
        by smtp.gmail.com with ESMTPSA id
 h22sm7131304qkk.14.2021.11.15.12.26.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Nov 2021 12:26:44 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------ov6ULVPBNbJwfFxamFU2BUXd"
Message-ID: <7f35ae7d-d12b-8ba3-5459-c2fb92f3f38f@gmail.com>
Date: Mon, 15 Nov 2021 21:26:41 +0100
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
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: 
 <CANNYZj-UTWzhnRoxTpTn3kqp4d7FiRk0NPD_Mon0cOd6Js13UQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Nov 2021 20:26:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158313

This is a multi-part message in MIME format.
--------------ov6ULVPBNbJwfFxamFU2BUXd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

It's substituted further down into
def test_sbin_init(self, _, origInit):

parameterized.expand generates two tests out of it. The string parameter 
is used as a suffix for the test, the rest is used as input parameters, 
i.e. the first test would be called with origInit=True, the second one 
with origInit=False.

The sample output looks like this:

2021-11-15 20:21:15,740 - oe-selftest - INFO - RESULTS - 
overlayfs.OverlayFSEtcRunTimeTests.test_sbin_init_0_original: PASSED 
(295.73s)
2021-11-15 20:21:15,740 - oe-selftest - INFO - RESULTS - 
overlayfs.OverlayFSEtcRunTimeTests.test_sbin_init_1_preinit: PASSED 
(177.97s)

Vyacheslav

On 15.11.2021 21:20, Alexander Kanavin wrote:
> I can't understand what is supposed to happen, perhaps because it's 
> incomplete? There's
>
> @parameterized.expand([
>
> ("original", True),
>
> ("preinit", False),
>
> ])
>
> but where is that used?
>
> Alex
>

--------------ov6ULVPBNbJwfFxamFU2BUXd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">It's substituted further down into<br>
      <span class="blob-code-inner blob-code-marker"
        data-code-marker="+"><span class="pl-k">def</span> <span
          class="pl-en">test_sbin_init</span>(<span class="pl-s1">self</span>,
        <span class="pl-s1">_</span>, <span class="pl-s1">origInit</span>):<br>
        <br>
      </span>parameterized.expand generates two tests out of it. The
      string parameter is used as a suffix for the test, the rest is
      used as input parameters, i.e. the first test would be called with
      origInit=True, the second one with origInit=False.<br>
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
    <blockquote type="cite"
cite="mid:CANNYZj-UTWzhnRoxTpTn3kqp4d7FiRk0NPD_Mon0cOd6Js13UQ@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div>I can't understand what is supposed to happen, perhaps
          because it's incomplete? There's</div>
        <div>
          <table class="gmail-diff-table gmail-js-diff-table
            gmail-tab-size">
            <tbody>
              <tr>
                <td class="gmail-blob-code gmail-blob-code-addition
                  gmail-selected-line gmail-selected-line-top
                  gmail-selected-line-bottom"><span
                    class="gmail-blob-code-inner gmail-blob-code-marker">
                    <span class="gmail-pl-en"><br>
                      @<span class="gmail-pl-s1">parameterized</span>.<span
                        class="gmail-pl-en">expand</span>([</span></span></td>
              </tr>
              <tr>
              </tr>
            </tbody>
          </table>
          <table class="gmail-diff-table gmail-js-diff-table
            gmail-tab-size">
            <tbody>
              <tr>
                <td class="gmail-blob-code gmail-blob-code-addition"> <span
                    class="gmail-blob-code-inner gmail-blob-code-marker"><span
                      class="gmail-pl-en"> (<span class="gmail-pl-s">"original"</span>,
                      <span class="gmail-pl-c1">True</span>),</span></span></td>
              </tr>
              <tr>
              </tr>
            </tbody>
          </table>
          <table class="gmail-diff-table gmail-js-diff-table
            gmail-tab-size">
            <tbody>
              <tr>
                <td class="gmail-blob-code gmail-blob-code-addition"> <span
                    class="gmail-blob-code-inner gmail-blob-code-marker"><span
                      class="gmail-pl-en"> (<span class="gmail-pl-s">"preinit"</span>,
                      <span class="gmail-pl-c1">False</span>),</span></span></td>
              </tr>
              <tr>
              </tr>
            </tbody>
          </table>
          <span class="gmail-blob-code-inner gmail-blob-code-marker"><span
              class="gmail-pl-en"> ])</span></span></div>
        <div><span class="gmail-blob-code-inner gmail-blob-code-marker"><span
              class="gmail-pl-en"><br>
            </span></span></div>
        <div><span class="gmail-blob-code-inner gmail-blob-code-marker"><span
              class="gmail-pl-en">but where is that used?<br>
            </span></span></div>
        <div><span class="gmail-blob-code-inner gmail-blob-code-marker"><span
              class="gmail-pl-en"><br>
            </span></span></div>
        <div><span class="gmail-blob-code-inner gmail-blob-code-marker"><span
              class="gmail-pl-en">Alex<br>
            </span></span></div>
      </div>
      <br>
    </blockquote>
    <br>
  </body>
</html>
--------------ov6ULVPBNbJwfFxamFU2BUXd--



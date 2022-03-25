Return-Path: <fntoth@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A0AEC433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 11:28:31 +0000 (UTC)
Received: from radex-web.radex.nl (radex-web.radex.nl [178.250.146.7])
 by mx.groups.io with SMTP id smtpd.web12.3995.1648207710600536905
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Mar 2022 04:28:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=softfail (domain: gmail.com, ip: 178.250.146.7, mailfrom: fntoth@gmail.com)
Received: from [192.168.1.35] (cust-178-250-146-69.breedbanddelft.nl
 [178.250.146.69])
	by radex-web.radex.nl (Postfix) with ESMTPS id 50B6F24065;
	Fri, 25 Mar 2022 12:28:29 +0100 (CET)
Content-Type: multipart/alternative;
 boundary="------------VfrzWUnXkHqQym4NKmWug9wm"
Message-ID: <bf0ea984-2798-ab9b-6008-7d09bebd9664@gmail.com>
Date: Fri, 25 Mar 2022 12:28:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 1/2] gpg-sign: Add parameters to gpg signature function
Content-Language: en-US
From: Ferry Toth <fntoth@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Xavier Berger <xavier.berger@bio-logic.net>
References: <20220322211949.7423-1-fntoth@gmail.com>
 <fe0f9ee8-e3d0-1681-af93-fa97019b8a0c@gmail.com>
 <e2b6066a69cf7933b0618a66b7e1b3589ff6da5c.camel@linuxfoundation.org>
 <a338dc08-b564-4f83-9f88-1e7dd1823f6d@gmail.com>
 <6dad87edfe80040678963ca18842a3ddf337e35c.camel@linuxfoundation.org>
 <9c616e34-d31b-dcab-657a-268698d34150@gmail.com>
 <0791e55a-cba3-3d7f-8a17-96b1591454a1@gmail.com>
In-Reply-To: <0791e55a-cba3-3d7f-8a17-96b1591454a1@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Mar 2022 11:28:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163636

This is a multi-part message in MIME format.
--------------VfrzWUnXkHqQym4NKmWug9wm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Op 24-03-2022 om 23:11 schreef Ferry Toth:
....

> It doesn't seem to be a particularly volatile area in the code. I 
> refreshed
>>>> Xavier's patches for Gatesgarth, and am actively using unchanged 
>>>> patch on
>>>> Honisiter.
>>>> I don't know how the automated testing is working but I guess for 
>>>> RPM a repo
>>>> is generated using a small layer? And then tested on a qemu running 
>>>> the
>>>> rootfs?
>>>> Should be almost same for deb/apt, maybe could be modified from rpm 
>>>> test?
>>> I think the rpm test is test_testimage_dnf in
>>> meta/lib/oeqa/selftest/cases/runtime_test.py. You'd run it with:
>>>
>>> oe-selftest -r runtime_test.TestImage.test_testimage_dnf
>> I'll have a look.

Grumble. I ran this test but it failed due to needing to run sudo to 
setup a tap interface (I ran it under screen).

Is there a way to continue this test without first clearing the build-st 
directory? It take about 2 hours to get to this failure point.

Thanks,

Ferry

--------------VfrzWUnXkHqQym4NKmWug9wm
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><font face="Noto Sans">Hi,</font><br>
    </p>
    <div class="moz-cite-prefix">Op 24-03-2022 om 23:11 schreef Ferry
      Toth:<br>
    </div>
    <div class="moz-cite-prefix">....</div>
    <br>
    <blockquote type="cite"
      cite="mid:0791e55a-cba3-3d7f-8a17-96b1591454a1@gmail.com">It
      doesn't seem to be a particularly volatile area in the code. I
      refreshed
      <br>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">Xavier's patches for Gatesgarth, and
            am actively using unchanged patch on
            <br>
            Honisiter.
            <br>
            I don't know how the automated testing is working but I
            guess for RPM a repo
            <br>
            is generated using a small layer? And then tested on a qemu
            running the
            <br>
            rootfs?
            <br>
            Should be almost same for deb/apt, maybe could be modified
            from rpm test?
            <br>
          </blockquote>
          I think the rpm test is test_testimage_dnf in
          <br>
          meta/lib/oeqa/selftest/cases/runtime_test.py. You'd run it
          with:
          <br>
          <br>
          oe-selftest -r runtime_test.TestImage.test_testimage_dnf
          <br>
        </blockquote>
        I'll have a look.
        <br>
      </blockquote>
    </blockquote>
    <p>Grumble. I ran this test but it failed due to needing to run sudo
      to setup a tap interface (I ran it under screen).</p>
    <p>Is there a way to continue this test without first clearing the
      build-st directory? It take about 2 hours to get to this failure
      point.</p>
    <p>Thanks,</p>
    <p>Ferry<br>
    </p>
  </body>
</html>

--------------VfrzWUnXkHqQym4NKmWug9wm--


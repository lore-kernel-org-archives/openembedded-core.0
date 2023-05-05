Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5FC1C77B7D
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 19:08:50 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.4062.1683313726148827335
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 12:08:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=YlQW8nNN;
 spf=pass (domain: baylibre.com, ip: 209.85.222.180, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7515631b965so1116438185a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 12:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1683313725; x=1685905725;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Md9+CkoxNWXITi6pnMvIKl19QXYyqYsMOrYJmazqaU=;
        b=YlQW8nNN/Ad/k/IpDz9mf9XzFTDjpC08kQ8FMUEKWYTsN5f3mAYcjtfiL2vQJNt7ca
         Hi6tZp9YmGwd28uMmVilUelQICiIstA/62p5a1v9d2JZziYzLxtm661jOq1SYZ66kev3
         O4rZnBlEfYthoJMzZpj4jzwScyvGucGpSqKi6OueWECaIPrJ1Dw628JgiEQBlZlBKeeB
         Wl6ENjWLEuuUWNmpD+VUXFMJ1RmtaiP7yV5Sa35dNZTiwQgd2hcYdIFXPxuhCMOGZCF5
         Pv5FvGwtaH4N/oClRYskAt31pKN1GaFPh3fzH/9F9+ZRknFf+Avt/J+RE9zMSM5hHxIu
         qHjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683313725; x=1685905725;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5Md9+CkoxNWXITi6pnMvIKl19QXYyqYsMOrYJmazqaU=;
        b=QP14bg2TKWyzduJIyhwvodbaYnsUUYTCeDCZLT1WgHo/9VrfDbTovqBZBm1jxOcjgT
         JywAQPCnydgceAz26C9ZmJaH3xmvIQHxdRRqXEa/Hc6HuY1yN1auorjSjZoBGTjJUfCi
         +klxH9vDkCFNO1CPvQ56i3x+zOBaNAJGszHBHbC8ZqlSxYEXNfM1J0B7yJWXU60yGWW3
         JO8GBi9Hq0Rxo789z0sg8rqbjVqRaV2TYafNmLtDe2gq3/t4WESEHToMbcqtIkvdahhl
         R9ilDLzxvjixC2T6QOtwsfXsdAY94yxSMXmJAveQAlednKI1njKqiuSBZpL+wjNQtKCP
         RDew==
X-Gm-Message-State: AC+VfDy2YxyYzU4iVrw0oL34fCHZdqVi2qYrqKmP8tVmaivBJtJRBOJT
	1JI9IbgN3rQ3bGBuOYG7bKySWA==
X-Google-Smtp-Source: ACHHUZ6ql+JzuxZ1HtKS5m3/WDnQuRAOTbScUTcbx+1Ts97s9C8hPleTLZCG55xMMXzS9IwWhMhADA==
X-Received: by 2002:a05:6214:21cb:b0:5f1:6a6a:f566 with SMTP id d11-20020a05621421cb00b005f16a6af566mr17421414qvh.19.1683313725023;
        Fri, 05 May 2023 12:08:45 -0700 (PDT)
Received: from [192.168.0.195] (cpe64777de11593-cm64777de11590.cpe.net.cable.rogers.com. [174.115.224.47])
        by smtp.gmail.com with ESMTPSA id 25-20020a05620a06d900b0074abf412080sm765673qky.128.2023.05.05.12.08.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 12:08:44 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------l0nYyZNUvybhRYAn3iF4wwqI"
Message-ID: <82fbf114-27ee-7d88-5d1d-5e0d0669f6ce@baylibre.com>
Date: Fri, 5 May 2023 15:08:43 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core] Contributing, how it works?
Content-Language: en-US
To: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core <openembedded-core@lists.openembedded.org>
References: <CA+cAkeqg4CdA5F73-z1dXLvQHz+2HqiDRQPC9ndTZM89BAmmaA@mail.gmail.com>
 <CANNYZj-q+5jxDxWDp_4B2kD4NVqWA-Fok2wuTUiLzzsO_5iYYw@mail.gmail.com>
 <ce83564a-1362-f45d-8c4d-e33e68a72d27@baylibre.com>
 <CA+cAkersaTEgB7zzvAHrr9nhicFT=Rtz30GQ_GaEHwNbSEQ5-Q@mail.gmail.com>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CA+cAkersaTEgB7zzvAHrr9nhicFT=Rtz30GQ_GaEHwNbSEQ5-Q@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 19:08:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180972

This is a multi-part message in MIME format.
--------------l0nYyZNUvybhRYAn3iF4wwqI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2023-05-05 14:31, Frédéric Martinsons wrote:
>
>
> Le ven. 5 mai 2023, 20:21, Trevor Gamblin <tgamblin@baylibre.com> a 
> écrit :
>
>
>     On 2023-05-05 13:37, Alexander Kanavin wrote:
>     > There is
>     >
>     http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
>     > and some additional pages linked from it:
>     > http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
>     > http://www.openembedded.org/wiki/Styleguide
>     >
>     > The wiki is not great, and needs improvements, but the problem
>     is it's
>     > difficult to write an authoritative and comprehensive answer to the
>     > questions you ask because there's just so many possible things one
>     > could check with any change to yocto. If you touch a recipe, you
>     > should of course check that 'bitbake recipe' still completes without
>     > an error. But that's obvious, isn't it? Beyond that... it
>     depends. And
>     > requires a bit of intuition and experience, or advice from
>     someone who
>     > knows the specific item better.
>     >
>     > We generally don't expect people to learn 'the rules' upfront - just
>     > write some code, and if you're not certain how to test it
>     properly or
>     > whether it even makes sense, submit the patch as RFC and ask to
>     take a
>     > look. If it fails in integration testing, you'll hear about it too,
>     > and that's normal and expected for anything more complex than a typo
>     > fix. My patches appear 'perfect' only because I pre-test them myself
>     > on the autobuilder :)
>     >
>     > Where we would *greatly* appreciate help is a special bot called
>     > patchtest that used to check mailing list submissions for common
>     > problems. That fell into disrepair due to lack of maintenance.
>     Fixing
>     > that would be fantastic - and people could run it locally too. That
>     > could act as both a repository of rules-as-code, and a way to check
>     > them automatically. It could also offer hints for testing, depending
>     > on what the change touches. All sorts of nice things, if there is a
>     > person looking after it.
>
>     I'm actually working on getting patchtest running again, and I've
>     assigned myself as maintainer :)
>
>     To add to what Alex said, a good place for you to start might be
>     looking
>     at the Newcomer Bugs list:
>     https://wiki.yoctoproject.org/wiki/Bug_Triage#Newcomer_Bugs
>
>     Alternatively, watching AUH failures and figuring out broken upgrades,
>
>
> What is AUH? Where I can see broken upgrades you talked about? And 
> more important to me, how can I replicate them to investigate on my side?

AUH is "Auto Upgrade Helper". If you search the OE-core mailing list for 
the acronym, you will sometimes see results like this:

[OE-core] [AUH] icu: upgrading to 73-1 FAILED

These could be another area to look at contributing in addition to the 
Newcomer Bugs or other parts of the Bugzilla, but the Newcomer list is 
probably the best place to get yourself familiarized.

You may find this page useful when it comes to recipe upgrades: 
https://docs.yoctoproject.org/dev/dev-manual/upgrading-recipes.html

- Trevor

>
>
>     or looking on the Bugzilla under terms like "ptest" could also be
>     very
>     useful, while providing better understanding of how recipes are
>     written
>     and being somewhat more accessible.
>
>     You can also ask questions in the #yocto channel on the
>     Libera.Chat IRC
>     server if you need additional help.
>
>     - Trevor
>
>     >
>     > Alex
>     >
>     > On Fri, 5 May 2023 at 19:17, Frederic Martinsons
>     > <frederic.martinsons@gmail.com> wrote:
>     >> Hello list
>     >>
>     >> I'm wondering if there are documentations on how contribution
>     are managed for the project.
>     >>
>     >> I try to find some but didn't manage to. There are easily
>     reachable doc about how to contribute of course (how to make
>     patches, fixe your identity, send mail via git... etc) but I
>     didn't find what I usually find on other open source project
>     (CONTRIBUTING.md file most of the time) like
>     >>    - what are the tests do should I run before submitting (I
>     learnt by practice about test image or bitbake selftest for example) ?
>     >>    - is there a specific configuration that I should test
>     before submitting (poky is ok, or should I also test another distro)?
>     >>    - does some commit writing rules exist ? (some projects want
>     commits to begin with a prefix, usually the software component
>     that is modified by the patch for example)
>     >>   - what are the coding rules you should follow, if any?
>     (having common coding rules helps greatly the review of patches,
>     pylint for python code for example, and I saw there are some
>     bitbake recipes linter from meta-sca layer)
>     >>
>     >> Long story short, I really would like to know what are the
>     different steps a patch should go through before being merged into
>     master (and as a side question, what are the steps for a patch to
>     be backported into one of the LTS branch).
>     >>
>     >> I'm deeply sorry if all these questions are obvious to you and
>     have been already answered somewhere, in that case, please just
>     give me the link.
>     >>
>     >> I recently started to contribute to yocto / oe and I think it
>     will help me to make better contributions if I know more of how it
>     works "under the hood".
>     >>
>     >> Best regards.
>     >>
>     >>
>     >>
>     >>
>     >> -=-=-=-=-=-=-=-=-=-=-=-
>     >> Links: You receive all messages sent to this group.
>     >> View/Reply Online (#180962):
>     https://lists.openembedded.org/g/openembedded-core/message/180962
>     >> Mute This Topic: https://lists.openembedded.org/mt/98710419/7611679
>     >> Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     >> Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     [tgamblin@baylibre.com]
>     >> -=-=-=-=-=-=-=-=-=-=-=-
>     >>
>
--------------l0nYyZNUvybhRYAn3iF4wwqI
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2023-05-05 14:31, Frédéric
      Martinsons wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CA+cAkersaTEgB7zzvAHrr9nhicFT=Rtz30GQ_GaEHwNbSEQ5-Q@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="auto">
        <div><br>
          <br>
          <div class="gmail_quote">
            <div dir="ltr" class="gmail_attr">Le ven. 5 mai 2023, 20:21,
              Trevor Gamblin &lt;<a href="mailto:tgamblin@baylibre.com"
                moz-do-not-send="true" class="moz-txt-link-freetext">tgamblin@baylibre.com</a>&gt;
              a écrit :<br>
            </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
              On 2023-05-05 13:37, Alexander Kanavin wrote:<br>
              &gt; There is<br>
              &gt; <a
href="http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded"
                rel="noreferrer noreferrer" target="_blank"
                moz-do-not-send="true" class="moz-txt-link-freetext">http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded</a><br>
              &gt; and some additional pages linked from it:<br>
              &gt; <a
                href="http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines"
                rel="noreferrer noreferrer" target="_blank"
                moz-do-not-send="true" class="moz-txt-link-freetext">http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines</a><br>
              &gt; <a
                href="http://www.openembedded.org/wiki/Styleguide"
                rel="noreferrer noreferrer" target="_blank"
                moz-do-not-send="true" class="moz-txt-link-freetext">http://www.openembedded.org/wiki/Styleguide</a><br>
              &gt;<br>
              &gt; The wiki is not great, and needs improvements, but
              the problem is it's<br>
              &gt; difficult to write an authoritative and comprehensive
              answer to the<br>
              &gt; questions you ask because there's just so many
              possible things one<br>
              &gt; could check with any change to yocto. If you touch a
              recipe, you<br>
              &gt; should of course check that 'bitbake recipe' still
              completes without<br>
              &gt; an error. But that's obvious, isn't it? Beyond
              that... it depends. And<br>
              &gt; requires a bit of intuition and experience, or advice
              from someone who<br>
              &gt; knows the specific item better.<br>
              &gt;<br>
              &gt; We generally don't expect people to learn 'the rules'
              upfront - just<br>
              &gt; write some code, and if you're not certain how to
              test it properly or<br>
              &gt; whether it even makes sense, submit the patch as RFC
              and ask to take a<br>
              &gt; look. If it fails in integration testing, you'll hear
              about it too,<br>
              &gt; and that's normal and expected for anything more
              complex than a typo<br>
              &gt; fix. My patches appear 'perfect' only because I
              pre-test them myself<br>
              &gt; on the autobuilder :)<br>
              &gt;<br>
              &gt; Where we would *greatly* appreciate help is a special
              bot called<br>
              &gt; patchtest that used to check mailing list submissions
              for common<br>
              &gt; problems. That fell into disrepair due to lack of
              maintenance. Fixing<br>
              &gt; that would be fantastic - and people could run it
              locally too. That<br>
              &gt; could act as both a repository of rules-as-code, and
              a way to check<br>
              &gt; them automatically. It could also offer hints for
              testing, depending<br>
              &gt; on what the change touches. All sorts of nice things,
              if there is a<br>
              &gt; person looking after it.<br>
              <br>
              I'm actually working on getting patchtest running again,
              and I've <br>
              assigned myself as maintainer :)<br>
              <br>
              To add to what Alex said, a good place for you to start
              might be looking <br>
              at the Newcomer Bugs list: <br>
              <a
                href="https://wiki.yoctoproject.org/wiki/Bug_Triage#Newcomer_Bugs"
                rel="noreferrer noreferrer" target="_blank"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://wiki.yoctoproject.org/wiki/Bug_Triage#Newcomer_Bugs</a><br>
              <br>
              Alternatively, watching AUH failures and figuring out
              broken upgrades,</blockquote>
          </div>
        </div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">What is AUH? Where I can see broken upgrades you
          talked about? And more important to me, how can I replicate
          them to investigate on my side? <br>
        </div>
      </div>
    </blockquote>
    <p>AUH is "Auto Upgrade Helper". If you search the OE-core mailing
      list for the acronym, you will sometimes see results like this:</p>
    <p>[OE-core] [AUH] icu: upgrading to 73-1 FAILED</p>
    <p>These could be another area to look at contributing in addition
      to the Newcomer Bugs or other parts of the Bugzilla, but the
      Newcomer list is probably the best place to get yourself
      familiarized.</p>
    <p>You may find this page useful when it comes to recipe upgrades:
      <a class="moz-txt-link-freetext" href="https://docs.yoctoproject.org/dev/dev-manual/upgrading-recipes.html">https://docs.yoctoproject.org/dev/dev-manual/upgrading-recipes.html</a></p>
    <p>- Trevor<br>
    </p>
    <blockquote type="cite"
cite="mid:CA+cAkersaTEgB7zzvAHrr9nhicFT=Rtz30GQ_GaEHwNbSEQ5-Q@mail.gmail.com">
      <div dir="auto">
        <div dir="auto"><br>
        </div>
        <div dir="auto">
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex"> <br>
              or looking on the Bugzilla under terms like "ptest" could
              also be very <br>
              useful, while providing better understanding of how
              recipes are written <br>
              and being somewhat more accessible.<br>
              <br>
              You can also ask questions in the #yocto channel on the
              Libera.Chat IRC <br>
              server if you need additional help.<br>
              <br>
              - Trevor<br>
              <br>
              &gt;<br>
              &gt; Alex<br>
              &gt;<br>
              &gt; On Fri, 5 May 2023 at 19:17, Frederic Martinsons<br>
              &gt; &lt;<a href="mailto:frederic.martinsons@gmail.com"
                target="_blank" rel="noreferrer" moz-do-not-send="true"
                class="moz-txt-link-freetext">frederic.martinsons@gmail.com</a>&gt;
              wrote:<br>
              &gt;&gt; Hello list<br>
              &gt;&gt;<br>
              &gt;&gt; I'm wondering if there are documentations on how
              contribution are managed for the project.<br>
              &gt;&gt;<br>
              &gt;&gt; I try to find some but didn't manage to. There
              are easily reachable doc about how to contribute of course
              (how to make patches, fixe your identity, send mail via
              git... etc) but I didn't find what I usually find on other
              open source project (CONTRIBUTING.md file most of the
              time) like<br>
              &gt;&gt;    - what are the tests do should I run before
              submitting (I learnt by practice about test image or
              bitbake selftest for example) ?<br>
              &gt;&gt;    - is there a specific configuration that I
              should test before submitting (poky is ok, or should I
              also test another distro)?<br>
              &gt;&gt;    - does some commit writing rules exist ? (some
              projects want commits to begin with a prefix, usually the
              software component that is modified by the patch for
              example)<br>
              &gt;&gt;   - what are the coding rules you should follow,
              if any? (having common coding rules helps greatly the
              review of patches, pylint for python code for example, and
              I saw there are some bitbake recipes linter from meta-sca
              layer)<br>
              &gt;&gt;<br>
              &gt;&gt; Long story short, I really would like to know
              what are the different steps a patch should go through
              before being merged into master (and as a side question,
              what are the steps for a patch to be backported into one
              of the LTS branch).<br>
              &gt;&gt;<br>
              &gt;&gt; I'm deeply sorry if all these questions are
              obvious to you and have been already answered somewhere,
              in that case, please just give me the link.<br>
              &gt;&gt;<br>
              &gt;&gt; I recently started to contribute to yocto / oe
              and I think it will help me to make better contributions
              if I know more of how it works "under the hood".<br>
              &gt;&gt;<br>
              &gt;&gt; Best regards.<br>
              &gt;&gt;<br>
              &gt;&gt;<br>
              &gt;&gt;<br>
              &gt;&gt;<br>
              &gt;&gt; -=-=-=-=-=-=-=-=-=-=-=-<br>
              &gt;&gt; Links: You receive all messages sent to this
              group.<br>
              &gt;&gt; View/Reply Online (#180962): <a
                href="https://lists.openembedded.org/g/openembedded-core/message/180962"
                rel="noreferrer noreferrer" target="_blank"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://lists.openembedded.org/g/openembedded-core/message/180962</a><br>
              &gt;&gt; Mute This Topic: <a
                href="https://lists.openembedded.org/mt/98710419/7611679"
                rel="noreferrer noreferrer" target="_blank"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://lists.openembedded.org/mt/98710419/7611679</a><br>
              &gt;&gt; Group Owner: <a
                href="mailto:openembedded-core%2Bowner@lists.openembedded.org"
                target="_blank" rel="noreferrer" moz-do-not-send="true">openembedded-core+owner@lists.openembedded.org</a><br>
              &gt;&gt; Unsubscribe: <a
                href="https://lists.openembedded.org/g/openembedded-core/unsub"
                rel="noreferrer noreferrer" target="_blank"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://lists.openembedded.org/g/openembedded-core/unsub</a>
              [<a href="mailto:tgamblin@baylibre.com" target="_blank"
                rel="noreferrer" moz-do-not-send="true"
                class="moz-txt-link-freetext">tgamblin@baylibre.com</a>]<br>
              &gt;&gt; -=-=-=-=-=-=-=-=-=-=-=-<br>
              &gt;&gt;<br>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------l0nYyZNUvybhRYAn3iF4wwqI--


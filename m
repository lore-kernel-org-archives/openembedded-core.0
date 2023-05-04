Return-Path: <peter@berginkonsult.se>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66EC0C7EE21
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 11:42:56 +0000 (UTC)
Received: from mailrelay4-2.pub.mailoutpod2-cph3.one.com (mailrelay4-2.pub.mailoutpod2-cph3.one.com [46.30.211.185])
 by mx.groups.io with SMTP id smtpd.web11.47197.1683200572879792666
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 May 2023 04:42:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=rsa2 header.b=eEFFsyTl;
 spf=none, err=permanent DNS error (domain: berginkonsult.se, ip: 46.30.211.185, mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=rsa2;
	h=in-reply-to:from:references:cc:to:subject:mime-version:date:message-id:
	 content-type:from;
	bh=1n10WpJL8kRnPRvm4yAFIppFv/nSXfMkcP6qYAG5sRY=;
	b=eEFFsyTlaX2zaemvGQxutvas5lRTAltXYkcd2+cNFO5JLTGSibAqm1OymxJut1TouHwoHuvhfVfBT
	 CjFSGyGjENsaFXJEywkrzHMS+kwCqLbFF75xQ71ZBbYje2KCfFwa2A9uWc8FfmpOB7t+5ujH+dOGhU
	 6j4NMYfn4a+qrBVgnpjWuJl/JQtLTk62TpGjRk4YuDopJpn6L7eEzdYV0K4ooaDGuCbT8w5zgBkCr1
	 McC7OhggUKA0JPchkTNQjHWs4I6AJwt0CmORp3w2Z34H0pheQX7A94U1FR3MHjO89nU8rvg8/+2kX1
	 1pZ2DoHzdHMWQzlEVc8CttF/Jx4Azag==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=ed2;
	h=in-reply-to:from:references:cc:to:subject:mime-version:date:message-id:
	 content-type:from;
	bh=1n10WpJL8kRnPRvm4yAFIppFv/nSXfMkcP6qYAG5sRY=;
	b=F6PJ/IN3jvp/K0HfJ9B5TIqwe96UGj2SEFIvPJTXAY35G40EsWjTrvoGs+as9bxPKS6j9mzkimUok
	 aMYsmvEBw==
X-HalOne-ID: cb88bcac-ea70-11ed-8118-592bb1efe9dc
Received: from [192.168.100.229] (c-799071d5.44006-0-69747578.bbcust.telenor.se [213.113.144.121])
	by mailrelay4 (Halon) with ESMTPSA
	id cb88bcac-ea70-11ed-8118-592bb1efe9dc;
	Thu, 04 May 2023 11:42:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------11QrkByJctc0cSKnAbjTcdoj"
Message-ID: <a0178343-4386-14af-82d0-cecd0074866e@berginkonsult.se>
Date: Thu, 4 May 2023 13:42:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core] [RFC] python3-cryptogaphy upgrade to 40.0.2 issues
Content-Language: en-US
To: Frederic Martinsons <frederic.martinsons@gmail.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Tim Orling <ticotimo@gmail.com>,
 openembedded-core <openembedded-core@lists.openembedded.org>
References: <CANx9H-B4seY487YwfvgW2ze_n6MWr73kJsOTc8spdou32qubKg@mail.gmail.com>
 <57f1224b-14c5-2ba4-c752-98dba8f57a21@berginkonsult.se>
 <CANNYZj-uE2WUvfZpjq67wHyeFqQaN1L7HYp54Fm99J5UzS8cdw@mail.gmail.com>
 <CA+cAkeoxG-eF=PKs8en6TcjQ4yDJgit8JfrXjKdtVJSVkjj2aA@mail.gmail.com>
 <CA+cAkepRm8-TYJEJRLPPtr05+D_CsnYJDwPYsECEZ96cqpggOA@mail.gmail.com>
From: Peter Bergin <peter@berginkonsult.se>
In-Reply-To: <CA+cAkepRm8-TYJEJRLPPtr05+D_CsnYJDwPYsECEZ96cqpggOA@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 11:42:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180866

This is a multi-part message in MIME format.
--------------11QrkByJctc0cSKnAbjTcdoj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2023-05-04 12:03, Frederic Martinsons wrote:
>
>
> Le jeu. 4 mai 2023, 11:31, Frédéric Martinsons 
> <frederic.martinsons@gmail.com> a écrit :
>
>
>
>     On Thu, 4 May 2023 at 11:00, Alexander Kanavin
>     <alex.kanavin@gmail.com> wrote:
>
>         On Thu, 4 May 2023 at 10:41, Peter Bergin
>         <peter@berginkonsult.se> wrote:
>
>         > At
>         >
>         https://github.com/pyca/cryptography/blob/f816b457494e010b655cd7fdcd30e3446f86a703/src/rust/build.rs#L46
>         > the path to python includes is defined by calling 'python3
>         -c "import
>         > sysconfig; print(sysconfig.get_path('include'))"' (but from
>         inside
>         > rust). With print-debugging this seems to return the bad string
>         > '/usr/include/python3.11' which is then passed to cc::Build
>         >
>         > I executed this in recipe context:
>         >
>         > do_compile:prepend() {
>         >      which python3
>         >      python3 -c "import sysconfig;
>         print(sysconfig.get_path('include'))"
>         > }
>         >
>         > and then I got the correct return value:
>         >
>         > |
>         >
>         /work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot-native/usr/bin/python3-native/python3
>         > |
>         >
>         /work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot-native/usr/include/python3.11
>
>         This is pointing to the native sysroot in a target build, so it is
>         most likely not actually correct. I believe 'inherit
>         python3targetconfig' may help, as it substitutes most places where
>         native python gets queried by components with target-specific
>         values.
>
>         Alex
>
>
>     Unless I'm mistaken , in the error message we can see that the
>     compiler specified the sysroot correctly (recipe-sysroot and
>     recipe-sysroot-native)
>
>
> recipe-sysroot and NOT recipe-sysroot-native

'--sysroot' is specified correct but that is not automatically add 
search paths to '-I' directive, if I'm not misreading this: 
https://gcc.gnu.org/onlinedocs/gcc/Directory-Options.html . When you use 
--sysroot with gcc you have to add = or $SYSROOT to your -I directive in 
order to add it to search path for headers. With that information I 
guess '-I =/usr/lib/python3.11' or '-I \$SYSROOT/usr/lib/python3.11' can 
work but '-I /usr/lib/python3.11' will point to your host.

/Peter


--------------11QrkByJctc0cSKnAbjTcdoj
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2023-05-04 12:03, Frederic
      Martinsons wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CA+cAkepRm8-TYJEJRLPPtr05+D_CsnYJDwPYsECEZ96cqpggOA@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="auto">
        <div><br>
          <br>
          <div class="gmail_quote">
            <div dir="ltr" class="gmail_attr">Le jeu. 4 mai 2023, 11:31,
              Frédéric Martinsons &lt;<a
                href="mailto:frederic.martinsons@gmail.com"
                moz-do-not-send="true" class="moz-txt-link-freetext">frederic.martinsons@gmail.com</a>&gt;
              a écrit :<br>
            </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div dir="ltr">
                <div dir="ltr"><br>
                </div>
                <br>
                <div class="gmail_quote">
                  <div dir="ltr" class="gmail_attr">On Thu, 4 May 2023
                    at 11:00, Alexander Kanavin &lt;<a
                      href="mailto:alex.kanavin@gmail.com"
                      target="_blank" rel="noreferrer"
                      moz-do-not-send="true"
                      class="moz-txt-link-freetext">alex.kanavin@gmail.com</a>&gt;
                    wrote:<br>
                  </div>
                  <blockquote class="gmail_quote" style="margin:0px 0px
                    0px 0.8ex;border-left:1px solid
                    rgb(204,204,204);padding-left:1ex">On Thu, 4 May
                    2023 at 10:41, Peter Bergin &lt;<a
                      href="mailto:peter@berginkonsult.se"
                      target="_blank" rel="noreferrer"
                      moz-do-not-send="true"
                      class="moz-txt-link-freetext">peter@berginkonsult.se</a>&gt;
                    wrote:<br>
                    <br>
                    &gt; At<br>
                    &gt; <a
href="https://github.com/pyca/cryptography/blob/f816b457494e010b655cd7fdcd30e3446f86a703/src/rust/build.rs#L46"
                      rel="noreferrer noreferrer" target="_blank"
                      moz-do-not-send="true"
                      class="moz-txt-link-freetext">https://github.com/pyca/cryptography/blob/f816b457494e010b655cd7fdcd30e3446f86a703/src/rust/build.rs#L46</a><br>
                    &gt; the path to python includes is defined by
                    calling 'python3 -c "import<br>
                    &gt; sysconfig;
                    print(sysconfig.get_path('include'))"' (but from
                    inside<br>
                    &gt; rust). With print-debugging this seems to
                    return the bad string<br>
                    &gt; '/usr/include/python3.11' which is then passed
                    to cc::Build<br>
                    &gt;<br>
                    &gt; I executed this in recipe context:<br>
                    &gt;<br>
                    &gt; do_compile:prepend() {<br>
                    &gt;      which python3<br>
                    &gt;      python3 -c "import sysconfig;
                    print(sysconfig.get_path('include'))"<br>
                    &gt; }<br>
                    &gt;<br>
                    &gt; and then I got the correct return value:<br>
                    &gt;<br>
                    &gt; |<br>
                    &gt;
/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot-native/usr/bin/python3-native/python3<br>
                    &gt; |<br>
                    &gt;
/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot-native/usr/include/python3.11<br>
                    <br>
                    This is pointing to the native sysroot in a target
                    build, so it is<br>
                    most likely not actually correct. I believe 'inherit<br>
                    python3targetconfig' may help, as it substitutes
                    most places where<br>
                    native python gets queried by components with
                    target-specific values.<br>
                    <br>
                    Alex<br>
                  </blockquote>
                  <div><br>
                  </div>
                  <div>Unless I'm mistaken , in the error message we can
                    see that the compiler specified the sysroot
                    correctly (recipe-sysroot and recipe-sysroot-native)</div>
                </div>
              </div>
            </blockquote>
          </div>
        </div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">recipe-sysroot and NOT recipe-sysroot-native <br>
        </div>
      </div>
    </blockquote>
    <p>'--sysroot' is specified correct but that is not automatically
      add search paths to '-I' directive, if I'm not misreading this:
      <a class="moz-txt-link-freetext" href="https://gcc.gnu.org/onlinedocs/gcc/Directory-Options.html">https://gcc.gnu.org/onlinedocs/gcc/Directory-Options.html</a> . When
      you use --sysroot with gcc you have to add = or $SYSROOT to your
      -I directive in order to add it to search path for headers. With
      that information I guess '-I =/usr/lib/python3.11' or '-I
      \$SYSROOT/usr/lib/python3.11' can work but '-I
      /usr/lib/python3.11' will point to your host.</p>
    <p>/Peter<br>
    </p>
    <br>
  </body>
</html>

--------------11QrkByJctc0cSKnAbjTcdoj--


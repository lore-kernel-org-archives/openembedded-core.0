Received: from smtp0.taitradio.net (smtp0.taitradio.net [202.37.96.22])
 by mx.groups.io with SMTP id smtpd.web10.4755.1595990029735769610
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2020 19:33:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: taitradio.com, ip: 202.37.96.22, mailfrom: douglas.royds@taitradio.com)
Received: from [172.16.169.141] (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id 2F288220248
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2020 14:33:46 +1200 (NZST)
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
From: "Douglas" <douglas.royds@taitradio.com>
Subject: sdk package_arch and yum
Message-ID: <cf22da6d-2a72-15b4-9027-8b81fe3cc264@taitradio.com>
Date: Wed, 29 Jul 2020 14:33:46 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------B496B2376AB955461FC7517E"
Content-Language: en-GB

--------------B496B2376AB955461FC7517E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I was unable to install my nativesdk packages on CentOS using yum, as 
the package architecture was set to "x86_64_nativesdk". My web-digging 
revealed no work-around I could use for yum.

dnf (available in CentOS 8, I believe) supports a --forcearch 
<https://www.mankier.com/8/dnf#--forcearch> option, and also provides an 
ignorearch <https://www.mankier.com/5/dnf.conf#ignorearch> configuration 
option, though this seems an unsatisfactory work-around.

For the experiment, I forced the sdk package_arch to simply "x86_64", 
and yum cheerfully installed the resulting rpm packages:

    PACKAGE_ARCH_class-nativesdk = "${SDK_ARCH}"
    SDK_PACKAGE_ARCHS = "all any noarch ${SDK_ARCH}"

I have no familiarity with yum. Am I missing something?

If not, I will propose a patch to create packages with PACKAGE_ARCH = 
x86_64 in the nativesdk case, but I wanted a sanity check before I did 
this work.

For the record, apt did install the corresponding .deb files, cheerfully 
ignoring the architecture.


--------------B496B2376AB955461FC7517E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>I was unable to install my nativesdk packages on CentOS using
      yum, as the package architecture was set to "x86_64_nativesdk". My
      web-digging revealed no work-around I could use for yum.<br>
    </p>
    <p>dnf (available in CentOS 8, I believe) supports a <a
        moz-do-not-send="true"
        href="https://www.mankier.com/8/dnf#--forcearch">--forcearch</a>
      option, and also provides an <a moz-do-not-send="true"
        href="https://www.mankier.com/5/dnf.conf#ignorearch">ignorearch</a>
      configuration option, though this seems an unsatisfactory
      work-around.<br>
    </p>
    <p>For the experiment, I forced the sdk package_arch to simply
      "x86_64", and yum cheerfully installed the resulting rpm packages:</p>
    <blockquote>
      <p><tt>PACKAGE_ARCH_class-nativesdk = "${SDK_ARCH}"</tt><tt><br>
        </tt><tt>SDK_PACKAGE_ARCHS = "all any noarch ${SDK_ARCH}"</tt><br>
      </p>
    </blockquote>
    <p>I have no familiarity with yum. Am I missing something?</p>
    <p>If not, I will propose a patch to create packages with
      PACKAGE_ARCH = x86_64 in the nativesdk case, but I wanted a sanity
      check before I did this work.</p>
    <p>For the record, apt did install the corresponding .deb files,
      cheerfully ignoring the architecture.<br>
    </p>
  </body>
</html>

--------------B496B2376AB955461FC7517E--

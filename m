Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1THZFb-0007WP-6s
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 14:00:59 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8SBm0rS008098
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Sep 2012 04:48:01 -0700 (PDT)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Fri, 28 Sep 2012 04:48:00 -0700
Message-ID: <50658E84.9090206@windriver.com>
Date: Fri, 28 Sep 2012 19:48:20 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Originating-IP: [128.224.162.159]
Cc: openembedded-core@lists.openembedded.org
Subject: Some problems about nativesdk-perl
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Sep 2012 12:00:59 -0000
Content-Type: multipart/alternative;
	boundary="------------020400010409030609000006"

--------------020400010409030609000006
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Richard,

I meet 2 problems about nativesdk-perl.

First one is that nativesdk-perl-modules doesn't depends on the single 
nativesdk-perl-module-xxx which I asked you yesterday, but I still don't 
know how to fix it.
I tried to add one line to perl_5.14.2.bb:
RRECOMMENDS_perl-modules_virtclass-nativesdk += 
"nativesdk-perl-module-config"

and it will cover the original value and make nativesdk-perl-modules 
only depends on nativesdk-perl-module-config.
Doesn't "+=" work for nativesdk ?

The second issue is the latest commit for perl(Yocto commit 
876ec81c039132d07a5f3d99bae40d6154351d41) . I build meta-toolchain-gmae 
with it,
and the perl @INC path remove the 
"/opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux" prefix.
Is that the right operation?

Regards,
Kai

--------------020400010409030609000006
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <font size="+1">Hi Richard,<br>
      <br>
      I meet 2 problems about nativesdk-perl. <br>
      <br>
      First one is that nativesdk-perl-modules doesn't depends on the
      single nativesdk-perl-module-xxx which I asked you yesterday, but
      I still don't know how to fix it.<br>
      I tried to add one line to perl_5.14.2.bb:<br>
      RRECOMMENDS_perl-modules_virtclass-nativesdk +=
      "nativesdk-perl-module-config" <br>
      <br>
      and it will cover the original value and make
      nativesdk-perl-modules only depends on </font><font size="+1">nativesdk-perl-module-config.<br>
      Doesn't "+=" work for nativesdk ?<br>
      <br>
      The second issue is the latest commit for perl(Yocto commit
      876ec81c039132d07a5f3d99bae40d6154351d41) . I build
      meta-toolchain-gmae with it, <br>
      and the perl @INC path remove the
      "/opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux" prefix.<br>
      Is that the right operation?<br>
      <br>
      Regards,<br>
      Kai<br>
    </font>
  </body>
</html>

--------------020400010409030609000006--

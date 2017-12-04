Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6CC2971C42
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Dec 2017 01:19:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vB41Jt2d004414
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 3 Dec 2017 17:19:55 -0800 (PST)
Received: from [128.224.162.178] (128.224.162.178) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Sun, 3 Dec 2017 17:19:54 -0800
To: Tim Orling <ticotimo@gmail.com>
References: <cover.1512111404.git.dengke.du@windriver.com>
	<43d0b786bf6dc1ae091ddb6c5c590880cadcc6fe.1512111404.git.dengke.du@windriver.com>
	<CAMKF1sq-VPxdRuKcpbvfK74GRnTk5mNwthuYj6S92bXCdPuF3Q@mail.gmail.com>
	<CANx9H-DT97H1kJDMRzmHQh9CZB5GFw4y-_vj8D8y=ZZ+f1Mmhw@mail.gmail.com>
From: Dengke Du <dengke.du@windriver.com>
Message-ID: <d704dab3-539d-8cc3-829c-71ed2b35db8f@windriver.com>
Date: Mon, 4 Dec 2017 09:18:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CANx9H-DT97H1kJDMRzmHQh9CZB5GFw4y-_vj8D8y=ZZ+f1Mmhw@mail.gmail.com>
X-Originating-IP: [128.224.162.178]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] ltp: add runtime depends ltp-staticdev
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
X-List-Received-Date: Mon, 04 Dec 2017 01:19:55 -0000
Content-Type: multipart/alternative;
	boundary="------------D28FB5C9F66324031357C905"
Content-Language: en-US

--------------D28FB5C9F66324031357C905
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Sorry for my errors, I have added the "ltp-staticdev" to my 
IMAGE_INSTALL_append,

so the nm01 test case have passed.


On 2017年12月02日 00:01, Tim Orling wrote:
> On Fri, Dec 1, 2017 at 6:52 AM Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>> wrote:
>
>     On Thu, Nov 30, 2017 at 10:58 PM, Dengke Du
>     <dengke.du@windriver.com <mailto:dengke.du@windriver.com>> wrote:
>     > The test case nm01 depends on /opt/ltp/testcases/data/nm01/lib.a in
>     > ltp-staticdev package.
>     >
>
>     perhaps its better to create a packaging exception to include this
>     static
>     library to be packaged into ${PN}
>
>     > Signed-off-by: Dengke Du <dengke.du@windriver.com
>     <mailto:dengke.du@windriver.com>>
>     > ---
>     >  meta/recipes-extended/ltp/ltp_20170929.bb
>     <http://ltp_20170929.bb> | 1 +
>     >  1 file changed, 1 insertion(+)
>     >
>     > diff --git a/meta/recipes-extended/ltp/ltp_20170929.bb
>     <http://ltp_20170929.bb>
>     b/meta/recipes-extended/ltp/ltp_20170929.bb <http://ltp_20170929.bb>
>     > index 93a59b3..6fd280c 100644
>     > --- a/meta/recipes-extended/ltp/ltp_20170929.bb
>     <http://ltp_20170929.bb>
>     > +++ b/meta/recipes-extended/ltp/ltp_20170929.bb
>     <http://ltp_20170929.bb>
>     > @@ -108,6 +108,7 @@ RDEPENDS_${PN} = "\
>     >  FILES_${PN}-staticdev += "/opt/ltp/lib/libmem.a
>     /opt/ltp/testcases/data/nm01/lib.a"
>     >
>     >  FILES_${PN} += "/opt/ltp/* /opt/ltp/runtest/*
>     /opt/ltp/scenario_groups/* /opt/ltp/testcases/bin/*
>     /opt/ltp/testcases/bin/*/bin/* /opt/ltp/testscripts/*
>     /opt/ltp/testcases/open_posix_testsuite/*
>     /opt/ltp/testcases/open_posix_testsuite/conformance/*
>     /opt/ltp/testcases/open_posix_testsuite/Documentation/*
>     /opt/ltp/testcases/open_posix_testsuite/functional/*
>     /opt/ltp/testcases/open_posix_testsuite/include/*
>     /opt/ltp/testcases/open_posix_testsuite/scripts/*
>     /opt/ltp/testcases/open_posix_testsuite/stress/*
>     /opt/ltp/testcases/open_posix_testsuite/tools/*"
>     > +RDEPENDES_${PN} += "${PN}-staticdev"
>
>
> Typo in RDEPENDS
> Please make sure you test patches before submitting. This could not 
> have worked as intended.
>
>     >
>     >  # Avoid generated binaries stripping. Otherwise some of the ltp
>     tests such as ldd01 & nm01 fails
>     >  INHIBIT_PACKAGE_STRIP = "1"
>     > --
>     > 2.8.1
>     >
>     > --
>     > _______________________________________________
>     > Openembedded-core mailing list
>     > Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


--------------D28FB5C9F66324031357C905
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Sorry for my errors, I have added the "ltp-staticdev" to my
      IMAGE_INSTALL_append, <br>
    </p>
    <p>so the nm01 test case have passed.<br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 2017年12月02日 00:01, Tim Orling wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANx9H-DT97H1kJDMRzmHQh9CZB5GFw4y-_vj8D8y=ZZ+f1Mmhw@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div>
        <div>
          <div class="gmail_quote">
            <div dir="auto">On Fri, Dec 1, 2017 at 6:52 AM Khem Raj &lt;<a
                href="mailto:raj.khem@gmail.com" target="_blank"
                moz-do-not-send="true">raj.khem@gmail.com</a>&gt; wrote:<br>
            </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu,
              Nov 30, 2017 at 10:58 PM, Dengke Du &lt;<a
                href="mailto:dengke.du@windriver.com" target="_blank"
                moz-do-not-send="true">dengke.du@windriver.com</a>&gt;
              wrote:<br>
              &gt; The test case nm01 depends on
              /opt/ltp/testcases/data/nm01/lib.a in<br>
              &gt; ltp-staticdev package.<br>
              &gt;<br>
              <br>
              perhaps its better to create a packaging exception to
              include this static<br>
              library to be packaged into ${PN}<br>
              <br>
              &gt; Signed-off-by: Dengke Du &lt;<a
                href="mailto:dengke.du@windriver.com" target="_blank"
                moz-do-not-send="true">dengke.du@windriver.com</a>&gt;<br>
              &gt; ---<br>
              &gt;  meta/recipes-extended/ltp/<a
                href="http://ltp_20170929.bb" rel="noreferrer"
                target="_blank" moz-do-not-send="true">ltp_20170929.bb</a>
              | 1 +<br>
              &gt;  1 file changed, 1 insertion(+)<br>
              &gt;<br>
              &gt; diff --git a/meta/recipes-extended/ltp/<a
                href="http://ltp_20170929.bb" rel="noreferrer"
                target="_blank" moz-do-not-send="true">ltp_20170929.bb</a>
              b/meta/recipes-extended/ltp/<a
                href="http://ltp_20170929.bb" rel="noreferrer"
                target="_blank" moz-do-not-send="true">ltp_20170929.bb</a><br>
              &gt; index 93a59b3..6fd280c 100644<br>
              &gt; --- a/meta/recipes-extended/ltp/<a
                href="http://ltp_20170929.bb" rel="noreferrer"
                target="_blank" moz-do-not-send="true">ltp_20170929.bb</a><br>
              &gt; +++ b/meta/recipes-extended/ltp/<a
                href="http://ltp_20170929.bb" rel="noreferrer"
                target="_blank" moz-do-not-send="true">ltp_20170929.bb</a><br>
              &gt; @@ -108,6 +108,7 @@ RDEPENDS_${PN} = "\<br>
              &gt;  FILES_${PN}-staticdev += "/opt/ltp/lib/libmem.a
              /opt/ltp/testcases/data/nm01/lib.a"<br>
              &gt;<br>
              &gt;  FILES_${PN} += "/opt/ltp/* /opt/ltp/runtest/*
              /opt/ltp/scenario_groups/* /opt/ltp/testcases/bin/*
              /opt/ltp/testcases/bin/*/bin/* /opt/ltp/testscripts/*
              /opt/ltp/testcases/open_posix_testsuite/*
              /opt/ltp/testcases/open_posix_testsuite/conformance/*
              /opt/ltp/testcases/open_posix_testsuite/Documentation/*
              /opt/ltp/testcases/open_posix_testsuite/functional/*
              /opt/ltp/testcases/open_posix_testsuite/include/*
              /opt/ltp/testcases/open_posix_testsuite/scripts/*
              /opt/ltp/testcases/open_posix_testsuite/stress/*
              /opt/ltp/testcases/open_posix_testsuite/tools/*"<br>
              &gt; +RDEPENDES_${PN} += "${PN}-staticdev"<br>
            </blockquote>
            <div dir="auto"><br>
            </div>
          </div>
        </div>
      </div>
      <div>
        <div>
          <div class="gmail_quote">
            <div dir="auto">Typo in RDEPENDS</div>
            <div dir="auto">Please make sure you test patches before
              submitting. This could not have worked as intended.</div>
          </div>
        </div>
      </div>
      <div>
        <div>
          <div class="gmail_quote">
            <div dir="auto"><br>
            </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">&gt;<br>
              &gt;  # Avoid generated binaries stripping. Otherwise some
              of the ltp tests such as ldd01 &amp; nm01 fails<br>
              &gt;  INHIBIT_PACKAGE_STRIP = "1"<br>
              &gt; --<br>
              &gt; 2.8.1<br>
              &gt;<br>
              &gt; --<br>
              &gt; _______________________________________________<br>
              &gt; Openembedded-core mailing list<br>
              &gt; <a
                href="mailto:Openembedded-core@lists.openembedded.org"
                target="_blank" moz-do-not-send="true">Openembedded-core@lists.openembedded.org</a><br>
              &gt; <a
                href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                rel="noreferrer" target="_blank" moz-do-not-send="true">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
              --<br>
              _______________________________________________<br>
              Openembedded-core mailing list<br>
              <a href="mailto:Openembedded-core@lists.openembedded.org"
                target="_blank" moz-do-not-send="true">Openembedded-core@lists.openembedded.org</a><br>
              <a
                href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                rel="noreferrer" target="_blank" moz-do-not-send="true">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------D28FB5C9F66324031357C905--

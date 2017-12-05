Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F093960103
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 23:53:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vB5Nr3fu029127
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 5 Dec 2017 15:53:03 -0800 (PST)
Received: from [128.224.162.134] (128.224.162.134) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 5 Dec 2017 15:53:01 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <1511849598-21661-1-git-send-email-yi.zhao@windriver.com>
	<CAJTo0LY4jzykDKeZtD7Z7qqr1JQz36K97E6dvzr0ZXBGeDEbjg@mail.gmail.com>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <74d7650c-ca45-c292-b443-583ec7fc27da@windriver.com>
Date: Wed, 6 Dec 2017 07:51:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LY4jzykDKeZtD7Z7qqr1JQz36K97E6dvzr0ZXBGeDEbjg@mail.gmail.com>
X-Originating-IP: [128.224.162.134]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] icu: fix libicudata corruption on big endian system
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
X-List-Received-Date: Tue, 05 Dec 2017 23:53:08 -0000
Content-Type: multipart/alternative;
	boundary="------------F913B2BE2CE7A22EFABAF243"
Content-Language: en-US

--------------F913B2BE2CE7A22EFABAF243
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit


I had sent V2 patch to fix this issue.


//Yi


在 2017年12月05日 19:44, Burton, Ross 写道:
> On 28 November 2017 at 06:13, Yi Zhao <yi.zhao@windriver.com 
> <mailto:yi.zhao@windriver.com>> wrote:
>
>     ICU library libicudata is created with a wrong endianness if the host
>     and target have different endianness. (e.g. build ICU for qemuppc on
>     x86-64 host)
>     See upstream bug report:
>     http://bugs.icu-project.org/trac/ticket/11758
>     <http://bugs.icu-project.org/trac/ticket/11758>
>
>     The discussion in oe-core mailing list:
>     https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg65155.html
>     <https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg65155.html>
>
>     The root cause is the native pkgdata can not generate correct icu data
>     for different endianness. By default, this data is built into the
>     shared
>     library libicudata that would cause it corrupt. But ICU also provides
>     additional options for loading the data. With option
>     --with-data-packaging=archive, ICU outputs a single icudt.dat file
>     which
>     can be loaded by the library.
>     See document: http://userguide.icu-project.org/icudata
>     <http://userguide.icu-project.org/icudata>
>
>     So for big endian system, we can use the separated data file which
>     re-generates by icupkg and set the correct ICU_DATA environment
>     variable
>     to make sure the library can load the data without problems.
>
>
> Fails on various builds on the AB:
>
> icupkg: unable to open input file 
> "TOPDIR/tmp/work/ppc7400-poky-linux/icu/60.1-r0/icu/source/data/in/icudt59l.dat" 
>
>
> http://errors.yoctoproject.org/Errors/Latest/?filter=%20icu:%20do_install&type=failure
>
> Ross


--------------F913B2BE2CE7A22EFABAF243
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <p>I had sent V2 patch to fix this issue.</p>
    <p><br>
    </p>
    <p>//Yi<br>
    </p>
    <br>
    <div class="moz-cite-prefix">在 2017年12月05日 19:44, Burton, Ross 写道:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJTo0LY4jzykDKeZtD7Z7qqr1JQz36K97E6dvzr0ZXBGeDEbjg@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">On 28 November 2017 at 06:13, Yi Zhao <span
          dir="ltr">&lt;<a href="mailto:yi.zhao@windriver.com"
            target="_blank" moz-do-not-send="true">yi.zhao@windriver.com</a>&gt;</span>
        wrote:<br>
        <div class="gmail_extra">
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">ICU
              library libicudata is created with a wrong endianness if
              the host<br>
              and target have different endianness. (e.g. build ICU for
              qemuppc on<br>
              x86-64 host)<br>
              See upstream bug report: <a
                href="http://bugs.icu-project.org/trac/ticket/11758"
                rel="noreferrer" target="_blank" moz-do-not-send="true">http://bugs.icu-project.org/<wbr>trac/ticket/11758</a><br>
              <br>
              The discussion in oe-core mailing list:<br>
              <a
href="https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg65155.html"
                rel="noreferrer" target="_blank" moz-do-not-send="true">https://www.mail-archive.com/<wbr>openembedded-core@lists.<wbr>openembedded.org/msg65155.html</a><br>
              <br>
              The root cause is the native pkgdata can not generate
              correct icu data<br>
              for different endianness. By default, this data is built
              into the shared<br>
              library libicudata that would cause it corrupt. But ICU
              also provides<br>
              additional options for loading the data. With option<br>
              --with-data-packaging=archive, ICU outputs a single
              icudt.dat file which<br>
              can be loaded by the library.<br>
              See document: <a
                href="http://userguide.icu-project.org/icudata"
                rel="noreferrer" target="_blank" moz-do-not-send="true">http://userguide.icu-project.<wbr>org/icudata</a><br>
              <br>
              So for big endian system, we can use the separated data
              file which<br>
              re-generates by icupkg and set the correct ICU_DATA
              environment variable<br>
              to make sure the library can load the data without
              problems.<br>
            </blockquote>
            <div><br>
            </div>
            <div>Fails on various builds on the AB:</div>
            <div><br>
              icupkg: unable to open input file
"TOPDIR/tmp/work/ppc7400-poky-linux/icu/60.1-r0/icu/source/data/in/icudt59l.dat" <br>
            </div>
            <div><br>
            </div>
            <div><a
href="http://errors.yoctoproject.org/Errors/Latest/?filter=%20icu:%20do_install&amp;type=failure"
                moz-do-not-send="true">http://errors.yoctoproject.org/Errors/Latest/?filter=%20icu:%20do_install&amp;type=failure</a><br>
            </div>
            <div><br>
            </div>
            <div>Ross</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------F913B2BE2CE7A22EFABAF243--

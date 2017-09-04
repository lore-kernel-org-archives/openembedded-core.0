Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5E1DA776AA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 23:03:33 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Sep 2017 16:03:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,476,1498546800"; 
	d="scan'208,217";a="897050092"
Received: from ldrojasm-mobl1.amr.corp.intel.com (HELO [10.252.248.104])
	([10.252.248.104])
	by FMSMGA003.fm.intel.com with ESMTP; 04 Sep 2017 16:03:33 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <20170821221130.2065-1-alejandro.hernandez@linux.intel.com>
	<CAJTo0LZrE1BCEewKeu=fqHWDheTAU6bYnPZRw9s-88avvN2_UQ@mail.gmail.com>
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Message-ID: <f7caba0e-76c5-62cb-7844-d625ad14666c@linux.intel.com>
Date: Mon, 4 Sep 2017 18:03:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZrE1BCEewKeu=fqHWDheTAU6bYnPZRw9s-88avvN2_UQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] hwlatdetect: fix RDEPENDS to avoid QA failures
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
X-List-Received-Date: Mon, 04 Sep 2017 23:03:33 -0000
Content-Type: multipart/alternative;
	boundary="------------B48E3E7E552CCACB2862D552"
Content-Language: en-US

--------------B48E3E7E552CCACB2862D552
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Yes, this was applied on top of master-next when the python manifest 
patches were there, Richard decided to delay those for 2.5 M1


Alejandro


On 09/04/2017 05:05 PM, Burton, Ross wrote:
> This doesn't apply to master, do you have some local Python patches?
>
> Ross
>
> On 21 August 2017 at 23:11, Alejandro Hernandez 
> <alejandro.hernandez@linux.intel.com 
> <mailto:alejandro.hernandez@linux.intel.com>> wrote:
>
>     When listing python3 as an RDEPENDS, the image will in fact
>     contain python3-modules, but the QA check fails to get
>     RPROVIDERS correctly (since the python3 package does not
>     actually exist), /usr/bin/python3 is provided by the
>     python3-core package, so by fixing the RDEPENDS and listing
>     python3-creo instead of python3, the QA check works correctly
>     and we avoid failures
>
>     Signed-off-by: Alejandro Hernandez
>     <alejandro.hernandez@linux.intel.com
>     <mailto:alejandro.hernandez@linux.intel.com>>
>     ---
>      meta/recipes-rt/rt-tests/hwlatdetect_1.1.bb
>     <http://hwlatdetect_1.1.bb> | 2 +-
>      1 file changed, 1 insertion(+), 1 deletion(-)
>
>     diff --git a/meta/recipes-rt/rt-tests/hwlatdetect_1.1.bb
>     <http://hwlatdetect_1.1.bb>
>     b/meta/recipes-rt/rt-tests/hwlatdetect_1.1.bb
>     <http://hwlatdetect_1.1.bb>
>     index 60b44a4d258..5f61c4ecddc 100644
>     --- a/meta/recipes-rt/rt-tests/hwlatdetect_1.1.bb
>     <http://hwlatdetect_1.1.bb>
>     +++ b/meta/recipes-rt/rt-tests/hwlatdetect_1.1.bb
>     <http://hwlatdetect_1.1.bb>
>     @@ -22,5 +22,5 @@ do_install() {
>      }
>
>      FILES_${PN} +=
>     "${libdir}/python${PYTHON_BASEVERSION}/dist-packages/hwlatdetect.py"
>     -RDEPENDS_${PN} = "python3 "
>     +RDEPENDS_${PN} = "python3-core "
>      RRECOMMENDS_${PN} = "kernel-module-hwlat-detector"
>     --
>     2.12.3
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>
>


--------------B48E3E7E552CCACB2862D552
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Yes, this was applied on top of master-next when the python
      manifest patches were there, Richard decided to delay those for
      2.5 M1</p>
    <p><br>
    </p>
    <p>Alejandro<br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 09/04/2017 05:05 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJTo0LZrE1BCEewKeu=fqHWDheTAU6bYnPZRw9s-88avvN2_UQ@mail.gmail.com">
      <div dir="ltr">This doesn't apply to master, do you have some
        local Python patches?
        <div><br>
        </div>
        <div>Ross</div>
      </div>
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On 21 August 2017 at 23:11, Alejandro
          Hernandez <span dir="ltr">&lt;<a
              href="mailto:alejandro.hernandez@linux.intel.com"
              target="_blank" moz-do-not-send="true">alejandro.hernandez@linux.intel.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">When
            listing python3 as an RDEPENDS, the image will in fact<br>
            contain python3-modules, but the QA check fails to get<br>
            RPROVIDERS correctly (since the python3 package does not<br>
            actually exist), /usr/bin/python3 is provided by the<br>
            python3-core package, so by fixing the RDEPENDS and listing<br>
            python3-creo instead of python3, the QA check works
            correctly<br>
            and we avoid failures<br>
            <br>
            Signed-off-by: Alejandro Hernandez &lt;<a
              href="mailto:alejandro.hernandez@linux.intel.com"
              moz-do-not-send="true">alejandro.hernandez@linux.<wbr>intel.com</a>&gt;<br>
            ---<br>
             meta/recipes-rt/rt-tests/<a
              href="http://hwlatdetect_1.1.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">hwlat<wbr>detect_1.1.bb</a>
            | 2 +-<br>
             1 file changed, 1 insertion(+), 1 deletion(-)<br>
            <br>
            diff --git a/meta/recipes-rt/rt-tests/<a
              href="http://hwlatdetect_1.1.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">hwl<wbr>atdetect_1.1.bb</a>
            b/meta/recipes-rt/rt-tests/<a
              href="http://hwlatdetect_1.1.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">hwl<wbr>atdetect_1.1.bb</a><br>
            index 60b44a4d258..5f61c4ecddc 100644<br>
            --- a/meta/recipes-rt/rt-tests/<a
              href="http://hwlatdetect_1.1.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">hwl<wbr>atdetect_1.1.bb</a><br>
            +++ b/meta/recipes-rt/rt-tests/<a
              href="http://hwlatdetect_1.1.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">hwl<wbr>atdetect_1.1.bb</a><br>
            @@ -22,5 +22,5 @@ do_install() {<br>
             }<br>
            <br>
             FILES_${PN} += "${libdir}/python${PYTHON_<wbr>BASEVERSION}/dist-packages/<wbr>hwlatdetect.py"<br>
            -RDEPENDS_${PN} = "python3 "<br>
            +RDEPENDS_${PN} = "python3-core "<br>
             RRECOMMENDS_${PN} = "kernel-module-hwlat-detector"<br>
            <span class="HOEnZb"><font color="#888888">--<br>
                2.12.3<br>
                <br>
                --<br>
                ______________________________<wbr>_________________<br>
                Openembedded-core mailing list<br>
                <a
                  href="mailto:Openembedded-core@lists.openembedded.org"
                  moz-do-not-send="true">Openembedded-core@lists.<wbr>openembedded.org</a><br>
                <a
                  href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                  rel="noreferrer" target="_blank"
                  moz-do-not-send="true">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
              </font></span></blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------B48E3E7E552CCACB2862D552--

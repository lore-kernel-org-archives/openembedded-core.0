Return-Path: <jose.perez.carranza@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id F1A897813F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 17:29:50 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Jun 2017 10:29:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,311,1493708400"; 
	d="scan'208,217";a="112089268"
Received: from jgperezc-mobl1.zpn.intel.com (HELO [10.219.4.33])
	([10.219.4.33])
	by fmsmga006.fm.intel.com with ESMTP; 07 Jun 2017 10:29:51 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <a5c78ee6-8320-7508-18d1-16762bed364c@linux.intel.com>
	<20170515135023.4090-1-jose.perez.carranza@linux.intel.com>
	<CAJTo0LYe=7Ug3wJSWwPX5VT=cy7GDe0Kf79uPFmC1tMj-0b-6Q@mail.gmail.com>
From: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
Message-ID: <e1d6c111-bd9d-af76-ae44-d6921c723ba6@linux.intel.com>
Date: Wed, 7 Jun 2017 12:31:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYe=7Ug3wJSWwPX5VT=cy7GDe0Kf79uPFmC1tMj-0b-6Q@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] runtime/dnf: Add new dnf test cases
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
X-List-Received-Date: Wed, 07 Jun 2017 17:29:51 -0000
Content-Type: multipart/alternative;
	boundary="------------B7055A227A186F1A3B196E37"
Content-Language: en-US

--------------B7055A227A186F1A3B196E37
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

When I tried this test image was built without using states hence 
"busybox*.rpm" and "curl*.rpm"where present under 
"tmp/deploy/rpm/core2_64" hence the repo i taking tha packages form 
there to add them to repo and used on the image, but when using sstates 
those packages are not being built so are not present on local build 
directory. is there any way to force those packages to be built to have 
them available on tmp/deploy/rpm/core2_64?

On 06/07/2017 05:21 AM, Burton, Ross wrote:
>
> On 15 May 2017 at 14:50, <jose.perez.carranza@linux.intel.com 
> <mailto:jose.perez.carranza@linux.intel.com>> wrote:
>
>     Add test cases to test “exclude” and “installroot“ options, also
>     modify
>     the logic of filtering packages on the feed to have all the packages
>     needed by the tests.
>
>
> Fails all over the autobuilder, for example:
>
> http://errors.yoctoproject.org/Errors/Details/143886/
>
> Ross

-- 
Saludos
José


--------------B7055A227A186F1A3B196E37
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    When I tried this test image was built without using states hence
    "busybox*.rpm" and "curl*.rpm"where present under
    "tmp/deploy/rpm/core2_64" hence the repo i taking tha packages form
    there to add them to repo and used on the image, but when using
    sstates those packages are not being built so are not present on
    local build directory. is there any way to force those packages to
    be built to have them available on tmp/deploy/rpm/core2_64? <br>
    <br>
    <div class="moz-cite-prefix">On 06/07/2017 05:21 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJTo0LYe=7Ug3wJSWwPX5VT=cy7GDe0Kf79uPFmC1tMj-0b-6Q@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 15 May 2017 at 14:50, <span
              dir="ltr">&lt;<a
                href="mailto:jose.perez.carranza@linux.intel.com"
                target="_blank" moz-do-not-send="true">jose.perez.carranza@linux.intel.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex"><span
                class="gmail-">Add test cases to test “exclude” and
                “installroot“ options, also modify<br>
                the logic of filtering packages on the feed to have all
                the packages<br>
                needed by the tests.<br>
              </span></blockquote>
          </div>
          <div class="gmail_extra"><br>
          </div>
          Fails all over the autobuilder, for example:</div>
        <div class="gmail_extra"><br>
          <a
            href="http://errors.yoctoproject.org/Errors/Details/143886/"
            moz-do-not-send="true">http://errors.yoctoproject.org/Errors/Details/143886/</a><br>
        </div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
    <pre class="moz-signature" cols="72">-- 
Saludos 
José </pre>
  </body>
</html>

--------------B7055A227A186F1A3B196E37--

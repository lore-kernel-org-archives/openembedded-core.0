Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6B34D60119
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2016 20:29:59 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 08 Jul 2016 13:30:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,331,1464678000"; 
	d="scan'208,217";a="1013386432"
Received: from aehernan-mobl1.zpn.intel.com (HELO [10.219.17.113])
	([10.219.17.113])
	by orsmga002.jf.intel.com with ESMTP; 08 Jul 2016 13:30:00 -0700
To: openembedded-core@lists.openembedded.org
References: <cover.1467905611.git.jussi.kukkonen@intel.com>
	<b0ba31b71ad1e9d540ab007713fe034a3bc1f7d1.1467905611.git.jussi.kukkonen@intel.com>
	<CAJTo0LZ67c7MXQrsBYzK6c+dQ3DGq0Xp5To+pz64qo=Cu8qeKQ@mail.gmail.com>
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Message-ID: <da5b22b8-5378-46d9-c787-a34f25542742@linux.intel.com>
Date: Fri, 8 Jul 2016 15:30:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ67c7MXQrsBYzK6c+dQ3DGq0Xp5To+pz64qo=Cu8qeKQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] python-six: Add to oe-core
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
X-List-Received-Date: Fri, 08 Jul 2016 20:30:00 -0000
Content-Type: multipart/alternative;
	boundary="------------2F1707DDD6BB58894F1FE7FA"

--------------2F1707DDD6BB58894F1FE7FA
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 07/08/2016 03:17 PM, Burton, Ross wrote:
>
> On 7 July 2016 at 16:39, Jussi Kukkonen <jussi.kukkonen@intel.com 
> <mailto:jussi.kukkonen@intel.com>> wrote:
>
>     +do_compile_append() {
>     +    ${PYTHON} setup.py -q bdist_egg --dist-dir ./
>     +}
>     +do_install_append() {
>     +    install -m 0644 ${S}/*.egg ${D}/${PYTHON_SITEPACKAGES_DIR}/
>     +}
>
>
> Is this actually required?  The setuptools class should be doing all 
> the magic, and this appears to be building and installing an egg, 
> which we generally try not to do.
>
> Ross

As far as I remember, if the package uses the setuptools class this 
should be handled automatically.
>
>


--------------2F1707DDD6BB58894F1FE7FA
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    On 07/08/2016 03:17 PM, Burton, Ross wrote:<br>
    <blockquote
cite="mid:CAJTo0LZ67c7MXQrsBYzK6c+dQ3DGq0Xp5To+pz64qo=Cu8qeKQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 7 July 2016 at 16:39, Jussi
            Kukkonen <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:jussi.kukkonen@intel.com" target="_blank">jussi.kukkonen@intel.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":4hm" class="a3s aXjCH m155c60503c651065">+do_compile_append()
                {<br>
                +    ${PYTHON} setup.py -q bdist_egg --dist-dir ./<br>
                +}<br>
                +do_install_append() {<br>
                +    install -m 0644 ${S}/*.egg
                ${D}/${PYTHON_SITEPACKAGES_DIR}/<br>
                +}</div>
            </blockquote>
          </div>
          <br>
          Is this actually required?  The setuptools class should be
          doing all the magic, and this appears to be building and
          installing an egg, which we generally try not to do.</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
    As far as I remember, if the package uses the setuptools class this
    should be handled automatically.<br>
    <blockquote
cite="mid:CAJTo0LZ67c7MXQrsBYzK6c+dQ3DGq0Xp5To+pz64qo=Cu8qeKQ@mail.gmail.com"
      type="cite">
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------2F1707DDD6BB58894F1FE7FA--

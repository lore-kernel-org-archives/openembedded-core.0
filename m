Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E8A727037D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jul 2014 01:45:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6B1jGhF024982
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 10 Jul 2014 18:45:16 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Thu, 10 Jul 2014 18:45:16 -0700
Message-ID: <53BF41A9.4010706@windriver.com>
Date: Fri, 11 Jul 2014 09:45:13 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1404885647.git.hongxu.jia@windriver.com>
	<9941caf92c8d49ddd3cdea016fa8ec6263875185.1404885647.git.hongxu.jia@windriver.com>
	<CAJTo0LZ7X4UUedddwb3q9XxkqZqTYF8-mHST7GRZ0y7OZUksvg@mail.gmail.com>
In-Reply-To: <CAJTo0LZ7X4UUedddwb3q9XxkqZqTYF8-mHST7GRZ0y7OZUksvg@mail.gmail.com>
Cc: Saul Wold <saul.wold@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/8] xmlto: add version 0.0.25
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
X-List-Received-Date: Fri, 11 Jul 2014 01:45:27 -0000
Content-Type: multipart/alternative;
	boundary="------------040706030308040201090300"

--------------040706030308040201090300
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/11/2014 04:57 AM, Burton, Ross wrote:
> On 9 July 2014 11:16, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> +# To make sure these native packages ready before xmlto-native was invoked.
>> +DEPENDS_class-native = " \
>> +    docbook-xml-dtd4-native \
>> +    docbook-xsl-stylesheets-native \
>> +    util-linux-native \
>> +    libxml2-native \
>> +    libxslt-native \
>> +"
> Does this do what you want if xmlto-native is pulled in from sstate in
> an empty tmp?

Hi Ross,

If we don't have it, while runing bitbake world, there was a build
failure for alsa-utils which xmlto enabled.
...

| xmlto man alsactl_init.xml
| sed -e 's,@localstatedir\@,/var,g' -e 's,@sbindir\@,/usr/sbin,g' -e 's,@daemonswitch\@,/etc/alsa/state-daemon.conf,g' < 90-alsa-restore.rules.in > 90-alsa-restore.rules || rm 90-alsa-restore.rules
| i586-poky-linux-gcc  -m32 -march=i586 --sysroot=/buildarea3/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86  -D__USE_GNU -DSYS_ASOUNDRC=\"/var/lib/alsa/asound.state\" -DSYS_PIDFILE=\"/var/run/alsactl.pid\" -O2 -pipe -g -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o alsactl alsactl-alsactl.o alsactl-state.o alsactl-lock.o alsactl-utils.o alsactl-init_parse.o alsactl-daemon.o  -lasound -lm -ldl -lpthread
| xmlto: /buildarea3/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/work/i586-poky-linux/alsa-utils/1.0.27.2-r0/alsa-utils-1.0.27.2/alsactl/alsactl_init.xml does not validate (status 3)
| xmlto: Fix document syntax or use --skip-validation option
| I/O error : Attempt to load network entity http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd
| /buildarea3/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/work/i586-poky-linux/alsa-utils/1.0.27.2-r0/alsa-utils-1.0.27.2/alsactl/alsactl_init.xml:3: warning: failed to load external entity "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
|   "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd">
|                                                            ^
| I/O error : Attempt to load network entity http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd
| warning: failed to load external entity "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
| validity error : Could not load the external subset "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"

...

The alsa-utils invoked xmlto to generate document at his do_compile,
so we have to make sure the above native packages prepared before
xmlto-native.

//Hongxu

>
>> +# xmlto needs getopt/xmllint/xsltproc at runtime
>> +RDEPENDS_${PN}_class-target = " \
>> +    docbook-xml-dtd4 \
>> +    docbook-xsl-stylesheets \
>> +    util-linux \
>> +    libxml2 \
>> +    libxslt-bin \
>> +"
> Don't bother with the -class-target override, they're general runtime
> dependencies and not specific to the target build.
>
> Ross


--------------040706030308040201090300
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 07/11/2014 04:57 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LZ7X4UUedddwb3q9XxkqZqTYF8-mHST7GRZ0y7OZUksvg@mail.gmail.com"
      type="cite">
      <pre wrap="">On 9 July 2014 11:16, Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">+# To make sure these native packages ready before xmlto-native was invoked.
+DEPENDS_class-native = " \
+    docbook-xml-dtd4-native \
+    docbook-xsl-stylesheets-native \
+    util-linux-native \
+    libxml2-native \
+    libxslt-native \
+"
</pre>
      </blockquote>
      <pre wrap="">
Does this do what you want if xmlto-native is pulled in from sstate in
an empty tmp?</pre>
    </blockquote>
    <br>
    Hi Ross,<br>
    <br>
    If we don't have it, while runing bitbake world, there was a build<br>
    failure for
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    alsa-utils which xmlto enabled.<br>
    ...<br>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <pre style="font-family: 'Courier New', courier, monotype, monospace; color: rgb(0, 0, 0); font-size: medium; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;"><span class="stdout" style="font-family: 'Courier New', courier, monotype, monospace; color: black;">| xmlto man alsactl_init.xml
| sed -e 's,@localstatedir\@,/var,g' -e 's,@sbindir\@,/usr/sbin,g' -e 's,@daemonswitch\@,/etc/alsa/state-daemon.conf,g' &lt; 90-alsa-restore.rules.in &gt; 90-alsa-restore.rules || rm 90-alsa-restore.rules
| i586-poky-linux-gcc  -m32 -march=i586 --sysroot=/buildarea3/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86  -D__USE_GNU -DSYS_ASOUNDRC=\"/var/lib/alsa/asound.state\" -DSYS_PIDFILE=\"/var/run/alsactl.pid\" -O2 -pipe -g -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o alsactl alsactl-alsactl.o alsactl-state.o alsactl-lock.o alsactl-utils.o alsactl-init_parse.o alsactl-daemon.o  -lasound -lm -ldl -lpthread
| xmlto: /buildarea3/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/work/i586-poky-linux/alsa-utils/1.0.27.2-r0/alsa-utils-1.0.27.2/alsactl/alsactl_init.xml does not validate (status 3)
| xmlto: Fix document syntax or use --skip-validation option
| I/O error : Attempt to load network entity <a class="moz-txt-link-freetext" href="http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd">http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd</a>
| /buildarea3/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/work/i586-poky-linux/alsa-utils/1.0.27.2-r0/alsa-utils-1.0.27.2/alsactl/alsactl_init.xml:3: warning: failed to load external entity <a class="moz-txt-link-rfc2396E" href="http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd">"http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"</a>
|   <a class="moz-txt-link-rfc2396E" href="http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd">"http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"</a>&gt;
|                                                            ^
| I/O error : Attempt to load network entity <a class="moz-txt-link-freetext" href="http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd">http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd</a>
| warning: failed to load external entity <a class="moz-txt-link-rfc2396E" href="http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd">"http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"</a>
| validity error : Could not load the external subset <a class="moz-txt-link-rfc2396E" href="http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd">"http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"</a></span></pre>
    ...<br>
    <br>
    The alsa-utils invoked xmlto to generate document at his do_compile,<br>
    so we have to make sure the above native packages prepared before<br>
    xmlto-native.<br>
    <br>
    //Hongxu<br>
    <br>
    <blockquote
cite="mid:CAJTo0LZ7X4UUedddwb3q9XxkqZqTYF8-mHST7GRZ0y7OZUksvg@mail.gmail.com"
      type="cite">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">+# xmlto needs getopt/xmllint/xsltproc at runtime
+RDEPENDS_${PN}_class-target = " \
+    docbook-xml-dtd4 \
+    docbook-xsl-stylesheets \
+    util-linux \
+    libxml2 \
+    libxslt-bin \
+"
</pre>
      </blockquote>
      <pre wrap="">
Don't bother with the -class-target override, they're general runtime
dependencies and not specific to the target build.

Ross
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------040706030308040201090300--

Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1SMZ8l-0003Ho-3s
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Apr 2012 08:22:19 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q3O6Ci6V018386
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Apr 2012 23:12:44 -0700 (PDT)
Received: from [128.224.162.223] (128.224.162.223) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 23 Apr 2012 23:12:43 -0700
Message-ID: <4F964456.6050106@windriver.com>
Date: Tue, 24 Apr 2012 14:12:38 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1335245655.git.xiaofeng.yan@windriver.com>
	<fde21e1126e23439ccd9dc7ba8e7cc9e96df3799.1335245655.git.xiaofeng.yan@windriver.com>
	<7334A38D-4148-4397-94A0-D721CD0BD924@dominion.thruhere.net>
In-Reply-To: <7334A38D-4148-4397-94A0-D721CD0BD924@dominion.thruhere.net>
X-Originating-IP: [128.224.162.223]
Subject: Re: [PATCH 1/1] gdk-pixbuf: Add --with-x11 when building lsb image
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Apr 2012 06:22:19 -0000
Content-Type: multipart/alternative;
	boundary="------------010302010903020108060207"

--------------010302010903020108060207
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2012?04?24? 13:53, Koen Kooi wrote:
> Op 24 apr. 2012, om 07:50 heeft Xiaofeng Yan het volgende geschreven:
>
>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>
>> LSB Test Suite complain "no library libgdk_pixbuf_xlib-2.0.so.0" \
>> because of having "--without-x11" for gdk-pixbuf_2.24.1.bb.
>> For passing lsb test I add PACKAGECONFIG support to the recipe and \
>> have poky-lsb turn on the poky-lsb distro for this recipe.
>>
>> [YOCTO #2284]
> Shouldn't this be an 'x11' DISTRO_FEATURE instead?
because "--without-x11" is disabled when x11 exists in core-image-sato. 
Using 'x11' DISTRO_FEATURE instead will change the default set, which 
will cause enable "--with-x11" when x11 is in DISTRO_FEATURE. LSB Test 
Suite need this configuration but other image may not need it even if 
having x11.

>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


--------------010302010903020108060207
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    On 2012&#24180;04&#26376;24&#26085; 13:53, Koen Kooi wrote:
    <blockquote
      cite="mid:7334A38D-4148-4397-94A0-D721CD0BD924@dominion.thruhere.net"
      type="cite">
      <pre wrap="">
Op 24 apr. 2012, om 07:50 heeft Xiaofeng Yan het volgende geschreven:

</pre>
      <blockquote type="cite">
        <pre wrap="">From: Xiaofeng Yan <a class="moz-txt-link-rfc2396E" href="mailto:xiaofeng.yan@windriver.com">&lt;xiaofeng.yan@windriver.com&gt;</a>

LSB Test Suite complain "no library libgdk_pixbuf_xlib-2.0.so.0" \
because of having "--without-x11" for gdk-pixbuf_2.24.1.bb.
For passing lsb test I add PACKAGECONFIG support to the recipe and \
have poky-lsb turn on the poky-lsb distro for this recipe.

[YOCTO #2284]
</pre>
      </blockquote>
      <pre wrap="">
Shouldn't this be an 'x11' DISTRO_FEATURE instead?
</pre>
    </blockquote>
    because "--without-x11" is disabled when x11 exists in
    core-image-sato. Using 'x11' DISTRO_FEATURE instead will change the
    default set, which will cause enable "--with-x11" when x11 is in
    DISTRO_FEATURE. LSB Test Suite need this configuration but other i<span
      style="color: rgb(0, 0, 0); font-family: Arial; font-size: 17px;
      font-style: normal; font-variant: normal; letter-spacing: normal;
      line-height: 25px; orphans: 2; text-indent: -22px; text-transform:
      none; white-space: normal; widows: 2; word-spacing: 0px;
      background-color: rgb(255, 255, 255);">mage <span
        class="Apple-converted-space"></span><span
        class="Apple-converted-space"></span></span> may not need it
    even if having x11.<br>
    <span class="keyword" style="margin-right: 1px; "></span><span
      class="Apple-converted-space"> <br>
    </span>
    <blockquote
      cite="mid:7334A38D-4148-4397-94A0-D721CD0BD924@dominion.thruhere.net"
      type="cite">
      <pre wrap="">

_______________________________________________
Openembedded-core mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a>

</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------010302010903020108060207--

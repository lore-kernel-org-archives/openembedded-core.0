Received: from smtprelay-b12.telenor.se ([62.127.194.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded-core@emagii.com>) id 1RYxdK-0002g6-5T
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 11:24:50 +0100
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-b12.telenor.se (Postfix) with ESMTP id B1F452400A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Dec 2011 11:17:59 +0100 (CET)
X-SENDER-IP: [83.227.56.19]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ArgeAL7f4U5T4zgTPGdsb2JhbAAMN6sBAQEBATeCJAEBAQEDAQEBawoRCxgJFg8JAwIBAgEVARsUBgEMBgIBAYgLtlaLcgSSS4Ilkig
X-IronPort-AV: E=Sophos;i="4.71,325,1320620400"; 
	d="scan'208,217";a="232267255"
Received: from c-1338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.242]) ([83.227.56.19])
	by ipb2.telenor.se with ESMTP; 09 Dec 2011 11:17:49 +0100
Message-ID: <4EE1E052.7080809@emagii.com>
Date: Fri, 09 Dec 2011 11:17:54 +0100
From: Ulf Samuelsson <openembedded-core@emagii.com>
Organization: eMagii
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110922 Thunderbird/3.1.15
MIME-Version: 1.0
To: ulf@emagii.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, elizabeth.flanagan@intel.com
References: <4EE1DE55.1040303@emagii.com>
In-Reply-To: <4EE1DE55.1040303@emagii.com>
Subject: Re: Change in "openembedded-core/meta/files/common-licenses/LGPL-2.0" breaks opie-image
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ulf@emagii.com, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Fri, 09 Dec 2011 10:24:50 -0000
Content-Type: multipart/alternative;
	boundary="------------020404000505070807070606"

--------------020404000505070807070606
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2011-12-09 11:09, Ulf Samuelsson wrote:
> Error:
>
> NOTE: package libopie2-1.2.5-r16.0: task do_configure: Started
> ERROR: libopie2: md5 data is not matching for 
> file:///home/ulf/projects/OE_2011-12-08/sources/openembedded-core/meta/files/common-licenses/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed
> ERROR: libopie2: The new md5 checksum is 9427b8ccf5cf3df47c29110424c9641a
> ERROR: libopie2: Check if the license information has changed in
> ERROR: Licensing Error: LIC_FILES_CHKSUM does not match, please fix
>
>
> The changes in LGPL-2.0 attached.
>
> One would guess that this breaks other recipes as well.
>
>
$ rgrep 03f2b9deed35802bc1aae2ae3dc6d9ed *
gives:

licenses:meta-opie/recipes-opie/opie-buzzword/opie-buzzword.inc:LIC_FILES_CHKSUM 
= 
"file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"
licenses:meta-opie/recipes-opie/libmailwrapper/libmailwrapper.inc:LIC_FILES_CHKSUM 
= 
"file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"
licenses:meta-opie/recipes-opie/opie-ftplib/opie-ftplib.inc:LIC_FILES_CHKSUM 
= 
"file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"
licenses:meta-opie/recipes-opie/opie-rotateapplet/opie-rotateapplet.inc:LIC_FILES_CHKSUM 
= 
"file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"
licenses:meta-opie/recipes-opie/opie-pimconverter/opie-pimconverter.inc:LIC_FILES_CHKSUM 
= 
"file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"
licenses:meta-opie/recipes-opie/opie-cardapplet/opie-cardapplet.inc:LIC_FILES_CHKSUM 
= 
"file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"
licenses:meta-opie/recipes-opie/libopieobex/libopieobex0.inc:LIC_FILES_CHKSUM 
= 
"file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"
licenses:meta-opie/recipes-opie/opie-packagemanager/opie-packagemanager.inc:LIC_FILES_CHKSUM 
= 
"file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"
licenses:meta-opie/recipes-opie/opie-todo/opie-todo.inc:LIC_FILES_CHKSUM 
= 
"file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"
licenses:meta-opie/recipes-opie/opie-systemtime/opie-systemtime.inc:LIC_FILES_CHKSUM 
= 
"file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"
licenses:meta-opie/recipes-opie/libopie/libopie2.inc:LIC_FILES_CHKSUM = 
"file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"
licenses:meta-opie/recipes-opie/opie-bounce/opie-bounce.inc:LIC_FILES_CHKSUM 
= 
"file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"
meta-opie/recipes-opie/opie-buzzword/opie-buzzword.inc:LIC_FILES_CHKSUM 
= 
"file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"
meta-opie/recipes-opie/libmailwrapper/libmailwrapper.inc:LIC_FILES_CHKSUM = 
"file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"
meta-opie/recipes-opie/opie-ftplib/opie-ftplib.inc:LIC_FILES_CHKSUM = 
"file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"
meta-opie/recipes-opie/opie-rotateapplet/opie-rotateapplet.inc:LIC_FILES_CHKSUM 
= 
"file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"
meta-opie/recipes-opie/opie-pimconverter/opie-pimconverter.inc:LIC_FILES_CHKSUM 
= 
"file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"
meta-opie/recipes-opie/opie-cardapplet/opie-cardapplet.inc:LIC_FILES_CHKSUM 
= 
"file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"
meta-opie/recipes-opie/libopieobex/libopieobex0.inc:LIC_FILES_CHKSUM = 
"file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"
meta-opie/recipes-opie/opie-packagemanager/opie-packagemanager.inc:LIC_FILES_CHKSUM 
= 
"file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"
meta-opie/recipes-opie/opie-todo/opie-todo.inc:LIC_FILES_CHKSUM = 
"file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"
meta-opie/recipes-opie/opie-systemtime/opie-systemtime.inc:LIC_FILES_CHKSUM 
= 
"file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"
meta-opie/recipes-opie/libopie/libopie2.inc:LIC_FILES_CHKSUM = 
"file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"
meta-opie/recipes-opie/opie-bounce/opie-bounce.inc:LIC_FILES_CHKSUM = 
"file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"

I think that before a new license file is checked in, we need to fix ALL 
recipes.

BR



>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


-- 
Best Regards
Ulf Samuelsson
eMagii


--------------020404000505070807070606
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
    <title></title>
  </head>
  <body bgcolor="#ffffff" text="#000000">
    On 2011-12-09 11:09, Ulf Samuelsson wrote:
    <blockquote cite="mid:4EE1DE55.1040303@emagii.com" type="cite">Error:
      <br>
      <br>
      NOTE: package libopie2-1.2.5-r16.0: task do_configure: Started
      <br>
      ERROR: libopie2: md5 data is not matching for
<a class="moz-txt-link-freetext" href="file:///home/ulf/projects/OE_2011-12-08/sources/openembedded-core/meta/files/common-licenses/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed">file:///home/ulf/projects/OE_2011-12-08/sources/openembedded-core/meta/files/common-licenses/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed</a><br>
      ERROR: libopie2: The new md5 checksum is
      9427b8ccf5cf3df47c29110424c9641a
      <br>
      ERROR: libopie2: Check if the license information has changed in
      <br>
      ERROR: Licensing Error: LIC_FILES_CHKSUM does not match, please
      fix
      <br>
      <br>
      <br>
      The changes in LGPL-2.0 attached.
      <br>
      <br>
      One would guess that this breaks other recipes as well.
      <br>
      <br>
      <br>
    </blockquote>
    $ rgrep 03f2b9deed35802bc1aae2ae3dc6d9ed *<br>
    gives:<br>
    <br>
    licenses:meta-opie/recipes-opie/opie-buzzword/opie-buzzword.inc:LIC_FILES_CHKSUM
    =
<a class="moz-txt-link-rfc2396E" href="file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed">"file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"</a><br>
    licenses:meta-opie/recipes-opie/libmailwrapper/libmailwrapper.inc:LIC_FILES_CHKSUM
    =
<a class="moz-txt-link-rfc2396E" href="file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed">"file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"</a><br>
    licenses:meta-opie/recipes-opie/opie-ftplib/opie-ftplib.inc:LIC_FILES_CHKSUM
    =
<a class="moz-txt-link-rfc2396E" href="file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed">"file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"</a><br>
    licenses:meta-opie/recipes-opie/opie-rotateapplet/opie-rotateapplet.inc:LIC_FILES_CHKSUM
    =
<a class="moz-txt-link-rfc2396E" href="file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed">"file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"</a><br>
    licenses:meta-opie/recipes-opie/opie-pimconverter/opie-pimconverter.inc:LIC_FILES_CHKSUM
    =
<a class="moz-txt-link-rfc2396E" href="file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed">"file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"</a><br>
    licenses:meta-opie/recipes-opie/opie-cardapplet/opie-cardapplet.inc:LIC_FILES_CHKSUM
    =
<a class="moz-txt-link-rfc2396E" href="file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed">"file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"</a><br>
    licenses:meta-opie/recipes-opie/libopieobex/libopieobex0.inc:LIC_FILES_CHKSUM
    =
<a class="moz-txt-link-rfc2396E" href="file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed">"file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"</a><br>
    licenses:meta-opie/recipes-opie/opie-packagemanager/opie-packagemanager.inc:LIC_FILES_CHKSUM
    =
<a class="moz-txt-link-rfc2396E" href="file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed">"file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"</a><br>
    licenses:meta-opie/recipes-opie/opie-todo/opie-todo.inc:LIC_FILES_CHKSUM
    =
<a class="moz-txt-link-rfc2396E" href="file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed">"file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"</a><br>
    licenses:meta-opie/recipes-opie/opie-systemtime/opie-systemtime.inc:LIC_FILES_CHKSUM
    =
<a class="moz-txt-link-rfc2396E" href="file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed">"file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"</a><br>
    licenses:meta-opie/recipes-opie/libopie/libopie2.inc:LIC_FILES_CHKSUM
    =
<a class="moz-txt-link-rfc2396E" href="file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed">"file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"</a><br>
    licenses:meta-opie/recipes-opie/opie-bounce/opie-bounce.inc:LIC_FILES_CHKSUM
    =
<a class="moz-txt-link-rfc2396E" href="file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed">"file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"</a><br>
    meta-opie/recipes-opie/opie-buzzword/opie-buzzword.inc:LIC_FILES_CHKSUM
    =
<a class="moz-txt-link-rfc2396E" href="file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed">"file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"</a><br>
    meta-opie/recipes-opie/libmailwrapper/libmailwrapper.inc:LIC_FILES_CHKSUM
    =
<a class="moz-txt-link-rfc2396E" href="file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed">"file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"</a><br>
    meta-opie/recipes-opie/opie-ftplib/opie-ftplib.inc:LIC_FILES_CHKSUM
    =
<a class="moz-txt-link-rfc2396E" href="file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed">"file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"</a><br>
    meta-opie/recipes-opie/opie-rotateapplet/opie-rotateapplet.inc:LIC_FILES_CHKSUM
    =
<a class="moz-txt-link-rfc2396E" href="file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed">"file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"</a><br>
    meta-opie/recipes-opie/opie-pimconverter/opie-pimconverter.inc:LIC_FILES_CHKSUM
    =
<a class="moz-txt-link-rfc2396E" href="file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed">"file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"</a><br>
    meta-opie/recipes-opie/opie-cardapplet/opie-cardapplet.inc:LIC_FILES_CHKSUM
    =
<a class="moz-txt-link-rfc2396E" href="file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed">"file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"</a><br>
    meta-opie/recipes-opie/libopieobex/libopieobex0.inc:LIC_FILES_CHKSUM
    =
<a class="moz-txt-link-rfc2396E" href="file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed">"file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"</a><br>
    meta-opie/recipes-opie/opie-packagemanager/opie-packagemanager.inc:LIC_FILES_CHKSUM
    =
<a class="moz-txt-link-rfc2396E" href="file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed">"file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"</a><br>
    meta-opie/recipes-opie/opie-todo/opie-todo.inc:LIC_FILES_CHKSUM =
<a class="moz-txt-link-rfc2396E" href="file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed">"file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"</a><br>
    meta-opie/recipes-opie/opie-systemtime/opie-systemtime.inc:LIC_FILES_CHKSUM
    =
<a class="moz-txt-link-rfc2396E" href="file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed">"file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"</a><br>
    meta-opie/recipes-opie/libopie/libopie2.inc:LIC_FILES_CHKSUM =
<a class="moz-txt-link-rfc2396E" href="file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed">"file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"</a><br>
    meta-opie/recipes-opie/opie-bounce/opie-bounce.inc:LIC_FILES_CHKSUM
    =
<a class="moz-txt-link-rfc2396E" href="file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed">"file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed"</a><br>
    <br>
    I think that before a new license file is checked in, we need to fix
    ALL recipes.<br>
    <br>
    BR<br>
    <br>
    <br>
    <br>
    <blockquote cite="mid:4EE1DE55.1040303@emagii.com" type="cite">
      <pre wrap="">
<fieldset class="mimeAttachmentHeader"></fieldset>
_______________________________________________
Openembedded-core mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a>
</pre>
    </blockquote>
    <br>
    <br>
    <pre class="moz-signature" cols="72">-- 
Best Regards
Ulf Samuelsson
eMagii
</pre>
  </body>
</html>

--------------020404000505070807070606--

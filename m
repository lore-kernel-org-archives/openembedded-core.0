Received: from smtp-out9.tpgi.com.au ([220.244.226.119] helo=mail9.tpgi.com.au)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marc@cpdesign.com.au>) id 1R4NeC-0001ou-Py
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 03:55:21 +0200
X-TPG-Junk-Checked: Yes
X-TPG-Junk-Status: Message not scanned because user authenticated using SMTP
	AUTH
X-TPG-Antivirus: Passed
X-TPG-Abuse: host=220-244-174-13.static.tpgi.com.au; ip=220.244.174.13;
	date=Fri, 16 Sep 2011 11:28:31 +1000;
	auth=jN+vu9lIznpdsLAI8D8JiNICYhl1zChPtcoQj/CnROE=
Received: from dev1.localnet (220-244-174-13.static.tpgi.com.au
	[220.244.174.13]) (authenticated bits=0)
	by mail9.tpgi.com.au (envelope-from marc@cpdesign.com.au)
	(8.14.3/8.14.3) with ESMTP id p8G1STgB002961
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 11:28:31 +1000
From: Marc Reilly <marc@cpdesign.com.au>
Organization: Creative Product Designs
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Fri, 16 Sep 2011 11:31:37 +1000
User-Agent: KMail/1.13.6 (Linux/2.6.37.6-0.7-desktop; KDE/4.6.0; x86_64; ; )
References: <1316078776-19890-1-git-send-email-denis@eukrea.com>
	<1316078776-19890-3-git-send-email-denis@eukrea.com>
In-Reply-To: <1316078776-19890-3-git-send-email-denis@eukrea.com>
X-KMail-Markup: true
MIME-Version: 1.0
Message-Id: <201109161131.37982.marc@cpdesign.com.au>
Subject: Re: [PATCH 2/2] qt4(embedded and x11): disable neon for armv6-vfp
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
X-List-Received-Date: Fri, 16 Sep 2011 01:55:21 -0000
Content-Type: multipart/alternative; boundary="Boundary-01=_5bqcOMIJHzWnwx9"
Content-Transfer-Encoding: 7bit

--Boundary-01=_5bqcOMIJHzWnwx9
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday, September 15, 2011 07:26:16 PM Denis Carikli wrote:
> without the -no-neon flag, neon is "autodetected"
>   by looking if the compiler is capable of compiling
>   a neon test, and succeed, and neon is then enabled
>   during the compilation.
> 
> Signed-off-by: Denis Carikli <denis@eukrea.com>


>  QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
> +QT_CONFIG_FLAGS_append_armv6-vfp = " -no-neon "

I also ran into this problem, with the same fix.


There are a couple of other places with armv6 overrides that could misbehave, 
notably:
TARGET_CC_ARCH_append_armv6 = " -D__SOFTFP__"
(python_2.6.6.bb)
QEMU_OPTIONS_armv6   = "-cpu arm1136"
(bitbake.conf)

Is there a way to do this more generically?, something like:
QT_CONFIG_FLAGS_append_armv6* = " ... "

Cheers
Marc


--Boundary-01=_5bqcOMIJHzWnwx9
Content-Type: text/html;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">
<html><head><meta name="qrichtext" content="1" /><style type="text/css">
p, li { white-space: pre-wrap; }
</style></head><body style=" font-family:'Monospace'; font-size:9pt; font-weight:400; font-style:normal;">
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">On Thursday, September 15, 2011 07:26:16 PM Denis Carikli wrote:</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; without the -no-neon flag, neon is &quot;autodetected&quot;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt;   by looking if the compiler is capable of compiling</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt;   a neon test, and succeed, and neon is then enabled</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt;   during the compilation.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; Signed-off-by: Denis Carikli &lt;denis@eukrea.com&gt;</p>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"><br /></p>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"><br /></p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt;  QT_CONFIG_FLAGS_append_armv6 = &quot; -no-neon &quot;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; +QT_CONFIG_FLAGS_append_armv6-vfp = &quot; -no-neon &quot;</p>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"><br /></p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">I also ran into this problem, with the same fix.</p>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"><br /></p>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"><br /></p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">There are a couple of other places with armv6 overrides that could misbehave, notably:</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">TARGET_CC_ARCH_append_armv6 = &quot; -D__SOFTFP__&quot;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">(python_2.6.6.bb)</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">QEMU_OPTIONS_armv6   = &quot;-cpu arm1136&quot;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">(bitbake.conf)</p>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"><br /></p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Is there a way to do this more generically?, something like:</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">QT_CONFIG_FLAGS_append_armv6* = &quot; ... &quot;</p>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"><br /></p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Cheers</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Marc</p>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"><br /></p>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"><br /></p></body></html>

--Boundary-01=_5bqcOMIJHzWnwx9--

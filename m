Received: from ams-iport-1.cisco.com ([144.254.224.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mertsas@cisco.com>) id 1T4n0R-0003dY-WE
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 08:04:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=mertsas@cisco.com; l=6965; q=dns/txt;
	s=iport; t=1345787547; x=1346997147;
	h=message-id:date:from:mime-version:to:subject:references:
	in-reply-to; bh=kcOQSTKzVbqIKQ2JRoPRmbvnlm2zEXHtbdv8SXXmIPw=;
	b=JVgCkhQngVkIbOjUp3+2+KK31gCNGOwXhfWFaAtqeavj3Pu3t1MAQucz
	nDZGQzZD7g3mzLJUKZPZdZ6XQ2nij7wcgfSOv1uLm47F1kA/em+Dhjiao
	zw8UcdsXw87Y+PLl880Ghn4DVscye9glRj6j13rmn98vTxFBBU+NvIi5j Y=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Av8EAAYVN1CQ/khM/2dsb2JhbABFulKBB4IgAQEBBAEBAQ8BWwoRCxgJFg8JAwIBAgEVAS8TBgIBAR6HawuZSKAdkhkDkymCK4EUhEiIUYFngmU
X-IronPort-AV: E=Sophos;i="4.80,302,1344211200"; 
	d="scan'208,217";a="142838955"
Received: from ams-core-3.cisco.com ([144.254.72.76])
	by ams-iport-1.cisco.com with ESMTP; 24 Aug 2012 05:52:24 +0000
Received: from [10.54.74.11] (dhcp-10-54-74-11.cisco.com [10.54.74.11])
	by ams-core-3.cisco.com (8.14.5/8.14.5) with ESMTP id q7O5qOHf025703
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2012 05:52:24 GMT
Message-ID: <503715BB.1090009@cisco.com>
Date: Fri, 24 Aug 2012 07:48:43 +0200
From: =?ISO-8859-1?Q?Martin_Erts=E5s?= <mertsas@cisco.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.6esrpre) Gecko/20120730 Thunderbird/10.0.6
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CALN+Pg3chDYX-R1+=GiqGbdMf+2uncZhmvU50vvqENkxC2M3+w@mail.gmail.com>
In-Reply-To: <CALN+Pg3chDYX-R1+=GiqGbdMf+2uncZhmvU50vvqENkxC2M3+w@mail.gmail.com>
Subject: Re: Tackling compilation errors in qt5 recipe.
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
X-List-Received-Date: Fri, 24 Aug 2012 06:04:32 -0000
Content-Type: multipart/alternative;
	boundary="------------060506030002000702060602"

--------------060506030002000702060602
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi.

You could have a look at git@github.com:martiert/meta-qt5.git as a
starting point. Have not tried anything but the qt5-x11-free packages,
which makes what is needed for rendering, but it is at least a starting
point.

- Martin

On 08/23/12 19:59, Sravan wrote:
> Hello,
>
> I never worked on oe/bitbake before. 
> I am trying to write recipes for Qt5(based
> on http://qt-project.org/wiki/Building_Qt_5_from_Git) .
> How ever i am stuck with few compilation errors that am able to slowly
> fix and move forward, by disabling them through "config" options.
>
> So, far i have used following options in config to get rid of
> compilation errors, is it the right approach? My end goal is to have a
> separate recipe file for Qt5 that is good enough to run webkit.
> Following are the flags that i am using
>
> QT_CONFIG_FLAGS = "-no-avx -no-opengl -no-neon -no-rpath -qconfig full 
>             -release -opensource -confirm-license -no-pch \          
>              
>             -nomake examples -nomake demos  -no-sse2 -no-ssse3 \      
>             
>             -nomake tests -no-gtkstyle -nomake translations \        
>              
>             -qt-zlib -qt-libpng -qt-libjpeg -qt-sql-sqlite" 
>
> and my 
>
> Build Configuration:
> BB_VERSION        = "1.15.2"
> TARGET_ARCH       = "i586"
> TARGET_OS         = "linux"
> MACHINE           = "qemux86"
> DISTRO            = "webos"
> DISTRO_VERSION    = "1.0"
> TUNE_FEATURES     = "m32 i586"
> TARGET_FPU        = ""
> meta              = "(nobranch):1b40dac2c501ae8c8d812cf2866fe7917f144a19"
> meta-oe           = "(nobranch):31bb03eba7c2e928cbc069eea61a5ae2a8d9fe51"
> meta-webos        =
> "qt5-recipes-qt5:f7df573d4af74b77d8747c9e84c7e8fd2fb70156"
>
>
> Please suggest how can i be sure that this approach is fine, and wont
> hurt me after building webkit to run with Qt5.
>
> -Sravan.
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--------------060506030002000702060602
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Hi.<br>
    <br>
    You could have a look at <a class="moz-txt-link-abbreviated" href="mailto:git@github.com:martiert/meta-qt5.git">git@github.com:martiert/meta-qt5.git</a> as a
    starting point. Have not tried anything but the qt5-x11-free
    packages, which makes what is needed for rendering, but it is at
    least a starting point.<br>
    <br>
    - Martin<br>
    <br>
    On 08/23/12 19:59, Sravan wrote:
    <blockquote
cite="mid:CALN+Pg3chDYX-R1+=GiqGbdMf+2uncZhmvU50vvqENkxC2M3+w@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html;
        charset=ISO-8859-1">
      Hello,
      <div><br>
      </div>
      <div>I never worked on oe/bitbake before.&nbsp;</div>
      <div>I am trying to write recipes for Qt5(based on&nbsp;<a
          moz-do-not-send="true"
          href="http://qt-project.org/wiki/Building_Qt_5_from_Git"
          target="_blank">http://qt-project.org/wiki/Building_Qt_5_from_Git</a>)
        .</div>
      <div>How ever i am stuck with few compilation errors that am able
        to slowly fix and move forward, by disabling them through
        "config" options.</div>
      <div><br>
      </div>
      <div>So, far i have used following options in config to get rid of
        compilation errors, is it the right approach? My end goal is to
        have a separate recipe file for Qt5 that is good enough to run
        webkit.</div>
      <div>Following are the flags that i am using</div>
      <div><br>
      </div>
      <div>
        <div>QT_CONFIG_FLAGS = "-no-avx -no-opengl -no-neon -no-rpath
          -qconfig full&nbsp;</div>
        <div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; -release -opensource -confirm-license -no-pch \
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</div>
        <div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; -nomake examples -nomake demos &nbsp;-no-sse2
          -no-ssse3 \ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</div>
        <div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; -nomake tests -no-gtkstyle -nomake translations
          \ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</div>
        <div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; -qt-zlib -qt-libpng -qt-libjpeg
          -qt-sql-sqlite"&nbsp;</div>
      </div>
      <div><br>
      </div>
      <div>and my&nbsp;</div>
      <div><br>
      </div>
      <div>
        <div>
          Build Configuration:</div>
        <div>BB_VERSION &nbsp; &nbsp; &nbsp; &nbsp;= "1.15.2"</div>
        <div>TARGET_ARCH &nbsp; &nbsp; &nbsp; = "i586"</div>
        <div>TARGET_OS &nbsp; &nbsp; &nbsp; &nbsp; = "linux"</div>
        <div>MACHINE &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; = "qemux86"</div>
        <div>
          DISTRO &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;= "webos"</div>
        <div>DISTRO_VERSION &nbsp; &nbsp;= "1.0"</div>
        <div>TUNE_FEATURES &nbsp; &nbsp; = "m32 i586"</div>
        <div>TARGET_FPU &nbsp; &nbsp; &nbsp; &nbsp;= ""</div>
        <div>meta &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
          "(nobranch):1b40dac2c501ae8c8d812cf2866fe7917f144a19"</div>
        <div>meta-oe &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
          "(nobranch):31bb03eba7c2e928cbc069eea61a5ae2a8d9fe51"</div>
        <div>meta-webos &nbsp; &nbsp; &nbsp; &nbsp;=
          "qt5-recipes-qt5:f7df573d4af74b77d8747c9e84c7e8fd2fb70156"</div>
      </div>
      <div><br>
      </div>
      <div><br>
      </div>
      <div>Please suggest how can i be sure that this approach is fine,
        and wont hurt me after building webkit to run with Qt5.</div>
      <div><br>
      </div>
      <div>-Sravan.</div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
Openembedded-core mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------060506030002000702060602--

Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 791E2C369C2
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 11:33:38 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.4524.1745580810814622147
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 04:33:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=miAuVDY/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4A72643921;
	Fri, 25 Apr 2025 11:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745580808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rToiC2+3VeZru4XYkAU5l1N1eJOaol37sodxQAWp33o=;
	b=miAuVDY/deeXRJondGbx0fj5FbfRddMr1Zs9FB8evuzEfULbEIpJSWo05NmTGbcqaaswWC
	vbs06m3uZ/JuJyBoNnREd2Wz3Y8O9ZP9lMaMH1fxoIp5mkbKAQgKkS1xP2+UgjnEg1Pj/2
	m9BKrxXV4LW0xuj1woKXbTtL45DF5nJ/zliFfoCs9Y9bEEJKe1ijA/nODgDcK1hmvR57J1
	YbzgEYjc3Aq5zl03DlAo6t6Uv2doqqRHwRfd3BKNDLAkU5nhILBT6uJNdw7DtAjQSfiohf
	bB8+/nxwc+uzQFet9uS/K1D2++bf9PsisvMlMN4J0mXZLPwZek7kcNsHWZ8mzQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Apr 2025 13:33:27 +0200
Message-Id: <D9FOR4M7UASR.23XL7B0KAMZNQ@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Trevor Gamblin" <tgamblin@baylibre.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] python3: upgrade 3.13.2 -> 3.13.3
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250423162714.2261296-1-tgamblin@baylibre.com>
In-Reply-To: <20250423162714.2261296-1-tgamblin@baylibre.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedvvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkhffvuffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptedtvdeuveeijeefudefvdeujeelffegfeekvdduheehgefhgedutdeklefhteevnecuffhomhgrihhnpehphihthhhonhdrohhrghdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehtghgrmhgslhhinhessggrhihlihgsrhgvrdgto
 hhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 11:33:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215459

On Wed Apr 23, 2025 at 6:27 PM CEST, Trevor Gamblin wrote:
> This adds some security fixes and many new changes to the library.
>
> Changelog: https://docs.python.org/3/whatsnew/changelog.html#python-3-13-=
3-final
>
> Reproducibility looks OK.
>
> ptest results OK:
>
> |----------------------------------------------------------------------
> |Ran 81 tests in 4.331s
> |
> |OK (skipped=3D2)
> |
> |=3D=3D Tests result: SUCCESS =3D=3D
> |
> |29 tests skipped:
> |    test.test_asyncio.test_windows_events
> |    test.test_asyncio.test_windows_utils test.test_gdb.test_backtrace
> |    test.test_gdb.test_cfunction test.test_gdb.test_cfunction_full
> |    test.test_gdb.test_misc test.test_gdb.test_pretty_print
> |    test_android test_apple test_asdl_parser test_clinic test_devpoll
> |    test_free_threading test_generated_cases test_idle test_ioctl
> |    test_kqueue test_launcher test_msvcrt test_startfile test_tcl
> |    test_tkinter test_ttk test_ttk_textonly test_turtle test_winapi
> |    test_winconsoleio test_winreg test_wmi
> |
> |9 tests skipped (resource denied):
> |    test_curses test_peg_generator test_pyrepl test_smtpnet
> |    test_socketserver test_urllib2net test_urllibnet test_winsound
> |    test_zipfile64
> |
> |442 tests OK.
> |
> |Total duration: 2 min 51 sec
> |Total tests: run=3D43,896 skipped=3D2,268
> |Total test files: run=3D471/480 skipped=3D29 resource_denied=3D9
> |Result: SUCCESS
> |DURATION: 171
> |END: /usr/lib/python3/ptest
> |2025-04-15T17:54
> |STOP: ptest-runner
> |TOTAL: 1 FAIL: 0
>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---

Hi Trevor,

Thanks for your patch.

I believe we do have some build errors on the autobuilder:

ERROR: nativesdk-python3-3.13.3-r0 do_compile: oe_runmake failed
ERROR: nativesdk-python3-3.13.3-r0 do_compile: Execution of '/srv/pokybuild=
/yocto-worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linu=
x/nativesdk-python3/3.13.3/temp/run.do_compile.477475' failed with exit cod=
e 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/buildtools=
/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-python3/3.13=
.3/temp/log.do_compile.477475
Log data follows:
...
| 0:00:01 load avg: 8.37 [4/4] test_types
| test test_types failed
| 0:00:04 load avg: 9.14 [4/4] test_types failed (1 failure)
|
| Total duration: 4.1 sec
| Total tests: run=3D321 failures=3D1 skipped=3D1
| Total test files: run=3D4/4 failed=3D1
| Result: FAILURE
| make: *** [Makefile:897: profile-run-stamp] Error 2
| ERROR: oe_runmake failed
| WARNING: /srv/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_=
64-nativesdk-pokysdk-linux/nativesdk-python3/3.13.3/temp/run.do_compile.477=
475:195 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/buildtools/build/build/tmp/=
work/x86_64-nativesdk-pokysdk-linux/nativesdk-python3/3.13.3/temp/run.do_co=
mpile.477475, line 195
| 	#2: die, /srv/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86=
_64-nativesdk-pokysdk-linux/nativesdk-python3/3.13.3/temp/run.do_compile.47=
7475, line 179
| 	#3: oe_runmake, /srv/pokybuild/yocto-worker/buildtools/build/build/tmp/w=
ork/x86_64-nativesdk-pokysdk-linux/nativesdk-python3/3.13.3/temp/run.do_com=
pile.477475, line 174
| 	#4: autotools_do_compile, /srv/pokybuild/yocto-worker/buildtools/build/b=
uild/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-python3/3.13.3/temp/=
run.do_compile.477475, line 157
| 	#5: do_compile, /srv/pokybuild/yocto-worker/buildtools/build/build/tmp/w=
ork/x86_64-nativesdk-pokysdk-linux/nativesdk-python3/3.13.3/temp/run.do_com=
pile.477475, line 152
| 	#6: main, /srv/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x8=
6_64-nativesdk-pokysdk-linux/nativesdk-python3/3.13.3/temp/run.do_compile.4=
77475, line 208
NOTE: recipe nativesdk-python3-3.13.3-r0: task do_compile: Failed
ERROR: Task (virtual:nativesdk:/srv/pokybuild/yocto-worker/buildtools/build=
/meta/recipes-devtools/python/python3_3.13.3.bb:do_compile) failed with exi=
t code '1'
NOTE: Tasks Summary: Attempted 4197 tasks of which 4029 didn't need to be r=
erun and 1 failed.
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/b=
uildtools/build/build/tmp/log/error-report/error_report_20250425111940.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/buildtools/build/build/tmp/=
log/error-report/error_report_20250425111940.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the ab=
ove command with the default server. Please ensure you remove any identifyi=
ng or proprietary information when prompted before sending.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/43/builds/1461/ste=
ps/11/logs/stdio

Can you have a look at the issue please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



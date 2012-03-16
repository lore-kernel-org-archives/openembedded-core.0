Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vijaykumar.pulluri@gmail.com>) id 1S8U98-0007go-De
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 11:12:30 +0100
Received: by vcbfl13 with SMTP id fl13so4636628vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 03:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=mga07C8wmuqz4ooOcRPDCwyfIpORCRR5YXUCMnGrARQ=;
	b=zcsyl7IxBE//D2eUstGUJbVOyMZs55txHEGa1GhgANVG7NCcoP+GsfqyORTUc8paw2
	4TSz+ul4fVDQP7f+LjFtOofunPyVenS7CfhDiONZlZQcU1lC7xYotuxZ7sJIoxhb4+oW
	U+tXqPRzLEt2JKykpxdG0s6gpLLuUgwOt6nYrD/xbO/U2w/33rxpIo2K44jFobYDYT7D
	+RDlrRwrYq/PQ1maqIF0Zw3bVr3VHK4hb6x3qYgwHRDjcUwPYkGr/clLTeRRrBTGozov
	KcAEcSyIEPxRwgfAeGvYmAKBFXuwHAdcLaXW44Y0gy33fEKZv5j2Esi7Ap4U7RQVf2ak
	JUJg==
MIME-Version: 1.0
Received: by 10.52.99.231 with SMTP id et7mr1236901vdb.114.1331892222602; Fri,
	16 Mar 2012 03:03:42 -0700 (PDT)
Received: by 10.52.158.202 with HTTP; Fri, 16 Mar 2012 03:03:42 -0700 (PDT)
In-Reply-To: <CAD=xvPu1b2ntY+b46G3N43tUHLrEneo8Y1UzwjKY2GMFBC=kgQ@mail.gmail.com>
References: <CAD=xvPu1b2ntY+b46G3N43tUHLrEneo8Y1UzwjKY2GMFBC=kgQ@mail.gmail.com>
Date: Fri, 16 Mar 2012 15:33:42 +0530
Message-ID: <CAD=xvPuGXzvLm8p2kOKeDycZQqAZ_cbMn0dfNE9tWf8ewP34Sw@mail.gmail.com>
From: VIJAY KUMAR <vijaykumar.pulluri@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: ERROR during bitbake
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
X-List-Received-Date: Fri, 16 Mar 2012 10:12:30 -0000
Content-Type: multipart/alternative; boundary=bcaec50161b7ceaebb04bb595276

--bcaec50161b7ceaebb04bb595276
Content-Type: text/plain; charset=ISO-8859-1

Hi all,

I am trying to build openjdk-6 for my imx53sabre board.
During my journey, I got sticked here to get out of error.

| chmod -w grove_inst.cxx
| chmod: grove_inst.cxx: new permissions are r-xr-xrwx, not r-xr-xr-x
| make[2]: *** [grove_inst.cxx] Error 1
| make[2]: Leaving directory `/host/coreembedded/oe-core/
build/tmp-
eglibc/work/i686-linux/openjade-native-1.3.2-r4/openjade-1.3.2/
spgrove'
| make[1]: *** [spgrove] Error 2
| make[1]: Leaving directory `/host/coreembedded/oe-core/build/tmp-
eglibc/work/i686-linux/openjade-native-1.3.2-r4/openjade-1.3.2'
| make: *** [depend] Error 2
| ERROR: oe_runmake failed

NOTE: package openjade-native-1.3.2-r4: task do_compile: Failed
ERROR: Task 2590 (/host/coreembedded/oe-core/meta/recipes-devtools/
openjade/openjade-native_1.3.2.bb, do_compile) failed with exit code
'1'

Waiting for 3 active tasks to finish:
0: systemd-git-r22 do_fetch (pid 28833)
1: ant-native-1.8.1-r0 do_fetch (pid 18210)
2: linux-libc-headers-imx-2.6.35.3-r1 do_fetch (pid 19822)
Waiting for 2 active tasks to finish:
0: ant-native-1.8.1-r0 do_fetch (pid 18210)
1: linux-libc-headers-imx-2.6.35.3-r1 do_fetch (pid 19822)
NOTE: package systemd-git-r22: task do_fetch: Succeeded
Waiting for 1 active tasks to finish:
0: linux-libc-headers-imx-2.6.35.3-r1 do_fetch (pid 19822)
NOTE: package ant-native-1.8.1-r0: task do_fetch: Succeeded

HELP me to get out of this.

Regards,
VJ

--bcaec50161b7ceaebb04bb595276
Content-Type: text/html; charset=ISO-8859-1

<br><div class="gmail_quote">Hi all,<br>
<br>
I am trying to build openjdk-6 for my imx53sabre board.<br>
During my journey, I got sticked here to get out of error.<br>
<br>
| chmod -w grove_inst.cxx<br>
| chmod: grove_inst.cxx: new permissions are r-xr-xrwx, not r-xr-xr-x<br>
| make[2]: *** [grove_inst.cxx] Error 1<br>
| make[2]: Leaving directory `/host/coreembedded/oe-core/<div>build/tmp-<br>
eglibc/work/i686-linux/openjade-native-1.3.2-r4/openjade-1.3.2/<br>
spgrove&#39;<br>
| make[1]: *** [spgrove] Error 2<br>
| make[1]: Leaving directory `/host/coreembedded/oe-core/build/tmp-<br>
eglibc/work/i686-linux/openjade-native-1.3.2-r4/openjade-1.3.2&#39;<br>
| make: *** [depend] Error 2<br>
| ERROR: oe_runmake failed<br>
<br>
NOTE: package openjade-native-1.3.2-r4: task do_compile: Failed<br>
ERROR: Task 2590 (/host/coreembedded/oe-core/meta/recipes-devtools/<br>
openjade/<a href="http://openjade-native_1.3.2.bb/" target="_blank">openjade-native_1.3.2.bb</a>, do_compile) failed with exit code<br>
&#39;1&#39;<br>
<br>
Waiting for 3 active tasks to finish:<br>
0: systemd-git-r22 do_fetch (pid 28833)<br>
1: ant-native-1.8.1-r0 do_fetch (pid 18210)<br>
2: linux-libc-headers-imx-2.6.35.3-r1 do_fetch (pid 19822)<br>
Waiting for 2 active tasks to finish:<br>
0: ant-native-1.8.1-r0 do_fetch (pid 18210)<br>
1: linux-libc-headers-imx-2.6.35.3-r1 do_fetch (pid 19822)<br>
NOTE: package systemd-git-r22: task do_fetch: Succeeded<br>
Waiting for 1 active tasks to finish:<br>
0: linux-libc-headers-imx-2.6.35.3-r1 do_fetch (pid 19822)<br>
NOTE: package ant-native-1.8.1-r0: task do_fetch: Succeeded<br>
<br>
HELP me to get out of this.<br>
<br>
Regards,<br>
VJ</div>
</div><br>

--bcaec50161b7ceaebb04bb595276--

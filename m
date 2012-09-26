Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <alexandru.damian@intel.com>) id 1TGtn8-0006Ox-N9
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 17:44:50 +0200
Received: from mail-qa0-f47.google.com ([209.85.216.47])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 26 Sep 2012 08:30:54 -0700
Received: by qafi29 with SMTP id i29so5443971qaf.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 08:30:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type
	:x-gm-message-state;
	bh=Xzc0Ur3jHkHeDm1Z1A56WhZC3JrE3/SDnUC7xRK4xLI=;
	b=PVzTNU99sXxQUpaEXlx+A6KiUCg5Vc28dJm/m42TqPE15iZd13Z+TxuQPIfOsQvZAy
	6HsKUaYWSDSTpU79ZRFY46Cs8+Qw7NQDyQEMR8lqJHTWw9NsEBimbYr5XZqksEe1GoO/
	XCSdk/qHCG9TseBPx19ihhGp+KHUWgBqSU5ikL6YBhbH0hTyNDwgjFQkKsPtCPhZ3ze6
	WZGaNghxd12En6SlLHyUQ0ft619rBveWRMPmpinfngKMOlppB/lvxzTRVMHv9hNLhfVk
	EYhjZBk3IBRBj8VrXuQg8ASEnes9AK/xDfuDPouVfu6uvTx7hNnesuUHJifJc5xTCW2i
	YV6A==
MIME-Version: 1.0
Received: by 10.224.176.18 with SMTP id bc18mr2809324qab.63.1348673453064;
	Wed, 26 Sep 2012 08:30:53 -0700 (PDT)
Received: by 10.49.15.33 with HTTP; Wed, 26 Sep 2012 08:30:53 -0700 (PDT)
Date: Wed, 26 Sep 2012 18:30:53 +0300
Message-ID: <CAJ2CSBtA+XdaQg_jdro=kz5VHZPOqsh+nxXk7c+QWdFSd-cDkg@mail.gmail.com>
From: "Damian, Alexandru" <alexandru.damian@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQk06Il3T3pIQyxVPNViLA+pBd87i+iSFfV3KJZ357GPezhItsEc+z/h2aq3vLOoRA/dr+BF
Subject: udev patch v4
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
X-List-Received-Date: Wed, 26 Sep 2012 15:44:51 -0000
Content-Type: multipart/alternative; boundary=20cf302d4e5e16834904ca9c823c

--20cf302d4e5e16834904ca9c823c
Content-Type: text/plain; charset=ISO-8859-1

Hi all,

I sent patch v4 with a small change modifying the udev's default runtime
directory
from /run/ to the more traditional /var/run/.

I've opened two bugs https://bugzilla.yoctoproject.org/show_bug.cgi?id=3179and
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3181 to track the issue
and
to remove the patch when we fix the runtime directory in Yocto.

Cheers,
Alex

--20cf302d4e5e16834904ca9c823c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi all,<br><br>I sent patch v4 with a small change modifying the udev&#39;s=
 default runtime directory<br>from /run/ to the more traditional /var/run/.=
 <br><br>I&#39;ve opened two bugs <a href=3D"https://bugzilla.yoctoproject.=
org/show_bug.cgi?id=3D3179">https://bugzilla.yoctoproject.org/show_bug.cgi?=
id=3D3179</a> and<br>
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D3181">https:=
//bugzilla.yoctoproject.org/show_bug.cgi?id=3D3181</a> to track the issue a=
nd <br>to remove the patch when we fix the runtime directory in Yocto.<br><=
br>
Cheers,<br>Alex<br>

--20cf302d4e5e16834904ca9c823c--

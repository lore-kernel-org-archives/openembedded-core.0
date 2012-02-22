Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1S0Edz-0006Cx-2K
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 17:02:15 +0100
Received: by wgbdr13 with SMTP id dr13so150449wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 07:53:54 -0800 (PST)
Received-SPF: pass (google.com: domain of s.stirtzel@googlemail.com designates
	10.180.77.228 as permitted sender) client-ip=10.180.77.228; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	s.stirtzel@googlemail.com designates 10.180.77.228 as permitted
	sender) smtp.mail=s.stirtzel@googlemail.com;
	dkim=pass header.i=s.stirtzel@googlemail.com
Received: from mr.google.com ([10.180.77.228])
	by 10.180.77.228 with SMTP id v4mr36910003wiw.2.1329926034964 (num_hops
	= 1); Wed, 22 Feb 2012 07:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=uLKwiJiPD7J/HRV6pweoHgGn4p0X4cM0sAjuiwoECew=;
	b=m7OTzZG6iQq6NURhN1XJ23Z53HCPHeZ0/dfU52csTMDIJYV7VjA+/RQ+QPRZWdowaM
	j4QCC7OR3wmIJqqL12eZxepPUPBBPKob2aZ1FGkaVVJ9VMrtnDWUOFrbNvlg5zC6eQM9
	iQNPIWmOrV6o66gY9yUTJVKuPai2umvA8ALYw=
MIME-Version: 1.0
Received: by 10.180.77.228 with SMTP id v4mr30513045wiw.2.1329926034846; Wed,
	22 Feb 2012 07:53:54 -0800 (PST)
Received: by 10.227.202.211 with HTTP; Wed, 22 Feb 2012 07:53:54 -0800 (PST)
Date: Wed, 22 Feb 2012 16:53:54 +0100
Message-ID: <CAGiJk9fWz97OC-wbpAroJdPUYP7+GTKcOG-00a0tP4R_jfWFPA@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Linker error while cross compiling, (Qt issue?)
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
X-List-Received-Date: Wed, 22 Feb 2012 16:02:15 -0000
Content-Type: text/plain; charset=UTF-8

Hi,
although building libdbusmenu-qt [1] for kdelibs succeeds, linking the
library will fail with "undefined reference to
DBusMenuExporter::~DBusMenuExporter" and similar errors.
The library is there and nothing in the configure / compile log of
both recipes seems to state any sort misconfiguration for this case.

For libdbusmenu-qt the settings were double checked, according to the
configuration it "should" export the symbols, however for some very
odd reasons it doesn't export any useful symbols at all.
See  http://pastebin.com/z9QfsCTc  for the list of exported symbols
(U=required symbols, T=provided symbols, for others see "man nm").

This error really puzzles me, usually I would assume that a library
has no problems to export symbols.
(Posted this to the core list as chances are good that it might be Qt related)

It seems to only occur when cross compiling.

Anyone has an idea if this is gcc ld / Qt related, or how to resolve it?
Help would be appreciated.


[1] http://gitorious.org/dbusmenu/dbusmenu-qt/trees/master/src
-- 
Regards
Samuel



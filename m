Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RSADC-0001Z8-Kz
	for openembedded-core@lists.openembedded.org;
	Sun, 20 Nov 2011 17:25:46 +0100
Received: by faat2 with SMTP id t2so5515178faa.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Nov 2011 08:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=+wPlnYKVwx8P/7mCvfOnqDZjnCcu8AYGOrRl05qVTIo=;
	b=DnJwZSH2EM81hX+aP8mKjc3NYsn52o2N9LH/RDbL2JyE5SIRwEJP9WLE4Hbr5UGSfS
	2zZ4bXhGmL3q4dYFlLow7fo5+z+bmMHfpXjxEgbjca2AGm3bjVeFOOw5JusXe56rW+sE
	+DjeCmqgVu4KAAm55Du2Jtui/HjjTYygLAwmQ=
Received: by 10.152.102.148 with SMTP id fo20mr6796431lab.51.1321805958115;
	Sun, 20 Nov 2011 08:19:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Sun, 20 Nov 2011 08:18:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 20 Nov 2011 08:18:47 -0800
Message-ID: <CAMKF1so8it8VVhVeidcpfmxd-5dgfXvrsX_w3z1U7WbrVpoRqQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Fetch errors from projects.o-hand.com
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
X-List-Received-Date: Sun, 20 Nov 2011 16:25:46 -0000
Content-Type: text/plain; charset=UTF-8

Hi

My build of core-image-sato is failing to fetch tars from projects.o-hand.com


 DEBUG: Trying MIRRORS
| ERROR: Function 'Fetcher failure for URL:
'http://projects.o-hand.com/matchbox/sources/libmatchbox/1.9/libmatchbox-1.9.tar.gz'.
Unable to fetch URL
http://projects.o-hand.com/matchbox/sources/libmatchbox/1.9/libmatchbox-1.9.tar.gz
from any source.' failed
NOTE: package libmatchbox-1.9-r8: task do_fetch: Failed


| NOTE: fetch http://projects.o-hand.com/matchbox/sources/optional-dependencies/Xsettings-client-0.10.tar.gz
| DEBUG: executing /usr/bin/env wget -t 5 -q --passive-ftp
--no-check-certificate -P
/home/kraj/work/angstrom/sources/openembedded-core/build/downloads
'http://projects.o-hand.com/matchbox/sources/optional-dependencies/Xsettings-client-0.10.tar.gz'
| DEBUG: Fetcher accessed the network with the command /usr/bin/env
wget -t 5 -q --passive-ftp --no-check-certificate -P
/home/kraj/work/angstrom/sources/openembedded-core/build/downloads
'http://projects.o-hand.com/matchbox/sources/optional-dependencies/Xsettings-client-0.10.tar.gz'

I dont have yocto project mirror in my fallback list.

Should these files be fetched from these urls or should urls be
updated to fetch them from elsewhere ?

-Khem



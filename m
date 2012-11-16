Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ive.found@gmail.com>) id 1TZQtf-0001Ej-Ij
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Nov 2012 19:44:11 +0100
Received: by mail-la0-f47.google.com with SMTP id u2so2216583lag.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2012 10:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=HK9LI5308BYz85x32xEtZVKlwPvGmAxGZ8nS+WXhUTE=;
	b=AnAwRhkSRjXi8Q7u8ucTpgNHiEkh6sdayoQneqGgsDf7ARSrFy+2cNh3oVcGJC+B+m
	rRsVK2bJHCvfjrmxBAiymA5QRRT44DHnwKlOCvdUv3dxpQ/Jh7qCpAetFOFmY8mvft6I
	H+s3psQrI+47+m+A0B6tXCxbg5sjz5AL7nEDUnQdGvW3DUqT4MtopieZmZFc6tcYJr9U
	dnJwVmb/KFncPo3mAIXLYVFxM0eRVsViAKQqWagzu8gt/F8fhtUXiyHyLl5J6EOk6pJv
	Cw8mcZvIyoxf8gyHaXPWw//LEI/zgqjNDPTzG9L30QfTSvh2HdBw8ef2KGFhpX9FXvBn
	cMMQ==
Received: by 10.152.106.237 with SMTP id gx13mr4940646lab.46.1353090612959;
	Fri, 16 Nov 2012 10:30:12 -0800 (PST)
Received: from blackbox.local ([178.123.142.146])
	by mx.google.com with ESMTPS id sx3sm860948lab.9.2012.11.16.10.30.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Nov 2012 10:30:12 -0800 (PST)
From: Leonid Borisenko <ive.found@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Nov 2012 21:29:24 +0300
Message-Id: <1353090566-16318-1-git-send-email-ive.found@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <CAP9ODKo1mQFcR6+HM3A4cE6-vB5RpjyXe1eNiq+-RCKzS71DNw@mail.gmail.com>
References: <CAP9ODKo1mQFcR6+HM3A4cE6-vB5RpjyXe1eNiq+-RCKzS71DNw@mail.gmail.com>
Subject: [PATCH v2 0/2] Support additional user-defined metadata
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
X-List-Received-Date: Fri, 16 Nov 2012 18:44:11 -0000

Hi. Here are rebased patches. Thanks for attention!

The following changes since commit b53ea6687b6201c8c5ab5cb0d2a845ef7e7b2abe:

  sstate: Bump version number to deal with layout fixes (2012-11-14 23:37:26 +0000)

up to 899ead84c843641a6732621b9b96960d9bef6ecf:

  package_{ipk, deb, rpm}.bbclass: support additional user-defined metadata (2012-11-16 20:54:14 +0300)

----------------------------------------------------------------
Leonid Borisenko (2):
  package.bbclass: add getter of additional metadata
  package_{ipk, deb, rpm}.bbclass: support additional user-defined
    metadata

 meta/classes/package.bbclass     |   11 +++++++++++
 meta/classes/package_deb.bbclass |    5 +++++
 meta/classes/package_ipk.bbclass |    5 +++++
 meta/classes/package_rpm.bbclass |    7 +++++++
 4 files changed, 28 insertions(+)

-- 
1.7.10.4




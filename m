Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PyQbG-0002CX-Tj
	for openembedded-core@lists.openembedded.org;
	Sat, 12 Mar 2011 16:19:27 +0100
Received: by pvc30 with SMTP id 30so596867pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2011 07:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=2n4KNsO//RuAYUxz1XE+5SyBDUX5UnnQYW7hF5rcmiY=;
	b=jkAhd4+FmfJVRRGKftnBzZ7L96OFVyHKw86GfcH6vtRlm12YuD2N9EqyNkfcb9Z9YV
	yBEwhUcCzWV2W5Y8NDozrUGPxGc+nncZ+uYApBiOrYBd1I4GvQxNu3tY1mGZiHVXHOZH
	17guGr0BfXt8ZajhVmsUAuaf2TnIqvcAJGetk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=eyY93DLgerguV7NMvaPCE/WvHvo7jw+avFhBrRljmZRNT35scaOb7IofrQcuaV7/h2
	ggFzkmIK6EuFaOBZ9nvpCNSeuBjLzUWzJpO/xhqDnOUoDC57LpoMJ3977iaMFAVuLSn8
	W8WRJFlxNlJ+M6bU52sKLUFazEsHUF32HFFL8=
Received: by 10.142.210.1 with SMTP id i1mr8591611wfg.346.1299942738463;
	Sat, 12 Mar 2011 07:12:18 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 25sm7073957wfb.22.2011.03.12.07.12.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 12 Mar 2011 07:12:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Sat, 12 Mar 2011 07:12:10 -0800
Message-Id: <cover.1299942641.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/1] Grok git config sendmail.to if available
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
X-List-Received-Date: Sat, 12 Mar 2011 15:19:27 -0000


Pull URL: git://git.openembedded.org/openembedded-core-contrib.git
  Branch: kraj/scripts
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/scripts

Thanks,
    Khem Raj <raj.khem@gmail.com>
---


Khem Raj (1):
  send-pull-request: Fetch TO email address from git config if
    specified

 scripts/send-pull-request |   21 +++++++++++++++------
 1 files changed, 15 insertions(+), 6 deletions(-)

-- 
1.7.4.1




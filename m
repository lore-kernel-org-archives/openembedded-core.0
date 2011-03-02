Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PuhaI-0002Ka-Is
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Mar 2011 09:39:02 +0100
Received: by pvc30 with SMTP id 30so911007pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Mar 2011 00:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=gygRLWw5eG/17u3Qj4q/51lzAYhbaAcCxMEu/Sgo/fQ=;
	b=IaDxyCSLbC+rsL/OxeD0J/aF6AWJY15QrWolZscWYlVF9bukpHxNeNjoiBy369nYT3
	KYqUQqZhUe9iDvwiusPH5MnFnBBwRr+kBvcNFoTZGxzkrryJd1bURRY8RaWYFKQLEeem
	LycHn2A5B0og5+0WZS9ghcHNHqibwNC58zk6Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=rS7ag9LwQg1ba+yWC/DAa+dsbRx4urWv99/CUR/RU9qFdDQg+HB+LkiHuBP6wCQijv
	6+7nowCD97kCZdqLQSF2CVGxhzsdIWj18IZSJNG5zuAo/VI9SZzyeTyC2wPKR7N1ePVm
	1R0andX9zL8nYXb/825EM+G9eXH6V604I+c5E=
Received: by 10.142.48.9 with SMTP id v9mr6213231wfv.405.1299055054614;
	Wed, 02 Mar 2011 00:37:34 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n4sm8708546wfl.14.2011.03.02.00.37.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Mar 2011 00:37:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Mar 2011 00:37:18 -0800
Message-Id: <1299055045-8096-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH V2 0/6] Fixes to get oe-core building
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
X-List-Received-Date: Wed, 02 Mar 2011 08:39:02 -0000

Hi


The attached patches are needed to get the OE core to build
Please provide feedback

V2: Fix the sanity test case to check for new limit
    Add patch to link gcc cross statically with prerequisite libs
    Remove do_compile_prepend from sqlite3 upgrade


Thanks

-Khem




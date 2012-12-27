Received: from mail-bk0-f41.google.com ([209.85.214.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1ToLoX-0001ff-RG
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Dec 2012 23:20:36 +0100
Received: by mail-bk0-f41.google.com with SMTP id jg9so4472587bkc.28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Dec 2012 14:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer;
	bh=2MDTTwihzhXdkVdgLo/sb712MWIqkAmrjBxSybiG9es=;
	b=CWZ1o6NuSbnde8nnPGe+J7tUnQsH5G6kuoigHSSkIpp31spVWRaVwlyA9iCnUam64L
	GETNLV99OTzOp1sdxXvA3dMQjuWLskI4ZY0ggwLiuUoKQAnkpJI7LeSvwMEDIJocDWyI
	OECGYiF6yM3I7VSRide0rfUiFabs043NyJiet3ZmY0pwBYF0+xR+u5OWYIid777SPHR4
	gLV1EchYIpDo63SUaSc+Mud7AkQ/gE1abUi6bizNrjO79aFKfgNYrcrT+g7gaJr1KEIG
	gD5uenyEIBCX6hJrRtPVvbrrjkJQPlZmkBA66I+U7M4AhWtOMPEE/AjUVYY+FSdaX3Z5
	fOzw==
X-Received: by 10.204.147.141 with SMTP id l13mr15063799bkv.43.1356645939222; 
	Thu, 27 Dec 2012 14:05:39 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id y11sm21612500bkw.8.2012.12.27.14.05.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 27 Dec 2012 14:05:38 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>) id 1ToLa4-0006dn-84
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Dec 2012 00:05:36 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Dec 2012 00:05:33 +0200
Message-Id: <1356645934-25467-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: automake update
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
X-List-Received-Date: Thu, 27 Dec 2012 22:20:37 -0000

Upstream has released new bugfix release from automake-1.12.
Automake-1.13 is expected soon, but this patch updates to 1.12.6 anyway.
At least it should be make eventual update to 1.13 easier as patches to
apply to source tree are adjusted for changes already present in 1.12.6.

Those patches are the thing to test in this update. Update is otherwise
quite simple (=not bugprone), but python-libdir.patch and
py-compile-only-optimized-byte-code.patch didn't apply cleanly and had
to be adjusted for new version.


 - ML



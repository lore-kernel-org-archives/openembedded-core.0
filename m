Received: from mail-lb0-f177.google.com ([209.85.217.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Tsun9-0007dv-8k
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 13:30:02 +0100
Received: by mail-lb0-f177.google.com with SMTP id n10so979215lbo.22
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2013 04:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer;
	bh=fQdRQOdV7eMGx5B6yfbxz3AorUt/8pLmMLhdNA4dxTc=;
	b=nJnkv5PYhXb46GgCTNmeKmgrfkWDgDE8nBRt3R9HaYJO+IyQScx+3TzOmWZaCFhzN1
	B0ITyRopi808HFfg9mHh4M099/+Z/jITUsKvVqXtjqjv128eY6BSJv0nTzo3VSuzmiM3
	uUUXrK4S+FqCJtYdxfF+bqzCDU7IZT5rfMBVpUGn92adMbz8EgvZDFnhNiYU2l65O64n
	SJ4mIfm+rYno9spzcTcSjdTWdjTfOrXZD6Lti3pFJu03UAbEqfzajRvXeLSjZD9KC63D
	nFqa+lzHIUgSjkQdKHIjS1WLna5/5v2v8K/M54q6B2cPaSpGgl2c5NlhuDj6zbdaGRTr
	K6SQ==
X-Received: by 10.152.144.71 with SMTP id sk7mr64902930lab.29.1357733687361;
	Wed, 09 Jan 2013 04:14:47 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id hn3sm2030236lab.10.2013.01.09.04.14.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Jan 2013 04:14:46 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>) id 1TsuXn-00060R-Av
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 14:14:07 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Jan 2013 14:13:52 +0200
Message-Id: <1357733634-23036-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: HarfBuzz + Pango update
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
X-List-Received-Date: Wed, 09 Jan 2013 12:30:02 -0000


 - Updated to HarfBuzz 0.9.10
 - Depend on cairo and freetype to consistently enable
   backends
 - Added patch to consistently disable graphite backend
   (I'm not aware of any current recipe to make it possible
    to enable it, but this patch makes sure it
    remains consistent even if such a recipe gets added)


 - Rebased to current master


 - ML



Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TcBTn-00080z-4i
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Nov 2012 09:52:51 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so1640817pad.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Nov 2012 00:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=pSTXdrP782s7fxQaDWd8het8Pug3yWUd4tjOylPZZ7Q=;
	b=e3jqWc5JnznWXU6E5nzs7x8vBLw5J81b8WLrCHk2kUKEVmMZQhSgARY5UWLIimRt3a
	mrUG0b2nXNKGuxh9Yg7Utpi7btIZtGfLq5aNn5y0MC8QFs8Thac05nqjyjU3jMlZltrl
	t8HQ5np62Sg/odUrgDiBSgjXCyV+DNb6iGCu5hfRDrg90omat83kOd9ENVccheBK2QHn
	6kkINpIgyQCiAQp5z1Gtln+ZSCaNLNqSmbXYIeLGHtkv9qPm8Rzg9AWLRasw+caFZXsd
	8ywUqEpdjw8otQC0Yv+eRqfLlVA4ooyv/jgcY8ewa0wk7uDNRSQ3SYK7w5PQSdSqiZFa
	X24g==
MIME-Version: 1.0
Received: by 10.68.233.201 with SMTP id ty9mr21103938pbc.14.1353746321594;
	Sat, 24 Nov 2012 00:38:41 -0800 (PST)
Received: by 10.68.63.6 with HTTP; Sat, 24 Nov 2012 00:38:41 -0800 (PST)
Date: Sat, 24 Nov 2012 10:38:41 +0200
Message-ID: <CAF6bG8eXXWEVesfiXapwdHDrZ-C6hSB5wTF617+waaKhGfrdHg@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: xz compressed autotools
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
X-List-Received-Date: Sat, 24 Nov 2012 08:52:51 -0000
Content-Type: text/plain; charset=UTF-8

 I just noticed that xz compressed packages of autotools cannot be
used as that would lead to circular dependency. xz decompressor cannot
be built without autotools.

 Before autoconf-2.69 was released, there was speculation that release
would be provided as tar.xz only. They decided to release at least
2.69 with tar.gz too, but future is not certain.

 I already sent email to autoconf mailing list too, noting that
(currently) OpenEmbedded depends on .tar.gz packages being available,
but maybe that dependency should also be somehow removed from future
OpenEmbedded versions.


 - ML



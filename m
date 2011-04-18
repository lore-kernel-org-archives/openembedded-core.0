Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QBu0T-0008Rw-VV
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Apr 2011 21:21:10 +0200
Received: by bwz5 with SMTP id 5so4521055bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2011 12:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:from:date:message-id:subject:to
	:content-type; bh=FDoeggtx4uzvFk5AJWKBal7G04Lfw9nbxS8lK2VP5aU=;
	b=q80NXIGdkwpRfMrIimn7q/NdaGoAaGDyQD/QwXlCdRp7NzQmiIh8ZyF7Kk9enfGp0U
	p8aAIm4Q/0mdnWs02585rU5qShGyTyVkJtXog5xMXS+7+SKg+xE0ic+/jjiych0zTlb+
	UB3I2eaONqsLM3XDEFxwe9AxdNx7NpoY52aVo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=xAbvWwr2Jaixkv9GszyuxzpE8WoMha6IIRlaZTw5RR005Ey+ANxLO06vBaINZpehZ0
	ji+DZsMXkHHFivqHrQEFDdq6+MHKbLfgrto6GZRGHs4OHiCJ4m2WMEsZQnJ/harKP7c1
	tQbdV/Xb7/XDYf0+R6K/IEGd2yng2xr6lnH58=
Received: by 10.204.46.27 with SMTP id h27mr173965bkf.61.1303154329156; Mon,
	18 Apr 2011 12:18:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.204.167.66 with HTTP; Mon, 18 Apr 2011 12:18:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Apr 2011 12:18:19 -0700
Message-ID: <BANLkTini7EDvr-GoW1AP3aaQWjv6tYjOLQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: gcc 4.6 recipes naming
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
X-List-Received-Date: Mon, 18 Apr 2011 19:21:10 -0000
Content-Type: text/plain; charset=UTF-8

Hi

I have gcc 4.6 under progress here. As we know the current release is
4.6.0. I have been calling the recipes
to omit the minor release number so the recipes are called
<recipes>_4.6.bb based on my experiences
with gcc releases over the years.

Since the minor releases are bug fix releases and when next bug fix
release happens the total diff
of changes from 4.6.0 to 4.6.1 are also released as a single diff
which can be applied on top of existing
4.6.0 tar file to reach 4.6.1

This makes the upgrade easier for minor releases. I decided not to
track the release branch since
that complicates the gcc download as in classic oe

So for upgrades we can either just take the diff from 4.6.0 to 4.6.1
and apply on top of 4.6.0 or
decide to use the new 4.6.1 tar both would be ok as we decide that later.

Let me know your thoughts.

-Khem



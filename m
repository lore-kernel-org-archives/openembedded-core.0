Return-Path: <kirgene@gmail.com>
Received: from mail-qc0-f171.google.com (mail-qc0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8FF7A6D571
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 15:27:04 +0000 (UTC)
Received: by mail-qc0-f171.google.com with SMTP id s13so1242120qcv.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 07:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=E53RLizFJdi3eJfQxEj7ibOPMK5ttYbH14l6EQfFumc=;
	b=k0sq662LU79TUw4cJBVG8iJMbjExnuBDDx/mkAYTO7F5+WdRqyJpRX9M05rGnNVTdR
	bDQ4E0mfi50VGcdBKPMsg49jagrAjY/EkvVDps2wByzPh/9wCxlDoROWrOsFmqQ+1JDk
	FzuAakjhAiVqx+lb9/JpirLs+fT4PbiStltnZ9CKgk7qWrDim87DKamvVnsITche1XKf
	VkW8k9ooaZHcoa2b2hjayw6Ob3dwNvkdpONXn9sUE5MV2E9UbLtnwHeGzRC5Yi1+fiWg
	NHg817d5Lxqf3CcXVRzheg02cEqbYQ5VRdVBeUwbHJJyqJsmmoLD+Gcn1/zXpTDGNlMO
	0bag==
MIME-Version: 1.0
X-Received: by 10.224.45.197 with SMTP id g5mr3420817qaf.2.1384442825944; Thu,
	14 Nov 2013 07:27:05 -0800 (PST)
Received: by 10.96.55.197 with HTTP; Thu, 14 Nov 2013 07:27:05 -0800 (PST)
Date: Thu, 14 Nov 2013 17:27:05 +0200
Message-ID: <CADV-EXEyxDZQowU8EdGFJbFbg-muYTPZACTzq_m8D7ubHe-Vfg@mail.gmail.com>
From: Yevhen Kyriukha <kirgene@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?0KFvbnRpbnVvdXMga2VybmVsIHJlYnVpbGQgYWZ0ZXIgdXBncmFkZQ==?=
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Nov 2013 15:27:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

After upgrading oe-core and bitbake to the latest revision
(616354f13732d13c17434d5b60b166f691c25761 and
616354f13732d13c17434d5b60b166f691c25761 respectively)
I'm having broblems building my kernel.

Kernel rebuilds everytime I run "bitbake <some_recipe>".
It starts rebuilding from "do_unpack" task.

I noticed interesting things:
If I interrupt the build process and then start building again, kernel
is started building from the point of interruption.
But if kernel building completed successfully then next time when I
run bitbake it starts rebuild.

My previous version of bitbake and oe-core are
565b3e31e0226c6e193ee0b031bd5e7bef25591e
and ae28ee3f7a060b9e0d13154a84f2444a98490b5b respectively.

Best regards,
Yevhen


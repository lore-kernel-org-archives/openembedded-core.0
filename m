Return-Path: <kirgene@gmail.com>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 772CE60E7C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2014 00:48:38 +0000 (UTC)
Received: by mail-qc0-f177.google.com with SMTP id i8so3505823qcq.22
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 16:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=hgsh2eOcNFAmsrJfmPnH1pD2fLEDl3BDdXmxBVz2hjk=;
	b=nhFzybrJpRJ4+wAJEK3ZnXx/JS6Y4I9c7BJi9pdLHQqgE92Z3G7mnGmsscPQtGK74Z
	4sCuZIa5h7f1n+dPxyPTpwArkd7U5V/v4kXgamdfv5/W9Jp3soAf3hK8yQue4YkOqpZa
	EUTVcivUYg41IIaicmRwTYPPIcVUk4ui4xXoDoJU1noRov3rVeXdhEGCtNgu2yOx7zpv
	2SMqIhgd9gnuMMtNNpFrRYVIEyT4aNt4jlqK7QOLf5dH0o3FtjCC0yqim4cYcAFKZxEo
	BdrbMSioSebq6cg+EiKN559/0uFsaEBcj4ljRmK3D26huXSrYm8DQdQJ4XsGBwukrBBy
	rLXg==
MIME-Version: 1.0
X-Received: by 10.224.2.6 with SMTP id 6mr16601681qah.12.1390524519283; Thu,
	23 Jan 2014 16:48:39 -0800 (PST)
Received: by 10.96.149.6 with HTTP; Thu, 23 Jan 2014 16:48:39 -0800 (PST)
Date: Fri, 24 Jan 2014 02:48:39 +0200
Message-ID: <CADV-EXE1HK6Qrg9ksCxdrEzvGEnBiAPFtoy4B967Jr1axtofTQ@mail.gmail.com>
From: Yevhen Kyriukha <kirgene@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: update-alternatives: symlinks are not created
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
X-List-Received-Date: Fri, 24 Jan 2014 00:48:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

I've built custom image with busybox included and noticed that
symlinks for mkdir, ls, rm and other programs are not created.

In do_rootfs log I have the following error messages:
...
update-alternatives: error: alternative path /bin/busybox.suid doesn't exist
...
update-alternatives: error: alternative path /bin/busybox.nosuid doesn't exist
...

-- 
Best regards,
Yevhen


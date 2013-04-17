Received: from mail-vc0-f169.google.com ([209.85.220.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1USM83-0007dt-1F
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 08:46:04 +0200
Received: by mail-vc0-f169.google.com with SMTP id hx10so1072543vcb.28
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2013 23:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to
	:content-type; bh=Tjw4ojcdRCMekRlnEKQlQt2vWS1XkC6KBaavMbrL0Ak=;
	b=O8LU4G41UrWp6gwtQMdgogN+onUK4DJQ0ltS+ICdKu8fBK/KUx8XspHnNc+wF/AsTi
	jHGupbKZEs4qi1ESdtd3VnOvkhN9CeO3BaPozPqwOspaTThKgagNR02ijcURTQ5Llgem
	fldGZeJL0SL6Nf7m+7f1SgdlkXo6z/h1rg+4j5s5JJkWvUiV0kjM1V2aabljP4dWaiYD
	e/wF3EDNtylHkTSvXWRdgIkcTmjPm3mtujIDthWPF8aCDjtqNhmdkC2ORGl2wpbuV719
	9gjS7mDUKHDJAgK+dYMKIAv8GssqKD78YJA3QtiiFEDDVnVKyCh/X6/NTOYmmHp3S3bm
	x17Q==
MIME-Version: 1.0
X-Received: by 10.52.170.204 with SMTP id ao12mr2711420vdc.83.1366180111427;
	Tue, 16 Apr 2013 23:28:31 -0700 (PDT)
Received: by 10.52.185.168 with HTTP; Tue, 16 Apr 2013 23:28:31 -0700 (PDT)
Date: Wed, 17 Apr 2013 08:28:31 +0200
Message-ID: <CALbNGRRDhXutLhQMs+prxLG3wbs3Y4pZbwR-D=VNR4Z=OUycMg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: postinst does not finish
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
X-List-Received-Date: Wed, 17 Apr 2013 06:46:04 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

sorry again me with another issue. I updated all layers from master
few hours ago and built from scratch. On first boot with systemd
postinst never finishes. I see only:

[**  } A start job is running for Run pending postinsts

and ** are moving around.

Does anybody else face this one?

Andreas



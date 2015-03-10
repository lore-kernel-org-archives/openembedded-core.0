Return-Path: <patrick.ohly@intel.com>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id CB55573922
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 10:10:59 +0000 (UTC)
Received: by iecsl2 with SMTP id sl2so8096834iec.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 03:11:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OsZn35dfgVg6elP/3oaAiKHbpgHKeRULGGX+Ph4mJBA=;
	b=EBv1dXgZun4Y/W4QjTyoB5ewJKYpKyw4wQ7cRqjFdIYKlPxV/5SwtGUhGsZlqRlYY3
	YIUcUsiME4Ol/ktwo379dgOj+pkfyanHHwjjYfZCPQN+V1br/lJNTWvKW1OecSfdk4xF
	0W3H5cF0xHnyHbkNHgle2E9+ikJdAlfKZVH7cI8RyVF2DJoKMT+lM62enXeBD4fceQhG
	o/RJ5tDzEDWiiR5UN266UVvwvBoSp5qYBN9GScFMkV0QNVaSmxDqNsIaUrbZPkeOkUSo
	EfTp+E/bx2I/Hr3GI+qCGEoIVzqGchesn2X9a8WRbJJjKjoYpSuumeotF8y1Ez8WyB7g
	FWHw==
X-Gm-Message-State: ALoCoQmaIjRbykhdUIsSfZ1ILOGEQEPN3rXUNeUuBCExXBbyxtHf3Hejm3a+PiuhCwn4q1XssiyB
X-Received: by 10.42.118.7 with SMTP id v7mr32729486icq.30.1425982260409;
	Tue, 10 Mar 2015 03:11:00 -0700 (PDT)
Received: from pohly-mobl1.ger.corp.intel.com (p5DE8F5CE.dip0.t-ipconnect.de.
	[93.232.245.206])
	by mx.google.com with ESMTPSA id k9sm225110ige.6.2015.03.10.03.10.58
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Mar 2015 03:10:59 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Mar 2015 11:10:47 +0100
Message-Id: <1425982249-17652-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/2] combo-layer: exclude files
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
X-List-Received-Date: Tue, 10 Mar 2015 10:10:59 -0000

I ran into the merge conflicts described in the second patch recently
due to changes in OE-core's conf sample files. Richard told me that he
is aware of the issue and just deals with it manually because he never
had time to automate it; I hope these patches do that sufficiently
well to be included.

They worked for me when I re-imported all patches in OE-core and
bitbake since Dizzy was branched off. I also tested "combo-layer init"
with files excluded.

Note that these patches may apply directly to master, but I haven't
tested that because in my tree I have them on top of the other two,
independent patches to combo-layer that I posted yesterday. I can
resend as a single patch series if that's preferred.

Patrick Ohly (2):
  combo-layer: runcmd() with separate output
  combo-layer: exclude files

 scripts/combo-layer              | 59 ++++++++++++++++++++++++++++++++++------
 scripts/combo-layer.conf.example | 14 ++++++++++
 2 files changed, 65 insertions(+), 8 deletions(-)

-- 
2.1.4



Return-Path: <jatedev@gmail.com>
Received: from mail-qc0-f193.google.com (mail-qc0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id B1D966F8BC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Mar 2014 19:28:50 +0000 (UTC)
Received: by mail-qc0-f193.google.com with SMTP id e16so4779418qcx.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Mar 2014 12:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=PFGbOpE3tUox1QI6koMEovz8Bn/t5OsyF/nr1smnV7Q=;
	b=yqcHb7MKbOuYuUPtZjmbBp4MhQcASgdcxxwd72w9VOIi7qcp5RYh/0M7IV4XsLfUE4
	jxxYyOkFcu5NwASvyd4uhQsV0EyQLV+n5E6L3vXqEOUwzpiPHhLflaynGncSfTwNDQyj
	g7Y9nHgVyVQ/Yal7PXPwE0RnkksOFFmQR6LHWr2w6R/Q/hLuTzoEduNMpPKHHKoUo5JF
	V+LFag12A+BVU3PffO52H3eloPZFHfjlk2Qf3DlXBY79ILY5lIOJpAGqGgaySroPdUmN
	p+alSScpEFW9v+iZY8Xn6pItUUbcJy1dX8tAOMgm9VJZM7RFWoMY3C1BWmYsbb9gMBSP
	LYkw==
MIME-Version: 1.0
X-Received: by 10.140.91.105 with SMTP id y96mr47597117qgd.3.1394566131244;
	Tue, 11 Mar 2014 12:28:51 -0700 (PDT)
Received: by 10.140.87.237 with HTTP; Tue, 11 Mar 2014 12:28:51 -0700 (PDT)
Date: Tue, 11 Mar 2014 15:28:51 -0400
Message-ID: <CAPphmgZ8Jk6YsdcVdh7AF7BD9odcY59myVFqoFVE5s7LrNkh9A@mail.gmail.com>
From: Jate Dev <jatedev@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: gvfs-gdu-volume-monitor: recipe missing DEPENDS on libgnome-keyring
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
X-List-Received-Date: Tue, 11 Mar 2014 19:28:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

On branch dora of openembedded-core, my compile of
gvfs-gdu-volume-monitor failed due to a missing library. I fixed it by
added a DEPENDS via bbappend:

DEPENDS += "libgnome-keyring"


- Jate S.


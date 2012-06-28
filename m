Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SkHLo-0000la-Fo
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2012 18:13:48 +0200
Received: by eaal1 with SMTP id l1so906030eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2012 09:02:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=VNkQq67iYN0xjzvlt7i/0lrHZTco2l9QTIkri3/7Vcg=;
	b=E1ayXVrJnuOBltWKMOWsnaI7KCZnndA4bXH40OEJ8p2qxgid2bcuBpUSbZt1X5h22v
	r8ju3HD9SJKb/haW8vVTxQzHoqxg2jWQOpqKLQfV2JKTMVVqx3Xh6j0z0Wk7aB9Tdxu0
	jadXAkLDq+TzGeIxhOfyDuTUzOwjF07suYz8r+vpdATCxbZ025Jos0PXSOvrdEG+xRZ2
	A3ojmPtcpcAwV0VW2FVJZYWGzyHoyvSc+EzrWhlwKzajHM0YVZJSTlu25BLkF+JnD31A
	B84phpwJuWkrX/W7pQ5UydQnQMMUTJWhLmBw7zVHFlLfndSoTVUMybLh4UrPole/SHGf
	9hbQ==
Received: by 10.14.127.195 with SMTP id d43mr641264eei.174.1340899373600;
	Thu, 28 Jun 2012 09:02:53 -0700 (PDT)
Received: from [172.20.10.4] ([84.241.205.162])
	by mx.google.com with ESMTPS id g47sm17144051eea.14.2012.06.28.09.02.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jun 2012 09:02:52 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1340876879-3690-2-git-send-email-jackie.huang@windriver.com>
Date: Thu, 28 Jun 2012 18:02:47 +0200
Message-Id: <F7D3BA9A-464D-4DC2-BD70-84D2D10FBF16@dominion.thruhere.net>
References: <1340876879-3690-1-git-send-email-jackie.huang@windriver.com>
	<1340876879-3690-2-git-send-email-jackie.huang@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQnlBXOYnMNUvQJUz+mCmLhbVmyMWq4rxisScNULZ7QlhPp4Y0LVUtWEN9RBkU+GN1xVQ648
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 2/2] ruby: Add ruby 1.9.3 recipe
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
X-List-Received-Date: Thu, 28 Jun 2012 16:13:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 28 jun. 2012, om 11:47 heeft <jackie.huang@windriver.com> =
<jackie.huang@windriver.com> het volgende geschreven:

> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> Took ruby 1.8.7 from OE and updated to 1.9.3-p194.
> Most of the 1.9.3 patches originate from =
ruby-1.9.3.194-10.1.fc17.src.rpm

Is ruby something that belongs into oe-core?=



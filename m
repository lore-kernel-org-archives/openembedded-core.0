Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1TMdqr-0007Il-Nu
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Oct 2012 13:56:25 +0200
Received: by mail-ob0-f175.google.com with SMTP id eq6so2793195obc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2012 04:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=GCHxKdhRDuAymqOSgcFXXLAYvCdk9FtdvpVV12zNEcY=;
	b=UOSC52njGJ49C24YABuV2gtXDEo33LCrLBSJu3rkd9lG3V4bphia8BQQupRdAbrGSI
	/jac3U2wUjO4E9vXwGn3OxWq5v0HVehIxFLEMyfK9h9NiwEZJanPe6JdG6svfOocBOvO
	OnGspVbNfcJ7DbDp/zSKqZbuALX96fl2NMFZl5RqnwsLV3RnBGE/GKA2a8RAt2jPgtGY
	tbHBPX+cnmXZYWXjtLMFf/wmScQ6bVt/y+cCYVo53fdBJD0+9zttccYdRr3P31X8Y2kL
	KiagqNj9ZKWrZoU15aN0h9wTFFgZdvz6K9Eg6rO+GAYOgzaqUyMzWqH1WAdOhNiwCKzM
	REPw==
MIME-Version: 1.0
Received: by 10.182.179.104 with SMTP id df8mr3191345obc.90.1350042193808;
	Fri, 12 Oct 2012 04:43:13 -0700 (PDT)
Received: by 10.76.95.198 with HTTP; Fri, 12 Oct 2012 04:43:13 -0700 (PDT)
Date: Fri, 12 Oct 2012 13:43:13 +0200
Message-ID: <CAGiJk9fX67UyL_NQo-TWUzgpu=0wq6N3u9pDmKnOskbsjNhxAQ@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Accelerate do_package
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
X-List-Received-Date: Fri, 12 Oct 2012 11:56:26 -0000
Content-Type: text/plain; charset=UTF-8

Hi,
after re-building Qt the third time today, I was curious why
do_package takes this long.

From my investigation it looks like the library stripping is the culprit,
it lets my system idle with 5% CPU usage over a long time.

Would it be possible to accelerate do_package with parallelisation?
Likely I could look into this sometime soon, but I'd rather hear your
thoughts on this first.


PS:
Also sstate creation and rootfs packing could be made faster with
pbzip2 [1] / pigz [2] (we have a recipe for pigz), or is anthing
preventing this?

[1] http://compression.ca/pbzip2/
[2] http://zlib.net/pigz/


-- 
Regards
Samuel



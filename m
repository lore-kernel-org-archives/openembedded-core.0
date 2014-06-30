Return-Path: <rewitt@declaratino.com>
X-Greylist: delayed 434 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 30 Jun 2014 19:23:35 UTC
Received: from p3plsmtpa08-02.prod.phx3.secureserver.net
	(p3plsmtpa08-02.prod.phx3.secureserver.net [173.201.193.103])
	by mail.openembedded.org (Postfix) with ESMTP id 92D1960850
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jun 2014 19:23:35 +0000 (UTC)
Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by p3plsmtpa08-02.prod.phx3.secureserver.net with 
	id LjGN1o0053nfWBV01jGNwH; Mon, 30 Jun 2014 12:16:22 -0700
Received: by mail-vc0-f175.google.com with SMTP id hy4so7969217vcb.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jun 2014 12:16:21 -0700 (PDT)
X-Received: by 10.220.192.129 with SMTP id dq1mr2263898vcb.57.1404155781930;
	Mon, 30 Jun 2014 12:16:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.119.197 with HTTP; Mon, 30 Jun 2014 12:15:51 -0700 (PDT)
In-Reply-To: <1404152999-10661-1-git-send-email-rewitt@declaratino.com>
References: <1404152999-10661-1-git-send-email-rewitt@declaratino.com>
From: Randy Witt <rewitt@declaratino.com>
Date: Mon, 30 Jun 2014 15:15:51 -0400
Message-ID: <CAP5N7XHpHhvsEZrjdwzWw=aDThS0nCY15mk_CvT-_s9WnkiKig@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: Speed up sdk creation by supporting multicore compressors.
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
X-List-Received-Date: Mon, 30 Jun 2014 19:23:37 -0000
Content-Type: multipart/alternative; boundary=089e01293f2c97669204fd127efa

--089e01293f2c97669204fd127efa
Content-Type: text/plain; charset=UTF-8

Sorry, I messed up my formatting there, here is are stats that are easier
to read:

Using default compressor(bzip2):
core-image-minimal-1.0-r0: do_populate_sdk: Elapsed time: 133.21 seconds
CPU usage: 12.3%
core-image-sato-1.0-r0: do_populate_sdk: Elapsed time: 356.85 seconds
CPU usage: 11.6%

Using pigz:
core-image-minimal-1.0-r0: do_populate_sdk: Elapsed time: 102.62 seconds
CPU usage: 15.3%
core-image-sato-1.0-r0: do_populate_sdk: Elapsed time: 261.66 seconds
CPU usage: 15.6%

--089e01293f2c97669204fd127efa
Content-Type: text/html; charset=UTF-8

<div dir="ltr">Sorry, I messed up my formatting there, here is are stats that are easier to read:<div><br></div><div><div>Using default compressor(bzip2):</div><div>core-image-minimal-1.0-r0: do_populate_sdk: Elapsed time: 133.21 seconds</div>

<div>CPU usage: 12.3%</div><div>core-image-sato-1.0-r0: do_populate_sdk: Elapsed time: 356.85 seconds</div><div>CPU usage: 11.6%</div><div><br></div><div>Using pigz:</div><div>core-image-minimal-1.0-r0: do_populate_sdk: Elapsed time: 102.62 seconds</div>

<div>CPU usage: 15.3%</div><div>core-image-sato-1.0-r0: do_populate_sdk: Elapsed time: 261.66 seconds</div><div>CPU usage: 15.6%</div></div></div>

--089e01293f2c97669204fd127efa--

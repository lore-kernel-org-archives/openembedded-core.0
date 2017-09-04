Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2DF9C77E86
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 20:04:47 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v84K4hkf006622
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 4 Sep 2017 21:04:44 +0100
Message-ID: <1504555483.2175.78.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: kai.kang@windriver.com, openembedded-core@lists.openembedded.org
Date: Mon, 04 Sep 2017 21:04:43 +0100
In-Reply-To: <1919461d34964f3fccb8fe31931dc4daef977b41.1504517912.git.kai.kang@windriver.com>
References: <cover.1504517912.git.kai.kang@windriver.com>
	<1919461d34964f3fccb8fe31931dc4daef977b41.1504517912.git.kai.kang@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Mon, 04 Sep 2017 21:04:44 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/1] dbus: fix ptest runtime failures
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
X-List-Received-Date: Mon, 04 Sep 2017 20:04:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-09-04 at 17:39 +0800, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> When run dbus ptest cases, there are some failures:
> 
> > 
> > ./test/test-dbus-daemon: relocation error: ./test/test-dbus-daemon: 
> > symbol
> > _dbus_real_assert, version LIBDBUS_PRIVATE_1.10.20 not defined in
> > file
> > libdbus-1.so.3 with link time reference
> > FAIL: test/test-dbus-daemon
> > [   24.943454] test-dbus-daemo[251]: segfault at 0
> > ip           (null) sp
> > 00007ffddabe6818 error 14 in test-dbus-daemon-eavesdrop[
> > 400000+a000]
> It disables tests in dbus recipe which cases symbols missing and
> segment
> fault. When 'ptest' in DISTRO_FEATURES, it should enable some
> configure
> options to make the symbols visible to ptest cases.
> 
> It also need to correct paths in ptest configure files.

Does this have a runtime effect on dbus, i.e. are these runtime asserts
which we don't want in production code?

Cheers,

Richard



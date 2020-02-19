Return-Path: <jonathan.rajotte-julien@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
	by mail.openembedded.org (Postfix) with ESMTP id 3D30461517
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 15:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.efficios.com (Postfix) with ESMTP id 3B974248DF4;
	Wed, 19 Feb 2020 10:27:21 -0500 (EST)
Received: from mail.efficios.com ([127.0.0.1])
	by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id SIOsbjNc3vsC; Wed, 19 Feb 2020 10:27:21 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.efficios.com (Postfix) with ESMTP id 18C3C248DF2;
	Wed, 19 Feb 2020 10:27:21 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 18C3C248DF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1582126041;
	bh=fG7NJxs9vH1x6z5H5CSL366X5n3UEGxHqC1b9Qs2tfw=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=sD6UMzdc7PUcuYS+3yuS4OvV1npd/8huH2e3DICpeDtajPMDBAIcr8jJbHyRoDrZk
	A/vG02iUMpZsZ4Vx9h9qB2pkFEV4YOsX0w9GhMO2FimffXdiv7JK8D7QQueDqul9VY
	rD+A3Vbw2Qm3QtLQzPw0Kq9gWrLkCc7GWrLT/YdGSsAav41B5Jc/CXGcAwS8aP2Mpg
	KXQ7JZtXDnUhFJBntAMjcen5gnbymfTJemJt22uJDl+jZjqMx1YuN/rwgbx6BFY235
	hnyMUtIeLv7XPA77IBxZkOkpVQi1QgoM2UigKKinRECxii5fMyRWuBgT2L1+ZmPleQ
	K+GWI7AmzciJA==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
	by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id cRcn5UB0NEjY; Wed, 19 Feb 2020 10:27:21 -0500 (EST)
Received: from joraj-alpa (192-222-181-218.qc.cable.ebox.net [192.222.181.218])
	by mail.efficios.com (Postfix) with ESMTPSA id CD86A2490CA;
	Wed, 19 Feb 2020 10:27:20 -0500 (EST)
Date: Wed, 19 Feb 2020 10:27:20 -0500
From: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
To: Anders Wallin <wallinux@gmail.com>
Message-ID: <20200219152720.GM17818@joraj-alpa>
References: <20200218132054.20341-1-wallinux@gmail.com>
	<CANNYZj9nm0eqo0NtHhEJiw7nLbnYQ8r1aazXk6mGn83VXc9VNA@mail.gmail.com>
	<CAF2baFdCF-NVmUa=meNhAN5BDBqLcS4k7F+EBWtUA1ekY6OVBg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAF2baFdCF-NVmUa=meNhAN5BDBqLcS4k7F+EBWtUA1ekY6OVBg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] babeltrace2: added 2.0.1
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
X-List-Received-Date: Wed, 19 Feb 2020 15:27:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 19, 2020 at 11:06:12AM +0100, Anders Wallin wrote:
> Hi Alex,
> 
> I think it's better to use babeltrace2 since it's a new version of
> babeltrace.
> The dist packages uses babeltrace2 and the main application/program is
> called babeltrace2.
> 
> Jonatan; Do you have any comment on the naming?

Me?

Don't care much about the naming. The major issue here is the dependency for
ptest of lttng-tools that depends on a "babeltrace" executable and not on the
"babeltrace2" executable. Currently on our CI we create a symlink from
"babeltrace2" to "babeltrace". This is something we plan on addressing shortly.

Cheers



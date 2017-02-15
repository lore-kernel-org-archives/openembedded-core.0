Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CF8B371E08
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 16:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v1FGoK1e004554; Wed, 15 Feb 2017 16:50:20 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id sjO0TCAI_2vq; Wed, 15 Feb 2017 16:50:20 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v1FGoD2M004544
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 15 Feb 2017 16:50:17 GMT
Message-ID: <1487177412.27753.91.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Wold, Saul" <saul.wold@intel.com>, "Sullivan, California L"
	<california.l.sullivan@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 15 Feb 2017 08:50:12 -0800
In-Reply-To: <1487139667.10318.32.camel@intel.com>
References: <1486684537-17517-1-git-send-email-california.l.sullivan@intel.com>
	<1487139667.10318.32.camel@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] kernel.bbclass: Make sanity check opt-out and provide easy opt-out
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
X-List-Received-Date: Wed, 15 Feb 2017 16:50:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-02-15 at 06:21 +0000, Wold, Saul wrote:
> This should also be applied Morty please

Whilst we can likely do this in master, it does have side effects you
aren't highlighting. You're making the kernel version check default for
*all* kernels linux-yocto or otherwise. This is a significant change in
behaviour and could break many existing non linux-yocto recipes. That
is certainly not something which can easily be backported to morty. Its
also something which if intended, should be hightlighted in the commit
message.

This is a good example of why these "can we backport this?" messages
for changes that haven't even made master worry me.

Cheers,

Richard


Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8F1E0771F1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Aug 2016 12:11:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u79C9S1X031443; Tue, 9 Aug 2016 13:09:28 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id JHXH52WAIe8T; Tue,  9 Aug 2016 13:09:28 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u79C9QG8031440
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 9 Aug 2016 13:09:27 +0100
Message-ID: <1470744566.8166.48.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jose Lamego <jose.a.lamego@linux.intel.com>,
	openembedded-core@lists.openembedded.org, "Lock, Joshua"
	<joshua.g.lock@intel.com>
Date: Tue, 09 Aug 2016 13:09:26 +0100
In-Reply-To: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
References: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 00/20] oeqa: Split configuration from the code
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
X-List-Received-Date: Tue, 09 Aug 2016 12:11:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-08-08 at 09:22 -0700, Jose Lamego wrote:
> Improve oeqa-selftest capabilities and UX by placing
> test configuration features and variables into a separate
> configuration file.
> Configuration file reading is done through a new library in
> oeqa.utils and specific configuration files for each test are
> stored in a separate directory.
> 
> [Yocto 9389]

Looking at these changes, I'm not 100% convinced this is an improvement
in readability or experience. Right now, I can look at the test case
definition and get a reasonable idea of what its doing. After the
change, I have to read two files at once, side by side in order to have
a clue what the test does. Is that an improvement?

I'm open to persuasion on why this patchset is a good idea but the
pieces I looked at didn't seem to help much :/

Cheers,

Richard


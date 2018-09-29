Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AC43D79952
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 12:33:41 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w8TCXbgw026291
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sat, 29 Sep 2018 13:33:39 +0100
Message-ID: <16cf316e0447025d4df7b76653b408350f236ced.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: kai.kang@windriver.com, openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alexander.kanavin@intel.com>
Date: Sat, 29 Sep 2018 13:33:37 +0100
In-Reply-To: <0b27127115cad5c47512fe6384898234a9bf53db.1538199671.git.kai.kang@windriver.com>
References: <cover.1538199671.git.kai.kang@windriver.com>
	<0b27127115cad5c47512fe6384898234a9bf53db.1538199671.git.kai.kang@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 10/10] vala: update vapigen-wrapper
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
X-List-Received-Date: Sat, 29 Sep 2018 12:33:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2018-09-29 at 13:43 +0800, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> gobject-introspection has changed installation paths of .gir files.

gobject-introspection has not changed. *We* have changed it.

This is basically why I really don't want to start messing with
upstream code like this as I'm guessing this will be the first of many
such problems.

Has anyone discussed the gobject-introspection gir path issue with
upstream? If data is arch specific, it shouldn't be going into datadir
but into libexec iirc. I'd like to understand the upstream response
before we start hacking around this in OE in a way which will generate
a ton of patches and incompatibility.

Cheers,

Richard



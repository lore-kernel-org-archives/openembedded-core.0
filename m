Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9202C731BC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 09:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u369JvQs017002; Wed, 6 Apr 2016 10:19:57 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id MBWrYt_DxbL7; Wed,  6 Apr 2016 10:19:57 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u369Jt5I016996
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 6 Apr 2016 10:19:56 +0100
Message-ID: <1459934394.7348.199.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Laurent Bonnans <laurent.bonnans@hikob.com>, "Burton, Ross"
	<ross.burton@intel.com>
Date: Wed, 06 Apr 2016 10:19:54 +0100
In-Reply-To: <CABBNMXVNRa8ANtg9dFgfT1nF8br-hB4_w1Q07FMjq=2Sq+L_RQ@mail.gmail.com>
References: <cover.1459438792.git.laurent.bonnans@hikob.com>
	<8a3fd47fc059f25ec7110cb74a5759556bae165e.1459438792.git.laurent.bonnans@hikob.com>
	<CAJTo0LYnkMORa=qY7wVruxYEmzD6mQZYeJENJz-vm3XRNnEYcw@mail.gmail.com>
	<CABBNMXVNRa8ANtg9dFgfT1nF8br-hB4_w1Q07FMjq=2Sq+L_RQ@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] python: remove tests and sqlite3-tests modules
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
X-List-Received-Date: Wed, 06 Apr 2016 09:20:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-04-06 at 10:00 +0200, Laurent Bonnans wrote:
> 2016-04-05 16:56 GMT+02:00 Burton, Ross <ross.burton@intel.com>:
> > 
> > On 31 March 2016 at 17:15, Laurent Bonnans <
> > laurent.bonnans@hikob.com>
> > wrote:
> > > 
> > > If present in manifests, they are shipped in 'python-modules'.
> > > This
> > > commit keeps them avalaible in the 'python-misc' package.
> > 
> > 
> > python-modules depends on python-misc, so this won't really achieve
> > anything.
> 
> You're right, I missed the change which adds this dependency in
> master.
> 
> What would then be the best way to avoid shipping tests when using
> python-modules?
> Add another package(s) in the main recipe files before python-misc?

Exclude those packages from python-modules as I previously suggested?

Cheers,

Richard


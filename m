Return-Path: <pascal.bach@siemens.com>
Received: from gecko.sbs.de (gecko.sbs.de [194.138.37.40])
	by mail.openembedded.org (Postfix) with ESMTP id 45CDC6011A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Mar 2016 08:53:56 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id u288rrcJ026882
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Tue, 8 Mar 2016 09:53:54 +0100
Received: from [139.16.79.50] (MD1FZU9C.ww002.siemens.net [139.16.79.50])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id u288rrpt029487;
	Tue, 8 Mar 2016 09:53:53 +0100
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <56CC6832.90506@siemens.com>
	<1457090416.2804.19.camel@linuxfoundation.org>
	<56D9964E.1070404@siemens.com>
	<1457105433.2804.30.camel@linuxfoundation.org>
From: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <56DE9321.4030404@siemens.com>
Date: Tue, 8 Mar 2016 09:53:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1457105433.2804.30.camel@linuxfoundation.org>
Subject: Re: Debugging using sysroots and GDB
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
X-List-Received-Date: Tue, 08 Mar 2016 08:53:59 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Richard
> Using this method is a supported approach. I'm a little surprised
> .debug directories don't work. Have you tried just setting:
>
> set sysroot /home/projects/rootfs-dbg
> set substitute-path /usr/src/debug /home/projects/rootfs
> -bbg/usr/src/debug
This doesn't seem to work (tried only with dizzy).
The only way I could get this to work is to extract both the rootfs and the rootfs-dbg into the same place and then set sysroot to that location.
Is this the way it is supposed to be?

>
> as I believe it should work with IMAGE_GEN_DEBUGFS=1 "out the box". If
> it doesn't that is a bug and we should try and look into fixing that.
I'm currently using dizzy. I will give it another try with jethro next week maybe it is working there.

Pascal


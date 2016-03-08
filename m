Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id E41C360116
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Mar 2016 14:09:30 +0000 (UTC)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id u28E9Us4028901
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Tue, 8 Mar 2016 15:09:30 +0100
Received: from [139.16.79.50] (MD1FZU9C.ww002.siemens.net [139.16.79.50])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id u28E9Tnh019283;
	Tue, 8 Mar 2016 15:09:29 +0100
To: Khem Raj <raj.khem@gmail.com>
References: <56CC6832.90506@siemens.com>
	<1457090416.2804.19.camel@linuxfoundation.org>
	<56D9964E.1070404@siemens.com>
	<1457105433.2804.30.camel@linuxfoundation.org>
	<56DE9321.4030404@siemens.com>
	<CAMKF1soj3B8c-eW=vwZ7f0XQEYeeQqwF8vbCXe=-KgJzFWExeQ@mail.gmail.com>
From: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <56DEDD19.2070309@siemens.com>
Date: Tue, 8 Mar 2016 15:09:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1soj3B8c-eW=vwZ7f0XQEYeeQqwF8vbCXe=-KgJzFWExeQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 08 Mar 2016 14:09:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit


> > The only way I could get this to work is to extract both the rootfs and the rootfs-dbg into the same place and then set sysroot to that location.
> > Is this the way it is supposed to be?
>
> Yes
>
Ok I was hoping to keep them seperate.
This because I'm using the rootfs for NFS and by having the debug symbols in a seperate rootfs-dbg directory they would not be visible from the target.
By setting `PACKAGE_DEBUG_SPLIT_STYLE = "debug-file-directory"` I got this working.


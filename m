Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by mail.openembedded.org (Postfix) with ESMTP id AF0A66067C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 22:14:56 +0000 (UTC)
Received: from vz-proxy-l006.mx.aol.com ([64.236.82.153])
	by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5U00H7FOGV2F20@vms173021.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Mon, 18 Apr 2016 17:14:56 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=kj9zAlcOel0A:10 a=kziv93cY1bsA:10	a=EkA_k8WYWOCHEKoT_j0A:9
	a=CjuIK1q_8ugA:10
Received: by 100.15.86.14 with SMTP id 270e01d9; Mon, 18 Apr 2016 22:14:56 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 616FF161FAF; Mon,
	18 Apr 2016 18:14:55 -0400 (EDT)
Date: Mon, 18 Apr 2016 18:14:55 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Message-id: <20160418221455.GJ16135@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Package management DB in old-style SDK
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
X-List-Received-Date: Mon, 18 Apr 2016 22:14:59 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Hi,

I'm still using the old-style SDK (meta-toolchain) for our products due to 
some code customizations in it and some of our use cases rely on the opkg 
package management database being present in sysroots, so packages can be 
manipulated in SDK with opkg command. It appears that /var/lib/opkg is now 
empty and the package database is no longer supplied with the SDK.

I know about the new-style populate_sdk and the even newer Extensible SDK, but 
not yet ready to convert our old use cases to that. Since there were lots of 
changes around the way SDKs work in OE-Core in the past couple releases, I'm 
failing to find the change that causes opkg DB to be missing from the old 
style SDK. I'll appreciate any pointers in helping me debug and/or fix this 
issue with my SDKs. Thanks.

-- 
Denys


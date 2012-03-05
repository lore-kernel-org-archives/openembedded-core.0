Received: from out5-smtp.messagingengine.com ([66.111.4.29])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1S4bTy-0005Vg-EN
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Mar 2012 18:13:58 +0100
Received: from compute2.internal (compute2.nyi.mail.srv.osa [10.202.2.42])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 71F6A205AF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2012 12:05:25 -0500 (EST)
Received: from frontend2.nyi.mail.srv.osa ([10.202.2.161])
	by compute2.internal (MEProxy); Mon, 05 Mar 2012 12:05:25 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:subject:from:to:date
	:in-reply-to:references:content-type:content-transfer-encoding
	:mime-version; s=smtpout; bh=+o0y3DchFCQ0ZZU/xNmUsL3SwZ0=; b=cQx
	ss8HNJVrzQBlywGReSAP7S15VYbxApSG6czglgfOHz8an0vL7yif86vaMNz007Ob
	EemLNoc4LGUo+EJdAWFma1eyp2wkGD8mgrs/WyKDCjcdxoecejoZm14D8QeU4SO6
	ikvdA310pqrInbEBokb5eUjrubfytQf2vaMKhBus=
X-Sasl-enc: fAegZHMnfwNvYwCNdtzmdqZYMAbWZ2nvVv0gud9b15UE 1330967125
Received: from [192.168.43.202] (247.sub-166-248-18.myvzw.com [166.248.18.247])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 1D349483514
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2012 12:05:25 -0500 (EST)
Message-ID: <1330967095.23796.4.camel@lenny>
From: Colin Walters <walters@verbum.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 05 Mar 2012 12:04:55 -0500
In-Reply-To: <3fce8ebe8b9af73e91bd8baf397d1a9ac196171f.1330771239.git.xiaofeng.yan@windriver.com>
References: <cover.1330771239.git.xiaofeng.yan@windriver.com>
	<3fce8ebe8b9af73e91bd8baf397d1a9ac196171f.1330771239.git.xiaofeng.yan@windriver.com>
X-Mailer: Evolution 3.2.3 (3.2.3-1.fc16) 
Mime-Version: 1.0
Subject: Re: [PATCH 1/3] package_rpm.bbclass: Add srpm function
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Mar 2012 17:13:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-03-03 at 18:54 +0800, Xiaofeng Yan wrote:
> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> 
> Add a new function to archive source, patches and logs to a source rpm
> package. Every source rpm package  will be deployed to
> ${DEPLOY}/sources/deploy-srpm.

What's the goal of this?  Just to be a "one file" collection of
sources?  Or do we actually expect people to build from this somehow?

If the intention is to eventually allow building, but it's not actually
used to build right now, it seems very likely to "bitrot" as the core
changes.





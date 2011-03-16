Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pzfub-0004jJ-Qv
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Mar 2011 02:52:33 +0100
Received: by gxk3 with SMTP id 3so474257gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2011 18:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:mime-version
	:content-type:content-disposition:user-agent;
	bh=UHKqk6zBE2M8gZ8zk7tBnOSJnD7Itznppo5RLkWKtMk=;
	b=diDtRBFroIpWni+cf6Fe3Ch6j+Mr4fDhBV3UHdHLr3oDNnizG2HV8JJkrrRc8vLZfW
	cwxdwqB1TjY2b7+AMXQ5bQ7M0t7XjJ2sY0wvYF86n+28F+2PcE9cfxLaJ9HXBXEPrDp8
	IGUPZyj3l/REljTxhnUdfeSweYo6jXnrru7VM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=jVXFByrARkBRstXY7XnFeDn8JP52Vt/qABYK2co+kKXMTn4hqybj8ekR6pxzeDNAJs
	pjhwBIkTd2f9ZCHPyGJKAUYXJZfvmq0UhBN/HiVp6RbiZ2ioF9HtySHazEYOXM1Qiy0V
	dEk/f/OENNCRR5BYd6qD260kGkwNXy8NKRKNw=
Received: by 10.236.77.138 with SMTP id d10mr276569yhe.110.1300240250705;
	Tue, 15 Mar 2011 18:50:50 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id k29sm271916yhk.14.2011.03.15.18.50.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Mar 2011 18:50:49 -0700 (PDT)
Date: Tue, 15 Mar 2011 18:51:33 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20110316015133.GA7694@sakrah.homelinux.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: User repos on openemebdded-core-contrib
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
X-List-Received-Date: Wed, 16 Mar 2011 01:52:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi

The policies on openembedded-core-contrib repo right now does not allow
me to either delete or do a git push -f on the branches I have pushed
for pull requests.

The problem becomes suppose when you have feedback on a pull request
and you do version 2 of the patch and subsequent versions then with
current policies we will have to create separate branches for each
request. I thought it would be better if one could delete/rewrite his
own branches on the contrib repo.

How does yocto manage the contrib repo in this regard?

Thoughts?

-- 
-Khem



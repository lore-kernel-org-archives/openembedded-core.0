Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E48D96FF3D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 08:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4P83ssP012789; Wed, 25 May 2016 09:05:39 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id k-4ZJqRdyeTp; Wed, 25 May 2016 09:05:39 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4P85aZQ012838
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 25 May 2016 09:05:37 +0100
Message-ID: <1464163536.9570.92.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Zhenbo Gao <zhenbo.gao@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 25 May 2016 09:05:36 +0100
In-Reply-To: <1464160265-16527-1-git-send-email-zhenbo.gao@windriver.com>
References: <1464160265-16527-1-git-send-email-zhenbo.gao@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] connman: add alias for connman
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
X-List-Received-Date: Wed, 25 May 2016 08:05:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-05-25 at 15:11 +0800, Zhenbo Gao wrote:
> connman get conflicts with networkmanager when building
> the project.
> 
> here introduce alias virtual/networkmanager for these
> two recipes, so setting PREFERRED_PROVIDER to the proper
> one can solve the conflicts.
> 
> this patch is for connman recipe.

We do not use the virtual/* namespace in package dependencies, only in
the build time DEPENDS/PROVIDES space. This is because there is no way
to indicate how the package manager should resolve such things amongst
many other reasons.

Cheers,

Richard



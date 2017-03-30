Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5068A77D10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 15:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v2UFXtjN011972; 
	Thu, 30 Mar 2017 16:34:16 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id W9KpPZmaBrIk; Thu, 30 Mar 2017 16:34:16 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2UFYCol012066
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 30 Mar 2017 16:34:13 +0100
Message-ID: <1490888052.13980.356.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: liu.ming50@gmail.com, openembedded-core@lists.openembedded.org
Date: Thu, 30 Mar 2017 16:34:12 +0100
In-Reply-To: <1490860656-27448-1-git-send-email-liu.ming50@gmail.com>
References: <1490860656-27448-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: Re: [PATCH] meta: define REAL_MULTIMACH_TARGET_SYS/SDKTARGETSYSROOT in bitbake.conf
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
X-List-Received-Date: Thu, 30 Mar 2017 15:34:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-03-30 at 09:57 +0200, liu.ming50@gmail.com wrote:
> From: Ming Liu <peter.x.liu@external.atlascopco.com>
> 
> REAL_MULTIMACH_TARGET_SYS is being defined and referred in several
> recipes, which is redundant and not easy to be overriden, and
> SDKTARGETSYSROOT is also defined in two recipes.
> 
> So move their definitions to bitbake.conf.

I have been wondering why you're needing to customise 
REAL_MULTIMACH_TARGET_SYS? Are you having trouble with arm multilibs?
If so, the patches I just sent out might be useful...

Cheers,

Richard


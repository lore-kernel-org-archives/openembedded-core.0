Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QnwJk-0000UY-Qb
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 19:30:17 +0200
Received: by pzk1 with SMTP id 1so11722779pzk.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Aug 2011 10:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=e5r7g6XO11HtY+BDXdM2suLqlnMIWYVNjsQ372lewGc=;
	b=DWdN50qoSCu7JloKXCFyUIBgaqzMQbPZZkZzYF1WNAvTTG1W14N8nLfrbjJqfXi2ew
	A1Xp2WDbiqnBqaKWNFC7M77YlVQj0lBZVS3tsl7kxwfl6GxcebWCd7EzqM4dM7UXgjRG
	n9AY/slwQu5qtuweGsLwkF4DNsQlXKP6R/AhQ=
Received: by 10.68.12.133 with SMTP id y5mr4669981pbb.104.1312219555515;
	Mon, 01 Aug 2011 10:25:55 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id k3sm5748352pbj.45.2011.08.01.10.25.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 01 Aug 2011 10:25:55 -0700 (PDT)
Date: Mon, 1 Aug 2011 10:27:18 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110801172718.GB7798@sakrah.homelinux.org>
References: <cover.1311836896.git.lei.mei@intel.com>
	<2241650b6cb4e409a5463d38cfa0274eec3a3ee2.1311836896.git.lei.mei@intel.com>
	<4E317B82.1020907@mentor.com>
	<749B9D3DBF0F054390025D9EAFF47F2212D0F6D3D5@shsmsx501.ccr.corp.intel.com>
	<4E321053.1050305@mentor.com>
	<749B9D3DBF0F054390025D9EAFF47F2212D0FCC70E@shsmsx501.ccr.corp.intel.com>
	<4E32D1B3.4010707@mentor.com>
	<749B9D3DBF0F054390025D9EAFF47F2212D0FCD06C@shsmsx501.ccr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <749B9D3DBF0F054390025D9EAFF47F2212D0FCD06C@shsmsx501.ccr.corp.intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 1/1] python-native:	Fix	a	compiler	finding	issue
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
X-List-Received-Date: Mon, 01 Aug 2011 17:30:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (01/08/11 20:41), Mei, Lei wrote:
> 
> >
> >You're patching python-native, not python, which means the host python
> >and not the target python.
> 
> Yes, but I think this function will be called by python-pycairo, which will use cross compiler name in this function, so we should get the compiler name from CC.

so we inject the cross compiler name hardcoded into python and then
python uses it when it needs to do cross compilation ?



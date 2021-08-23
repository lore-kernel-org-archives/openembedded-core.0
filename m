Received: from first.geanix.com (first.geanix.com [116.203.34.67])
 by mx.groups.io with SMTP id smtpd.web12.23065.1629721915087322462
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Aug 2021 05:31:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=first header.b=Uwscc3Uf;
 spf=pass (domain: geanix.com, ip: 116.203.34.67, mailfrom: sean@geanix.com)
Received: from skn-laptop (unknown [185.17.218.86])
	by first.geanix.com (Postfix) with ESMTPSA id AAA694409A2;
	Mon, 23 Aug 2021 12:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1629721911; bh=9+yEz30TP7ZYvj2MzKYiS2TJH4pf+Q2nz6I8HJFtgos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Uwscc3Ufubmy2Ms+5oznLUlNht8f2cOfRkW+xgsMUqE64DTQoZe8fUMEqW8kkkXa3
	 94CvHRkW9aUZWfQksGJMgZdcFJsPrDDpBje8J1icgFVhnyQFbNgSwThGAu48pDjjk6
	 xYzN875/wNc5OQGxcpab6ue4EwwdrTq1atOy73803WpfL85j5AdXgBYXMrAWhe6B5l
	 EUtuOnit5sLXT33i4GB00KfdPpuBHLLKAWPgVLs7LWcQJzjmc5QMRAEjmEmw4w84/B
	 anQecXOCMI4cPA3F8ocoT69StoODRILEOdCRznm0rZPqUGMrR4XJSZgbQNFcOQ7+vP
	 qB3BaAMAR832A==
Date: Mon, 23 Aug 2021 14:31:50 +0200
From: "Sean Nyekjaer" <sean@geanix.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 3/3] lib/package_manager: Use shutil.copy instead of bb.utils.copyfile for intercepts
Message-ID: <20210823123150.4l3pkck4hg3kpi54@skn-laptop>
References: <20210506075100.1984260-1-richard.purdie@linuxfoundation.org>
 <20210506075100.1984260-3-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <20210506075100.1984260-3-richard.purdie@linuxfoundation.org>
X-Spam-Status: No, score=-3.1 required=4.0 tests=ALL_TRUSTED,BAYES_00,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,URIBL_BLOCKED
	autolearn=disabled version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on 13e2a5895688
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, May 06, 2021 at 08:51:00AM +0100, Richard Purdie wrote:
> If the scripts/postinst-intercepts is owned by root/root then the copyfile() calls
> will fail due to chown issues. We don't care about ownership of these files so
> use shutil.copy() instead which won't perform any chown.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Anuj will you backport this to gatesgarth?

/Sean

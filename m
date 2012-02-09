Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RvKhH-0004co-BS
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Feb 2012 04:29:23 +0100
Received: by daln34 with SMTP id n34so907706dal.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Feb 2012 19:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=K46iPeaAPL8NWvez7A+MaVEO9eMW6MTod+5V0TssaDM=;
	b=Qgr+LhovFXcRqnAkHmbTpUGjrPqLT+rT1vZTggUX5AniBy7Ym1UGr85bWZoJcfnfiT
	0pWNZpWoEvEP3qFEVjEnaL/e5gqEY8ZdiHCNIbyyouW7FprNLhsU4IfqxrNGfVUrs+bk
	cqGsQq9Bx8N11q/TDu4CvMw7q0kVbmbfxQx7E=
Received: by 10.68.226.98 with SMTP id rr2mr960350pbc.115.1328757678358;
	Wed, 08 Feb 2012 19:21:18 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id x4sm2908567pbx.16.2012.02.08.19.21.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 08 Feb 2012 19:21:17 -0800 (PST)
Date: Wed, 8 Feb 2012 19:21:09 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120209032109.GA29491@sakrah.homelinux.org>
References: <cover.1328752455.git.josh@linux.intel.com>
	<c2bcdddcf16dceedafa8f96e6534e920ea036e15.1328752455.git.josh@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <c2bcdddcf16dceedafa8f96e6534e920ea036e15.1328752455.git.josh@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 4/5] clutter: upgrade git recipe to reflect 1.8.4 tag
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
X-List-Received-Date: Thu, 09 Feb 2012 03:29:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> -# the 1.8.2 tag
> -SRCREV = "9041ea42655dfc1422ce88eab931382dd400d13a"
> -PV = "1.8.2+git${SRCPV}"
> +# the 1.8.4 tag
> +SRCREV = "f2183fa8df3d173afbee09cc4230ab8f4e03f459"
> +PV = "1.8.4git${SRCPV}"

should this be 1.8.4+git${SRCPV} ?



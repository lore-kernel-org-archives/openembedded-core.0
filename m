Received: from mail-pz0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S32Mr-00006N-DI
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 10:32:11 +0100
Received: by dald2 with SMTP id d2so607684dal.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2012 01:23:32 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.68.216.129 as permitted sender) client-ip=10.68.216.129; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.68.216.129 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.68.216.129])
	by 10.68.216.129 with SMTP id oq1mr110468pbc.32.1330593812968 (num_hops
	= 1); Thu, 01 Mar 2012 01:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=OGlLIcrd9G5XeBXqsZeF4JXXdAtxOXyP0bJmMOdxP+E=;
	b=qyNC16gm00vF6EjgHWoHIRDNt3FHDBYbP5EOGCRhdpUbkyX/iT0rcwY2tgkRTp7UXq
	xeaPq8nbOmKo/HKcffs1ErzyNflZGJCV9mDAvZwGOrd9ZvyfMIRsXSiJM0pOzFdGO+HW
	qE0q/uw8vPhoLAOU9669Xkil6Xq9IVzhMOVtU=
Received: by 10.68.216.129 with SMTP id oq1mr92968pbc.32.1330593812892;
	Thu, 01 Mar 2012 01:23:32 -0800 (PST)
Received: from [192.168.1.78] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id l1sm1599989pbe.54.2012.03.01.01.23.30
	(version=SSLv3 cipher=OTHER); Thu, 01 Mar 2012 01:23:31 -0800 (PST)
Message-ID: <4F4F4011.2080303@gmail.com>
Date: Thu, 01 Mar 2012 01:23:29 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120224 Thunderbird/11.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <85003f1e060b6a4406bdde5c48fb9a09bea2ee05.1330242184.git.Martin.Jansa@gmail.com>
	<f88bff815fdeb404bb9a51efbf1b03862ef6dda0.1330242184.git.Martin.Jansa@gmail.com>
In-Reply-To: <f88bff815fdeb404bb9a51efbf1b03862ef6dda0.1330242184.git.Martin.Jansa@gmail.com>
Subject: Re: [PATCHv2 2/5] bitbake.conf: remove TARGET_ARCH from in SDKPATH
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
X-List-Received-Date: Thu, 01 Mar 2012 09:32:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 02/25/2012 11:49 PM, Martin Jansa wrote:
> +SDK_NAME_PREFIX = "oecore"

should this be weak assignment



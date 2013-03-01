Received: from mail-ve0-f169.google.com ([209.85.128.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UBRwM-0007HA-8L
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 16:32:10 +0100
Received: by mail-ve0-f169.google.com with SMTP id 15so3018403vea.28
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Mar 2013 07:15:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=di2I75vpnfSkWkAQSEtax6jd9JmFS73do2jN/wHjwLg=;
	b=WRHZEAGlywdFGVho2Uj7GlEn6BfXBtxfy8f0pg7N7ut729whwkh1uV3F+v9+19RdrF
	dcJCnGe1NZmg8qjA9V/Xaj4f8jGwGeiCUUl6dCRz/rSUVwNMiTUvyCvSlt0EUFXFoFxu
	xGDeNsoxwYwxVDCcJk5jhZeLD1HLEmDBkA6DTlILlCGcE57CrrNEz+T56Ql2j6G8++m+
	hMPMR98/X5f/WX681f7vDEapud2UWhTKPBfSP0un4sKO3B7xWeBEQ4ictSbvAnSDnzJH
	vNs/j5I56zpuwkI3/c6wnacqWivSAhR65VRfG0Hw06/GFT842T89qQiNE/X4+Y2oOQWc
	6mVg==
X-Received: by 10.220.215.73 with SMTP id hd9mr4179130vcb.19.1362150942333;
	Fri, 01 Mar 2013 07:15:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.219.195 with HTTP; Fri, 1 Mar 2013 07:15:22 -0800 (PST)
In-Reply-To: <20130301151037.GM3279@jama>
References: <20130212132846.46275501F6@opal> <20130301151037.GM3279@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 1 Mar 2013 15:15:22 +0000
Message-ID: <CAJTo0LYGVSqsjvoEJHGVt6ZjFuVPZ+ghSsp=GR85fA986t7DOA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQngiqEgNaappq2UHv2b/B17KnldXYlJzz3mSrN0k4c8nt08DkHmRjUoKsW41ZVKmdGZYEJ9
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Constantin Musca : mesa: upgrade to 9.0.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Mar 2013 15:32:40 -0000
Content-Type: text/plain; charset=UTF-8

On 1 March 2013 15:10, Martin Jansa <martin.jansa@gmail.com> wrote:
> This breaks upgrade path:
>  * check_data_file_clashes: Package libdricore9.0.2-1 wants to install
>  * file /etc/drirc
>         But that file is already provided by package  * libdricore9.0.1-1

Urgh, that's annoying API versioning.  I wonder if some magic PV
parsing could be done to generate the conflicts/replaces.

Ross



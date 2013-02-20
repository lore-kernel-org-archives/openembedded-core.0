Received: from mail-pa0-f51.google.com ([209.85.220.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1U84Kt-0002xu-1a
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Feb 2013 08:43:32 +0100
Received: by mail-pa0-f51.google.com with SMTP id hz1so3885291pad.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2013 23:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:mail-followup-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=/kKU67N/WYDpbbMHNPBm5T4dYqwh7HHAcprVk+U0KQQ=;
	b=Cl3nxjjL2EeCCuyhNKeRqXg/8k0YARPqXL67dFputEWm0L8kBm1jwQgF60re30lBgG
	iFkL/fjjYOYmPPm5oKdxYw4+YyVsrhNpTa2gfcPseM6NXhPmqMqoDRzRMOMC+gRn3MKt
	gRd1084PVxI7H1cUi44R5lvVVCAVr/zIeJN9HbsAB7XV6RT9XGTVR3aOY7NOcNOENB+j
	qquw/4tN/rENsn/zXkLGKdpdlo1clnSBH5DPKxBimxCqIY3taCtxBq42jeGOPQbo3SGv
	NCtGZ3OvOZHyanshQSwhyZsB+e04ecPsrTX5ddsAH6xLdLah856Hk5NF7VxvX5I82m66
	eV2w==
X-Received: by 10.66.51.225 with SMTP id n1mr969208pao.203.1361345236135;
	Tue, 19 Feb 2013 23:27:16 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id t6sm110261217paz.11.2013.02.19.23.27.15
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 19 Feb 2013 23:27:15 -0800 (PST)
Date: Tue, 19 Feb 2013 23:26:56 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Yevhen Kyriukha <kirgene@gmail.com>
Message-ID: <20130220072655.GA23958@sakrah.homelinux.org>
Mail-Followup-To: Yevhen Kyriukha <kirgene@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <CADV-EXF+r-Bj08253OJ+Dga5TfgSS7CrLQtAeaTDVc5hSxZbWg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADV-EXF+r-Bj08253OJ+Dga5TfgSS7CrLQtAeaTDVc5hSxZbWg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Do not build initramfs
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
X-List-Received-Date: Wed, 20 Feb 2013 07:43:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (28/01/13 18:05), Yevhen Kyriukha wrote:
> I want to build an image ("core-image-minimal" for example) without
> initramfs support.
> How can I do it?
> 

what does IMAGE_FSTYPES variable look like ? Do you have 'live' or
'hddimg' in there ?



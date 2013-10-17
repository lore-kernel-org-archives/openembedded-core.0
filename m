Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 078986CF0B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 10:36:05 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	r9HAa4c9010901
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 12:36:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1382006167;
	bh=vk9Q/7q7YDVOEZoJI0OYvB274PobWrhLv7id7i+C6dM=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=hKFVk6QDjyWIDgWqCDxrnM0xWJbck649weVqH5fN9+qDcc146QGna5sje2HVd34Dl
	62qwQ8223vxE4QGeL3Y8fJFpFFUx10iuVikTcmP6jI6sOHi/88G+RBy5KxunPxZIfU
	OU6vOcswzsGC43vkBxL9CCVmZcj0IUpzpG5S1j8M=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r9HAa00Z017412
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 12:36:01 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>) id 1VWkvv-0002IC-SU
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Oct 2013 12:35:59 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1381908841-16027-1-git-send-email-rongqing.li@windriver.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Thu, 17 Oct 2013 12:35:59 +0200
In-Reply-To: <1381908841-16027-1-git-send-email-rongqing.li@windriver.com>
	(rongqing's message of "Wed, 16 Oct 2013 15:34:01 +0800")
Message-ID: <lyvc0wtca8.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -4.2
X-Spam-Level: ----
X-Spam-Tests: AWL,DKIM_ADSP_ALL,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.74
Subject: Re: [PATCH 1/2 v2] connman: ignore the networking device which nfs for rootfs is working on
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
X-List-Received-Date: Thu, 17 Oct 2013 10:36:06 -0000
Content-Type: text/plain

<rongqing.li-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org> writes:

> +/usr/sbin/connmand -n $EXTRA_PARAM

this must be 'exec /usr/sbin/connmand'; else you keep an unneeded 'sh'
process around.



Enrico


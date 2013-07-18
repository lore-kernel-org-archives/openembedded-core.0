Return-Path: <Sen.Zhang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 721856AFF1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 08:43:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6I8hbWs024947
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 18 Jul 2013 01:43:37 -0700 (PDT)
Received: from [128.224.162.230] (128.224.162.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Thu, 18 Jul 2013 01:43:37 -0700
Message-ID: <51E7AB55.5060401@windriver.com>
Date: Thu, 18 Jul 2013 16:46:13 +0800
From: Jesse Zhang <sen.zhang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: Henning Heinold <heinold@inf.fu-berlin.de>
References: <cover.1374050133.git.sen.zhang@windriver.com>
	<c95d46b97c8167bddcffb4495438227b668e87cb.1374050133.git.sen.zhang@windriver.com>
	<1374057911.2651.118.camel@phil-desktop.brightsign>
	<CANyK_8fG5LJRBVzRQZG6BVbn-AjTgY0CMwStL47qgu0eVvMcig@mail.gmail.com>
	<20130717145321.GA24542@mail.zedat.fu-berlin.de>
In-Reply-To: <20130717145321.GA24542@mail.zedat.fu-berlin.de>
X-Originating-IP: [128.224.162.230]
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] libatomics-ops: force omit frame pointer for x86 builds
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
X-List-Received-Date: Thu, 18 Jul 2013 08:43:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 07/17/2013 10:53 PM, Henning Heinold wrote:
> This makes we wonder which software on x86 relies on libatomic-ops anymore?
> gcc buildins should be good enough now.

pulseaudio depends on libatomics-ops though I don't know about the
reasons. The libatomics-ops recipe is actually inside the pulseaudio
dir.

jesse


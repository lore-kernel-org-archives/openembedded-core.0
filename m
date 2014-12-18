Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 66D6C72775
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 03:08:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBI38vmK025457
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Dec 2014 19:08:58 -0800 (PST)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Wed, 17 Dec 2014 19:08:57 -0800
Message-ID: <54924549.8060502@windriver.com>
Date: Thu, 18 Dec 2014 11:08:57 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1411894750.git.Qi.Chen@windriver.com>	<e8d9350d5e90ff8b13ab18cd0ec0c868e7cc7f9e.1411894750.git.Qi.Chen@windriver.com>	<54914F06.3030405@windriver.com>
	<lyk31qa856.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <lyk31qa856.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Originating-IP: [128.224.162.226]
Subject: Re: [PATCH 1/1] dhcp: fix for systemd service file
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
X-List-Received-Date: Thu, 18 Dec 2014 03:09:05 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/17/2014 06:21 PM, Enrico Scholz wrote:
> ChenQi <Qi.Chen-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org> writes:
>
>>> 1. Set Type=forking for dhcpd.service to make it start up correctly.
>>> 2. Add PIDFile=/var/run/dhcpd.pid
> why forking? Starting dhcpd with '-f --no-pid' should chose the more
> simple non-forking variant without a clumsy.pidfile.
>
>
> Enrico

V2 sent, using '-f --no-pid'.

Regards,
Chen Qi


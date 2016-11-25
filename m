Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0181671AA7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2016 19:09:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uAPJ9Vsw004588
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2016 11:09:31 -0800 (PST)
Received: from soho-mhatle-m.local (172.25.36.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 25 Nov 2016 11:09:30 -0800
To: <openembedded-core@lists.openembedded.org>
References: <CAKRNOGzXLf_kfousHniKin-qqs2TURwOQQptDJTMHA9Gqe5now@mail.gmail.com>
	<20161124104959.32350-1-freesilicon@gmail.com>
	<CAJTo0LaJZesXW8ytS+nkVh2Sa1JGKzMsSN=MPvoqMQz5sezyAQ@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <ea567625-caf4-487d-449f-31c2d1b36427@windriver.com>
Date: Fri, 25 Nov 2016 13:09:30 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.5.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaJZesXW8ytS+nkVh2Sa1JGKzMsSN=MPvoqMQz5sezyAQ@mail.gmail.com>
Subject: Re: [PATCH v3] rootfs: Modify RPM installation
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
X-List-Received-Date: Fri, 25 Nov 2016 19:09:31 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 11/25/16 12:17 PM, Burton, Ross wrote:
> 
> On 24 November 2016 at 10:49, David Vincent <freesilicon@gmail.com
> <mailto:freesilicon@gmail.com>> wrote:
> 
>     -        self._setup_dbg_rootfs(['/etc/rpm', '/var/lib/rpm', '/var/lib/smart'])
>     +        self._setup_dbg_rootfs(['/etc/rpm', rpm_libdir, '/var/lib/smart'])
> 
> 
> Can we extend the un-hardcoding so this uses ${localstatedir}/lib/smart, and
> rpmlibdir also uses ${localstatedir}?

The value for the rpm directory is hard coded into the configuration file.
Anything we do outside of that MUST match.  Inspect the rpm macros file for the
matching value.  (This is why /var/lib/rpm was hard coded in the past.)

As for smart, I don't remember the rules offhand, so someone will need to figure
out if it's variable (compile time) or hard coded.

--Mark

> Also current master lets you not bother passing True to d.getVar() as that is
> the default now.
> 
> Ross
> 
> 



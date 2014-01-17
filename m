Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DF89C6E3EB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 04:55:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0H4tKa4010571
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 16 Jan 2014 20:55:20 -0800 (PST)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 16 Jan 2014 20:55:19 -0800
Message-ID: <52D8B7B5.9010502@windriver.com>
Date: Fri, 17 Jan 2014 12:55:17 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CAMgc3zNOyfSfz=jUmO2sCDOOJ8=MRwD+EZyAc3t-C6gzn3Ehnw@mail.gmail.com>
In-Reply-To: <CAMgc3zNOyfSfz=jUmO2sCDOOJ8=MRwD+EZyAc3t-C6gzn3Ehnw@mail.gmail.com>
Subject: Re: unable to use bitbake -c populate_sdk core-image-minimal on dora
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
X-List-Received-Date: Fri, 17 Jan 2014 04:55:22 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Shane,

Thanks for reporting this, I will try to figure it out.

And Nicolas, I'm very sorry that I missed your email.

// Robert

On 01/15/2014 09:16 PM, Shane Volpe wrote:
> I believe I'm also having the same problem Nicolas has reported in
> this thread, here is my output:
>
> Issue 1:
> update-alternatives: Error: cannot register alternative opkg to
> /usr/local/oecore-i686/sysroots/i686-angstromsdk-linux/usr/bin/opkg
> since it is already registered to /usr/bin/opkg
>
>
> Issue 2:
> update-alternatives: Error: cannot register alternative passwd to
> /usr/local/oecore-i686/sysroots/i686-angstromsdk-linux/usr/bin/passwd
> since it is already registered to /usr/bin/passwd
> update-alternatives: Error: cannot register alternative chfn to
> /usr/local/oecore-i686/sysroots/i686-angstromsdk-linux/usr/bin/chfn
> since it is already registered to /usr/bin/chfn
> update-alternatives: Error: cannot register alternative newgrp to
> /usr/local/oecore-i686/sysroots/i686-angstromsdk-linux/usr/bin/newgrp
> since it is already registered to /usr/bin/newgrp
> update-alternatives: Error: cannot register alternative chsh to
> /usr/local/oecore-i686/sysroots/i686-angstromsdk-linux/usr/bin/chsh
> since it is already registered to /usr/bin/chsh
> update-alternatives: Error: cannot register alternative groups to
> /usr/local/oecore-i686/sysroots/i686-angstromsdk-linux/usr/bin/groups
> since it is already registered to /usr/bin/groups
> update-alternatives: Error: cannot register alternative chpasswd to
> /usr/local/oecore-i686/sysroots/i686-angstromsdk-linux/usr/sbin/chpasswd
> since it is already registered to /usr/sbin/chpasswd
> update-alternatives: Error: cannot register alternative login to
> /usr/local/oecore-i686/sysroots/i686-angstromsdk-linux/bin/login since
> it is already registered to /bin/login
> update-alternatives: Error: cannot register alternative vipw to
> /usr/local/oecore-i686/sysroots/i686-angstromsdk-linux/sbin/vipw since
> it is already registered to /sbin/vipw
> update-alternatives: Error: cannot register alternative vigr to
> /usr/local/oecore-i686/sysroots/i686-angstromsdk-linux/sbin/vigr since
> it is already registered to /sbin/vigr
> update-alternatives: Error: cannot register alternative su to
> /usr/local/oecore-i686/sysroots/i686-angstromsdk-linux/bin/su since it
> is already registered to /bin/su
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


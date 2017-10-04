Return-Path: <andrej.valek@siemens.com>
Received: from lizzard.sbs.de (lizzard.sbs.de [194.138.37.39])
	by mail.openembedded.org (Postfix) with ESMTP id A652177EA1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Oct 2017 17:42:36 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id v94HgXS4009846
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Wed, 4 Oct 2017 19:42:33 +0200
Received: from [192.168.253.100] ([139.22.116.193])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTPS id v94HgXVu004766
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 4 Oct 2017 19:42:33 +0200
To: "Burton, Ross" <ross.burton@intel.com>
References: <1507045133-16665-1-git-send-email-andrej.valek@siemens.com>
	<CAJ86T=Xh4HZO8e-u6r9gn0nCx+ZbzkjV+AJOP3-Cgt1fF3xr7w@mail.gmail.com>
	<bb590f7b-67d0-f106-785f-9f4ecf3127a0@siemens.com>
	<CAJTo0Lb-QW_zHVs3eyGsVE6sXwBb9AwWDSFEhoe=EWMrCKF7uA@mail.gmail.com>
	<ba1bbc29-6515-e99f-be98-921ccd96c614@siemens.com>
	<CAJTo0LaHrM7r1S4=Qp5AXZMwrH5Qd4Vcn2O5Z2QnDW9Q24wPrw@mail.gmail.com>
From: Andrej Valek <andrej.valek@siemens.com>
Message-ID: <55b42850-054d-591c-e141-202681cf967c@siemens.com>
Date: Wed, 4 Oct 2017 19:42:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaHrM7r1S4=Qp5AXZMwrH5Qd4Vcn2O5Z2QnDW9Q24wPrw@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] busybox updating
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
X-List-Received-Date: Wed, 04 Oct 2017 17:42:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

I don not know, if you have custom configuration, but I can give a
advice. CONFIG_FEATURE_SH_IS_ASH has been changed to CONFIG_SH_IS_ASH.
You can check, if have all occurrences already changed ;).

Andrej

On 10/04/2017 06:13 PM, Burton, Ross wrote:
> On 4 October 2017 at 12:56, Andrej Valek <andrej.valek@siemens.com 
> <mailto:andrej.valek@siemens.com>> wrote:
> 
>     I have unpacked the rpm package over command "rpm -qp --scripts
>     busybox-1.27.2-r0.i586.rpm" and links to /bin/sh looks good for me.
> 
>     update-alternatives --install /bin/sh sh /bin/busybox.nosuid 50
> 
> 
> I wiped tmp and rebuild busybox and it's still linking to busybox.suid here.  
> Annoyingly I asked Joshua to replicate and he confirmed your busybox.nosuid link.
> 
> Argh! :(
> 
> Ross
> 


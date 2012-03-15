Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1S8DdC-0007uS-Kf
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 17:34:27 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2FGPcad028494
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 09:25:38 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 15 Mar 2012 09:25:38 -0700
Message-ID: <4F621801.4000308@windriver.com>
Date: Thu, 15 Mar 2012 11:25:37 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1331799506.1041.55.camel@localhost.localdomain>
In-Reply-To: <1331799506.1041.55.camel@localhost.localdomain>
Subject: Re: LSB support?
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
X-List-Received-Date: Thu, 15 Mar 2012 16:34:27 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 3/15/12 3:18 AM, Ni Qingliang wrote:
> Hello, I'm working on custom lsb-base image using oe-core.
>
> and when using the lsb script, found error:
>
> lsb_start_daemon line 44: daemon command not found.
>
> similar thing happend on lsb_log_message: failure and warning command
> not found.
>
> maybe these function should be defined in /etc/init.d/functions?
>
> but there are not these function in this file (belongs to initscripts).

Did you enable the LSB distribution settings?  Without this, various components 
may not be available.

In Poky, there is a "poky-lsb" distribution type:

DISTRO = "poky-lsb"
DISTROOVERRIDES = "poky:linuxstdbase"

DISTRO_FEATURES_append = " pam largefile opengl"
PREFERRED_PROVIDER_virtual/libx11 = "libx11"

(as well as using the core-image-lsb and/or task-core-lsb components.)

If you've tried this and those items are still broken, let me know and I can 
help investigate further.  (One final note, only LSB 1.4 is currently supported.)

--Mark

> Any idea?
>
> thanks!
>
>




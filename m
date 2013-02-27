Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1UAg3e-0008KC-Dd
	for Openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 13:24:37 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1RC83av019800
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 27 Feb 2013 04:08:03 -0800 (PST)
Received: from [172.25.32.35] (172.25.32.35) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.328.9;
	Wed, 27 Feb 2013 04:08:03 -0800
Message-ID: <512DF722.2030700@windriver.com>
Date: Wed, 27 Feb 2013 06:08:02 -0600
From: Jason Wessel <jason.wessel@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Trevor Woerner <twoerner@gmail.com>
References: <1361930646-10689-1-git-send-email-jason.wessel@windriver.com>
	<CAHUNapRkAFDfkyhS=+BEzcU_Gt4AO5WoMv7PpZ16bjjoR9+cfg@mail.gmail.com>
In-Reply-To: <CAHUNapRkAFDfkyhS=+BEzcU_Gt4AO5WoMv7PpZ16bjjoR9+cfg@mail.gmail.com>
X-Enigmail-Version: 1.5
Cc: Patches and discussions about the oe-core layer
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] syslinux.bbclass: Add a default serial console option and real boot menu support
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
X-List-Received-Date: Wed, 27 Feb 2013 12:24:45 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 02/27/2013 05:51 AM, Trevor Woerner wrote:
> On Tue, Feb 26, 2013 at 9:04 PM, Jason Wessel
> <jason.wessel@windriver.com> wrote:
>> You can see the screen shots attached to the bugzilla.
>>
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3944
>>
>> [ YOCTO #3944 ]
> Is the "Windriver" logo on the VGA example optional?

The Wind River logo is purely an example.  It is not actually included in the commit.  If you build the commit I published you get what ever the internal splash that is part of isolinux.   To be more specific, if you don't provide a SYSLINUX_SPLASH = "location of some lss file" in your local.conf you get the internal default which has nothing to do with Wind River's logo.

I published an example to show that it can be done because other vendors would also likely want to include their own boot splash.

Jason.



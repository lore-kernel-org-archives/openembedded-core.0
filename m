Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Florin.Sarbu@windriver.com>) id 1U5yEj-0005cq-SG
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Feb 2013 13:49:13 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1ECWMHR006838
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Feb 2013 04:32:22 -0800 (PST)
Received: from [128.224.168.151] (128.224.168.151) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Thu, 14 Feb 2013 04:32:21 -0800
Message-ID: <511CD958.2010401@windriver.com>
Date: Thu, 14 Feb 2013 14:32:24 +0200
From: Florin Sarbu <florin.sarbu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <511BB265.8030505@windriver.com> <511CA4B2.1090307@intel.com>
	<511CA9E2.70700@windriver.com>
	<CAJTo0LYLtan2=YkzCN9Xvkj7k695LGba7T1QMHwYQ8EK46YvgQ@mail.gmail.com>
In-Reply-To: <CAJTo0LYLtan2=YkzCN9Xvkj7k695LGba7T1QMHwYQ8EK46YvgQ@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: systemd services in the rootfs
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
X-List-Received-Date: Thu, 14 Feb 2013 12:49:14 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

So choosing, for example ${PN} to hold the systemd services, and also 
choose to use sysvinit as the init manager, then I'd end up with a 
rootfs containing useless systemd services.
Then can someone detail what is SYSTEMD_PACKAGES used for? If it's only 
for adding the packages to PACKAGES, then it doesn't make too much sense 
to exist in my opinion, as it would just be an extra variable defined to 
do something that can be achieved without defining a extra variable.

Florin

On 02/14/2013 12:17 PM, Burton, Ross wrote:
> On 14 February 2013 09:09, Florin Sarbu <florin.sarbu@windriver.com> wrote:
>> The issue I was referring to was that the individual packages (that contain
>> the systemd service files) generated from various recipes, do not end up in
>> the rootfs solely by having them declared in the SYSTEMD_PACKAGES and having
>> DISTRO_FEATURES_INITMAN ="systemd". You need now to explicitly add these
>> ${PN}-systemd (or whatever name you choose for the packages that will hold
>> the systemd services) in some packagegroups or image recipes to have them in
>> the rootfs. It is not a question of where to have them in the rootfs, but
>> rather to have them added in the do_rootfs stage.
> Put the service files into the relevant package (i.e. $PN, instead of
> into a separate package of their own.
>
> This is different to how meta-systemd worked, because in oe-core
> systemd is a DISTRO_FEATURE and not something you can decide at image
> construction time.
>
> Ross




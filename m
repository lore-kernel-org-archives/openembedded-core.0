Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A8EB86059A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jun 2014 05:50:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5U5oDNh008924
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 29 Jun 2014 22:50:13 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 29 Jun 2014 22:50:12 -0700
Message-ID: <53B0FA93.7060603@windriver.com>
Date: Mon, 30 Jun 2014 13:50:11 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Himanshu Pandey <pandey_himanshu80@rediffmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20140630053915.21219.qmail@f4mail-235-182.rediffmail.com>
In-Reply-To: <20140630053915.21219.qmail@f4mail-235-182.rediffmail.com>
Subject: Re: Adding meta-networking layer to Yocto
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
X-List-Received-Date: Mon, 30 Jun 2014 05:50:21 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 06/30/2014 01:39 PM, Himanshu Pandey wrote:
> Hi,
>
> Please tell me how to add meta-networking layer to Yocto.
>
> What all steps are involved?

Please refer to conf/bblayers.conf, it should be something like:

BBLAYERS = "\
	[snip]
	/path/to/meta-networking \
	[snip]
"

to add the meta-networking layer.

>
> Which all files to configure etc.

The recipes in the meta-networking will be parsed (not built by default),
if you want to add packages to the image, you can use:

CORE_IMAGE_EXTRA_INSTALL += "<pkg name>" (e.g.: ntp)

to conf/local.conf

// Robert

>
> Regards,
> Himanshu
>
> <http://sigads.rediff.com/RealMedia/ads/click_nx.ads/www.rediffmail.com/signatureline.htm@Middle?>
> Get your own *FREE* website, *FREE* domain & *FREE* mobile app with Company email.
> 	*Know More >*
> <http://track.rediff.com/click?url=___http://businessemail.rediff.com/email-ids-for-companies-with-less-than-50-employees?sc_cid=sign-1-10-13___&cmp=host&lnk=sign-1-10-13&nsrv1=host>
>
>
>


Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E398F60DD7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Oct 2014 07:17:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9H7HVGU000048
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 17 Oct 2014 00:17:31 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 17 Oct 2014 00:17:30 -0700
Message-ID: <5440C280.4010104@windriver.com>
Date: Fri, 17 Oct 2014 15:17:20 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>,
	<Qi.Chen@windriver.com>
References: <cover.1413527658.git.hongxu.jia@windriver.com>
In-Reply-To: <cover.1413527658.git.hongxu.jia@windriver.com>
Subject: Re: [PATCH 0/1] systemd: move libgudev back to $rootlibdir
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
X-List-Received-Date: Fri, 17 Oct 2014 07:17:37 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Please drop this, I think Martin's "systemd: don't move libgudev around,
it breaks libgudev-1.0.la" is better. We indeed do not need the "backward
compatibility"

//Hongxu

On 10/17/2014 02:35 PM, Hongxu Jia wrote:
> The following changes since commit ccf5a4d2342c4fd40e4e0b332ea7e34e0bf175d4:
>
>    build-appliance-image: Update to dizzy head revision (2014-10-11 08:11:17 +0100)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib hongxu/fix-systemd
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-systemd
>
> Hongxu Jia (1):
>    systemd: move libgudev back to $rootlibdir
>
>   meta/recipes-core/systemd/systemd_216.bb | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>



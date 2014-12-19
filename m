Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 13B6C728ED
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 08:17:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBJ8HgSP016368
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 00:17:42 -0800 (PST)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Fri, 19 Dec 2014 00:17:42 -0800
Message-ID: <5493DF23.7080602@windriver.com>
Date: Fri, 19 Dec 2014 16:17:39 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1418190010.git.Chong.Lu@windriver.com>
In-Reply-To: <cover.1418190010.git.Chong.Lu@windriver.com>
X-Originating-IP: [128.224.162.204]
Subject: Re: [PATCH V3 0/3] use single variable to set baud rate
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
X-List-Received-Date: Fri, 19 Dec 2014 08:17:47 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 12/10/2014 01:43 PM, Chong Lu wrote:
> Change since V2:
> don't change SERIAL_CONSOLE default value and add console.bbclass to get
> port, tty and baud rate from SERIAL_CONSOLE.
>
> The following changes since commit ec6377bcf52d105cd23ac6bbbeddd38fee9337e4:
>
>    bitbake: bitbake-user-manual-metadata.xml: Updated do_package_write example (2014-12-09 22:25:36 +0000)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib chonglu/baudrate
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/baudrate
>
> Chong Lu (3):
>    console.bbclass: add class which can be used to set serial console and
>      baud rate
>    syslinux.bbclass: use single variable to set baud rate
>    grub-efi.bbclass: use single variable to set baud rate
>
>   meta/classes/console.bbclass  | 23 +++++++++++++++++++++++
>   meta/classes/grub-efi.bbclass |  5 +++--
>   meta/classes/syslinux.bbclass |  5 +++--
>   3 files changed, 29 insertions(+), 4 deletions(-)
>   create mode 100644 meta/classes/console.bbclass
>



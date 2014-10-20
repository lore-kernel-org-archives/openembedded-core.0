Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 46ED760233
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 09:19:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9K9Jcs2009727
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 20 Oct 2014 02:19:38 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Mon, 20 Oct 2014 02:19:37 -0700
Message-ID: <5444D3A5.7060208@windriver.com>
Date: Mon, 20 Oct 2014 17:19:33 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1413341569.git.Chong.Lu@windriver.com>
	<b2f5f79f9e08f008043508392775c2bb52f819b3.1413341569.git.Chong.Lu@windriver.com>
	<CAJTo0LboKNAOi7_tx31+m2KOxF_HEKEGePU2wnHXSzGpoeGTgA@mail.gmail.com>
In-Reply-To: <CAJTo0LboKNAOi7_tx31+m2KOxF_HEKEGePU2wnHXSzGpoeGTgA@mail.gmail.com>
X-Originating-IP: [128.224.162.204]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 1/1] gconf: fix multilib conflict - org.gnome.GConf.service
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
X-List-Received-Date: Mon, 20 Oct 2014 09:19:42 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 10/15/2014 06:42 PM, Burton, Ross wrote:
> On 15 October 2014 03:54, Chong Lu <Chong.Lu@windriver.com> wrote:
>> The gconfd-2 will be called in org.gnome.GConf.service file and the path of
>> gconfd-2 is ${libexecdir}, this will get following error when multilib exported
>> in the sdk:
>> error: file /usr/share/dbus-1/services/org.gnome.GConf.service from install
>> of gconf-3.2.6-r0.0.lib32_x86 conflicts with file from package
>> gconf-3.2.6-r0.0.x86_64
>>
>> Split org.gnome.GConf.service to ${PN}-service, the conflict was fixed.
> Why are both ML variants of gconf being installed?    Presumably for
> libgconf, which needs to have ML variants and is packaged into $PN.
> $PN also contains the binaries and data files, which are not

Hi Ross,

The data file is different between bit-32 and bit-64 environment.

Best Regards
Chong

> ML-specific and can only be installed once.
>
> So, gconf should split the daemon/binaries from the libraries.  I
> suggested this back in July as it seems the logical answer, instead of
> splitting the daemon binary and the service file that defines where
> the binary is.
>
> Ross
>
>



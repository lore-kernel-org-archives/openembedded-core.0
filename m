Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C656D6D2F9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 02:54:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAI2sXEM028306
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Nov 2013 18:54:33 -0800 (PST)
Received: from [128.224.162.213] (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Sun, 17 Nov 2013 18:54:32 -0800
Message-ID: <52898177.5000303@windriver.com>
Date: Mon, 18 Nov 2013 10:54:47 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CANyK_8c67C4NL7mNf3LTDwurtfpeU+S5ts4+O2t+HiDv84YgaQ@mail.gmail.com>
In-Reply-To: <CANyK_8c67C4NL7mNf3LTDwurtfpeU+S5ts4+O2t+HiDv84YgaQ@mail.gmail.com>
X-Originating-IP: [128.224.162.213]
Subject: Re: opkg dependencies and update-alternatives
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
X-List-Received-Date: Mon, 18 Nov 2013 02:54:30 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/2013 02:57 AM, Paul Barker wrote:
> Hi all,
>
> I've been trying to add PACKAGECONFIG options to opkg and have ran
> into a dependency loop whilst building with certain options. Enabling
> curl support within opkg requires a dependency on curl. curl in turn
> depends on ncurses (via a few intermediate dependencies) and ncurses
> uses update-alternatives causing a dependency on
> virtual/update-alternatives.
> PREFERRED_PROVIDER_virtual/update-alternatives is set to "opkg" in
> meta/conf/distro/include/default-providers.inc and so we have a
> dependency loop if curl is enabled via the new PACKAGECONFIG options
> for opkg.
>
> I can cause the same dependency loop by setting
> PREFERRED_PROVIDER_virtual/update-alternatives to "dpkg" as dpkg
> directly depends on ncurses (which uses update-alternatives). So if
> someone wanted to use the more powerful update-alternatives from dpkg
> on a target system it doesn't look like that is currently possible.
>
> This places quite a constraint on whichever recipe PROVIDES
> update-alternatives. Going forward I'm hoping to use libarchive within
> opkg and libarchive depends on bzip2 by default which uses
> update-alternatives, which would cause the same problem.
>
> Does anyone have any clever solutions to this? Perhaps we could split
> update-alternatives off into its own recipe which should be dependent
> on very little, allowing opkg a little more freedom in its
> dependencies.
>
> Thanks,
>

I opened a bug some time ago for this update-alternative problem.
https://bugzilla.yoctoproject.org/show_bug.cgi?id=4836

It would be really helpful if you could add some input in the comments 
of that bug.

Thanks,
Chen Qi


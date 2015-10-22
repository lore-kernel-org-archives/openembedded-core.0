Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 5E0F077108
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 15:02:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id A8910600F52
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1445334356.git.joshua.lock@collabora.co.uk>
	<1a1ce45ceedb4a185b9cb03e36a56c5cd2485773.1445334356.git.joshua.lock@collabora.co.uk>
	<CAJTo0LbZ3_uwkerqAU3TbHSNPCg+8C3Z_U-Wu-XbMCA68pF+xA@mail.gmail.com>
From: Joshua Lock <joshua.lock@collabora.co.uk>
Message-ID: <5628FA91.30004@collabora.co.uk>
Date: Thu, 22 Oct 2015 16:02:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbZ3_uwkerqAU3TbHSNPCg+8C3Z_U-Wu-XbMCA68pF+xA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 3/7] weston: add PACKAGECONFIG to build with systemd-login support
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
X-List-Received-Date: Thu, 22 Oct 2015 15:02:44 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 21/10/15 17:14, Burton, Ross wrote:
>
> On 20 October 2015 at 10:47, Joshua Lock <joshua.lock@collabora.co.uk
> <mailto:joshua.lock@collabora.co.uk>> wrote:
>
>     +# Weston with systemd-login support
>     +PACKAGECONFIG[systemd] = ",,systemd dbus"
>
>
> This means it is impossible to have a distro with systemd present but
> have the systemd feature disabled which isn't ideal.  Adding configure
> options would be awesome.

Indeed, I realised the same after I'd sent a patch. I'll submit a v3 
series which includes a resolution for this issue (with another 
backported patch).

Regards,

Joshua



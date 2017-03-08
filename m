Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0C46773111
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 17:26:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v28HQRuN001480
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 8 Mar 2017 09:26:27 -0800 (PST)
Received: from soho-mhatle-m.local (172.25.36.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 8 Mar 2017 09:26:26 -0800
To: "Burton, Ross" <ross.burton@intel.com>, Peter Kjellerstedt
	<peter.kjellerstedt@axis.com>
References: <cover.1488539819.git.pkj@axis.com>
	<CAEHkU3XyKbGzTCX9XaG7jYXjde+ZRtA9z_MSecxpgOcu6wLMiQ@mail.gmail.com>
	<aca83849e80a444595764b812d5e3394@XBOX02.axis.com>
	<af3c0da4bce549a5b303d828c9728524@XBOX02.axis.com>
	<CAJTo0Laa_WrQOjCyNBBmpWbKkza9Pg=dAiQEQJBrQoiEWab0Bw@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <03a990de-1a7d-e4d0-2e87-7fc1d656e463@windriver.com>
Date: Wed, 8 Mar 2017 11:26:25 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Laa_WrQOjCyNBBmpWbKkza9Pg=dAiQEQJBrQoiEWab0Bw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3 0/5] Add dummy tools to help identify needed dependencies
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
X-List-Received-Date: Wed, 08 Mar 2017 17:26:38 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 3/8/17 11:21 AM, Burton, Ross wrote:
> 
> On 8 March 2017 at 09:43, Peter Kjellerstedt <peter.kjellerstedt@axis.com
> <mailto:peter.kjellerstedt@axis.com>> wrote:
> 
>     since I see that you have integrated/staged the two patches that add
>     inherits of pkgconfig, but not the patches that add the dummy commands,
>     I assume you have some reservations to these patches. What are your
>     take on the subject of blacklisting vs whitelisting the commands from
>     the build host? I know that having these dummy commands in place helped
>     me a great deal when updating our recipes to build correctly with RSS.
> 
> 
> FWIW I wasn't entirely keen on how the blacklisting had to be very careful about
> how PATH was manipulated, which is why I merged to my staging branch the fixes
> but not the dummy commands.
> 
> If the majority of people agree that this should be merged I don't have a strong
> opinion either way.

The scripts would be very useful for people to avoid host-contamination issues.

If we could build up a set of these types of tools (and associated 'please do
the following' behaviors) I think it would be very useful.  (Starting with these
three items will probably catch the majority of things.)

--Mark

> Ross
> 
> 



Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id EA13B77CD7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 08:30:50 +0000 (UTC)
Received: from [172.16.1.14] (62-178-118-86.cable.dynamic.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 6787E1FE1D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 10:30:51 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <1491897285-6179-1-git-send-email-dv@pseudoterminal.org>
	<8d9c24ce-6a90-e080-dbe9-b3edba59aac4@linux.intel.com>
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <77e0f2a1-520d-5a0d-b1c0-d231622cfe79@pseudoterminal.org>
Date: Tue, 11 Apr 2017 10:30:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <8d9c24ce-6a90-e080-dbe9-b3edba59aac4@linux.intel.com>
Subject: Re: [PATCH] kmscube: add recipe
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
X-List-Received-Date: Tue, 11 Apr 2017 08:30:52 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2017-04-11 10:26, Alexander Kanavin wrote:
> On 04/11/2017 10:54 AM, Carlos Rafael Giani wrote:
>> This is a useful tool to test KMS and GBM-based EGL & OpenGL ES drawing
>
> Sorry, but the bar for adding recipes to oe-core is higher than a 
> single all-purpose word 'useful'. Useful to whom? What does the tool 
> do? Is it essential for making an embedded system? You really should 
> write a (much) longer commit message, for a start.
>
> Alex
>

Well it is sort of an equivalent of glxgears for checking whether or not 
GBM-based rendering actually works. We have piglit for testing, eglinfo 
for getting information about the EGL & GLES support, and kmscube also 
adds a visual output to see that rendering actually behaves nicely.


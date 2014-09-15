Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 64C4471397
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 11:20:35 +0000 (UTC)
Received: (qmail 2861 invoked by uid 1003); 15 Sep 2014 11:20:35 -0000
Received: from unknown (HELO ?192.168.4.226?)
	(philip@opensdr.com@64.134.243.23)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	15 Sep 2014 11:20:35 -0000
Message-ID: <5416CB83.5030304@balister.org>
Date: Mon, 15 Sep 2014 07:20:35 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, 
	Soren Brinkmann <soren.brinkmann@xilinx.com>
References: <1410467636-17638-1-git-send-email-soren.brinkmann@xilinx.com>
	<CAJTo0LbAQ38w=dUqTKEXpt=BRvMk5WG9UCVFkMnEE31w95Xvtg@mail.gmail.com>
In-Reply-To: <CAJTo0LbAQ38w=dUqTKEXpt=BRvMk5WG9UCVFkMnEE31w95Xvtg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base-files: Allow setting hostname through DISTRO_HOSTNAME
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
X-List-Received-Date: Mon, 15 Sep 2014 11:20:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 09/14/2014 06:30 PM, Burton, Ross wrote:
> On 11 September 2014 21:33, Soren Brinkmann <soren.brinkmann@xilinx.com> wrote:
>> Add a distro variable to set the hostname. This allows easily assigning
>> a hostname in local.conf.
> 
> It's already as easy as assigning a hostname in local.conf:
> 
> hostname_pn-base-files = "cuteembeddedhack"
> 
> Also your patch doesn't add a distro-level variable, it just adds
> another package-level variable.
> 
> Patches like this tend to appear every 18 months or so, clearly we
> need to ensure this is documented.

We should change this line in the bb file:

# set standard hostname, might be a candidate for a DISTRO variable? :M:

to let people know how to override from local.conf.

If no one gets to this soon, I will when I am home.

Philip

> 
> Ross
> 


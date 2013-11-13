Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 873A46D598
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 13:24:13 +0000 (UTC)
Received: (qmail 20344 invoked by uid 1003); 13 Nov 2013 13:24:14 -0000
Received: from unknown (HELO ?192.168.1.113?)
	(philip@opensdr.com@108.44.82.190)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	13 Nov 2013 13:24:14 -0000
Message-ID: <52837D78.4030402@balister.org>
Date: Wed, 13 Nov 2013 08:24:08 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1384337335-32231-1-git-send-email-hongbo.zhong@windriver.com>
	<1384337335-32231-2-git-send-email-hongbo.zhong@windriver.com>
	<1384342720.12863.10.camel@phil-desktop.brightsign>
	<CAJTo0LZFOyfK84xnA8HhV=UJD23hPhhX0DFJ=t_TvYkGymKZHQ@mail.gmail.com>
In-Reply-To: <CAJTo0LZFOyfK84xnA8HhV=UJD23hPhhX0DFJ=t_TvYkGymKZHQ@mail.gmail.com>
X-Enigmail-Version: 1.6
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] bluez4: Install simple-agent utility for pairing bluetooth devices
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
X-List-Received-Date: Wed, 13 Nov 2013 13:24:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 11/13/2013 07:34 AM, Burton, Ross wrote:
> On 13 November 2013 11:38, Phil Blundell <pb@pbcl.net> wrote:
>> On Wed, 2013-11-13 at 18:08 +0800, Zhong Hongbo wrote:
>>> From: Zhong Hongbo <hongbo.zhong@windriver.com>
>>>
>>> Signed-off-by: Zhong Hongbo <hongbo.zhong@windriver.com>
>> [...]
>>>       install -m 0644 ${S}/input/input.conf ${D}/${sysconfdir}/bluetooth/
>>> +     install -m 0755 ${S}/test/simple-agent ${D}/${bindir}/simple-agent
>>
>> What does simple-agent actually do?  Is it generally enough useful that
>> it should be installed unconditionally?
> 
> It's a dumb agent for responding to incoming pairing requests, as it
> works interactively from a terminal it's purely for testing purposes.
> I'd prefer to see it (and probably more utilities) installed in
> bluez4-tests as it's not generally useful.

I think it is also useful for console only devices.

Philip

> 
> Ross
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> 


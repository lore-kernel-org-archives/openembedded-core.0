Return-Path: <Hongbo.Zhong@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 990DB6D2FB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 03:29:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAE3T1iH007567
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 13 Nov 2013 19:29:01 -0800 (PST)
Received: from [128.224.162.173] (128.224.162.173) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Wed, 13 Nov 2013 19:29:01 -0800
Message-ID: <5284438D.6060902@windriver.com>
Date: Thu, 14 Nov 2013 11:29:17 +0800
From: Zhong Hongbo <hongbo.zhong@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1384337335-32231-1-git-send-email-hongbo.zhong@windriver.com>
	<1384337335-32231-2-git-send-email-hongbo.zhong@windriver.com>
	<1384342720.12863.10.camel@phil-desktop.brightsign>
	<CAJTo0LZFOyfK84xnA8HhV=UJD23hPhhX0DFJ=t_TvYkGymKZHQ@mail.gmail.com>
In-Reply-To: <CAJTo0LZFOyfK84xnA8HhV=UJD23hPhhX0DFJ=t_TvYkGymKZHQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 14 Nov 2013 03:29:00 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/2013 08:34 PM, Burton, Ross wrote:
> On 13 November 2013 11:38, Phil Blundell <pb@pbcl.net> wrote:
>> On Wed, 2013-11-13 at 18:08 +0800, Zhong Hongbo wrote:
>>> From: Zhong Hongbo <hongbo.zhong@windriver.com>
>>>
>>> Signed-off-by: Zhong Hongbo <hongbo.zhong@windriver.com>
>> [...]
>>>        install -m 0644 ${S}/input/input.conf ${D}/${sysconfdir}/bluetooth/
>>> +     install -m 0755 ${S}/test/simple-agent ${D}/${bindir}/simple-agent
>> What does simple-agent actually do?  Is it generally enough useful that
>> it should be installed unconditionally?
> It's a dumb agent for responding to incoming pairing requests, as it
> works interactively from a terminal it's purely for testing purposes.
> I'd prefer to see it (and probably more utilities) installed in
> bluez4-tests as it's not generally useful.
Agree.

But a issue is: How do place this test file?  On the /usr/bin directory? 
or /usb/bin/bluez? or others?

The below place the test to /usr/bin. as the following:

FILES_${PN}-test += "\
   ${bindir}/test-* \
   ${bindir}/simple-* \
   ${bindir}/agent \
   ${bindir}/attest \
   ${bindir}/avtest \
   ${bindir}/bdaddr \
   ${bindir}/btiotest \
   ${bindir}/gaptest \
   ${bindir}/hsmicro \
   ${bindir}/hsplay \
   ${bindir}/hstest \
   ${bindir}/ipctest \
   ${bindir}/l2test \
   ${bindir}/list-devices \
   ${bindir}/lmptest \
   ${bindir}/monitor-bluetooth \
   ${bindir}/mpris-player \
   ${bindir}/rctest \
   ${bindir}/scotest \
   ${bindir}/sdptest \
   ${bindir}/uuidtest \
"

Thanks,
Hongbo
>
> Ross
>
>



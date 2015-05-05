Return-Path: <vomegaz@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 4B21B72376
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2015 17:11:38 +0000 (UTC)
Received: by wgyo15 with SMTP id o15so190803974wgy.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 May 2015 10:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=pQxOeBrt3eYVrrxlGR5gGDlRQxOiNlbusLWqaZglhpU=;
	b=h+yGKfm9FRYHNzLoxypQIqBy1omcRHzVUD/PPDQ1BVNfgvZ+t4wmhun74MK3qia9H9
	Qw4bGnSv8HKx7TLGZhiKxshqxYwK2kD1+pJIhGS0KojzhHUseCHdp99ZHTbwkJDa2xUm
	daIJ5a3ArMXKrBtkwtRIf28kTfbyo2RRPi1jOssBzrl+EyD4z2Zu0rA8MZJ6PaurLEst
	Lo3ZluGA2XARQPp78V10iv8SYSEJD3aRlU4G/MEE46kab3xr1+tPeM/TrMzNr50TmQUB
	SJ7ByboRJKlInAYzJHzvZHAM++93tgzpkvMk1FelKnfkRvNPObrU6YDi7rfBbwV5EzNS
	7M5Q==
X-Received: by 10.194.178.227 with SMTP id db3mr46258025wjc.82.1430845900020; 
	Tue, 05 May 2015 10:11:40 -0700 (PDT)
MIME-Version: 1.0
Sender: vomegaz@gmail.com
Received: by 10.28.9.73 with HTTP; Tue, 5 May 2015 10:10:59 -0700 (PDT)
In-Reply-To: <CAJTo0LZkVGZTVBueVpwFaTvmiK_3vsXRB45abKSs0--fbVWzZw@mail.gmail.com>
References: <1429720746-20096-1-git-send-email-thomas.perrot@tupi.fr>
	<CAJTo0LZkVGZTVBueVpwFaTvmiK_3vsXRB45abKSs0--fbVWzZw@mail.gmail.com>
From: Thomas PERROT <thomas.perrot@tupi.fr>
Date: Tue, 5 May 2015 19:10:59 +0200
X-Google-Sender-Auth: Qw-fFw-oqiW7Pt7_odqLHPcuzJs
Message-ID: <CAGXeWg=6c28bYgZsOVe0E18AwD6Q1AECZopu9T4EEQuVRbU0ng@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: tprrt <tprrt@tupi.fr>, OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd-systemctl-native: fix checksum error
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: thomas.perrot@tupi.fr
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 May 2015 17:11:39 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

Yes, I used combo-layer to create combined repository.
-----------------------------------------------------------------------------------------
http://fr.linkedin.com/pub/thomas-perrot/37/436/876
https://plus.google.com/u/0/111501193434241021399
https://github.com/tprrt


On Fri, May 1, 2015 at 10:41 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 22 April 2015 at 17:39, Thomas Perrot <thomas.perrot@tupi.fr> wrote:
>>
>> ERROR: systemd-systemctl-native: md5 data is not matching for
>> file:///home/tprrt/dev/oe-build-easy/combination/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690
>> ERROR: systemd-systemctl-native: The new md5 checksum is
>> 751419260aa954499f7abaabaa882bbe
>
>
> The LICENSE in oe-core definitely has the md5sum 4d92[...].  Are you using a
> tool to create a combined repository that is overriding the LICENSE file?
>
> Ross


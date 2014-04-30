Return-Path: <paul.betafive@gmail.com>
Received: from mail-ve0-f171.google.com (mail-ve0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id 68E1E65D14
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Apr 2014 17:58:35 +0000 (UTC)
Received: by mail-ve0-f171.google.com with SMTP id jy13so2644596veb.30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Apr 2014 10:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=HocB91aF/VmUow9hG4phYvFOywGf+c/IXSI9pHma8cc=;
	b=gfHD/Z7taprrhsTbjlZuIGRsM2z5KM/J6WxZK+VE6KIk45SYx1g72R/BwBm5PL2pRP
	5thXAKckMT47e7dHnhmzTsJ9tOCP6aPaInBYKgHFSmgl8+iuOLtwOBB/g8XUMx3XhfRz
	u7lor0ciYVyDr4Gv706gKIF3Vr93LAys2Az0pmWAEGdm8/gAqcf7L9piAGEf1i4fiNEJ
	4I0tPcudlKe/mnpNTb4KECVNvjYjiEcvZ0+cvMiiAVirArh+akazK8yKPDJkngCplCD/
	mQbsMNuMqMlZZpiQnx5ROh3aAUdHqk916cb2fIslVG9MIjV/i1jPXJNf4qddrQ0/Y9hk
	ohlQ==
X-Received: by 10.52.51.197 with SMTP id m5mr3954630vdo.9.1398880716535; Wed,
	30 Apr 2014 10:58:36 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.221.5.133 with HTTP; Wed, 30 Apr 2014 10:57:56 -0700 (PDT)
In-Reply-To: <1398873268.16672.529.camel@ted>
References: <535F3FFD.1080403@hostmobility.com>
	<535F4513.20407@hostmobility.com> <1398873268.16672.529.camel@ted>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Wed, 30 Apr 2014 18:57:56 +0100
X-Google-Sender-Auth: afq_xLLYHZlIMEvZf0q6MpfJv10
Message-ID: <CANyK_8c_-UdtF6ZqHLvQcs_JJ9PGjP+wP0dJGH_3imkn4n4h4w@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: quilt-native fails on tar version 1.27.1
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
X-List-Received-Date: Wed, 30 Apr 2014 17:58:36 -0000
Content-Type: text/plain; charset=UTF-8

On 30 April 2014 16:54, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2014-04-29 at 08:22 +0200, Mirza Krak wrote:
>> Hi.
>>
>> I recently updated my Ubuntu PC to 14.04 LTS which broke yocto builds.
>>
>>   From what I can see is that there seems to be an issue with the tar
>> command and quilt-native recipe. But I am to newb to fix this. Do you
>> guys have any ideas?
>
> You're using an old release on a modern system which wasn't around when
> the release was made.
>

Just wanted to add to the comments on this as I got into a discussion
on the mailing list about this recently. The recommendations I got
were to keep the old branch on the old version of the distro that you
were using. With linux containers being supported in Ubuntu 14.04,
it's pretty easy to create a container with Ubuntu 12.04 installed and
use that for building old branches of OpenEmbedded. If you can't find
a good guide online on how to set this up, let me know and I'll write
up a blog post of how I did it.

For example, in my situation I have a system image built against the
dylan branch which I need to continue supporting and I can't
realistically upgrade to a newer branch. I now have a Ubuntu 12.04
container running that build, while new builds against the daisy or
master branches are being done in a Ubuntu 14.04 container.

Hope this helps,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk


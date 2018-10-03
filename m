Return-Path: <douglas.royds@taitradio.com>
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id 1213D74A13
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Oct 2018 20:55:30 +0000 (UTC)
Received: from [172.16.169.141] (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id B77A01C001F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Oct 2018 09:55:30 +1300 (NZDT)
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <2f47bda4-deb2-9603-a151-8330f0d52e08@taitradio.com>
	<c5a520ffbff2e4b1f12355b7605b5f5988228101.camel@linuxfoundation.org>
	<4f206827-9c6e-608a-409f-a66edcfcec2d@taitradio.com>
	<8738d389-5361-272b-f329-63c6538bb9ed@taitradio.com>
	<5a57b59fc05db0260d1257692161ebcd5443aa2f.camel@linuxfoundation.org>
From: Douglas Royds <douglas.royds@taitradio.com>
Message-ID: <58f5bb4f-0c95-d73e-3747-1159a75e3f84@taitradio.com>
Date: Thu, 4 Oct 2018 09:55:28 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <5a57b59fc05db0260d1257692161ebcd5443aa2f.camel@linuxfoundation.org>
Subject: Re: glibc binary reproducibility
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
X-List-Received-Date: Wed, 03 Oct 2018 20:55:31 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB

I had found and updated my patch for the ld.so and libpthread.so cases 
as well, but you beat me to it ... Much better solution, thanks.


On 04/10/18 00:25, Richard Purdie wrote:

> I don't think your patch will fix all the cases sadly. I did find
> another technique that works:
>
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t222&id=21bc0c2fe6e9d2ae1d08d3de5f2a6d75d4ba108b
>
> basically by injecting a STT_FILE entry into the underlying assembler
> files, the linker then doesn't need to add its own.
>
> The patch above fixes aarch64 but will need additions for the other
> arches which break...
>
> Khem: Any thoughts on this?
>
> Cheers,
>
> Richard




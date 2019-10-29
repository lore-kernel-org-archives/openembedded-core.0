Return-Path: <gchoc-openembedded-core@m.gmane.org>
Received: from blaine.gmane.org (195-159-176-226.customer.powertech.no
	[195.159.176.226])
	by mail.openembedded.org (Postfix) with ESMTP id 6E1346C0EB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 17:38:03 +0000 (UTC)
Received: from list by blaine.gmane.org with local (Exim 4.89)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1iPVRS-000AGd-GE for openembedded-core@lists.openembedded.org;
	Tue, 29 Oct 2019 18:38:02 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Ferry Toth <fntoth@gmail.com>
Date: Tue, 29 Oct 2019 18:37:55 +0100
Message-ID: <c66d5833-ffb1-327d-6297-ca41c5dcfd59@gmail.com>
References: <CAA=hcWTH9VCNgbDbU+ai3sydbWWKNR9HfnuGKu3oQ7XsHN6JBQ@mail.gmail.com>
	<de0e9a45-522a-be55-120a-b3cbd398ec6c@gmail.com>
	<CAA=hcWSTFCUBniK19V-2d0o87PjLN1dkpsWCXhjMXfBQiFvtEw@mail.gmail.com>
	<47af37ed-25aa-65aa-cea7-febfada814f7@gmail.com>
	<CAA=hcWQ8xjT03MC9MQPXgFVB04ZdbE5=Nd8LOE=6w308r44kGg@mail.gmail.com>
	<e91e63ef-9da5-3110-17d2-6f78bf09c904@gmail.com>
	<CAA=hcWTF5GVrEQ6WtjgLoHovrtyNKUUt_aHYpiaQ9pzHtqt7nQ@mail.gmail.com>
	<8733775b-ae58-30a3-2b11-daf8abed85b4@gmail.com>
	<CAA=hcWTucG_LwdAPBX4AA3wAv44Y-h3zqEMn9af8pWEQQFG8tg@mail.gmail.com>
Mime-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.2
In-Reply-To: <CAA=hcWTucG_LwdAPBX4AA3wAv44Y-h3zqEMn9af8pWEQQFG8tg@mail.gmail.com>
Cc: public-openembedded-core-ZwoEplunGu3dfDuKDZ/zN51Ccm5ICvs9@plane.gmane.org,
	public-public-openembedded-core-ZwoEplunGu3dfDuKDZ/zN51Ccm5ICvs9-wOFGN7rlS/M9smdsby/KFg@plane.gmane.org
Subject: Re: zimage Initramfs booting stuck at Start Kernel
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
X-List-Received-Date: Tue, 29 Oct 2019 17:38:03 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Op 29-10-2019 om 11:25 schreef JH:
> Hi Ferry,
> 
> On 10/29/19, Ferry Toth <fntoth@gmail.com> wrote:
>>
>> https://github.com/edison-fw/meta-intel-edison/blob/master/meta-intel-edison-bsp/conf/machine/edison.conf
>>
>> And there is the max size!
> 
> Are you able to run u-boot to start kernel in the large size 64 MB?

No, the largest I had was 18MB compressed and it didn't boot. After I 
brought it back to 10MB or so it boots again. Like I said, I don't know 
where the limit comes from.

I think you should be able to make the initramfs minimal and put the 
rest in a separate file system same as I do and your problem will be 
solved. But it looks like if you want to trace the root cause and solve 
it, you are on your own.

> Thank you.
> 
> Kind regards,
> 
> - jh
> 




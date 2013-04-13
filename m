Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UR40o-0005r0-GN
	for openembedded-core@lists.openembedded.org;
	Sat, 13 Apr 2013 19:13:20 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 13 Apr 2013 09:55:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,468,1363158000"; d="scan'208";a="294495038"
Received: from unknown (HELO [10.255.14.73]) ([10.255.14.73])
	by orsmga001.jf.intel.com with ESMTP; 13 Apr 2013 09:55:46 -0700
Message-ID: <51698E12.9070103@linux.intel.com>
Date: Sat, 13 Apr 2013 09:55:46 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
References: <1365838096-11843-1-git-send-email-sgw@linux.intel.com>
	<1365848798.16702.75.camel@ted>
	<13e0390dbb6.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
In-Reply-To: <13e0390dbb6.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] udev-extraconf: Add -o silent to auto mount for mount.util-linux
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 13 Apr 2013 17:13:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/13/2013 06:23 AM, Bernhard Reutner-Fischer wrote:
> On 13 April 2013 12:26:38 Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Sat, 2013-04-13 at 00:28 -0700, Saul Wold wrote:
>> > This will silence some of the noisy output from mount.util-linux and
>> the kernel
>> > when trying to automount filesystems or devices. Busybox does not
>> accept the silent
>> > option, it uses a "loud" option instead.
>> > [YOCTO #3935]
>> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> > ---
>> >  meta/recipes-core/udev/udev-extraconf/mount.sh | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> As far as I can see this will break with busybox mount. Is there a 2/2
>> missing?
>
> IIRC Busybox defaults to be silent (right?), I will thus add (and
> ignore) silent. I will have a look in the evening.
>

Dangit, I sent the wrong patch, I have the correct one, will resend.

Sau!

> Thanks for the heads up!
> Cheers,
>>
>> > diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh
>> b/meta/recipes-core/udev/udev-extraconf/mount.sh
>> > index 99c76b2..7b58361 100644
>> > --- a/meta/recipes-core/udev/udev-extraconf/mount.sh
>> > +++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
>> > @@ -22,7 +22,7 @@ automount() {
>> >      ! test -d "/media/$name" && mkdir -p "/media/$name"
>> >
>> > -    if ! $MOUNT -t auto $DEVNAME "/media/$name"
>> > +    if ! $MOUNT -o silent -t auto $DEVNAME "/media/$name"
>> >      then
>> >          #logger "mount.sh/automount" "$MOUNT -t auto $DEVNAME
>> \"/media/$name\" failed!"
>> >          rm_dir "/media/$name"
>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
> Sent with AquaMail for Android
> http://www.aqua-mail.com
>
>
>
>



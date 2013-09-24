Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id B82526CA10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2013 14:30:47 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id eo20so3733514lab.34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2013 07:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=7QQYfUi3gJ1cO9tPGEQrdw6SjSkDm7HC/1FUbrkaJsY=;
	b=EQvcWTFm/xHkMZ1RsY7LFUQ6kkZgl0Qo6UGDeU5rsFPANL4W7UdqJiFIL8jnDO17pM
	c8xfXbzlXN5GHzzzUC5hWD9cAh8lwtc34sjXQDJtQs+k8B6TowBaXEyMjQY1kIyXTTwu
	Q8UWjaC+fPe8bmUjp3GYYN6X/q7KqfhqAgXw3pQGQ5Qy0NJ/jlMwzjjCY9DeO7zOtVtc
	tFfm4cwhZdYIk7qd316mL4TOO3OigYs+PINZEpG4dCMKnVtckoBtH789J4EKBhWdugMk
	HJ86s7UuHrHoV9lCB5K1nAChaaMzunTif3OYfoiyBRX5rJZ0xmBRGP/xG6UsfxKuXk0F
	OtrQ==
X-Received: by 10.152.23.5 with SMTP id i5mr13750748laf.8.1380033048198;
	Tue, 24 Sep 2013 07:30:48 -0700 (PDT)
Received: from [172.16.141.168] (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id
	ac2sm15544409lbc.10.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 24 Sep 2013 07:30:47 -0700 (PDT)
Message-ID: <5241A215.4020501@gmail.com>
Date: Tue, 24 Sep 2013 16:30:45 +0200
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.c.nystrom@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1379954041-5575-1-git-send-email-david.nystrom@enea.com>	
	<1379954041-5575-2-git-send-email-david.nystrom@enea.com>	
	<5240820E.5020407@windriver.com>	
	<CAAKB1h2tRBDowRYZ9vOXduTCy0Fg4aoD+fJmVkN7vZ=XqzWpEg@mail.gmail.com>	
	<1379970871.18603.265.camel@ted> <1380011114.18603.270.camel@ted>
In-Reply-To: <1380011114.18603.270.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] shadow: Create recipe nativesdk-shadow
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
X-List-Received-Date: Tue, 24 Sep 2013 14:30:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/24/2013 10:25 AM, Richard Purdie wrote:
> On Mon, 2013-09-23 at 22:14 +0100, Richard Purdie wrote:
>> On Mon, 2013-09-23 at 21:01 +0200, David Nystrom wrote:
>>>
>>> On Sep 23, 2013 8:01 PM, "Mark Hatle" <mark.hatle@windriver.com>
>>> wrote:
>>>>
>>>> This looks to be the same as the 'native' package, but I don't think
>>> you can just add a BBCLASSEXTEND = "nativesdk"
>>>
>>> It mostly is and I cant, your right.
>>
>> Why not? Just the SRC_URI or other issues?
>>
>>>> Perhaps (in 1.6) someone should look at merging the three back
>>> together.
>>>
>>> Agree, the merged recipe will also get a bit messy, but probably
>>> easier to maintain than in its current state.
>>>
>>>> If this is the same as the native version, I'd suggest adding a
>>> comment stating as much so we can hopefully keep them in sync.
>>>
>>> Will do, will return with v2
>>>
>> Well, I'm not happy with the idea of duplicating all this code.
>> shadow-native shouldn't exist and this makes things worse. With a few
>> minutes, I could write this patch:
>>
>> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t2&id=0730423fcda165a12112182b093d2f6df2f9c5eb
>>
>> which at least makes the situation a bit less ugly. I guess I did spend
>> years doing these kinds of patches back when we had 50 versions of
>> everything and BBCLASSEXTEND didn't yet exist. With a few more minutes
>> perhaps I can get rid of the separate -native, now the differences are
>> clear. meld is a nice too for this kind of work btw.
>
> Better still, a conversion to BBCLASSEXTEND:
>
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t2&id=142d11b9b61bf18567cdb0527b7e63683c5afa1a

Thanks for that,  I'll take above as a learning experience.


I'm have a question about this though.

diff --git a/meta/recipes-extended/shadow/shadow.inc 
b/meta/recipes-extended/shadow/shadow.inc
index 4df5e5e..75b0afc 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
<snip>
+pkg_postinst_${PN} () {
+	if [ "x$D" != "x" ]; then
+	  rootarg="--root=$D"
+	else
+	  rootarg=""
+	fi
+
+	pwconv $rootarg
+	grpconv $rootarg
+}
<snip>

This will introduce the postinstall hook for both ${BPN}-native and 
${BPN} ?. Before the change, the postinstall hook was activated only by 
${BPN} afaict. Tried removing it from native* through 
pkg_postinst_${BPN}, but that does not seem to work.

Hmm, slightly off-topic, but when looking at the postinstalls:

shadow:
cat /tmp/opkg-extract-574/CONTROL/postinst
	if [ "x$D" != "x" ]; then
	  rootarg="--root=$D"
	else
	  rootarg=""
	fi

	pwconv $rootarg
	grpconv $rootarg
	update-alternatives --install /usr/bin/passwd passwd 
/usr/bin/passwd.shadow 200
	update-alternatives --install /usr/bin/chfn chfn /usr/bin/chfn.shadow 200
	update-alternatives --install /usr/bin/newgrp newgrp 
/usr/bin/newgrp.shadow 200

Above is not a problem since OPKG_OFFLINE_ROOT in update-alternatives 
can be used to redirect symlink creation when creating a from a package 
repo.

nativesdk-shadow:
if [ "x$D" != "x" ]; then
	  rootarg="--root=$D"
	else
	  rootarg=""
	fi

	pwconv $rootarg
	grpconv $rootarg
	update-alternatives --install 
/opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/bin/passwd 
passwd 
/opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/bin/passwd.shadow 
200
	update-alternatives --install 
/opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/bin/chfn chfn 
/opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/bin/chfn.shadow 200
	update-alternatives --install 
/opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/bin/newgrp 
newgrp 
/opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/bin/newgrp.shadow 
200
	update-alternatives --install 
/opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/bin/chsh chsh 
/opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/bin/chsh.shadow 200

Could we not add a "--root" option to update-alternatives like done to 
update-rc.d instead of hardcoding paths or using envs.

Also, seems like ${sysconfdir} in the nativesdk-opkg postinstall expands to:

chmod 0755 $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts
chmod 0755 
$D/opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/etc/rcS.d/S98run-postinsts

Is this really expected behaviour ?

Br,
David






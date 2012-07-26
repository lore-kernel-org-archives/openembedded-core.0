Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SuU0a-0002Ut-8D
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 21:46:04 +0200
Received: by lbol5 with SMTP id l5so1526603lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 12:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=HZzDuPM0mBGx5ixZxgui12ZdKx4EJ9XUfReqxrAlzss=;
	b=y6w6krYh83QSej7ld/SU27n++oQYIiCxkJmrmc/bZGnmKHi7520WI93O50o0JWa8jQ
	MN5bPH77zvqe7fbMV6U8GONHehTUMXsVGv87Sr3sXikRUnvP+UX3Nqs2SGVXyGPLqdkw
	6xZL5789KPBB9gYJTNuCX+KftRkDDDL6oDMvny9drgCSJiDs5VrtDv+WQyF1FVnjs3Zi
	wSyaTWxS3jYqHxNR8aGFWSAKuekpMB8L2P59VpLwY0B5EFMXsajpJycCTTp8K0GjDmdq
	D79y4ZErE7becTkbA2H4FIQevz/o+7xw5qVkJxIxZHqangF/D8RGMSANZVe99+z7EunU
	MaDQ==
Received: by 10.112.102.136 with SMTP id fo8mr194852lbb.106.1343331273031;
	Thu, 26 Jul 2012 12:34:33 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.64.180 with HTTP; Thu, 26 Jul 2012 12:34:12 -0700 (PDT)
In-Reply-To: <50119A1B.5050403@linux.intel.com>
References: <alpine.DEB.2.02.1207230557520.20099@oneiric>
	<50119A1B.5050403@linux.intel.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 26 Jul 2012 12:34:12 -0700
X-Google-Sender-Auth: Rrp99ChHNxSARf-YaBOoFy65n5c
Message-ID: <CABcZAN=ovSNo96CmpA7jygJPTxD6Vp_QE80buXQxc4x4+NnnMg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: libxp: Change superfluous "+=" to simple "=" when using _append
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jul 2012 19:46:04 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 26, 2012 at 12:27 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 07/23/2012 02:59 AM, Robert P. J. Day wrote:
>>
>>
>> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>>
>> ---
>>
>> diff --git a/meta/recipes-graphics/xorg-lib/libxp_1.0.1.bb
>> b/meta/recipes-graphics/xorg-lib/libxp_1.0.1.bb
>> index 349dad1..dbd4609 100644
>> --- a/meta/recipes-graphics/xorg-lib/libxp_1.0.1.bb
>> +++ b/meta/recipes-graphics/xorg-lib/libxp_1.0.1.bb
>> @@ -15,7 +15,7 @@ PE = "1"
>>
>>   XORG_PN = "libXp"
>>
>> -CFLAGS_append += " -I ${S}/include/X11/XprintUtil -I
>> ${S}/include/X11/extensions"
>> +CFLAGS_append = " -I ${S}/include/X11/XprintUtil -I
>> ${S}/include/X11/extensions"
>>
>>   SRC_URI += "file://fix-cast-error.patch"
>>
>>
> Merged into OE-Core

A second janitorial-type task would be to find and remove unnecessary
uses of _append entirely. This one for example, it's highly unlikely a
+= wouldn't do the job here. :)
-- 
Christopher Larson



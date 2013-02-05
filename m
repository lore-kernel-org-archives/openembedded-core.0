Received: from mail-ie0-f180.google.com ([209.85.223.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1U2lvd-00066o-P4
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 18:03:36 +0100
Received: by mail-ie0-f180.google.com with SMTP id bn7so502164ieb.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2013 08:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=fKgq5jr8Lv5NcYUcVp/c1SO+LmbfA9Hej45sM86xu+I=;
	b=AW/Q8lzOaL5bYSrOkCIplptIX3C/Ifn8Z/cGu0alycaGesgQA25VItA1MQQ3y9wXjM
	nUc+lfjcEEb9cjgAU0FmjgKgbIfxWcwL1GiluWqeZIfMIA23lBU3jctB5D/fDhlQdgXN
	TI8/dYYF5fy8KgRHoHVVJuf6s/PbwxktiiVK9rUI79XanrMJHvBdwXDvTv+c6rhpqwVY
	wRIR0FG4ygYeM0jQH7lff72yBDRXE7FZ0B7xZGJfd8ATjtLDic9sFWJrgFev5mEPhaiV
	1BtD+3SQYSXmpg4hHthx9AmmblFlKx8yKlAZ6+hgAo5EDv1GCLNcfsgtwkuPSt9AtAW5
	xyLw==
MIME-Version: 1.0
X-Received: by 10.50.180.226 with SMTP id dr2mr14406205igc.7.1360082859327;
	Tue, 05 Feb 2013 08:47:39 -0800 (PST)
Received: by 10.64.143.228 with HTTP; Tue, 5 Feb 2013 08:47:39 -0800 (PST)
In-Reply-To: <CAJTo0LYDkCvZUCp4U4o_2bsmuiVor69Wbh4Rd94g3WvQ4=X5Yw@mail.gmail.com>
References: <cover.1360079373.git.rep.dot.nop@gmail.com>
	<3666e39a359b03ba1e054813f4353ddeed11d506.1360079373.git.rep.dot.nop@gmail.com>
	<CAJTo0LYDkCvZUCp4U4o_2bsmuiVor69Wbh4Rd94g3WvQ4=X5Yw@mail.gmail.com>
Date: Tue, 5 Feb 2013 17:47:39 +0100
Message-ID: <CAC1BbcQss0BHe_CGx+H_QKbASNS-_4Bad8rHeCNdJERg-G8Y4w@mail.gmail.com>
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/8] Revert "Add ptest for glib."
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
X-List-Received-Date: Tue, 05 Feb 2013 17:03:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 5 February 2013 17:44, Burton, Ross <ross.burton@intel.com> wrote:
> On 5 February 2013 15:55, Bernhard Reutner-Fischer
> <rep.dot.nop@gmail.com> wrote:
>> This reverts commit dec6f912d68f52748f645b6af411f189cf464f85.
>>
>> This breaks core-image-sato-sdk for TCLIBC="uclibc".
>
> Ouch.  How about we fix it instead of reverting this?

I do not have time to look into this, sorry. But yes, of course fixing
it for real would be better..

thanks,



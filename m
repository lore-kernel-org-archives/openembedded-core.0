Return-Path: <schnitzeltony@gmail.com>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6A61D79725
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 10:04:50 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id 36-v6so12433651oth.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 03:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=aYPSB6WqJFBACEGMpk+VHXGwATZC5sHOPpYBcHymEGw=;
	b=YGyOnYK7kqyfrQWzYUKulDbQwihoyS9ky2f//DR0ZESmpP43Z4PVhxCZ00u1N1rv3R
	8uU9xXGkco6h6M2dq2LuG0T8UXgyJTlOtQoJhG0TAcqs67/jBuyGJuuu8td1w0KRW20s
	Veg1LYwQJvO0klF/mctlSnCiXkk5sXZFDpzB//5Odq12czGDITok5eDkvINAsMc6cGdW
	IsdIxWO/Jqd6k4XmLprKmmAWVXN0iadyxAk7kLf0hsNrf0Sp+d5W0y4TwB1jmImI6Y6S
	DyXqiHFarzUZ7ESedUN1LjdmwRyNF4ZSmx6LP1e/MXaSFLEIEbE2mBR+gTVn5pUUQXOE
	N0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=aYPSB6WqJFBACEGMpk+VHXGwATZC5sHOPpYBcHymEGw=;
	b=tUsTf3PJdmymbpO0nkyHGl8zBLnaLLEIc5HVAeYy7ilf+CtNurq5LCmt79FEGzyfPa
	0KQdPsTx5cKBjULEjJrSceMWCTvi+TCiVV3vXYySg9wzTthewWSlfiYwE8vypbR9vXTE
	REjufS3PFBMF2p0rhas+oYlomL3oQLZBw/da+xKGcnegMXeWQNH0LeNIdcXPFSN/z6vI
	vRw4l00rontq3I8cJfQscnEwFwDxJDhfZV7skkTAsb+CEYzPagz8gp8qnX5iKO3PDMhl
	TXxvZp9KL+ktSEKctkjm8+ukHV4Dl7iV/JbVMdG07D/oOC0NAx4l8hVrzbqc6ps3hfaK
	mGkg==
X-Gm-Message-State: APzg51Dp33S4tbWWZWBwU+CRv2mngpoUwVGxqh90thQDOtBleB7STKQ9
	Kr7zuI0SOr9n7Ih3nMPcysR4dU6IzJrvQ9HN9DQ=
X-Google-Smtp-Source: ANB0VdZDFWM/k8O/eyIHcVD9rUnkketemx9PY5OONv2Eq3EfnYa5o9w92fMQuQGUgXMVzH1hYoBxXW+rX/JVXuBZL+0=
X-Received: by 2002:a9d:522d:: with SMTP id
	e45-v6mr23277302oth.250.1537524291244; 
	Fri, 21 Sep 2018 03:04:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:490c:0:0:0:0:0 with HTTP; Fri, 21 Sep 2018 03:04:50
	-0700 (PDT)
In-Reply-To: <CALbNGRQT94ptEPAygj+Rm9vBm27yo=inbz+O6nR2gL_etkGd7g@mail.gmail.com>
References: <CALbNGRTAbsa9CzzXqtq7mpiknFzUB_=9eHcFHnD5W--HEM8bPw@mail.gmail.com>
	<20180402215705.GA25121@linux-uys3>
	<CALbNGRThT8S5bfJH=zXMkQzCMMasQ=yUoEXTjsfPXtncig3yFA@mail.gmail.com>
	<ada194d6-5653-fde7-a70a-64646b08b281@intel.com>
	<CALbNGRTthOp+_T-6c_Vc3qmgMHTt-2ztyDiGbNEHY4+6UuW2ig@mail.gmail.com>
	<CALbNGRQT94ptEPAygj+Rm9vBm27yo=inbz+O6nR2gL_etkGd7g@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 21 Sep 2018 12:04:50 +0200
Message-ID: <CALbNGRQxauR4PkJ+FMXKmnJapcWO9pVSvW1cLVyrDU9-T+o65A@mail.gmail.com>
To: Cal Sullivan <california.l.sullivan@intel.com>
Cc: bruce.ashfield@windriver.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: kernel menuconfig broken?
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
X-List-Received-Date: Fri, 21 Sep 2018 10:04:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 13, 2018 at 12:12 AM, Andreas M=C3=BCller
<schnitzeltony@gmail.com> wrote:
> On Thu, Apr 12, 2018 at 11:46 PM, Andreas M=C3=BCller
> <schnitzeltony@gmail.com> wrote:
>> On Thu, Apr 12, 2018 at 11:38 PM, Cal Sullivan
>> <california.l.sullivan@intel.com> wrote:
>>> If you're using a non-linux-yocto kernel you likely need to apply this =
patch
>>> to your kernel as well:
>>>
>>> https://git.yoctoproject.org/cgit/cgit.cgi/meta-intel/tree/recipes-kern=
el/linux/linux-intel/0001-menuconfig-check-lxdiaglog.sh-Allow-specification=
-of.patch
>> Correct: RaspberryPi kernel
>>>
>>> (This is in all linux-yocto kernels, I'm only linking to meta-intel bec=
ause
>>> I knew where it was off the top of my head)
>>>
>>> This was sent upstream but last I looked it didn't gain any traction. I
>>> think Bruce resent it recently but I can't be sure.
>>>
>>> Thanks,
>>> Cal
>>>
>> That looks very promising - will try and let you know - thanks in advanc=
e :)
>>
> Perfect! - Thanks Cal for quick help!
>
Hi,

seems upstream has introduced changes 4.17 -> 4.18 - the patch does
not apply anymore. Is this patch available for 4.18 somewhere?

Regards

Andreas


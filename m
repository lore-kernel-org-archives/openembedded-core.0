Received: from mail-vb0-f48.google.com ([209.85.212.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UZljr-0004jQ-89
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 19:31:53 +0200
Received: by mail-vb0-f48.google.com with SMTP id q16so702182vbe.21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2013 10:13:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=EgW+VTdOuZdj4a2mh9yaYq9EsFU6xnaxoqI5SeHs6qA=;
	b=l3CQ9jeNF04gWH7dqX13+7m55jMcqngc0hnOC5RzBk9ziWnIOJTA3KZxGGjaXC4Xyv
	qnugHOH5dJToRbkG67MspugaP0E/mBFwxBBOWINKm8jSTyGM7XYtWOX4UqsOnWr6M5Nx
	tV0yBrhze9oMQOOtvIcplJ1oBSuiS8BawYuheQCqFxmqHMGyrH7kJDL9GLA3EPeZ+uob
	QP5voCR6OlLVD2DQHMJc+p29dJsJbFOtMD0DsV1egRBvpzoGZga0SqbGV35OGs5Xnfyl
	HIePO1Lw/atHD66zQg6bzBP35LkaN47xUIKvrZirkKWvxxc2fWCUIm6NdVyWmPdbYTze
	oGtg==
X-Received: by 10.58.207.97 with SMTP id lv1mr1897291vec.39.1367946821844;
	Tue, 07 May 2013 10:13:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Tue, 7 May 2013 10:13:20 -0700 (PDT)
In-Reply-To: <CAHUNapT--78aOf=eCava7w9VsHAD8fL3odbreW-6EATt6mujbA@mail.gmail.com>
References: <1367930701.27116.31.camel@ted>
	<CAHUNapT--78aOf=eCava7w9VsHAD8fL3odbreW-6EATt6mujbA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 7 May 2013 18:13:20 +0100
Message-ID: <CAJTo0LaUSyekgycP37-jZnHmgy1wOM-PfJ0yZQtMrSP_bUp8hg@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
X-Gm-Message-State: ALoCoQkA3hJo3h/ua9hAgznbTttV7IkeRAP9Pa87V4By2GtNj20R5B+EI7GBGEMXoDSpEGj/MwhV
Cc: yocto <yocto@yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] Status Update
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
X-List-Received-Date: Tue, 07 May 2013 17:32:04 -0000
Content-Type: text/plain; charset=UTF-8

On 7 May 2013 17:29, Trevor Woerner <twoerner@gmail.com> wrote:
>> 1.3.2
>> =====
>>
>> I've merged a lot of queued changes that Ross prepared for 1.3.2 and
>> this is now undergoing testing.
>
> I have a patch for Danny to allow qemu-native of qemu-1.2.0 to compile
> on openSuSE 12.3 (which, apparently, is also affected by the same (or
> a similar) DSO linking change that affects fedora). Are the queued
> changes available somewhere so I can check this hasn't already been
> applied?

The merged changes are in the "danny" branch of the oe-core and poky,
and there's a ross/danny-next branch in openembedded-core-contrib that
is my staging area for submissions to danny.

Ross



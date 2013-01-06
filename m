Received: from mail-vc0-f177.google.com ([209.85.220.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Trx45-0002B6-D5
	for openembedded-core@lists.openembedded.org;
	Sun, 06 Jan 2013 21:43:35 +0100
Received: by mail-vc0-f177.google.com with SMTP id m8so18603443vcd.36
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Jan 2013 12:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=18js2S44DwfcR10G3VdkZ3NDtMxJpGR65WGsZb+k1Ho=;
	b=ylychdQeazdyxoSUB4MoxQgzTRdVcLqyQHnx+HYDSVMMeAyUjIoDUZNzTYa1WZbVAP
	9JST0uPQi4IuYIauplNUp0wvMgeH/Jpk8FlKk/n1bMElHQw4yDUv1WddVjDtBh4/JTZW
	sHzXRKqoXQQaGQHnjBRNccXc28hLhm/HJX2ykbEuYUC2zCusBH23TEhGMqxejLSEd9s6
	lBc2jXFji3lXubNbMdVKC5LaXUzQSmtp9w9Sbz38C+/b/uTygOOUEMaidJfzoTdkJef6
	5T2sv2q3DGd7tuVt/CBBK39rbyARk9Pw4uVMSGcv/c9cj3Xa9qDZslPQyGkIzINz6cxl
	PFxg==
MIME-Version: 1.0
Received: by 10.220.230.133 with SMTP id jm5mr81586531vcb.4.1357504100626;
	Sun, 06 Jan 2013 12:28:20 -0800 (PST)
Received: by 10.58.80.2 with HTTP; Sun, 6 Jan 2013 12:28:20 -0800 (PST)
In-Reply-To: <50E8FDBB.5080500@linux.intel.com>
References: <cover.1357366840.git.sgw@linux.intel.com>
	<CAF6bG8ed60RO2bBTPFhKQiG+3xis6-H9icmLDWtwHCO9NAyadw@mail.gmail.com>
	<50E8FDBB.5080500@linux.intel.com>
Date: Sun, 6 Jan 2013 22:28:20 +0200
Message-ID: <CAF6bG8fBgAP_No6RkckjvEQ2XquwKagbyn-Rh01CY7Hi+8MfFw@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL (V2) 00/35] Updates, Multilib Patches and other fixes
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
X-List-Received-Date: Sun, 06 Jan 2013 20:43:36 -0000
Content-Type: text/plain; charset=UTF-8

On 6 January 2013 06:29, Saul Wold <sgw@linux.intel.com> wrote:
> On 01/04/2013 10:52 PM, Marko Lindqvist wrote:
>>
>> On 5 January 2013 08:22, Saul Wold <sgw@linux.intel.com> wrote:
>>>
>>>
>>> Saul Wold (3):
>>>    glib-2.0: Update to 2.35.3
>>
>>
>>   Is there some specific need for bleeding edge (unstable development
>> snapshot)?
>>
> I was updating glib-networking and it required glib 2.35.3, I had not
> checked (my bad that it was unstable).  Even after a number of years, I
> loose track sometimes of what's stable vs unstable (odd vs .99 vs ??)

 With gnome way of releasing stable versions of something depending on
something that is not yet really released (has not stable release) it
can be even quite frustrating. So you already have patch for
glib-networking we can apply once glib is updated to 2.36.

 Another challenge for http://packages.yoctoproject.org/ ?


 - ML



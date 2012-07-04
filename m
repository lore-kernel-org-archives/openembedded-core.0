Received: from mail-qa0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mario.goulart@gmail.com>) id 1SmQwQ-0005dV-0x
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 16:52:30 +0200
Received: by qabg1 with SMTP id g1so3575570qab.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jul 2012 07:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
	:user-agent:mime-version:content-type;
	bh=mlfflDrklQZPWLZzd9nF3+9Rj5BpwiHIjVhVl67RX90=;
	b=ZouJLIXpPeXP5SZPNrzQN9xr1nvm2UT0ozXcQ7Pr8RWfGQiIPWNybOAzfwhXxzuojb
	XBoqRPrNP1++g4wDJK4SIVTMbqnZ6zkJVAU91TtJ0/Ka9iMyP/tmAIBuxxFN+G+KRCFT
	mTj2ISiuV++yOJUhw6Y9Dws0JrAVx2lAsjQuXDMEvgS/04Z+BZXRSvIztOxXL6QWxaxR
	xsLMbo/cefTz3sJJus+Y633Vo53xu5mUZD4pYavxKp0BwsrC0zSicrhr0xFDJjClcBdD
	rgmLf72SGBBmFz/4Vz/xoJmyB9iMOOrfQy+IceWk05MqVTlyWFxrLzpKG79dY7b1z910
	QCtw==
Received: by 10.224.59.19 with SMTP id j19mr38636442qah.25.1341412886228;
	Wed, 04 Jul 2012 07:41:26 -0700 (PDT)
Received: from cl-t066-141cl.privatedns.com.gmail.com (wkit.com.br.
	[67.205.85.241])
	by mx.google.com with ESMTPS id f14sm20833736qak.20.2012.07.04.07.41.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 04 Jul 2012 07:41:24 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
References: <CAF1ZMEftbcYLjj-qFiXgGQysr_pnfMMonXJz25TO3+UXXj4ckQ@mail.gmail.com>
	<85obo3s3ht.fsf@cl-t066-141cl.privatedns.com>
	<4FECA927.20204@linux.intel.com>
Date: Wed, 04 Jul 2012 10:35:38 -0400
In-Reply-To: <4FECA927.20204@linux.intel.com> (Saul Wold's message of "Thu, 28
	Jun 2012 11:57:43 -0700")
Message-ID: <85sjd7mw5h.fsf@cl-t066-141cl.privatedns.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.1.91 (gnu/linux)
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: xcursor-transparent-theme-0.1.1: upstream source vanish
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
X-List-Received-Date: Wed, 04 Jul 2012 14:52:30 -0000
Content-Type: text/plain; charset=us-ascii

On Thu, 28 Jun 2012 11:57:43 -0700 Saul Wold <sgw@linux.intel.com> wrote:

> On 06/28/2012 11:19 AM, Mario Domenech Goulart wrote:
>
>> At the moment I cannot access the svn repository (linked from
>> https://matchbox-project.org/get_involved.html).
>>
>> The download links from https://matchbox-project.org/download.html are
>> broken.  https://matchbox-project.org/sources.1.html gives me an empty
>> page and http://handhelds.org/~mallum/downloadables/ (for older
>> releases) gives me a 404 code.
>
> This is being looked into, at the matchbox site side.
>
> Can you get the file from here:
>
> http://autobuilder.yoctoproject.org/pub/sources/xcursor-transparent-theme-0.1.1.tar.gz
>
> This is a mirror that should be accessed, do you set your PREMIRROR to
> something?  See the meta-yocto/conf/distro/poky.conf for an example
> for setting to the Yocto Project Mirror.

Thanks a lot, Saul.

Best wishes.
Mario



Received: from mail-vc0-f179.google.com ([209.85.220.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TrDH3-0000Z3-0C
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Jan 2013 20:49:49 +0100
Received: by mail-vc0-f179.google.com with SMTP id p1so17164821vcq.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Jan 2013 11:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=V3mHFsUDjdMCvuKIbYZIj9YZpy9J5/4oPi3EKhVNYRk=;
	b=yfbN+kn4XYTZRPlrUWTSkdpvk1aNlUw+2jIMqi5+ZUw2czVe40Z1NeySlhfiP4/Tcg
	hRdSKRN2aQT3fsDQpcy5UU2U+FLw5U+waY5/NLyAOZty7WdJQtYwUjVDIYqgNeO20W2d
	Zzj0X6xZTkAfQak4CQIT9pUdsx4Dxwo638HPaiAt+m7Islg9tTyTkcEZdSJMPqtWc3Im
	1vLURwITXnkz+mT2UCfTcZqpl6pUzU2aO6agjM7P5vMQ0vTAJref/itka19sisf7twww
	oUX1q0jM+jQ8i+L6L0+2/q1kuyy0zEOlgUezu7t95+MUckmcAhriH3Cc536JkBlFgu1c
	H+ig==
MIME-Version: 1.0
Received: by 10.220.230.133 with SMTP id jm5mr77761944vcb.4.1357328083265;
	Fri, 04 Jan 2013 11:34:43 -0800 (PST)
Received: by 10.58.80.2 with HTTP; Fri, 4 Jan 2013 11:34:43 -0800 (PST)
In-Reply-To: <50E727FF.2020502@linux.intel.com>
References: <1356662690-16034-1-git-send-email-cazfi74@gmail.com>
	<1356662690-16034-2-git-send-email-cazfi74@gmail.com>
	<50E601F9.7010705@linux.intel.com>
	<CAF6bG8f5d8GbkRtT2L8ZS4ZCJ0n6FUByyZAcJ=M5V-oH5HnxXQ@mail.gmail.com>
	<50E727FF.2020502@linux.intel.com>
Date: Fri, 4 Jan 2013 21:34:43 +0200
Message-ID: <CAF6bG8eXHaDfmof3aJy3PDxGYutmsRcAVZgxp-TFzuO_HPZpQQ@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] icu: update to upstream version 50.1.1
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
X-List-Received-Date: Fri, 04 Jan 2013 19:49:49 -0000
Content-Type: text/plain; charset=UTF-8

On 4 January 2013 21:05, Saul Wold <sgw@linux.intel.com> wrote:
> On 01/03/2013 06:17 PM, Marko Lindqvist wrote:
>>
>> On 4 January 2013 00:11, Saul Wold <sgw@linux.intel.com> wrote:
>>>
>>>>
>>> Just found a problem with this in my testing:
>>>
>>>> | configure:3983: error: No such directory
>>>>
>>>> /home/sgw/yocto/builds/world/tmp/sysroots/x86_64-linux/usr/share/icu/50.1.1
>>>> supplied as the argument to --with-cross-build. Use an absolute path.
>>>
>>> Seems that icu lays down a /usr/share/icu/50.1 directory, not a ${PV}, so
>>> this needs a little work.
>>
>>   Can you tell anything more about the situation where this came up? I
>> tried to reproduce, but icu-native build created, and icu build used
>> .../icu/50.1.1/... just right.
>>
> Hmm, when you build the new version of icu-native, what does it create for
> you in your tmp/sysroot/x86*-linux/usr/share?

 icu/50.1.1/


 - ML



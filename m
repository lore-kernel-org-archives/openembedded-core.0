Received: from mail-vb0-f44.google.com ([209.85.212.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Tsp06-0001vb-GH
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 07:18:58 +0100
Received: by mail-vb0-f44.google.com with SMTP id fc26so1223537vbb.17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2013 22:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=jI1yYbdJNK8ZKuTR8qXb3Qq0/xdV1aO4UOeim5SAe4k=;
	b=uNUX4d3lQ9XtHqgP+UnaD9AY3SJnvanIHEWny29Hng8BlBpXgoLtUFMTWiRmCpa92C
	BQGdTgm/uXim53T3NnWFGw11aNdtEWpI295/G4FAF5hGOYcLBSQLBtB1sP+eK9YZxxFh
	j6VYT0k8UIsN0PPn48avDfPchN2X3SEC+YemMyE50wQochv09VZN2O+3ZYqPHUFhiXav
	KvOH4sKHl7NCyakwF9Qg9i11c6EISvMeUnUWaSDlYe8G03J7KXSMRVqLFL0jfQiBH5Hv
	WKJd2RmXvFxi67zlEVRcAnsOkw7Nthbs6wrwgHoFvXptDgcfKEWjzIX1YRkT1BLSjBaI
	60nA==
MIME-Version: 1.0
Received: by 10.58.15.227 with SMTP id a3mr91401058ved.38.1357711426289; Tue,
	08 Jan 2013 22:03:46 -0800 (PST)
Received: by 10.58.80.2 with HTTP; Tue, 8 Jan 2013 22:03:45 -0800 (PST)
In-Reply-To: <50ECB568.8060604@linux.intel.com>
References: <1357504491-2878-1-git-send-email-cazfi74@gmail.com>
	<1357504491-2878-2-git-send-email-cazfi74@gmail.com>
	<50ECB568.8060604@linux.intel.com>
Date: Wed, 9 Jan 2013 08:03:45 +0200
Message-ID: <CAF6bG8eUaz67UGeYDcQRTiTYT4H=p=a0OX3Bbae4nTOgrK5N5Q@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] harfbuzz: add recipe, version 0.9.9
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
X-List-Received-Date: Wed, 09 Jan 2013 06:19:02 -0000
Content-Type: text/plain; charset=UTF-8

On 9 January 2013 02:10, Saul Wold <sgw@linux.intel.com> wrote:
> On 01/06/2013 12:34 PM, Marko Lindqvist wrote:
>>
>> OpenType text shaping engine HarfBuzz is dependency of pango >= 1.32
>>
>> Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
>
> We we also need libx11?  I am seeing a failure:
>>
>> | x86_64-linux-libtool: link: cannot find the library
>> `/intel/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libX11.la' or
>> unhandled argument
>> `/intel/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libX11.la'
>> | make[2]: *** [hb-view] Error 1
>
> Notice this was the native version that failed.

 There's another dynamically changing property depending on whether
cairo is present in configure time or not - I'll make new version of
HarfBuzz recipe to make builds consistent (to always have sensible
backends, and never the others). However, I don't see how enabling
cairo backend could produce the linking error above if everything
outside harfbuzz is ok.
 Attempt to link against libX11 most likely comes from cairo.pc or
cairo-ft.pc - maybe they get generated with dependencies that are not
guaranteed to exist?


 - ML



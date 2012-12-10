Received: from mail-ia0-f170.google.com ([209.85.210.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Ti1OA-000465-O0
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Dec 2012 12:19:31 +0100
Received: by mail-ia0-f170.google.com with SMTP id i1so3917749iaa.29
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Dec 2012 03:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=OTkHCianNS3Uj/j/chxnDyBAG0gKSeC5md/LsKU9TG8=;
	b=EjH+LD80vJaArmZbD/oOHkbhTfW9Jj+RmTAf05k9gUhEOLK5xK1H7wAD0exjN5LMwn
	CdU+1l7GLn7+D9Dh+e84IgOUOa5QF8dmwUxUGeyuXlZKnPDg+C5zw4jdS8jj/yIPV9zL
	KRVpRuC9m6pw1rV0lrJhZQWjTMxfSgZinfPVjPZefSwE7mrhCr1XMxqDKjKByz7AtEl7
	GBlWAX75r+zgVsXwQCWA2N3wq9EpMqCP1uMF96WVGFXXcFXEhkm5ZfsKmSDEB1Dcy8rd
	hOag0bzwYOH6ud5rsaD08ursKQKBF6Cag+rbR3dDJErnXlgR0dwu2x0nmJ4rGYpv/rKq
	gCZA==
MIME-Version: 1.0
Received: by 10.50.152.132 with SMTP id uy4mr6166824igb.3.1355137479620; Mon,
	10 Dec 2012 03:04:39 -0800 (PST)
Received: by 10.64.24.175 with HTTP; Mon, 10 Dec 2012 03:04:39 -0800 (PST)
In-Reply-To: <50C2CB51.7030308@linux.intel.com>
References: <1354920751-21102-1-git-send-email-cazfi74@gmail.com>
	<50C2CB51.7030308@linux.intel.com>
Date: Mon, 10 Dec 2012 13:04:39 +0200
Message-ID: <CAF6bG8eQqHroZ0g-VwST02BcxoqdA8tXuJA=kozBgwPh1QKo7w@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: libpng update to 1.5.13 V2
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
X-List-Received-Date: Mon, 10 Dec 2012 11:19:32 -0000
Content-Type: text/plain; charset=UTF-8

On 8 December 2012 07:08, Saul Wold <sgw@linux.intel.com> wrote:
> On 12/07/2012 02:52 PM, Marko Lindqvist wrote:
>>
>>
>> In openembedded-core itself, libmatchbox does not compile
>> against libpng15. Patch for that sent already.
>>
>> In meta-openembedded, libsdl-image is known not to compile
>> against libpng15. Patch for that too sent already.
>>
>> I have not been systematically testing build of all the
>> possible components. Above two problems are just the ones
>> I've encountered as part of my typical builds.
>>
> Did you at least try to build all the recipes that are in OE-Core that
> depend on libpng, not just typical builds?  A quick grep in OE-Core shows
> that the following depend on libpng:
>
> transfig-native
> cups
> gdk-pixbuf
> gthumb
> gtk+
> cairo
> directfb
> libmatchbox
> pixman
> gst-plugins-good
> qt4
>
> So I would strongly recommend building and doing somekind of basic
> validation of these to ensure there are not any more API issues.

 All built succesfully. As for validation, build already proves that
they are not trying to use removed data members directly (linking at
least would have failed).


 - ML



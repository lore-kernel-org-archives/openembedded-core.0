Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TrGCe-0006wC-G4
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Jan 2013 23:57:31 +0100
Received: by mail-vc0-f175.google.com with SMTP id fy7so16880710vcb.20
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Jan 2013 14:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=fZEnQcO5i7/3kOsgjrWVaoX9aVyOXdFSa46K5o6gXxM=;
	b=phf0Jf/nISgoGVcdBtSH7HO+m7dGBHYnl5+6CMhJ1K9deFdr2P4Y/46AM1dXTSFGKF
	9J0HAQyF7eKp3VYZ3gGBJZPhwo7XvJGA9IWjuKNu26Dd7Jv6I/pl5XZ3H/GAOZSNxzBx
	ExPNzMLsFwWdd6cGhz0F/hRZsHSilILANaD0B0cxbrB1OMX5db52H5a+Gb5Ib4wg0XGG
	oZqqgXgsAZBfDEF+2eT3sw5Dc2PD1iG9+xV71vQ02stUf9Hp6BtsQRpacA3H8oeiwzSa
	wxYzEXXnFpfYX+U5PUa1qUgVRznUw1Idr46yeBiLXum1bdKuxCUZY3zrcjChhIsjMnzS
	Hk7g==
MIME-Version: 1.0
Received: by 10.59.13.197 with SMTP id fa5mr79998287ved.47.1357339342531; Fri,
	04 Jan 2013 14:42:22 -0800 (PST)
Received: by 10.58.80.2 with HTTP; Fri, 4 Jan 2013 14:42:22 -0800 (PST)
In-Reply-To: <50E755FE.90604@linux.intel.com>
References: <1357245391-11055-1-git-send-email-cazfi74@gmail.com>
	<50E755FE.90604@linux.intel.com>
Date: Sat, 5 Jan 2013 00:42:22 +0200
Message-ID: <CAF6bG8cgn7h2DKehjVEU5HmNurCqNC2VFMCAVBOjZbbW=h4VdA@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Prepare recipes for automake-1.13 (batch 1)
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
X-List-Received-Date: Fri, 04 Jan 2013 22:57:32 -0000
X-List-Received-Date: Fri, 04 Jan 2013 22:57:32 -0000
Content-Type: text/plain; charset=UTF-8

On 5 January 2013 00:21, Saul Wold <sgw@linux.intel.com> wrote:
> On 01/03/2013 12:36 PM, Marko Lindqvist wrote:
>>
>> In practice there is three categories of changes in automake-1.13
>> that cause packages to break. From that follows that virtually all
>> problems fall to three categories, and all packages suffering from
>> problem of the same category get virtually identical fix.
>>
> So these need the automake-1.13 update first?  I have the 1.12 version but
> have not seen the 1.13 version yet.
>
> Just want to confirm that.

 No, the other way around. These are needed in place before we can
even consider automake-1.13. They are compatible with several versions
back.

 From the amount of problematic packages openembedded-core alone
(there's going to be several batches of fixes) I don't think we can
make the actual switch to automake-1.13 any time soon. World would
explode.


 - ML



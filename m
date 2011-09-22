Received: from mail-vw0-f41.google.com ([209.85.212.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R6d9X-0002tM-BA
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 08:52:59 +0200
Received: by vws16 with SMTP id 16so3467998vws.28
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 23:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=IrFU518fQvPg71o1hnJ6249BjDZX5UH7pmLKSpzY30k=;
	b=GloXiSyF8F7fJSrqErpLjwcuA9tSGKWE1IifWj6F21oz859Fmw/flBZ0jPBwraH5sF
	ZoCSW8mcCJF3mlKA6jit5kMXtoUZ19AZFKgo+uFOKvX7ceyGVI3RjvuYoKFFTNQAxAsW
	jywvyC2WwmZGyf1Vet9u604Y7WCNe2iU6jHFg=
MIME-Version: 1.0
Received: by 10.52.94.112 with SMTP id db16mr1412970vdb.497.1316674059673;
	Wed, 21 Sep 2011 23:47:39 -0700 (PDT)
Received: by 10.52.181.226 with HTTP; Wed, 21 Sep 2011 23:47:39 -0700 (PDT)
In-Reply-To: <1316671579.13622.32.camel@ted>
References: <1316630404-10336-1-git-send-email-dbaryshkov@gmail.com>
	<1316671579.13622.32.camel@ted>
Date: Thu, 22 Sep 2011 10:47:39 +0400
Message-ID: <CALT56yNoscL5JXoHxknRgk427F1Kry-y07ixDLGtOGT3vmOYSg@mail.gmail.com>
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/17] icecc-create-env: rename to -native
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
X-List-Received-Date: Thu, 22 Sep 2011 06:52:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 9/22/11, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2011-09-21 at 22:39 +0400, Dmitry Eremin-Solenikov wrote:
>> icecc-create-env(-native) is a native package. But if it doesn't have
>> the -native suffix, some dependency tracking stuff in oe-core (in
>> nativesdk.bbclass) get's crazy about it, trying to generate dependencies
>> to icecc-create-env-native packages. To fix that simply add -native
>> suffix to this package.
>>
>> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
>> ---
>
> Thanks for some great cleanups. I've merged most of this to master,
> except where there has been feedback/discussion.

Thanks! It seems icecc patch file got damaged somewhere in the loop.
I think I'll just drop the patch and the not-so-upstream tarball and
submit the script
to be included in the oe-core tree. Does that sound good?

-- 
With best wishes
Dmitry



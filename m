Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QUiGQ-0004tc-KE
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 18:39:22 +0200
Received: by vws2 with SMTP id 2so1498889vws.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jun 2011 09:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:content-type;
	bh=t5v7ekUcgFnNjonEUemXIkQJ6cGQxPWYeP2+GxEgUsU=;
	b=fncJzbQClTOS/tMu3KcR9i0tw+/WJ3/mT6dkdG/D9/NdVyQkzpq8KFtXflJb2CPJYH
	GkOzEquYE9+Ubh+fEPC8ejWkTqCL8+lEEEt40cy9GpU5VkSmK+nt4RjMk0ydpGhLup51
	q3dCLqUHyrx0BITIgkKctMievGJX58G6RhT6w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=UyW8ni8Wgc0Ao6y+FjvN966utrwwfojLc9UdxuTfdghzIGbwpeIu3qRooeuJBTwhIO
	XKzQsjKisQnBEOwbmtdcoQZnGX+9pXJyd6vWaSkRnId6giDubdpiSpT4R6KV8RlyYnG6
	cIoBI6ebBSyf3ug/7HeCE8FRhWR15MVvlat+U=
Received: by 10.52.75.193 with SMTP id e1mr1292243vdw.195.1307637362061; Thu,
	09 Jun 2011 09:36:02 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.52.101.134 with HTTP; Thu, 9 Jun 2011 09:35:42 -0700 (PDT)
In-Reply-To: <201106091654.57519.paul.eggleton@linux.intel.com>
References: <233337C7-346F-4E05-887C-776008F90E5F@dominion.thruhere.net>
	<201106091631.48506.paul.eggleton@linux.intel.com>
	<201106091654.57519.paul.eggleton@linux.intel.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 9 Jun 2011 09:35:42 -0700
X-Google-Sender-Auth: mpFN3cCMmDwUnZeI5Y9OfLoPMQk
Message-ID: <BANLkTimtkEzUMRZ2OOYss4-c1yB3P7X2Fw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: List of bbappends without matching recipes
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
X-List-Received-Date: Thu, 09 Jun 2011 16:39:22 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 9, 2011 at 8:54 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Thursday 09 June 2011 16:31:48 Paul Eggleton wrote:
>> I've recently submitted a patch to bitbake-devel which fixes
>> bitbake-layers' handling of skipped recipes so that it doesn't report them
>> as missing. I don't think skipped recipes can account for that entire list
>> however.
>
> OK so those patches don't apply anymore, have rebased them locally (+ added
> one fix) and will resubmit. FYI this is the list I have come up with, without
> skipped recipes:
>

Those patches look reasonable to me, thanks for taking the time to
look into it and fix it.

Acked-by: Chris Larson <chris_larson@mentor.com>
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics



Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1T4aTJ-0008Qx-3z
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Aug 2012 18:41:29 +0200
Received: by pbcwy7 with SMTP id wy7so1777145pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2012 09:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ngYrbzyGs8tXaXgT+FHaLqrO9zRIEQzIfwZCMItNPZg=;
	b=OiqUZPFvV6g5Jio6Y/H07KqGpJibQzcP7cN7G2XSf6ahhNgH6ZRGSMg4TkYEHT3JB1
	WejBslYBwI0ZhTKN4L9swDxLu7YSNDkCiqyw0bQs0M1LaPdwRBoIiUXYfzyvc5F1zBVI
	IsAkzy2cUHYN0wI59TYnII6wLvyaeFwpbg5JsyK4HcZpbRrCIVMph3EjOdlMlftqnz7y
	VHzrqJfowLbdYrm2fDm7U8e5wvESsPb9TcjC6MVN6+Dzp9Am/HIVXgoa/nNrfimwORJT
	bK5Lv55rEBG4ghAco7pDbWPhbFuizQ3yZf28oyjxirgaKJgRih6R9SAB7VZ77S2VR2D9
	2NzA==
MIME-Version: 1.0
Received: by 10.68.132.228 with SMTP id ox4mr6040744pbb.13.1345739361813; Thu,
	23 Aug 2012 09:29:21 -0700 (PDT)
Received: by 10.68.129.6 with HTTP; Thu, 23 Aug 2012 09:29:21 -0700 (PDT)
In-Reply-To: <503648CC.7060903@linux.intel.com>
References: <1345726178-16751-1-git-send-email-constantinx.musca@intel.com>
	<503648CC.7060903@linux.intel.com>
Date: Thu, 23 Aug 2012 19:29:21 +0300
Message-ID: <CAF6bG8eJG7sVZkbkGOkViYq6ueKuU3ZA3Qf9DOTRVx08zkMH0g@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Constantin Musca <constantinx.musca@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] dpkg: upgrade to 1.16.8
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
X-List-Received-Date: Thu, 23 Aug 2012 16:41:29 -0000
Content-Type: text/plain; charset=UTF-8

On 23 August 2012 18:14, Saul Wold <sgw@linux.intel.com> wrote:
> On 08/23/2012 05:49 AM, Constantin Musca wrote:
>>
>> perllibdir.patch: removed
>>      - in the new version PERL_LIBDIR will be set only if empty
>> ignore_extra_fields.patch: adapted to the new version
>> check_version.patch: adapted to the new version
>> preinst.patch: removed
>>      - the incorrect code is removed in the new version
>> dpkg-deb-avoid-fflush.patch: removed
>>      - the patch is included in the new version
>>
> What kind of testing did you do with this? dpkg is a pretty major tool used
> for the debian packaging system and has been known to have problems in the
> past.

 At least my version (submitted May) of dpkg upgrade required changes
outside dpkg itself for building of some packages to work. You may
find (separate) patch I did for those useful.

> It would be best to build a system with PACKAGE_CLASSES = "package_deb"

 It was something about generic syntax that was feeded directly to
package_deb and which then misinterpreted it (tag that looked like
version number to deb) I don't have related documents and code on this
computer, so you need to search yourself.


 - ML



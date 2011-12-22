Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rdn6Q-000561-Tf
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 19:10:50 +0100
Received: by lami14 with SMTP id i14so3297748lam.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 10:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=vkTKb+tafOjrz19XGZ68CxItPQbyvl3AbdlZAopIG58=;
	b=EPrNi0uLdIaOchY1t4dY3uboBIxHF1afbccnluk/XeQgg2bAdxNSXOUGkdEM8FYbHk
	hAMrFiSIfEw9JqfiJtvMPPs/rNZNdB3ZG1LZnCLdivufzz/ovsUiRbHkewGvxMMb96or
	HZJ0ODypnQzuplEJETSd2WcJwDjK1Xmp1Bnto=
Received: by 10.152.113.131 with SMTP id iy3mr9606276lab.39.1324577019632;
	Thu, 22 Dec 2011 10:03:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.10.3 with HTTP; Thu, 22 Dec 2011 10:03:08 -0800 (PST)
In-Reply-To: <5001068.cY7vLDoi1Z@helios>
References: <CAMKF1so8it8VVhVeidcpfmxd-5dgfXvrsX_w3z1U7WbrVpoRqQ@mail.gmail.com>
	<5001068.cY7vLDoi1Z@helios>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 Dec 2011 10:03:08 -0800
Message-ID: <CAMKF1so7M25uv0Rc4YugNnD5h9xKmWjLSN_jbUh_KVpGXma8=w@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Fetch errors from projects.o-hand.com
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
X-List-Received-Date: Thu, 22 Dec 2011 18:10:51 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 22, 2011 at 3:25 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Hi Khem,
>
> On Sunday 20 November 2011 08:18:47 Khem Raj wrote:
>> My build of core-image-sato is failing to fetch tars from
>> projects.o-hand.com
>>
>>...
>>
>> I dont have yocto project mirror in my fallback list.
>>
>> Should these files be fetched from these urls or should urls be
>> updated to fetch them from elsewhere ?
>
> All references to *.o-hand.com in SRC_URI have now been fixed. Thanks for
> pointing this out and sorry for the delay in fixing it!

Thanks for fixing it much appreciated.



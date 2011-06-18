Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QY1La-0007gZ-EC
	for openembedded-core@lists.openembedded.org;
	Sat, 18 Jun 2011 21:38:22 +0200
Received: by vws2 with SMTP id 2so1148418vws.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jun 2011 12:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=kyHUTFdJfPUz2e1Lo2M6xQhIKc7vqBWcet7YBAZ6+gw=;
	b=xb+91903PiugiH/KxHEu6IYc6CPhnGrlsDfvI5ao3E+fRIzBCyG+JM3g3XiINcOuN9
	3RS0C7Z1UaBTlAsa0TfGGLfCtOGWwI0P9n7EFSrwVqCOhNaDP2tlXJyrlNByxCT6PQBs
	jW03Oxm5+2W3WSa7T6xjnKvT2FQl55oFvgYy4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=CdPmcply0V3OttBodLXoLzwncODE2KcMC/tJJP5oI/jJ26bkJEen4vUDwTu3O0yvQz
	fF2Jzg309jAvQuAG3GfE9IjvB3zNJmh/5/06JcqbJmdCDLaLNnPLgiQYGUZ+M8pX/lSi
	4ezjFok2mU02QqfU6IxDuAtCbkTEtQcY1AWy0=
Received: by 10.52.99.198 with SMTP id es6mr3286292vdb.49.1308425691140; Sat,
	18 Jun 2011 12:34:51 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.52.181.2 with HTTP; Sat, 18 Jun 2011 12:34:31 -0700 (PDT)
In-Reply-To: <201106181840.38875.paul.eggleton@linux.intel.com>
References: <E1QXzLA-0004Ca-IU@happy.bec-systems.com>
	<201106181840.38875.paul.eggleton@linux.intel.com>
From: Chris Larson <clarson@kergoth.com>
Date: Sat, 18 Jun 2011 12:34:31 -0700
X-Google-Sender-Auth: D5jcmfiiHvIUMXjS-grJKuAMAzA
Message-ID: <BANLkTim2jbiaWy0orBycqpGrC8bdiR_CVw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: OE Changelog for 2011-06-6 to 2011-06-13
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
X-List-Received-Date: Sat, 18 Jun 2011 19:38:22 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Jun 18, 2011 at 10:40 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Hi Cliff,
>
> On Saturday 18 June 2011 18:29:48 cliff.brake@gmail.com wrote:
>> meta-yocto: git://git.yoctoproject.org/poky
>>...
>> ====================================================
>> Changelog for meta-yocto:
>>
>
> This clearly contains more than just changes to the meta-yocto subdirectory of
> the poky repo. Can you please set this up to be filtered? Otherwise we're just
> effectively getting dupes of commits to bitbake and oe-core.

Speaking of which, if we do that, might be a good idea to add bitbake
itself specifically, in case any of the changes to master will impact
the userbase.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics



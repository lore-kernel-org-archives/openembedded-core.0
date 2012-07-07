Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SnJTE-0002K2-Ay
	for openembedded-core@lists.openembedded.org;
	Sat, 07 Jul 2012 03:06:17 +0200
Received: by eekd49 with SMTP id d49so3639668eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jul 2012 17:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=2jq7I2OMsYBASKS1I30dp5vghfIg5+uDVOBlxwxwTH8=;
	b=z2A/9jluxq4b6seOL6NyEFIcc3xfQtjcEDrYhr4sBv+JBYu4luCjIIHqDkttC4BhJR
	TbfJTOjMFURqqYkG/eXsanuX7cx9nkAzS6xoP2pn2pbfYY8f83tyrgjdTpW95Vd8YaCL
	/9ndfpiIvzfvC+3yQ7/ZvwiJYjfRVDS9wxfUGfjjJq+u8zMRBmWT5HKhdHIzZVozFr/i
	KRziikzUv0mQNHK+L8fqOvJ6KdT7ZfukGG+YO1FNchG1PuUo9gDhPex4mBCzSJd3Z3MF
	RKOZ4gkOuOTjDJG4zo1YTAWbQgWesCklpW6cUnUJsP+1xKn19MuMgRsAub8UsLO75RuB
	44Jw==
Received: by 10.14.97.16 with SMTP id s16mr7159270eef.117.1341622481665; Fri,
	06 Jul 2012 17:54:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Fri, 6 Jul 2012 17:54:11 -0700 (PDT)
In-Reply-To: <4FF71F28.70302@linux.intel.com>
References: <CAJ2CSBsPhAtmpoTpBRzfqghV6tnRQXmjpcY415h=XfXtHxQzHQ@mail.gmail.com>
	<4FF453EC.8030007@linux.intel.com> <1341413143.3906.31.camel@ted>
	<CAJ2CSBuRsmRDCaj5oY8xToURc3GkCJzRj8y6auzTUxA32AZBMQ@mail.gmail.com>
	<1341414137.3906.33.camel@ted>
	<CAJ2CSBtESa4NVB1YF_VSN3BOj-n8NipPN7krkuLHH-nRdEVfcg@mail.gmail.com>
	<20120704152111.GB15100@jama.jama.net>
	<CAJ2CSBvQJtFPBXf-QEVm7bO84W4_K2ziYAOR=1kiQfENyK_D_Q@mail.gmail.com>
	<4FF5F32C.7080905@gmail.com> <1341564942.3104.3.camel@ted>
	<CAMKF1so=LN+cXK37B9Eu1msE-kmVUJDkSzvcCLm9jSFNDaZM_w@mail.gmail.com>
	<4FF71F28.70302@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Jul 2012 17:54:11 -0700
Message-ID: <CAMKF1sqBzraHf8ZD=Df6yMR56EUEb=4N2FgDm8yneCxfE5pr4Q@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: gcc errors while building core-image-sato-sdk
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
X-List-Received-Date: Sat, 07 Jul 2012 01:06:18 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 6, 2012 at 10:23 AM, Saul Wold <sgw@linux.intel.com> wrote:
> On 07/06/2012 09:00 AM, Khem Raj wrote:
>>
>> On Fri, Jul 6, 2012 at 1:55 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>>
>>>
>>> I merged a couple of gcc changes fairly quickly to address a variety of
>>> problems people started hitting (including the autobuilder). The svn
>>> nature of the recipe is causing a few issues with the subversion 1.7
>>> change. I am wondering if we should just point it to the svn checkout
>>> tarball by default and leave the svn url for use when updating only and
>>> populating the mirror?
>>
>>
>> or we can use git instead of svn. http://gcc.gnu.org/git/?p=gcc.git
>>
> That sounds like a good idea.

I have queued up a patch in the eglibc 2.16 pull tree for it
http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/eglibc-2.16&id=d81a98a5c13256f6f14c5b7921492c293dd9587b

>
> Sau!
>
>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>
>



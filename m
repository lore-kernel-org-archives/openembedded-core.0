Received: from ams-iport-2.cisco.com ([144.254.224.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mertsas@cisco.com>) id 1SrpJZ-00032y-Pm
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 13:54:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=mertsas@cisco.com; l=1028; q=dns/txt;
	s=iport; t=1342698202; x=1343907802;
	h=message-id:date:from:mime-version:to:subject:references:
	in-reply-to:content-transfer-encoding;
	bh=uRRQ0c6luKy9hdWYeI9jsf2aFmFdLqgNvI+4fZA2G4A=;
	b=JFH3rqjOEN/JuDnaGtWNjhkd3HYK/YlGDWODZ3gVqUDJIjz/4I4S7Cx8
	XvqlzbYEvRe5oGzCVY/RxrcamPBK2i4WTiPTrzeGUY7WYOO/v+y7mntoE
	MBz4dNWz4ydVSDMIjHy2h2NWXWpTZgS6+N76rxnSwTIkCAOoL2i4cpThu s=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AgEFAFLwB1CQ/khR/2dsb2JhbABFhW2zWoEHgiABAQEEAQEBDwEQDwE7ChELGAICBRYLAgIJAwIBAgEVAS8TBgIBAR6HawueLY0Zkm6BIIogg3SCCoESA5MbgimBE4RGg1CEeoFmgmE
X-IronPort-AV: E=Sophos;i="4.77,615,1336348800"; d="scan'208";a="75411708"
Received: from ams-core-1.cisco.com ([144.254.72.81])
	by ams-iport-2.cisco.com with ESMTP; 19 Jul 2012 11:43:19 +0000
Received: from [10.54.74.11] (dhcp-10-54-74-11.cisco.com [10.54.74.11])
	by ams-core-1.cisco.com (8.14.5/8.14.5) with ESMTP id q6JBhJQE009389
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 11:43:20 GMT
Message-ID: <5007F1BF.5050102@cisco.com>
Date: Thu, 19 Jul 2012 13:38:39 +0200
From: =?UTF-8?B?TWFydGluIEVydHPDpXM=?= <mertsas@cisco.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120628 Thunderbird/10.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1342696517-28149-1-git-send-email-mertsas@cisco.com>
	<20120719113512.GK3331@jama.jama.net>
	<5007F0C7.90605@cisco.com> <1342698109.7940.7.camel@ted>
In-Reply-To: <1342698109.7940.7.camel@ted>
Subject: Re: [PATCH] Changed SRC_URI for eglibc repo.
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
X-List-Received-Date: Thu, 19 Jul 2012 11:54:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/19/12 13:41, Richard Purdie wrote:
> On Thu, 2012-07-19 at 13:34 +0200, Martin Ertsås wrote:
>> On 07/19/12 13:35, Martin Jansa wrote:
>>> On Thu, Jul 19, 2012 at 01:15:17PM +0200, Martin Ertsaas wrote:
>>>> The branches repo for eglibc is /branches, not /svn/branches.
>>> Are you sure? wasn't this tested on broken bitbake where protocol param
>>> was ignored and default svn:// protocol was used instead http://?
>>>
>>> Cheers,
>> when was bitbake fixed for this? I have commit number
>> a93a58b7cea2ddb9596cb4d718c0801db5d1a295 from two days ago now. Was it a
>> broken bitbake?
> The commit immediately after that,
> http://git.openembedded.org/bitbake/commit/?id=b2017f493ab730d804ae44ec5a168d464626d046
> is the fix referred to.
>
> Cheers,
That fixed the problem. Thanks.
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




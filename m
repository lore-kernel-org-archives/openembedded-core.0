Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1QHztl-0001uh-Gw
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 16:51:25 +0200
Received: by ywg8 with SMTP id 8so842845ywg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 May 2011 07:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=gkPK6G+MBeT/HH/gjjg293DZX2+IjPt0WFW1kIKxzKY=;
	b=f4h73Ti1k3PtLyWBgXGVbNkxoAOyyeuSS+fmxNhmwFMsfHZSBjf/wW5RXP4Bkz6WA0
	c3G1xI3cIYbHGrRtYDRQ2NpBt5VG4cqJlS1dmr8JddyBIlOZb+XVdFP+MHbyFeooccL7
	j8TNQ8YKPLtG3lU/nykAM6ifc2v3Sk+4HirBE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=NPA7/EtK8bu+KhZf/iVJzHa4ZUYU4qE+aaB2/kNafIj3zaPd5HpyryibzDjObrmZpV
	pfIXiZ8l0bJZZ949NZ6RSXcNZIUaM4ONJsmA4VsMIuOxBzJfXVgU67zHHOy19fEx1Qd2
	djVst4Gl7+MZsU7UwyIdE8a4UMbg/MJBUaIkU=
MIME-Version: 1.0
Received: by 10.91.126.14 with SMTP id d14mr2356004agn.58.1304606924927; Thu,
	05 May 2011 07:48:44 -0700 (PDT)
Received: by 10.90.104.11 with HTTP; Thu, 5 May 2011 07:48:44 -0700 (PDT)
In-Reply-To: <BANLkTi=VizL4=DUReoOUeZfov5EYsyPQGQ@mail.gmail.com>
References: <cover.1304581769.git.sgw@linux.intel.com>
	<a2366eef6e0784848f35b93827407038eeea7ebc.1304581770.git.sgw@linux.intel.com>
	<20110505141219.GB6461@suse.de>
	<BANLkTi=VizL4=DUReoOUeZfov5EYsyPQGQ@mail.gmail.com>
Date: Thu, 5 May 2011 10:48:44 -0400
Message-ID: <BANLkTin9dd5ZdBMkk6HwVpFr1cKWmYBfCA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Kyle McMartin <kyle@redhat.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Kang Kai <kai.kang@windriver.com>, Thomas Meyer <thomas@m3y3r.de>
Subject: Re: [PATCH 25/26] linux-yocto: update SRCREVs
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
X-List-Received-Date: Thu, 05 May 2011 14:51:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, May 5, 2011 at 10:45 AM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Thu, May 5, 2011 at 10:12 AM, Greg KH <gregkh@suse.de> wrote:
>> On Thu, May 05, 2011 at 12:57:33AM -0700, Saul Wold wrote:
>>> From: Bruce Ashfield <bruce.ashfield@windriver.com>
>>>
>>> Updating the linux-yocto/2.6.37 SRCREVs to pickup:
>>>
>>> =A0 =A0 perf tool: Fix gcc 4.6.0 issues
>>
>> <snip>
>>
>> Because of this one patch, you sent mail to a whole bunch of people who
>> don't care anything about the yocto project, or any of these 27 emails.
>>
>> Please be more careful in the future to not do this again.
>
> Argh. Sorry about that, I was on a box that didn't have supress-cc
> turned on.

... that, and  I can't read.

My initial send looks to have gone out properly, without the cc's.

Sorry for two extra email in your inbox, but I wanted to ensure that
my claim of misconfiguration didn't prevent the problem from being
addressed.

Bruce

>
> Bruce
>
>>
>> greg k-h
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"



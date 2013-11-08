Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id B69696A467
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2013 11:55:11 +0000 (UTC)
Received: by mail-ie0-f181.google.com with SMTP id ar20so3067081iec.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Nov 2013 03:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=Ivh+wIGGvHWK7+QHMRowN01MMKMqNB/n2QYK8L0/ftA=;
	b=qN8CkfVFlOj/X6o7GmtQHpfHtNaanHhBN/ETLJzQmbx/MA4FPG38IJkt2eUB9dPrAr
	Kwu/j+vAwBUbZ1hCjsCOOQdRF/GoJyOs8b8F4rxl0hk9xaYzFuwhypNeLmIfSfkZUCjI
	65W+C7qCao+IRk3axdhijxNl/FMj8xGC4+xzEaL7jF0zYv9xtzninwJun2vL/7idR0Pn
	UVBrc83HovGNpqRIaoec/eX7aHTtlEhgLXTiSAFWOiDNZ/ndG5jLmcK8/liM34cqQFwb
	ooOIXavYw2p0S5kZFBJYVn27pi3amq/YoHRRJFLzjA43l1IP1RWLcxEn1vbTdbyRwEnh
	7gWg==
MIME-Version: 1.0
X-Received: by 10.50.114.168 with SMTP id jh8mr2046796igb.6.1383911712779;
	Fri, 08 Nov 2013 03:55:12 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.64.20.229 with HTTP; Fri, 8 Nov 2013 03:55:12 -0800 (PST)
In-Reply-To: <1383865030.6271.283.camel@ted>
References: <1383689722.6271.184.camel@ted>
	<CAP9ODKrLg1nb5syAUtM4_ipMKenTe1ejXmVsVrqGifiSpBqYjA@mail.gmail.com>
	<1383781353.6271.200.camel@ted>
	<CAP9ODKrQ9aEx8VH8qhjuBORaDyGp72a3BXsHTkRosqB53zGOTg@mail.gmail.com>
	<1383865030.6271.283.camel@ted>
Date: Fri, 8 Nov 2013 09:55:12 -0200
X-Google-Sender-Auth: UBfz91sadPsyTrjXlzRq_ArMHfU
Message-ID: <CAP9ODKqMC8WeQTQA2=BNnO-B-oKw+_AFULmLcoq-3JQ2iPD8Mg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "Eggleton, Paul" <paul.eggleton@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: lib/oe/sstatesig: Ensure packagegroups don't continually rebuild
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Nov 2013 11:55:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Nov 7, 2013 at 8:57 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2013-11-07 at 13:58 -0200, Otavio Salvador wrote:
>> On Wed, Nov 6, 2013 at 9:42 PM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > On Wed, 2013-11-06 at 16:51 -0200, Otavio Salvador wrote:
>> >> On Tue, Nov 5, 2013 at 8:15 PM, Richard Purdie
>> >> <richard.purdie@linuxfoundation.org> wrote:
>> >> > packagegroups are allarch and shouldn't change depending on the target
>> >> > or machine selected. In general they should have good stable namespaces
>> >> > for their dependencies. As such we can exclude them from rebuilding when
>> >> > dependency checksums change.
>> >> >
>> >> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> >>
>> >> What about machine-base and core-boot? this may change depending on machine.
>> >
>> > Those already get marked as machine specific. I'd not expect
>> > dependencies to be changing package names there for example so I'm not
>> > sure this is an issue.
>>
>> In:
>>
>> +    def isPackageGroup(fn):
>> +        inherits = " ".join(dataCache.inherits[fn])
>> +        return "packagegroup.bbclass" in inherits
>>
>> We must check PACKAGE_ARCH, no?
>
> No. The fact they're marked as MACHINE_ARCH ensures they change when
> they need to, we don't need sstate to do that as well.

Fine :)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

